<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>



<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String jmfl=cf.getParameter(request,"jmfl");

response.sendRedirect("DeleteZcjmFl.jsp?khbh="+khbh+"&jmfl="+jmfl);

%>