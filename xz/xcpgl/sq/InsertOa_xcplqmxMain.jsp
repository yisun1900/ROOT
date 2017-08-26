<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String sqxh=request.getParameter("sqxh");
%>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 

  <frame name="menu" resize src="InsertOa_xcplqmxCx.jsp">
  <frame name="main" resize src="InsertOa_xcplqmx.jsp?sqxh=<%=sqxh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
