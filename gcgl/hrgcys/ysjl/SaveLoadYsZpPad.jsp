<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,org.apache.commons.fileupload.FileItem,org.apache.commons.fileupload.disk.DiskFileItemFactory,org.apache.commons.fileupload.servlet.ServletFileUpload' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�ϴ�ͼƬ�����ݿ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
Vector vector = new Vector();

String ysjlh=null;
String zplx=null;
String zpxm=null;
String zpsm=null;
String zpml="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {

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
			if("ysjlh".equals(name)){
				ysjlh=value;
			}
			if("zplx".equals(name)){
				zplx=value;
			}
			if("zpml".equals(name)){
				zpml=value;
			}
			if("zpxm".equals(name)){
				zpxm=value;
			}
			if("zpsm".equals(name)){
				zpsm=value;
				zpsm = java.net.URLDecoder.decode(zpsm,"UTF-8");
			}
		} 
		else {
			String fileName = fileItem.getName();


			if (fileName != null&&fileName!="") 
			{
				// ����ļ��������ϴ�
				java.io.File fullFile = new java.io.File(fileItem.getName());

				String filename=request.getRealPath("/")+"yblimg/gcys/"+zpml+"/"+ysjlh+"-"+zpxm+"-"+fullFile.getName();
				System.out.println(filename);

				java.io.File fileOnServer = new java.io.File(filename);
				
				try 
				{
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

				
				String inF=filename;
				String outF=filename;
				int outWidth=800;
				int outHeight=800;
				boolean rateIs=true;

				ybl.common.ImgDeal.compressPic(inF,outF,outWidth,outHeight,rateIs);  
			}
	
		}
	}
	
	conn=cf.getConnection();

	String khbh = "";
	ls_sql="SELECT khbh";
	ls_sql+=" FROM crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
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

	String zpsfxsh = "";//��Ƭ�Ƿ������  Y������ˣ�N������
	ls_sql="SELECT zpsfxsh";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zpsfxsh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	String kkzpbz="0";//0���ɿ�   1�ɿ�

	if (zpsfxsh.equals("N"))//Y������ˣ�N������
	{
		kkzpbz="1";
	}

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
			out.println("<P>�������ѣ�[��Ƭ����:"+yszpmc+"]�Ѵ��ڣ�����Ƭ�ϴ���ȡ��");
			continue;
		}

		ls_sql="insert into crm_heyszp(yszpmc,ysjlh,zplx,zpxm,zpsm,kkzpbz,khbh,zpml,zpshbz) values(?,?,?,?,?,?,?,?,'N')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yszpmc);
		ps.setString(2,ysjlh);
		ps.setString(3,zplx);
		ps.setString(4,zpxm);
		ps.setString(5,zpsm);
		ps.setString(6,kkzpbz);
		ps.setString(7,khbh);
		ps.setString(8,zpml);
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


	%>
	<SCRIPT language=javascript >
	<!--
	alert("�ϴ��ļ��ɹ���");
	history.go(-1);
	//-->
	</SCRIPT>	
	<%	
		
}
catch (Exception e) {
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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
