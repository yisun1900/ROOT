<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="jCoding" scope="page" class="ybl.jcoding.JCoding"/>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>�鿴����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">

<%
	String viewcodetools=jCoding.getViewCodeTools();
	String outPath=jCoding.getOutPath();
	String filename=request.getParameter("filename");
	filename=outPath+"/"+filename;
	out.println("<BR>�鿴���ߣ�"+viewcodetools);
	java.lang.Runtime.getRuntime().exec(viewcodetools+" "+filename);
	out.println("<BR>�鿴�ļ���"+filename);
%>


</body>
</html>

<SCRIPT language=javascript >
<!--
refresh();
//-->
</SCRIPT>
