<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="0" framespacing="1" rows="*"> 
<%  
String ddbh=request.getParameter("ddbh");
%>

  <frame name="menu" resize src="Jc_cpjjddmxCx.jsp">
  <frame name="main" resize src="InsertJc_cpjjddmx.jsp?ddbh=<%=ddbh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
