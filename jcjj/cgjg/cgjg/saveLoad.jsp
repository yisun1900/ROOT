<%@ page import='ybl.upload.*'%>
<%@ page contentType="text/html;charset=GBK" %>

<html>
<head>
<title>�ϴ�ͼƬ�����ݿ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
	String ls=getServletContext().getRealPath("");
	String loadname=null;
	try 
	{
		ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
		up.initialize();

		loadname=up.getFileName("loadname").toUpperCase();
		byte[] buffer=up.getFileBuffer("loadname");
		loadname=loadname.substring(loadname.lastIndexOf('\\')+1);
		String filename=ls+"/jcjj/cgjg/cgjg/images/"+loadname;
//		out.println("<BR>filename="+filename);
		java.io.FileOutputStream f=new java.io.FileOutputStream(filename);
		f.write(buffer);
		f.close();
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���ذ����Ƭ�ɹ���");
		history.go(-1);
		//-->
		</SCRIPT>
		<%
	}
	catch (Exception e) {
	  out.print("���ذ����Ƭʧ�ܣ�Exception:" + e);
	}
%> 
</body>
</html>
