<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String lx=request.getParameter("lx");
String jlh=request.getParameter("jlh");

if (lx.equals("1"))
{
	String khbh=cf.executeQuery("select khbh from crm_khsmjl where jlh='"+jlh+"'");
	response.sendRedirect("InsertCrm_zxhfjlSm.jsp?jlh="+jlh+"&khbh="+khbh);
}
%>


