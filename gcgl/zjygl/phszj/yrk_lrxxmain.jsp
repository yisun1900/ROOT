<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>CRM信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String lrph = request.getParameter("lrph");
%>

  <frame name="menu" resize src="yrk_lrxxcx.jsp">
  <frame name="main" resize src="EnterKhxm.jsp?lrph=<%=lrph%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
