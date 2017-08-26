<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%

String fkxh=cf.GB2Uni(request.getParameter("fkxh"));
String khbh=cf.executeQuery("select khbh from cw_khfkjl where fkxh='"+fkxh+"'");
String khlx=cf.executeQuery("select count(*) from crm_khxx where khbh='"+khbh+"'");
if (khlx.equals("0"))//0：咨询客户；1：家装客户
{
	response.sendRedirect("/dhzx/dhzx/ViewCrm_zxkhxx.jsp?khbh="+khbh);
}
else {
	response.sendRedirect("/khxx/ViewCrm_khxx.jsp?khbh="+khbh);
}

%>