<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL��Ϣ����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String xh = request.getParameter("xh");
%>

  <frame name="menu" resize src="/jcjj/cgdd/Jc_cgddmxCx.jsp">
  <frame name="main" resize src="EditJc_cgddmx.jsp?xh=<%=xh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
