<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>�����ʼ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" >

<%
/*
//*************************************************************************************
/*���ܣ������ʼ����ɸ���һ���ļ�
/*���� String host:�ʼ���������
/*���� username:���������������wqingl
/*���� password:�������������
/*���� mailfrom:
/*���� mailto:Ŀ������
/*���� mailsubject:
/*���� mailcontent:
/*���� pFileName:�����ļ���
/*************************************************************************************/
//public void sendMail(String mailfrom,String mailto,String mailsubject,String mailcontent,String pFileName) throws Exception
/*************************************************************************************
/*���ܣ������ʼ����ɸ���һ���ļ�
/*���� String host:�ʼ���������
/*���� username:���������������wqingl
/*���� password:�������������
/*���� mailfrom:
/*���� mailto[]:Ŀ������
/*���� mailsubject:
/*���� mailcontent:
/*���� pFileName:�����ļ���
/*************************************************************************************/
//public void sendMail(String mailfrom,String[] mailto,String mailsubject,String mailcontent,String pFileName) throws Exception
/*************************************************************************************
/*���ܣ������ʼ����޸����ļ�
/*���� String host:�ʼ���������
/*���� username:���������������wqingl
/*���� password:�������������
/*���� mailfrom:
/*���� mailto:Ŀ������
/*���� mailsubject:
/*���� mailcontent:
/*************************************************************************************/
//public void sendMail(String mailfrom,String mailto,String mailsubject,String mailcontent) throws Exception
/*************************************************************************************
/*���ܣ������ʼ����޸����ļ�
/*���� String host:�ʼ���������
/*���� username:���������������wqingl
/*���� password:�������������
/*���� mailfrom:
/*���� mailto[]:Ŀ������
/*���� mailsubject:
/*���� mailcontent:
/*************************************************************************************/
//public void sendMail(String mailfrom,String[] mailto,String mailsubject,String mailcontent) throws Exception
/*************************************************************************************
/*���ܣ������ʼ����޸����ļ�
/*���� String host:�ʼ���������
/*���� username:���������������wqingl
/*���� password:�������������
/*���� mailfrom:
/*���� mailto:Ŀ�����䣬�����ַ�á�,���ָ�磺wql@sina.com,wql@163.com
/*���� mailsubject:
/*���� mailcontent:
/*************************************************************************************/
//public void mail(String mailfrom,String mailto,String mailsubject,String mailcontent) throws Exception
/*************************************************************************************
/*���ܣ������ʼ����ɸ���һ���ļ�
/*���� String host:�ʼ���������
/*���� username:���������������wqingl
/*���� password:�������������
/*���� mailfrom:
/*���� mailto:Ŀ�����䣬�����ַ�á�,���ָ�磺wql@sina.com,wql@163.com
/*���� mailsubject:
/*���� mailcontent:
/*���� pFileName:�����ļ���
/*************************************************************************************/
//public void mail(String mailfrom,String mailto,String mailsubject,String mailcontent,String pFileName) throws Exception



String mailfrom="wqingl@sina.com.cn";
String mailcontent="�����Ų�����Ϣ�������޹�˾��һ�Ҹ߿Ƽ������ҵ����ñ����и�н������ҵ��֤�� ��һ�������������ҵ����ҵ��������������ṩ��";

try
{
	ybl.mail.JavaMail jm=new ybl.mail.JavaMail();

	//����
//	String mailsubject="����java�����ʼ�";
//	String mailto="yblmailbox@163.com";
//	jm.sendMail(mailfrom,mailto,mailsubject,mailcontent) ;

	//�෢
//	String mailsubject="����java�෢�ʼ�";
//	String[] mailtos={"wqingl@sina.com.cn","wql.163.com@163.com","yblmailbox@163.com"};
//	jm.sendMail(mailfrom,mailtos,mailsubject,mailcontent) ;

	//����java�����������ʼ�
	String mailsubject="����java�����������ʼ�";
	String mailto="yblmailbox@163.com";
	String fjFileName = "D:\\document\\��Ŀ����\\Ӧ�ÿ�������ͳ�Ʊ�.doc"; 
	jm.sendMail(mailfrom,mailto,mailsubject,mailcontent,fjFileName) ;


	out.println("�ʼ����ͳɹ���");
}
catch (Exception e)
{
	out.println("�����ʼ�ʧ��:"+e);
}


%>

</body>
</html>

