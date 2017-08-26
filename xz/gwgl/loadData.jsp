<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>导入工资初始化信息 </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String filename=null;
String gwfj=null;
java.io.FileOutputStream f=null;

String[][] outStr=null; 
String bgcolor=null;

String gwbh =null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try 
{
	conn=cf.getConnection();

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	gwbh = up.getParameter("gwbh");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename =up.getFileName("loadName");
	filename=filename.substring(filename.lastIndexOf('\\')+1);
	gwfj=filename;

	if (!cf.isFileType(gwfj))
	{
		out.println("错误！不是允许的上传文件类型");
		return;
	}


	int xh=0;
	ls_sql="select count(*)";
	ls_sql+=" from  xz_gwgl";
	ls_sql+=" where gwbh!='"+gwbh+"' and gwfj='"+gwfj+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (xh>0)
	{
		out.println("错误！[公文附件名称]已存在");
		return;
	}

	filename =rootPath+"\\xz\\gwgl\\file\\"+filename;
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer);
	f.close();



	ls_sql="update xz_gwgl set gwfj=?";
	ls_sql+=" where  (gwbh='"+gwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gwfj);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("上传成功！");
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
		if (f!= null) f.close(); 
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 
