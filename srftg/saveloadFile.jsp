<%@ page import='ybl.upload.*'%>
<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�����ļ�</title>
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

		out.println("�����ļ��ɹ����������ļ�Ϊ��"+filename);

	}
	catch (Exception e) {
	  out.print("�����ļ�ʧ�ܣ�Exception:" + e);
	}
%> 
</body>
</html>
