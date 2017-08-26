<%@ page contentType="text/html;charset=GBK" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String ddbh=request.getParameter("ddbh");
String zjxxh=request.getParameter("zjxxh");
%>

  <frame name="menu" resize src="/jcjj/jjddcl/ht/Jc_cpjjddmxCx.jsp">
  <frame name="main" resize src="InsertJc_cpjjddmx.jsp?ddbh=<%=ddbh%>&zjxxh=<%=zjxxh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
