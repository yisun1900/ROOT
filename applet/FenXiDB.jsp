<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>分析数据库文件结构</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%

	String inFile="D:\\tomcat\\webapps\\ROOT\\applet\\yblerp.DMP";
	String outFile="D:\\tomcat\\webapps\\ROOT\\applet\\FenXiDB1.txt";

	java.io.FileInputStream inIO=null;
	java.io.FileOutputStream outIO=null;

	int count=0;
	byte[] buffer =null;

	int len8i=2268;
	int len9i=2448;//TABLE
	int len10i=2985;

	try {

		buffer =new byte[5000];

		inIO=new FileInputStream(inFile);
		outIO=new FileOutputStream(outFile);

		count=inIO.read(buffer,0,5000);
		outIO.write(buffer,0,count);



		out.println("成功");


	}
	catch (Exception e) {
		out.print("发生意外: " + e);
	}
	finally 
	{
		try
		{
			if (inIO!=null) inIO.close();
			if (outIO!=null) outIO.close();
		}
		catch (Exception e)
		{
		}
	}


%>

</body>
</html>
