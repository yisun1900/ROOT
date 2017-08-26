<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String tsjlh=request.getParameter("tsjlh");
String lx=cf.executeQuery("select lx from crm_tsjl where tsjlh='"+tsjlh+"'");
if (lx.equals("1"))//1£ºÍ¶Ëß£»2£º±¨ÐÞ
{
	response.sendRedirect("InsertCrm_tshfjl.jsp?tsjlh="+tsjlh);
}
else{
	response.sendRedirect("InsertCrm_bxhfjl.jsp?tsjlh="+tsjlh);
}

%>

