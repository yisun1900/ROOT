<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String yddbh=request.getParameter("yddbh");
String khlx=cf.executeQuery("select khlx from jc_mmydd where yddbh='"+yddbh+"'");
if (khlx.equals("1"))//1：装修客户；2：橱柜客户
{
	response.sendRedirect("EditJc_mmydd.jsp?yddbh="+yddbh);
}
else{
	response.sendRedirect("EditJc_mmydd1.jsp?yddbh="+yddbh);
}

%>

