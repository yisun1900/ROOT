<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>������Ƭ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
	ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

	String ls=getServletContext().getRealPath("");

	java.io.FileOutputStream f=null;

	try 
	{
		ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
		up.initialize();

		String loadname=up.getFileName("loadname");
		loadname=loadname.substring(loadname.lastIndexOf('\\')+1);
		String fj=loadname;

		if (!cf.isFileType(fj))
		{
			out.println("���󣡲���������ϴ��ļ�����");
			return;
		}


		String ygbh=up.getParameter("ygbh");
		byte[] buffer=up.getFileBuffer("loadname");

		String bianhao=cf.executeQuery("select bianhao from sq_yhxx where ygbh="+ygbh);

		String filename=ls+"/rs/yghmcgl/images/"+bianhao+".JPG";


		f=new java.io.FileOutputStream(filename);
		f.write(buffer);
		f.close();

	
		
		%>
		<SCRIPT language=javascript >
		<!--
		alert("������Ƭ�ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
	catch (Exception e) {
		out.print("����ʧ�ܣ�Exception:" + e);
		return;
	}
	finally 
	{
		try{
			if (f!=null) f.close();
		}
		catch (Exception e){
			out.println("�ر����ӷ�������,Exception:"+e.getMessage());
		}
	}
%> 
</body>
</html>
