<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>上载照片</title>
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
			out.println("错误！不是允许的上传文件类型");
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
		alert("上载照片成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
	catch (Exception e) {
		out.print("操作失败，Exception:" + e);
		return;
	}
	finally 
	{
		try{
			if (f!=null) f.close();
		}
		catch (Exception e){
			out.println("关闭连接发生以外,Exception:"+e.getMessage());
		}
	}
%> 
</body>
</html>
