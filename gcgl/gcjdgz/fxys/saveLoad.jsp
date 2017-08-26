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

	int maxSize=100;//最大尺寸

	try 
	{
		ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
		up.initialize();

		String ysjlh=cf.GB2Uni(up.getParameter("ysjlh"));

		loadname=up.getFileName("loadname");
		byte[] buffer=up.getFileBuffer("loadname");

		int size=buffer.length/1024;
		if (size>maxSize)
		{
			out.println("错误！上传文件大小不能超过["+maxSize+"K]，该文件大小为["+size+"K]");
			return;
		}

		loadname=loadname.substring(loadname.lastIndexOf('\\')+1);


		//为照片名称加前缀
		loadname=ysjlh.toUpperCase()+"-"+loadname;


		if (!cf.isFileType(loadname))
		{
			out.println("错误！不是允许的上传文件类型");
			return;
		}

		conn=cf.getConnection();


		String oldysjlh="";
		ls_sql="SELECT ysjlh";
		ls_sql+=" FROM crm_gcfxyszp";
		ls_sql+=" where yszpmc='"+loadname+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			oldysjlh=rs.getString(1);

			if (!oldysjlh.equals(ysjlh))
			{
				out.println("错误！[照片名称]已存在");
				return;
			}
		}
		rs.close();
		ps.close();


		String filename=ls+"/gcgl/gcjdgz/fxys/fxysimages/"+loadname;

		java.io.FileOutputStream f=new java.io.FileOutputStream(filename);
		f.write(buffer);
		f.close();


		if (!oldysjlh.equals(ysjlh))
		{
			ls_sql="insert into crm_gcfxyszp(yszpmc,ysjlh) values(?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,loadname);
			ps.setString(2,ysjlh);
			ps.executeUpdate();
			ps.close();

			int zpsl=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_gcfxyszp";
			ls_sql+=" where ysjlh='"+ysjlh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zpsl=rs.getInt(1);
			}
			rs.close();
			ps.close();
		
			ls_sql="update crm_gcfxysjl set zpsl=?";
			ls_sql+=" where ysjlh='"+ysjlh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,zpsl);
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
