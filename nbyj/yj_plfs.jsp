<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�Ų����ʼ�ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" >

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String[] mailtos=null;
String mailfrom="wqingl@sina.com.cn";
String mailto=cf.GB2Uni(request.getParameter("sjr"));//�ռ���
String mailcontent=cf.GB2Uni(request.getParameter("yjnr"));//����
String mailsubject=cf.GB2Uni(request.getParameter("yjzt"));//����
String fjFileName=cf.GB2Uni(request.getParameter("yjfj"));//����
mailtos=mailto.split(",");//�����ݹ����Ĳ����ָ������
out.print(mailcontent);
out.print(fjFileName);
%>

</body>
</html>

