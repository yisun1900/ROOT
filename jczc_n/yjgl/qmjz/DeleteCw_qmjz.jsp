<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>期末结转</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<%
	String jzrq=request.getParameter("jzrq");
%>

<table width="100%" border="0" height="173">
  <tr align="center"> 
    <td height="122"><b><font color="#CC0000" size="6">注意：删除后可能造成业绩错误<BR>且不可恢复<BR>请确认是否删除</font></b></td>
  </tr>
  <tr align="center"> 
    <td><A HREF="DeleteCw_qmjz1.jsp?jzrq=<%=jzrq%>">删除结转记录</A>：<%=jzrq%></td>
  </tr>
</table>
</body>
</html>
