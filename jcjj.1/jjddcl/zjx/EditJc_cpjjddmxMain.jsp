<%@ page contentType="text/html;charset=gb2312" %>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL��Ϣ����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String zjxxh=request.getParameter("zjxxh");
String cpjjbh=request.getParameter("cpjjbh");
%>

  <frame name="menu" resize src="/jcjj/jjddcl/ht/Jc_cpjjddmxCx.jsp">
  <frame name="main" resize src="EditJc_cpjjddmx.jsp?zjxxh=<%=zjxxh%>&cpjjbh=<%=cpjjbh%>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
