<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL��Ϣ����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String gsbh=request.getParameter("gsbh");
%>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 

  <frame name="menu" resize src="InsertXz_gdzcbCx.jsp">
  <frame name="main" resize src="EditXz_gdzcb1.jsp?gsbh=<%=gsbh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
