<%@ page contentType="text/html;charset=GBK" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL��Ϣ����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String xcmxh=request.getParameter("xcmxh");
String zjxxh=request.getParameter("zjxxh");
%>

  <frame name="menu" resize src="/jcjj/jjddcl/ht/Jc_jjxcmmxCx.jsp">
  <frame name="main" resize src="EditJc_jjxcmmx.jsp?xcmxh=<%=xcmxh%>&zjxxh=<%=zjxxh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
