<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>上载照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<%
	Connection conn  = null;
	PreparedStatement ps=null;
	String ls_sql=null;

	java.io.FileOutputStream f=null;

	String ls=getServletContext().getRealPath("");
	String loadname=null;
	try 
	{
		ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
		up.initialize();

		String clbm=up.getParameter("clbm");

		loadname=up.getFileName("loadname").toUpperCase();
		byte[] buffer=up.getFileBuffer("loadname");
		loadname=loadname.substring(loadname.lastIndexOf('\\')+1);
		String filename=ls+"/jxc/images/"+loadname;
		f=new java.io.FileOutputStream(filename);
		f.write(buffer);
		f.close();

		conn=cf.getConnection();
		
		ls_sql="update jxc_clbm set zp=?";
		ls_sql+=" where clbm='"+clbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,loadname);
		ps.executeUpdate();
		ps.close();

		%>
		<SCRIPT language=javascript >
		<!--
		alert("上载照片成功！");
		history.go(-1);
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
			if (ps!= null) ps.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			out.println("关闭连接发生以外,Exception:"+e.getMessage());
		}
	}
%> 
</body>
</html>
