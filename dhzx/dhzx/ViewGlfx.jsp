<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
	String khbh=request.getParameter("khbh");
	String jzbz=cf.executeQuery("select jzbz from crm_zxkhxx where khbh='"+khbh+"'");
	response.sendRedirect("/dzbj/zxbjmx/Bj_khbjmxGlfxList.jsp?khbh="+khbh);
%>