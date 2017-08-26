<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>主材订单明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>


<frameset rows="1200" cols="460,*" frameborder="YES" border="0" framespacing="4"> 
  <frameset rows="700,*" frameborder="YES" border="0" framespacing="1"> 
    <frame name="tjmain" resize scrolling="NO" src="InsertJc_zcddmxAjax.jsp">
  </frameset>
  <frameset rows="700,*" frameborder="YES" border="0" framespacing="1"> 
    <frame name="tjmain2" resize scrolling="YES" src="Jc_zcddmxAjaxList.jsp">
  </frameset>
</frameset>

<noframes>

<body bgcolor="#FFFFFF">
<noscript><iframe scr="*.htm"></iframe></noscript>
</body>
</noframes>
</html>
