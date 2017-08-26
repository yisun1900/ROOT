<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看工程巡检照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String jcjlh=request.getParameter("jcjlh");

String[] filename=request.getParameterValues("filename");//传递的删除文件名
String ls=getServletContext().getRealPath("")+"/sgdgl/gdrcjc/images";


java.io.File dir=new java.io.File(ls);
java.io.File lsFile=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();

	if ((dir.isDirectory())&&(filename!=null))//执行删除操作
	{
		for (int i=0;i<filename.length ;i++ )
		{
	//		out.println("filename="+ls+"\\"+filename[i]);

			lsFile=new java.io.File(ls+"/"+filename[i]);
			lsFile.delete();

			ls_sql=" delete from kp_gdrcjczp";
			ls_sql+=" where  jcjlh='"+jcjlh+"' and zpmc='"+filename[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			out.println("成功删除图片："+filename[i]);
		}
	}


%>
<body bgcolor="#FFFFFF">
<CENTER>
  <B>巡检记录号：<%=jcjlh%></B><BR>
  <hr>
<form method="post" action="viewPhoto.jsp" name="editform">
<input type="hidden" name="jcjlh" value="<%=jcjlh%>" >
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF"> 
  <td width="15%"> 
	<div align="center"><font color="#000099">选择文件</font></div>
  </td>
  <td width="25%"> 
	<div align="center"><font color="#000099">文件名称</font></div>
  </td>
  <td width="60%"> 
	<div align="center"><font color="#000099">照片</font></div>
  </td>
</tr>
<%

	String yszpmc=null;
	ls_sql="SELECT zpmc";
	ls_sql+=" FROM kp_gdrcjczp";
	ls_sql+=" where  jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yszpmc=rs.getString(1);

		%>
		<tr bgcolor="#FFFFFF"> 
		  <td width="15%"> 
			<div align="center"><input name="filename" type=checkbox value="<%=yszpmc%>"></div>
		  </td>
		  <td width="25%"> 
			<div align="center"><%=yszpmc%></div>
		  </td>
		  <td width="60%"> 
			<div align="center"><img src="/sgdgl/gdrcjc/images/<%=yszpmc.toUpperCase() %>" width="300"></div>
		  </td>
		</tr>
<%
}
	rs.close();
	ps.close();

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
	<tr bgcolor="#FFFFFF">
	<td colspan="3" height="2"> 
	<input type=button value='删除选中的信息' onclick="f_onclick(editform)">
	</td>
	</tr>
</table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	if ( confirm("确实要继续吗?") )	{
		FormName.submit();
		return true;
	}
} 
//-->
</script>