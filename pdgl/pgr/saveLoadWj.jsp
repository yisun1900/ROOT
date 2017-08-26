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
String yhmc=(String)session.getAttribute("yhmc");

Vector vector = new Vector();
String khbh=null;
String grxm=null;

	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(1024 * 10);
	factory.setRepository(new java.io.File("D:\\temp\\"));
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(1024 * 1024 * 300);
	List<FileItem> fileItems = null;
	try {
		fileItems = upload.parseRequest(request);
	} catch (Exception e) {
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
			
			if(name.equals("khbh"))
			{
				khbh=value;
			}
			else if(name.equals("grxm"))
			{
				grxm=value;
			}
		} 
		else {
			String fileName = fileItem.getName();
			if (fileName != null && fileName!="") 
			{
				// 如果文件存在则上传
				java.io.File fullFile = new java.io.File(fileItem.getName());
				
				String filename=request.getRealPath("/")+"pdgl/images/"+khbh+"-"+grxm+"-"+fullFile.getName();
				
				java.io.File fileOnServer = new java.io.File(filename);
				
				try {
					fileItem.write(fileOnServer);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{
					fileItem.delete();
				}
				vector.add(fileOnServer.getName());

				String inF=filename;
				String outF=filename;
				int outWidth=200;
				int outHeight=200;
				boolean rateIs=true;

				ybl.common.ImgDeal.compressPic(inF,outF,outWidth,outHeight,rateIs);  
			}
	
		}
	}
	
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	try {
		conn=cf.getConnection();

		conn.setAutoCommit(false);

		Iterator iterator = vector.iterator();

		while(iterator.hasNext())
		{
			String zpmc=(String)iterator.next();

			ls_sql="update crm_grxx set zpmc=?,shr='"+yhmc+"',shsj=SYSDATE";
			ls_sql+=" where khbh='"+khbh+"' and grxm='"+grxm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zpmc);
			ps.executeUpdate();
			ps.close();
		}


		String pgrshbz="";//1：未审核；2：审核
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  crm_grxx";
		ls_sql+=" where khbh='"+khbh+"' and shsj is null";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			pgrshbz="1";
		}
		else {
			pgrshbz="2";
		}

		ls_sql="update crm_khxx set pgrshbz=? ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,pgrshbz);
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
