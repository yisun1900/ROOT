<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));
String clzt=cf.executeQuery("select clzt from crm_xcjdjl where jdjlh='"+jdjlh+"'");
if (clzt.equals("1"))//1�����룻2��ȷ�ϣ�3������ȷ�ϣ�4��������ɣ�5��������6���ѽ���
{
	response.sendRedirect("EditCrm_xcjdjl.jsp?jdjlh="+jdjlh);
}
else{
	response.sendRedirect("EditQrSbCrm_xcjdjl.jsp?jdjlh="+jdjlh);
}

%>


