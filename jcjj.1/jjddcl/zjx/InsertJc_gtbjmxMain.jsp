<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL��Ϣ����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String gtxh=request.getParameter("gtxh");
String ddbh=request.getParameter("ddbh");
String zjxxh=request.getParameter("zjxxh");
%>

  <frame name="menu" resize src="/jcjj/jjddcl/ht/Jc_gtbjmxCx.jsp">
  <frame name="main" resize src="InsertJc_gtbjmx.jsp?ddbh=<%=ddbh%>&gtxh=<%=gtxh%>&zjxxh=<%=zjxxh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
