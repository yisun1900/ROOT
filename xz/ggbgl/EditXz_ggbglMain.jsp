<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ggbh=request.getParameter("ggbh");
%>
<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 

  <frame name="menu" resize src="EdieXz_ggbglCx.jsp">
  <frame name="main" resize src="EditXz_ggbgl.jsp?ggbh=<%=ggbh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
