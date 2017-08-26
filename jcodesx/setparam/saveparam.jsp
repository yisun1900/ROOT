<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="ep" scope="page" class="ybl.jcoding.EnvParam"/>

<html>
<head>
<title>配置系统参数</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String txtpath=request.getParameter("txtpath");
String outpath=request.getParameter("outpath");
String previewpath=request.getParameter("previewpath");
String style=request.getParameter("style");
String size=request.getParameter("size");
String database=request.getParameter("database");
String appserver=request.getParameter("appserver");
String viewcodetools=request.getParameter("viewcodetools");

try
{
	ep.setProperty("txtpath", txtpath);
	ep.setProperty("outpath", outpath);
	ep.setProperty("previewpath", previewpath);
	ep.setProperty("style", style);
	ep.setProperty("size", size);
	ep.setProperty("database", database);
	ep.setProperty("appserver", appserver);
	ep.setProperty("viewcodetools", viewcodetools);

	ep.store();

	out.println("存盘成功！");
}
catch(Exception e)
{
	out.println("Exception："+e);
	return;
}

%>
<body bgcolor="#FFFFFF">
</body>
</html>
