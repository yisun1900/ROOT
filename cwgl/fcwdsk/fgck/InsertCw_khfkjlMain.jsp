<%@ page contentType="text/html;charset=GBK" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL��Ϣ����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String khbh = request.getParameter("khbh");
%>

  <frame name="menu" resize src="/cwgl/cwsk/fgck/InsertCw_khfkjCx.jsp">
  <frame name="main" resize src="InsertCw_khfkjl.jsp?khbh=<%=khbh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
