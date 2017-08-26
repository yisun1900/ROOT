<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>选择[系统内]主材</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
%>
<frameset rows="*" cols="200,*" frameborder="YES" border="0" framespacing="4"> 
  <frameset rows="90,*" frameborder="YES" border="0" framespacing="1"> 
    <frame name="tjmain" resize scrolling="NO" src="tjmainList.jsp?ddbh=<%=ddbh%>">
    <frame name="xhmain" scrolling="YES" src="note2.jsp">
  </frameset>
  <frameset cols="400,*" frameborder="YES" border="0" framespacing="4"> 
	<frame name="cpmain" scrolling="YES" resize src="note3.jsp">
	<frame name="insertmain" scrolling="NO" src="note4.jsp">
  </frameset>
</frameset>

<noframes>

<body bgcolor="#FFFFFF">
<noscript><iframe scr="*.htm"></iframe></noscript>
</body>
</noframes>
</html>
