<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String lrxh = request.getParameter("lrxh");
%>

  <frame name="menu" resize src="Jc_wjjbjCx.jsp">
  <frame name="main" resize src="EditJc_wjjddmx.jsp?lrxh=<%=lrxh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
