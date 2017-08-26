<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>上传图片</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
	String ls=getServletContext().getRealPath("");
	String loadname=null;


	int maxSize=20480;//最大尺寸

	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;

	try 
	{
		ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
		up.initialize();

		String yszpmc=up.getParameter("yszpmc");
		String ysjlh=up.getParameter("ysjlh");
		String zpml=up.getParameter("zpml");


		loadname=up.getFileName("loadname");
		if (!cf.isFileType(loadname))
		{
			out.println("错误！不是允许的上传文件类型");
			return;
		}

		byte[] buffer=up.getFileBuffer("loadname");

		int size=buffer.length/1024;
		if (size>maxSize)
		{
			out.println("错误！上传文件大小不能超过["+maxSize+"K]，该文件大小为["+size+"K]");
			return;
		}


		String filename=ls+"/yblimg/gcys/"+zpml+"/"+yszpmc;

		java.io.FileOutputStream f=new java.io.FileOutputStream(filename);
		f.write(buffer);
		f.close();

		String inF=filename;
		String outF=filename;
		int outWidth=800;
		int outHeight=800;
		boolean rateIs=true;

		ybl.common.ImgDeal.compressPic(inF,outF,outWidth,outHeight,rateIs);  

		conn=cf.getConnection();

		ls_sql =" update crm_heyszp set zpshbz='C' ";
		ls_sql+=" where yszpmc='"+yszpmc+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
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
	  out.print("上载照片失败，Exception:" + e);
	}
	finally
	{
		try{
			if (ps != null) ps.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			if (conn != null) cf.close(conn); 
		}
	}

%> 
</body>
</html>
