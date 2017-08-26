<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ckphs = request.getParameterValues("ckph");
if (ckphs.length>1)
{
	out.println("错误！一次不能删除多个");
	return;
}

String ckph=ckphs[0];

String cklx=cf.executeQuery("select cklx from jxc_ckd where ckph='"+ckph+"'");

if (cklx.equals("P"))//D：订单出库；B：报废出库；T：退货出库； S：申购出库；P：材料单出库；J：代金券出库；X：销售出库；R:调拨出库
{	
	response.sendRedirect("deleteTjckdCld.jsp?ckph="+ckph);
}
else if (cklx.equals("S"))
{	
	response.sendRedirect("deleteTjckdSgd.jsp?ckph="+ckph);
}
else if (cklx.equals("X"))
{	
	response.sendRedirect("deleteTjckdXsd.jsp?ckph="+ckph);
}
else if (cklx.equals("R"))
{	
	response.sendRedirect("deleteTjckdDbd.jsp?ckph="+ckph);
}
%>