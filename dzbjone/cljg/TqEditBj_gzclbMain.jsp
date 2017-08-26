<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String dqbm = request.getParameter("dqbm");
String wlbm = request.getParameter("wlbm");
%>

  <frame name="menu" resize src="Bj_gzclbCx.jsp">
  <frame name="main" resize src="TqEditBj_gzclb.jsp?dqbm=<%=dqbm%>&wlbm=<%=wlbm%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
