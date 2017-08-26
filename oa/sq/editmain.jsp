<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>CRM信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%
String xh=cf.GB2Uni(request.getParameter("xh"));
%>
  <frame name="menu" resize src="yrk_lrxxcx.jsp">
  <frame name="main" resize src="EditOa_lqsq.jsp?xh=<%=xh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
