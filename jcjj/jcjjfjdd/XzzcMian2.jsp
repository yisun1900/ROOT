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
%>
  <frameset rows="150,*" frameborder="YES" border="0" framespacing="1"> 
    <frame name="lr" resize scrolling="NO" src="Bj_khzcmxCxList2.jsp?khbh=<%=khbh%>">
    <frame name="xg" scrolling="YES" src="EditBj_khzcmxAll.jsp?khbh=<%=khbh%>">
  </frameset>

<body bgcolor="#FFFFFF">
</body>
</html>
