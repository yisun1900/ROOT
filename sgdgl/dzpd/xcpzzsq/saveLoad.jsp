<%@ page import='ybl.upload.*'%>
<%@ page contentType="text/html;charset=gb2312" %>

<html>
<head>
<title>上传企划文件到数据库</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
	String ls=getServletContext().getRealPath("");
	String loadname=null;
	try 
	{
		ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
		up.initialize();

		loadname=up.getFileName("loadname");
		byte[] buffer=up.getFileBuffer("loadname");
		loadname=loadname.substring(loadname.lastIndexOf('\\')+1);
		String filename=ls+"/qh/xcpzzsq/Docs/"+loadname;
		//out.println("<BR>filename="+filename);
		java.io.FileOutputStream f=new java.io.FileOutputStream(filename);
		f.write(buffer);
		f.close();
		%>
		<SCRIPT language=javascript >
		<!--
		alert("上传企划文件成功！");
		history.go(-1);
		//-->
		</SCRIPT>
		<%
	}
	catch (Exception e) {
	  out.print("上传企划文件失败，Exception:" + loadname);
	}
%> 
</body>
</html>
