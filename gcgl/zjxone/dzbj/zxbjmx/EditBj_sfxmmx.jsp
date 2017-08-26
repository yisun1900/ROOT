<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
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
