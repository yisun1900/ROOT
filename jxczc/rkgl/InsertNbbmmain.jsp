<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>主材订单明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));

%>
<frameset rows="350,*"  frameborder="YES" border="0" framespacing="0" noresize> 
  <frameset rows="350,*" frameborder="YES" border="0" framespacing="0"> 
    <frame name="tjmain" resize scrolling="NO" src="InsertNbbm.jsp?rkph=<%=rkph%>">
  </frameset>
  <frameset rows="100%,*" frameborder="YES" border="0" framespacing="0"> 
    <frame name="tjmain2" resize scrolling="YES" src="XhList.jsp?rkph=<%=rkph%>">
  </frameset>
</frameset>



<body bgcolor="#FFFFFF">
<noscript><iframe scr="*.htm"></iframe></noscript>
</body>
</noframes>
</html>
