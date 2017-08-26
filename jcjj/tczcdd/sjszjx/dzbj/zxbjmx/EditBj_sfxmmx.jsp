<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%
String zjxxh=request.getParameter("zjxxh");
String khbh=request.getParameter("khbh");
String sfxmbm=request.getParameter("sfxmbm");
%>
  <frame name="menu" resize src="Bj_sfxmmxCx.jsp">
  <frame name="main" resize src="EditBj_sfxmmx1.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&sfxmbm=<%=sfxmbm%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
