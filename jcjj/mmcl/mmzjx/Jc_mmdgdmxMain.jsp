<%@ page contentType="text/html;charset=GBK" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL��Ϣ����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String yddbh = request.getParameter("yddbh");
String zjxxh = request.getParameter("zjxxh");
%>

  <frame name="menu" resize src="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp">
  <frame name="main" resize src="InsertJc_mmdgdmx.jsp?yddbh=<%=yddbh%>&zjxxh=<%=zjxxh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>