<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL��Ϣ����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%
String khbh=request.getParameter("khbh");
String sgd=request.getParameter("sgd");

%>
  <frame name="menu" resize src="SgdCx.jsp">
  <frame name="main" resize src="EditXgCrm_khxx.jsp?khbh=<%=khbh%>&sgd=<%=sgd%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
