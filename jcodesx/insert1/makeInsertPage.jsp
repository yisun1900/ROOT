<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.jcoding.*' %>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
           
<%
	String filename=null;
	String dw_name=request.getParameter("dw_name");
	try
	{
		JCoding jCoding=new JCoding(dw_name);
		filename=jCoding.makeInsertPage();
		out.println("<br>�ɹ������ļ�:"+filename);
	}
	catch (Exception e)
	{
		out.print("�����ļ�ʧ�ܣ���������:" + e);
	}
%>
	  
</body>
</html>

