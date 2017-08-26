<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>主材订单明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));
String cglb=null;
cglb=cf.GB2Uni(request.getParameter("cglb"));
String cllb=cf.GB2Uni(request.getParameter("cllb"));
String dqbm=cf.executeQuery("select dqbm from jxc_clcgjh,sq_dwxx where jxc_clcgjh.ssfgs=sq_dwxx.dwbh and cgjhph='"+cgjhph+"'");
%>
<frameset rows="350,*"  frameborder="YES" border="0" framespacing="0" noresize> 
  <frameset rows="350,*" frameborder="YES" border="0" framespacing="0"> 
    <frame name="tjmain" resize scrolling="NO" src="InsertTm.jsp?cgjhph=<%=cgjhph%>&dqbm=<%=dqbm%>&cglb=<%=cglb%>&cllb=<%=cllb%>">
  </frameset>
  <frameset rows="100%,*" frameborder="YES" border="0" framespacing="0"> 
    <frame name="tjmain2" resize scrolling="YES" src="XhList.jsp?cgjhph=<%=cgjhph%>">
  </frameset>
</frameset>



<body bgcolor="#FFFFFF">
<noscript><iframe scr="*.htm"></iframe></noscript>
</body>
</noframes>
</html>
