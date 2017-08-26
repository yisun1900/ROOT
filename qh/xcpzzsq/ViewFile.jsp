<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String scwjm=null;
String whereqh_xcpzzsh_shbbh=null;
whereqh_xcpzzsh_shbbh=cf.GB2Uni(request.getParameter("shbbh"));
String ls_sql2=null;
ls_sql2="select scwjm from qh_xcpzzsh where shbbh='"+whereqh_xcpzzsh_shbbh+"'";
scwjm=cf.executeQuery(ls_sql2);

String ls=getServletContext().getRealPath("");
String filename="/qh/xcpzzsq/Docs/"+scwjm;
%>

<html>
<body>

<p><a href=<%=filename%>>打开企划文件</a></p>

</body>

</html>

