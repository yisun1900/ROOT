<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,org.apache.commons.fileupload.FileItem,org.apache.commons.fileupload.disk.DiskFileItemFactory,org.apache.commons.fileupload.servlet.ServletFileUpload' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>上传图片到数据库</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<%
	Vector vector = new Vector();

	String ysjlh = null;
	String zplx = null;
	String zpxm = null;
	String zpsm = null;

	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(1024 * 10);
	factory.setRepository(new java.io.File("D:\\temp\\"));
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(1024 * 1024 * 100);
	List<FileItem> fileItems = null;
	try {
		fileItems = upload.parseRequest(request);
	} 
	catch (Exception e) {
		e.printStackTrace();
	}
	Iterator<FileItem> iterable = fileItems.iterator();
	FileItem fileItem;
	while (iterable.hasNext()) 
	{
		fileItem = (FileItem) iterable.next();

		if (fileItem.isFormField()) 
		{
			String name = fileItem.getFieldName();
			String value = fileItem.getString("GBK");
			if(name.equals("ysjlh"))
			{
				ysjlh=value;
			}
			else if(name.equals("zplx"))
			{
				zplx=value;
			}
			else if(name.equals("zpxm"))
			{
				zpxm=value;
			}
			else if(name.equals("zpsm"))
			{
				zpsm=value;
			}
		} 
		else 
		{
			String fileName = fileItem.getName();

			if (fileName != null&&fileName!="") 
			{
				// 如果文件存在则上传
				java.io.File fullFile = new java.io.File(fileItem.getName());
				java.io.File fileOnServer = new java.io.File(request.getRealPath("/")+"imggcys/"
						+ ysjlh+"-ys-"+fullFile.getName());
				try {
					fileItem.write(fileOnServer);
				} 
				catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{
					fileItem.delete();
				}
				vector.add(fileOnServer.getName());
			}
	
		}
	}
	
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	try {
		conn=cf.getConnection();

		String khbh = "";
		ls_sql="SELECT khbh";
		ls_sql+=" FROM crm_heysjl";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=rs.getString(1);
		}
		rs.close();
		ps.close();


		String fgsbh = "";
		ls_sql="SELECT fgsbh";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fgsbh=rs.getString(1);
		}
		rs.close();
		ps.close();

		String zpsfxsh = "";//照片是否需审核  Y：需审核；N：不需
		ls_sql="SELECT zpsfxsh";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zpsfxsh=rs.getString(1);
		}
		rs.close();
		ps.close();

		conn.setAutoCommit(false);

		Iterator iterator = vector.iterator();
		while(iterator.hasNext())
		{
			String yszpmc=(String)iterator.next();

			int count=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_heyszp";
			ls_sql+=" where yszpmc='"+yszpmc+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count>0)
			{
				out.println("<P>错误提醒！[照片名称:"+yszpmc+"]已存在，此照片上传被取消");
				continue;
			}

			String kkzpbz="N"//0不可看   1可看
			if (zpsfxsh.equals("N"))//Y：需审核；N：不需
			{
				kkzpbz="Y";
			}

			ls_sql="insert into crm_heyszp(yszpmc,ysjlh,zpsm,zplx,zpxm,kkzpbz,zpshbz) values(?,?,?,?,?,?,'N')";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,yszpmc);
			ps.setString(2,ysjlh);
			ps.setString(3,zpsm);
			ps.setString(4,zplx);
			ps.setString(5,zpxm);
			ps.setString(6,kkzpbz);
			ps.executeUpdate();
			ps.close();
		}

		int zpsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_heyszp";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zpsl=rs.getInt(1);
		}
		rs.close();
		ps.close();
	
		ls_sql="update crm_heysjl set zpsl=?";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zpsl);
		ps.executeUpdate();
		ps.close();

		conn.commit();

		%>
		<SCRIPT language=javascript >
		<!--
		alert("上传文件成功！");
		history.go(-1);
		//-->
		</SCRIPT>	
        <%	
		
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
</body>
</html>
