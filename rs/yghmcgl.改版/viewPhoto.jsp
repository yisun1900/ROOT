<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>查看照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ygbh=request.getParameter("ygbh");
String[] filename=request.getParameterValues("filename");//传递的删除文件名
String ls=getServletContext().getRealPath("")+"/rs/yghmcgl/images";

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
			lsFile=new java.io.File(ls+"/"+filename[i]);
			if (lsFile.delete())
			{
				out.println("成功删除图片："+filename[i]);
			}
			else{
				out.println("<BR>不能删除图片，或图片不存在："+filename[i]);
			}
		}
	}
%>
<body bgcolor="#FFFFFF">
<CENTER><B>员工序号：<%=ygbh%></B><BR><HR>
<form method="post" action="viewPhoto.jsp" name="editform">
<input type="hidden" name="ygbh" value="<%=ygbh%>" >
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

	String bianhao=null;
	ls_sql="SELECT bianhao";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bianhao=rs.getString(1);

		%>
			<tr bgcolor="#FFFFFF"> 
			  <td width="15%"> 
				<div align="center"><input name="filename" type=checkbox value="<%=bianhao%>.JPG"></div>
			  </td>
			  <td width="25%"> 
				<div align="center"><%=bianhao%>.JPG</div>
			  </td>
			  <td width="60%"> 
				<div align="center"><img src="/rs/yghmcgl/images/<%=bianhao%>.JPG"></div>
			  </td>
			</tr>
		<%
	}
	rs.close();
	ps.close();
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

<%
}
catch (Exception e) {
	out.print("操作失败，Exception:" + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>

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