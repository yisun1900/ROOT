<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.jcoding.*' %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
           
<%
	String filename=null;
	String dw_name=request.getParameter("dw_name");
	String editbox=request.getParameter("editbox");
	String deletebox=request.getParameter("deletebox");
	String tablebox=request.getParameter("tablebox");
	if (editbox==null)
	{
		editbox="N";
	}
	if (deletebox==null)
	{
		deletebox="N";
	}
	if (tablebox==null)
	{
		tablebox="N";
	}
	try
	{
		JCoding jCoding=new JCoding(dw_name);
		filename=jCoding.makeSelectPage(editbox,deletebox,tablebox);
		out.println("<br>成功生成文件:"+filename);
	}
	catch (Exception e)
	{
		out.print("生成文件失败！发生意外:" + e);
	}
%>
	  
</body>
</html>

