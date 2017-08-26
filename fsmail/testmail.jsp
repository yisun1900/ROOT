<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>测试邮件发送</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" >

<%
/*
//*************************************************************************************
/*功能：发送邮件，可附属一个文件
/*参数 String host:邮件服务器名
/*参数 username:申请的邮箱名，如wqingl
/*参数 password:申请的邮箱密码
/*参数 mailfrom:
/*参数 mailto:目的邮箱
/*参数 mailsubject:
/*参数 mailcontent:
/*参数 pFileName:附属文件名
/*************************************************************************************/
//public void sendMail(String mailfrom,String mailto,String mailsubject,String mailcontent,String pFileName) throws Exception
/*************************************************************************************
/*功能：发送邮件，可附属一个文件
/*参数 String host:邮件服务器名
/*参数 username:申请的邮箱名，如wqingl
/*参数 password:申请的邮箱密码
/*参数 mailfrom:
/*参数 mailto[]:目的邮箱
/*参数 mailsubject:
/*参数 mailcontent:
/*参数 pFileName:附属文件名
/*************************************************************************************/
//public void sendMail(String mailfrom,String[] mailto,String mailsubject,String mailcontent,String pFileName) throws Exception
/*************************************************************************************
/*功能：发送邮件，无附属文件
/*参数 String host:邮件服务器名
/*参数 username:申请的邮箱名，如wqingl
/*参数 password:申请的邮箱密码
/*参数 mailfrom:
/*参数 mailto:目的邮箱
/*参数 mailsubject:
/*参数 mailcontent:
/*************************************************************************************/
//public void sendMail(String mailfrom,String mailto,String mailsubject,String mailcontent) throws Exception
/*************************************************************************************
/*功能：发送邮件，无附属文件
/*参数 String host:邮件服务器名
/*参数 username:申请的邮箱名，如wqingl
/*参数 password:申请的邮箱密码
/*参数 mailfrom:
/*参数 mailto[]:目的邮箱
/*参数 mailsubject:
/*参数 mailcontent:
/*************************************************************************************/
//public void sendMail(String mailfrom,String[] mailto,String mailsubject,String mailcontent) throws Exception
/*************************************************************************************
/*功能：发送邮件，无附属文件
/*参数 String host:邮件服务器名
/*参数 username:申请的邮箱名，如wqingl
/*参数 password:申请的邮箱密码
/*参数 mailfrom:
/*参数 mailto:目的邮箱，多个地址用『,』分割，如：wql@sina.com,wql@163.com
/*参数 mailsubject:
/*参数 mailcontent:
/*************************************************************************************/
//public void mail(String mailfrom,String mailto,String mailsubject,String mailcontent) throws Exception
/*************************************************************************************
/*功能：发送邮件，可附属一个文件
/*参数 String host:邮件服务器名
/*参数 username:申请的邮箱名，如wqingl
/*参数 password:申请的邮箱密码
/*参数 mailfrom:
/*参数 mailto:目的邮箱，多个地址用『,』分割，如：wql@sina.com,wql@163.com
/*参数 mailsubject:
/*参数 mailcontent:
/*参数 pFileName:附属文件名
/*************************************************************************************/
//public void mail(String mailfrom,String mailto,String mailsubject,String mailcontent,String pFileName) throws Exception



String mailfrom="wqingl@sina.com.cn";
String mailcontent="北京优铂利信息技术有限公司是一家高科技软件企业，获得北京市高薪技术企业认证， 是一家面向大中型企业的企业管理软件及服务提供商";

try
{
	ybl.mail.JavaMail jm=new ybl.mail.JavaMail();

	//单发
//	String mailsubject="测试java单发邮件";
//	String mailto="yblmailbox@163.com";
//	jm.sendMail(mailfrom,mailto,mailsubject,mailcontent) ;

	//多发
//	String mailsubject="测试java多发邮件";
//	String[] mailtos={"wqingl@sina.com.cn","wql.163.com@163.com","yblmailbox@163.com"};
//	jm.sendMail(mailfrom,mailtos,mailsubject,mailcontent) ;

	//测试java单发带附件邮件
	String mailsubject="测试java单发带附件邮件";
	String mailto="yblmailbox@163.com";
	String fjFileName = "D:\\document\\项目管理\\应用开发任务统计表.doc"; 
	jm.sendMail(mailfrom,mailto,mailsubject,mailcontent,fjFileName) ;


	out.println("邮件发送成功！");
}
catch (Exception e)
{
	out.println("发送邮件失败:"+e);
}


%>

</body>
</html>

