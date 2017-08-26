<%@ page contentType="text/html;charset=GBK" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String ddbh = request.getParameter("ddbh");
%>

  <frame name="menu" resize src="/jcjj/cgdd/Jc_cgddmxCx.jsp">
  <frame name="main" resize src="InsertJc_cgddmx.jsp?ddbh=<%=ddbh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
