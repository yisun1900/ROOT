<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String gtxh=request.getParameter("gtxh");
String ddbh=request.getParameter("ddbh");
%>

  <frame name="menu" resize src="Jc_jjxcmmxCx.jsp">
  <frame name="main" resize src="InsertJc_jjxcmmx.jsp?ddbh=<%=ddbh%>&gtxh=<%=gtxh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
