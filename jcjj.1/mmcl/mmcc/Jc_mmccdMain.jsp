<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String yddbh = request.getParameter("yddbh");
%>

  <frame name="menu" resize src="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp">
  <frame name="main" resize src="InsertJc_mmccd.jsp?yddbh=<%=yddbh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
