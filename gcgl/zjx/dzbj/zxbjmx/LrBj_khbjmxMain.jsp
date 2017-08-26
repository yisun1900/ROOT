<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String khbh=request.getParameter("khbh");
%>
<frameset rows="61,*" frameborder="NO" border="0" framespacing="0"> 
  <frame name="topFrame" scrolling="NO" noresize src="Bj_khbjmxHead.jsp?khbh=<%=khbh%>" >
  <frame name="mainFrame" src="Bj_khbjmxList.jsp?khbh=<%=khbh%>">
</frameset>
<noframes><body bgcolor="#FFFFFF">

</body></noframes>
</html>
