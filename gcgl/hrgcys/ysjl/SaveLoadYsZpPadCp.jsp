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

String ysjlh=null;
String yszpmc=null;
String zpml=null;


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
		if (fileItem.isFormField()) {
			String name = fileItem.getFieldName();
			String value = fileItem.getString("GBK");
			if("ysjlh".equals(name)){
				ysjlh=value;
			}
			if("zpml".equals(name)){
				zpml=value;
			}
			if("yszpmc".equals(name)){
				yszpmc=value;
				yszpmc = java.net.URLDecoder.decode(yszpmc,"UTF-8");
			}
		} 
		else {
			String fileName = fileItem.getName();


			if (fileName != null&&fileName!="") 
			{
				// 如果文件存在则上传
				java.io.File fullFile = new java.io.File(fileItem.getName());

				String filename=request.getRealPath("/")+"yblimg/gcys/"+zpml+"/"+yszpmc;
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

	ls_sql =" update crm_heyszp set zpshbz='C' ";
	ls_sql+=" where yszpmc='"+yszpmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("上传文件成功！");
	window.close();
	//-->
	</SCRIPT>	
	<%	
		
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
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
