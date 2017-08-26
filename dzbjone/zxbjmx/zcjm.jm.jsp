<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>



<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));
String jgwzbm=cf.getParameter(request,"jgwzbm");

if (tccplbbm.equals(""))
{
	response.sendRedirect("zcjmFl.jsp?khbh="+khbh+"&jgwzbm="+jgwzbm+"&tcsjflbm="+tcsjflbm);
}
else{
	response.sendRedirect("zcjmXl.jsp?khbh="+khbh+"&tccplbbm="+tccplbbm+"&jgwzbm="+jgwzbm);
}

%>