<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<%

String yhdlm=request.getParameter("yhdlm").trim();
String ygbh=request.getParameter("ygbh").trim();

session.setAttribute("gtltygbh",ygbh);
session.setAttribute("gtltyhdlm",yhdlm);

String ygbh1=(String)session.getAttribute("ygbh");
String yhdlm1=(String)session.getAttribute("gtltyhdlm");
//out.print(ygbh1+yhdlm1);
//response.sendRedirect("ktz.jsp");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
 <SCRIPT language=javascript >
window.close();
</SCRIPT>
  <TITLE> New Document </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
 </HEAD>

 <BODY>
  
 </BODY>
</HTML>

<a href="ktz.jsp">µã»÷·ÃÎÊÂÛÌ³</a>