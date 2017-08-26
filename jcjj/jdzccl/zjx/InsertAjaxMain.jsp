<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>主材订单明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>


<%
	String ppbm=cf.GB2Uni(request.getParameter("ppbm"));

	String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
	String dqbm=cf.executeQuery("select sq_dwxx.dqbm from sq_dwxx,jc_zczjx where sq_dwxx.dwbh=jc_zczjx.fgsbh and jc_zczjx.zjxbh='"+zjxbh+"'");
%>
<frameset rows="1200" cols="430,*" frameborder="YES" border="0" framespacing="4"> 
  <frameset rows="700,*" frameborder="YES" border="0" framespacing="1"> 
    <frame name="tjmain" resize scrolling="NO" src="InsertJc_zcddmxAjax.jsp?ddbh=<%=ddbh%>&zjxbh=<%=zjxbh%>&dqbm=<%=dqbm%>&ppbm=<%=ppbm%>">
  </frameset>
  <frameset rows="700,*" frameborder="YES" border="0" framespacing="1"> 
    <frame name="tjmain2" resize scrolling="YES" src="Jc_zczjxmxAjaxList.jsp?ddbh=<%=ddbh%>&zjxbh=<%=zjxbh%>">
  </frameset>
</frameset>

<noframes>

<body bgcolor="#FFFFFF">
<noscript><iframe scr="*.htm"></iframe></noscript>
</body>
</noframes>
</html>
