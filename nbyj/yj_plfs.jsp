<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>优铂利邮件系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" >

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String[] mailtos=null;
String mailfrom="wqingl@sina.com.cn";
String mailto=cf.GB2Uni(request.getParameter("sjr"));//收件人
String mailcontent=cf.GB2Uni(request.getParameter("yjnr"));//内容
String mailsubject=cf.GB2Uni(request.getParameter("yjzt"));//主题
String fjFileName=cf.GB2Uni(request.getParameter("yjfj"));//附件
mailtos=mailto.split(",");//将传递过来的参数分割成数组
out.print(mailcontent);
out.print(fjFileName);
%>

</body>
</html>

