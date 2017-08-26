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
	String ml=cf.today("YYYY");

	int maxSize=2;//最大尺寸

	try 
	{
		ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
		up.initialize();

		String khbh=cf.GB2Uni(up.getParameter("khbh"));
		String wjsm=up.getParameter("wjsm");

		conn=cf.getConnection();

		loadname=up.getFileName("loadname");
		byte[] buffer=up.getFileBuffer("loadname");

		int size=buffer.length/(1024*1024);
		if (size>maxSize)
		{
			out.println("错误！上传文件大小不能超过["+maxSize+"MB]，该文件大小为["+size+"MB]");
			return;
		}


		loadname=loadname.substring(loadname.lastIndexOf('\\')+1);


		//为名称加前缀
		loadname=khbh+"-"+loadname;



		if (!cf.isFileType(loadname))
		{
			out.println("错误！不是允许的上传文件类型");
			return;
		}

		String oldkhbh="";
		ls_sql="SELECT khbh";
		ls_sql+=" FROM crm_sjzlk";
		ls_sql+=" where wjmc='"+loadname+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			oldkhbh=rs.getString(1);

			if (!oldkhbh.equals(khbh))
			{
				out.println("错误！[文件名称]已被--客户编号["+oldkhbh+"]使用，不能使用重复名称");
				return;
			}
		}
		rs.close();
		ps.close();

		String dirStr=ls+"/zlkxt/files/sjzlk/"+ml+"/";
		
		//目录不存在创建目录
		java.io.File dir=new java.io.File(dirStr);
		if (!dir.isDirectory())
		{
			java.io.File lsFile=new java.io.File(dirStr);
			lsFile.mkdir();
		}

		String filename=dirStr+loadname;

		java.io.FileOutputStream f=new java.io.FileOutputStream(filename);
		f.write(buffer);
		f.close();

		if (!oldkhbh.equals(khbh))
		{
			ls_sql="insert into crm_sjzlk(wjmc,khbh,ml,wjsm) values(?,?,?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,loadname);
			ps.setString(2,khbh);
			ps.setString(3,ml);
			ps.setString(4,wjsm);
			ps.executeUpdate();
			ps.close();
		}

		%>
		<SCRIPT language=javascript >
		<!--
		alert("上传文件成功！");
		history.go(-1);
		//-->
		</SCRIPT>
		<%
	}
	catch (Exception e) {
	  out.print("上传文件失败，Exception:" + e);
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
