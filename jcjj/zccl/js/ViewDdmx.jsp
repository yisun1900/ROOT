<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
	String ddbh=cf.fillNull(request.getParameter("ddbh"));

	if (ddbh.length()==9)
	{
		response.sendRedirect("/jcjj/zcdd/ViewJeJc_zcdd.jsp?ddbh="+ddbh);
	}
	else{
		response.sendRedirect("/jcjj/zccl/zjx/ViewJeJc_zczjx.jsp?zjxbh="+ddbh);
	}
%>