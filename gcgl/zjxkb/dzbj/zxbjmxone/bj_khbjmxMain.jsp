<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>电子报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
	String khbh=request.getParameter("khbh");
	String zjxxh=request.getParameter("zjxxh");

	String dqbm=request.getParameter("dqbm");
	String jzbz=cf.executeQuery("select jzbz from crm_zxkhxx where khbh='"+khbh+"'");

%>
<frameset rows="*" cols="180,*" frameborder="YES" border="0" framespacing="3"> 
  <frame name="menu" scrolling="YES" resize src="menu.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&dqbm=<%=dqbm%>&jzbz=<%=jzbz%>">
  <frameset rows="45,*" frameborder="YES" border="0" framespacing="1"> 
    <frame name="guol" resize scrolling="NO" src="guol.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&dqbm=<%=dqbm%>&jzbz=<%=jzbz%>">
    <frame name="main" scrolling="NO" src="note.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&dqbm=<%=dqbm%>&jzbz=<%=jzbz%>">
  </frameset>
</frameset>

<noframes>

<body bgcolor="#FFFFFF">
<noscript><iframe scr="*.htm"></iframe></noscript>
</body>
</noframes>
</html>
