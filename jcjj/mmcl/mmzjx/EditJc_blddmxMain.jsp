<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@include file="/getlogin.jsp"%>

<%  
String lrxh=request.getParameter("lrxh");
String zjxxh=request.getParameter("zjxxh");

String lx=cf.executeQuery("select lx from jc_blzjxmx where zjxxh='"+zjxxh+"' and lrxh="+lrxh);
if (lx.equals("1"))//1：已有项目；2：新增项目
{
	response.sendRedirect("EditZjxJc_blddmx.jsp?lrxh="+lrxh+"&zjxxh="+zjxxh);
}
else{
	response.sendRedirect("EditJc_blddmx.jsp?lrxh="+lrxh+"&zjxxh="+zjxxh);
}

%>

