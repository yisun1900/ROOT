<%@ page contentType="text/html;charset=GBK" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String xh = request.getParameter("xh");
%>

  <frame name="menu" resize src="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp">
  <frame name="main" resize src="EditJc_mmccd.jsp?xh=<%=xh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
