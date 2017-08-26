<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String xh=cf.GB2Uni(request.getParameter("xh"));
String sxbz=cf.executeQuery("select sxbz from jc_zcysdmx where ddbh='"+ddbh+"' and xh="+xh);

if (sxbz.equals("1"))//1£º·ÇÊÖÐ´£»2£ºÊÖÐ´
{
	response.sendRedirect("EditJc_zcddmx.jsp?ddbh="+ddbh+"&xh="+xh);
}
else
{
	response.sendRedirect("TqLrEditJc_zcddmx.jsp?ddbh="+ddbh+"&xh="+xh);
}

%>
