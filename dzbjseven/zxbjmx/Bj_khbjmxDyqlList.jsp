<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
	String khbh=request.getParameter("khbh");
	String zjxxh=cf.executeQuery("select zjxxh from crm_khxx where khbh='"+khbh+"'");
	if (zjxxh==null)
	{
		response.sendRedirect("Bj_khbjmxDyqlHtList.jsp?khbh="+khbh);
	}
	else{
		response.sendRedirect("Bj_khbjmxDyqlZjxList.jsp?khbh="+khbh+"&zjxxh="+zjxxh);
	}
%>