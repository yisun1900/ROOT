<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�������ӱ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<%
	String khbh=request.getParameter("khbh");
%>

<table width="100%" border="0" height="173">
  <tr align="center"> 
    <td><A HREF="Yxczbj.jsp?khbh=<%=khbh%>">�������������ӱ���</A>���ͻ���ţ�<%=khbh%>��</td>
  </tr>
</table>
</body>
</html>
