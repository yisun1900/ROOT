<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String fkxh = request.getParameter("fkxh");
%>

  <frame name="menu" resize src="/cwgl/cwsk/fgck/EditCw_khfkjCx.jsp">
  <frame name="main" resize src="EditCw_khfkjl.jsp?fkxh=<%=fkxh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
