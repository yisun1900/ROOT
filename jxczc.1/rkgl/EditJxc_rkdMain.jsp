<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String rklx=cf.executeQuery("select rklx from jxc_rkd where rkph='"+rkph+"'");

if (rklx.equals("F"))//F：发货单入库
{
	response.sendRedirect("EditJxc_rkdCkd.jsp?rkph="+rkph);
}
else if (rklx.equals("S"))//S：申购入库
{
	response.sendRedirect("EditJxc_rkdSgd.jsp?rkph="+rkph);
}
else if (rklx.equals("C"))//C：采购入库
{
	response.sendRedirect("EditJxc_rkdGys.jsp?rkph="+rkph);
}
else{//C：采购入库；T：退货入库；R：调拨入库；S：申购入库；J：代金券退货入库；D：主材订单退货；F：发货单入库；Z：直接入库
	response.sendRedirect("EditJxc_rkd.jsp?rkph="+rkph);
}
%>