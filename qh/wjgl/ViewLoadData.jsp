<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>导入工资初始化信息 </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
String gwfj=null;
gwfj=cf.GB2Uni(request.getParameter("gwfj"));
%>
<A HREF="/xz/gwgl/file/<%=java.net.URLEncoder.encode(gwfj)%>"><%=gwfj%></A>
</body>
</html>
