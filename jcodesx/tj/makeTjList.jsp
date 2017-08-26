<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.jcoding.*' %>


<html>
<head>
<title>生成插入代码</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
           
<%
	String filename=null;
	String dw_name=request.getParameter("dw_name");
	String tx=request.getParameter("tx");
	String zhdmbox=request.getParameter("zhdmbox");
	if (zhdmbox==null)
	{
		zhdmbox="N";
	}

	try
	{
		JCoding jCoding=new JCoding(dw_name);
		if (tx==null)
		{
			filename=jCoding.makeTjList(zhdmbox);
		}
		else{
			filename=jCoding.makeTjApplet(zhdmbox);
		}
		out.println("<br>成功生成文件:"+filename);
	}
	catch (Exception e)
	{
		out.print("生成文件失败！发生意外:" + e);
	}
%>
	  
</body>
</html>

