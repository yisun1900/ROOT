<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String ddbh=request.getParameter("ddbh");
String khlx=cf.executeQuery("select khlx from jc_cgdd where ddbh='"+ddbh+"'");
if (khlx.equals("1"))//1：装修客户；2：橱柜客户
{
	response.sendRedirect("EditJc_cgdd.jsp?ddbh="+ddbh);
}
else{
	response.sendRedirect("EditJc_cgdd1.jsp?ddbh="+ddbh);
}

%>

