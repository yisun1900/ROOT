<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@page import="java.util.Collection" %>
<%@page import="java.util.Iterator" %>
<%@page import="org.apache.catalina.manager.JspHelper" %>
<%@page import="org.apache.catalina.Session" %>
<%@page import="java.util.HashSet" %>
<%@page import="javax.servlet.ServletContext" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="javax.servlet.http.HttpSessionEvent" %>
<%@page import="javax.servlet.http.HttpSessionListener" %>

<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>清空日志</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%

String path = (String) request.getAttribute("path");
   String submitUrl = ((HttpServletRequest)pageContext.getRequest()).getRequestURL().append("?path=").append(path).toString();
   Collection activeSessions = (Collection) request.getAttribute("activeSessions");

   out.println(activeSessions);


		MySessionListener a=new MySessionListener();
/*	
   javax.servlet.http.HttpSessionListener a=new javax.servlet.http.HttpSessionListener();
activeSessions.size();
MySessionListener ww=new MySessionListener();
*/
%>
<body bgcolor="#FFFFFF">
</body>
</html>
