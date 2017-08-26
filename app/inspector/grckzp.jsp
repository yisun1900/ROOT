<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>查看工程巡检照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String zp=request.getParameter("zp");
%>

<body bgcolor="#FFFFFF">


<table width="100%" border="0" style="FONT-SIZE:12"  cellpadding="2" cellspacing="2">
	<tr>
		<td width="100%"><img src="/sgdgl/grxxb/images/<%=zp%>" width="100%"></td>        
	</tr>
    
    <tr>
		<td width="50%" align="center">工人照片</td>        
	</tr>

</table>
</body>
</html>
