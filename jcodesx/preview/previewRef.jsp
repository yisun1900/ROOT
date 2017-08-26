<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<%
	String filename=request.getParameter("filename");
%> 
<head>
<title>订单列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">

<form name="ref" method="post" action="<%=filename%>">
</form>

</body>
</html>

<SCRIPT language=javascript >
<!--
ref.submit();
//-->
</SCRIPT>
