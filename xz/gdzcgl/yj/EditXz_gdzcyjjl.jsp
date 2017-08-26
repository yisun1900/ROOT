<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String gsbh=request.getParameter("gsbh");
String yjsj=request.getParameter("yjsj");
%>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 

  <frame name="menu" resize src="InsertXz_gdzcyjjlCx.jsp">
  <frame name="main" resize src="EditXz_gdzcyjjl1.jsp?gsbh=<%=gsbh%>&yjsj=<%=yjsj%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
