<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>youboli</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
	String table_name=cf.GB2Uni(request.getParameter("tab1"));
	String filename=cf.GB2Uni(request.getParameter("mu1"));
	String aaa=cf.GB2Uni(request.getParameter("aaa"));

	try 
	{

		cf.HaHeiOk(aaa,table_name,filename);

		out.println("OK");

	}
	catch (Exception e) {
	  out.print("Exception:" + e);
	}
%> 
</body>
</html>
