<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>上传图片到数据库</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

		String kcjlh=cf.GB2Uni(up.getParameter("kcjlh"));
		conn=cf.getConnection();

		loadname=up.getFileName("loadname");
		byte[] buffer=up.getFileBuffer("loadname");
		loadname=loadname.substring(loadname.lastIndexOf('\\')+1);


		//为照片名称加前缀
		loadname=kcjlh.toUpperCase()+"-"+loadname;


		if (!cf.isFileType(loadname))
		{
			out.println("错误！不是允许的上传文件类型");
			return;
		}



		String oldkcjlh="";
		ls_sql="SELECT kcjlh";
		ls_sql+=" FROM crm_xckczp";
		ls_sql+=" where xczpmc='"+loadname+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			oldkcjlh=rs.getString(1);

			if (!oldkcjlh.equals(kcjlh))
			{
				out.println("错误！[照片名称]已存在");
				return;
			}
		}
		rs.close();
		ps.close();


		String filename=ls+"/tsgl/images/"+loadname;

		java.io.FileOutputStream f=new java.io.FileOutputStream(filename);
		f.write(buffer);
		f.close();

		if (!oldkcjlh.equals(kcjlh))
		{
			ls_sql="insert into crm_xckczp(xczpmc,kcjlh) values(?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,loadname);
			ps.setString(2,kcjlh);
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
