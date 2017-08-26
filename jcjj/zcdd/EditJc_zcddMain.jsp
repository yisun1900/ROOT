<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String ddlx=cf.executeQuery("select ddlx from jc_zcdd where ddbh='"+ddbh+"'");


if (ddlx.equals("4"))//1：系统存在品牌订单；2：系统不存在品牌订单；3：补录合同；4：有库存订单
{
	response.sendRedirect("/jcjj/kczcdd/EditJc_zcdd.jsp?ddbh="+ddbh);
}
else
{
	response.sendRedirect("/jcjj/zcdd/EditJc_zcdd.jsp?ddbh="+ddbh);
}

%>
