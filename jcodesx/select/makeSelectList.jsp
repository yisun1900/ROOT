<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.jcoding.*' %>


<html>
<head>
<title>���ɲ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
           
<%
	String filename=null;
	String dw_name=request.getParameter("dw_name");
	String viewbox=request.getParameter("viewbox");
	String zhdmbox=request.getParameter("zhdmbox");
	String editbox=request.getParameter("editbox");
	String deletebox=request.getParameter("deletebox");
	String pagebox=request.getParameter("pagebox");
	String sumbox=request.getParameter("sumbox");
	String tablebox=request.getParameter("tablebox");
	String colnamebox=request.getParameter("colnamebox");
	if (viewbox==null)
	{
		viewbox="N";
	}
	if (editbox==null)
	{
		editbox="N";
	}
	if (zhdmbox==null)//ת������ 
	{
		zhdmbox="N";
	}
	if (deletebox==null)
	{
		deletebox="N";
	}
	if (pagebox==null)
	{
		pagebox="N";
	}
	if (sumbox==null)
	{
		sumbox="N";
	}
	if (tablebox==null)
	{
		tablebox="N";
	}
	if (colnamebox==null)
	{
		colnamebox="N";
	}
	try
	{
		JCoding jCoding=new JCoding(dw_name);
		filename=jCoding.makeSelectList(viewbox,editbox,deletebox,zhdmbox,pagebox,sumbox,tablebox,colnamebox);
		out.println("<br>�ɹ������ļ�:"+filename);
	}
	catch (Exception e)
	{
		out.print("�����ļ�ʧ�ܣ���������:" + e);
	}
%>
	  
</body>
</html>

