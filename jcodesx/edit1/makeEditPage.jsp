<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.jcoding.*' %>

<html>
<head>
<title>�����޸�ҳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
           
<%
	String filename=null;
	String dw_name=request.getParameter("dw_name");
	String tablebox=request.getParameter("tablebox");
	if (tablebox==null)
	{
		tablebox="N";
	}
	try
	{
		JCoding jCoding=new JCoding(dw_name);
		filename=jCoding.makeEditPage(tablebox);
		out.println("<br>�ɹ������ļ�:"+filename);
	}
	catch (Exception e)
	{
		out.print("�����ļ�ʧ�ܣ���������:" + e);
	}
%>
	  
</body>
</html>

