<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>上传图片到数据库</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
	String ls=getServletContext().getRealPath("");
	String loadname=null;
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	try 
	{
		ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
		up.initialize();

		String xjjlh=cf.GB2Uni(up.getParameter("xjjlh"));

		loadname=up.getFileName("loadname").toUpperCase();
		byte[] buffer=up.getFileBuffer("loadname");

		loadname=loadname.substring(loadname.lastIndexOf('\\')+1);
		loadname=xjjlh.toUpperCase()+"_"+loadname;
		String filename=loadname;
		filename=ls+"/sgdgl/xjgd/images/"+filename;

		if (!cf.isFileType(filename))
		{
			out.println("错误！不是允许的上传文件类型");
			return;
		}


//		out.println("<BR>filename="+filename);
		java.io.FileOutputStream f=new java.io.FileOutputStream(filename);
		f.write(buffer);
		f.close();


		conn=cf.getConnection();

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM kp_xjgdjlzp";
		ls_sql+=" where  xjjlh='"+xjjlh+"' and xjzpmc='"+loadname+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			ls_sql="insert into kp_xjgdjlzp(xjzpmc,xjjlh) values(?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,loadname);
			ps.setString(2,xjjlh);
			ps.executeUpdate();
			ps.close();
		}


		%>
		<SCRIPT language=javascript >
		<!--
		alert("上载版库照片成功！");
		history.go(-1);
		//-->
		</SCRIPT>
		<%
	}
	catch (Exception e) {
	  out.print("上载版库照片失败，Exception:" + e);
	}
	finally 
	{
		try{
			if (rs!= null) rs.close(); 
			if (ps!= null) ps.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			if (conn != null) cf.close(conn); 
		}
	}
%> 
</body>
</html>
