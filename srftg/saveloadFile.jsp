<%@ page import='ybl.upload.*'%>
<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>上载文件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
	String ls=getServletContext().getRealPath("");
	String path=null,loadname=null;
	try 
	{
		ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
		up.initialize();
		path=up.getParameter("path");
		loadname=up.getFileName("loadname");
		byte[] buffer=up.getFileBuffer("loadname");
		loadname=loadname.substring(loadname.lastIndexOf('\\')+1);
		String filename=path+"\\"+loadname;
//		out.println("<BR>filename="+filename);
		java.io.FileOutputStream f=new java.io.FileOutputStream(filename);
		f.write(buffer,0,buffer.length-2);
		f.close();

		out.println("上载文件成功！！上载文件为："+filename);

	}
	catch (Exception e) {
	  out.print("上载文件失败，Exception:" + e);
	}
%> 
</body>
</html>
