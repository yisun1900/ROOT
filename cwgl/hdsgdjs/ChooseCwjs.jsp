<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>施工队预结算</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
String gdjsjlh=request.getParameter("gdjsjlh");
String jsfs=cf.executeQuery("select jsfs from cw_gdjsjl where gdjsjlh='"+gdjsjlh+"'");

if (jsfs.equals("1") )//1：计提管理费；2：定额结算
{
	response.sendRedirect("/cwgl/hdsgdjsglf/CwjsCw_gdjsjl.jsp?gdjsjlh="+gdjsjlh);
}
else{
	response.sendRedirect("/cwgl/hdsgdjs/CwjsCw_gdjsjl.jsp?gdjsjlh="+gdjsjlh);
}

%>

</body>
</html>
