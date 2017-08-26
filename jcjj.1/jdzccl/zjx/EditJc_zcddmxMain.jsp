<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
String xh=cf.GB2Uni(request.getParameter("xh"));
String lx=cf.executeQuery("select lx from jc_zczjxmx where zjxbh='"+zjxbh+"' and xh="+xh);
String sxbz=cf.executeQuery("select sxbz from jc_zczjxmx where zjxbh='"+zjxbh+"' and xh="+xh);

if (lx.equals("1"))//1：已有项目；2：新增项目
{
	response.sendRedirect("EditOldJc_zcddmx.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
}
else
{
	if (sxbz.equals("1"))//1：非手写；2：手写
	{
		response.sendRedirect("EditNewJc_zcddmx.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
	}
	else
	{
		response.sendRedirect("TqLrEditNewJc_zcddmx.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
	}
}


%>
