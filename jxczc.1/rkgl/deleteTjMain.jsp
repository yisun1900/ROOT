<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] rkph=request.getParameterValues("rkph");
if (rkph.length>1)
{
	out.println("错误！一次不能删除多个");
	return;
}

String rklx=cf.executeQuery("select rklx from jxc_rkd where rkph='"+rkph[0]+"'");

if (rklx.equals("F"))//F：发货单入库
{
	response.sendRedirect("deleteTjrkdCkd.jsp?rkph="+rkph[0]);
}
else if (rklx.equals("S"))//S：申购入库
{
	response.sendRedirect("deleteTjrkdSgd.jsp?rkph="+rkph[0]);
}
else{//C：采购入库；T：退货入库；R：调拨入库；S：申购入库；J：代金券退货入库；D：主材订单退货；F：发货单入库；Z：直接入库
	response.sendRedirect("deleteTjrkd.jsp?rkph="+rkph[0]);
}
%>