<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>主材订单明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%
	String ppbm=cf.GB2Uni(request.getParameter("ppbm"));

	String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
	String dqbm=cf.executeQuery("select sq_dwxx.dqbm from sq_dwxx,jc_zczjx where sq_dwxx.dwbh=jc_zczjx.fgsbh and jc_zczjx.zjxbh='"+zjxbh+"'");
	String djlrfs=cf.executeQuery("select sq_dwxx.djlrfs from sq_dwxx,jc_zcdd where jc_zcdd.fgsbh=sq_dwxx.dwbh and jc_zcdd.ddbh='"+ddbh+"'");
	String kgcxhdbl=cf.executeQuery("select sq_dwxx.kgcxhdbl from sq_dwxx,jc_zcdd where jc_zcdd.fgsbh=sq_dwxx.dwbh and jc_zcdd.ddbh='"+ddbh+"'");
%>
<frameset rows="1200" cols="430,*" frameborder="YES" border="0" framespacing="4"> 
  <frameset rows="700,*" frameborder="YES" border="0" framespacing="1"> 
<%
	if (djlrfs.equals("1"))//1：录入单价算折扣；2：录入折扣算单价；3：不可打折
	{
		if (kgcxhdbl.equals("Y"))//Y：可改；N：不可改
		{
			%>
			<frame name="tjmain" resize scrolling="NO" src="InsertJc_zcddmxAjaxDjBl.jsp?ddbh=<%=ddbh%>&zjxbh=<%=zjxbh%>&dqbm=<%=dqbm%>&ppbm=<%=ppbm%>">
			<%
		}
		else{
			%>
			<frame name="tjmain" resize scrolling="NO" src="InsertJc_zcddmxAjaxDj.jsp?ddbh=<%=ddbh%>&zjxbh=<%=zjxbh%>&dqbm=<%=dqbm%>&ppbm=<%=ppbm%>">
			<%
		}
	}
	else if (djlrfs.equals("2"))
	{
		if (kgcxhdbl.equals("Y"))//Y：可改；N：不可改
		{
			%>
			<frame name="tjmain" resize scrolling="NO" src="InsertJc_zcddmxAjaxZkBl.jsp?ddbh=<%=ddbh%>&zjxbh=<%=zjxbh%>&dqbm=<%=dqbm%>&ppbm=<%=ppbm%>">
			<%
		}
		else{
			%>
			<frame name="tjmain" resize scrolling="NO" src="InsertJc_zcddmxAjaxZk.jsp?ddbh=<%=ddbh%>&zjxbh=<%=zjxbh%>&dqbm=<%=dqbm%>&ppbm=<%=ppbm%>">
			<%
		}
	}
	else
	{
		%>
		<frame name="tjmain" resize scrolling="NO" src="InsertJc_zcddmxAjax.jsp?ddbh=<%=ddbh%>&zjxbh=<%=zjxbh%>&dqbm=<%=dqbm%>&ppbm=<%=ppbm%>">
		<%
	}
%>
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
