<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看版库照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String cgbm=request.getParameter("cgbm");
String zp=request.getParameter("zp");
String[] filename=request.getParameterValues("filename");//传递的删除文件名
String ls=getServletContext().getRealPath("")+"/jcjj/cgjg/cgjg/images";
if (zp.indexOf(".")==-1)
{
	out.println("照片名称输入不正确，缺少文件后坠!");
	return;
}

java.io.File dir=new java.io.File(ls);
java.io.File lsFile=null;
if ((dir.isDirectory())&&(filename!=null))//执行删除操作
{
	for (int i=0;i<filename.length ;i++ )
	{
//		out.println("filename="+ls+"\\"+filename[i]);
		lsFile=new java.io.File(ls+"/"+filename[i]);
		if (lsFile.delete())
		{
			out.println("成功删除图片："+filename[i]);
		}
		else{
			out.println("<BR>不能删除图片："+filename[i]);
		}
	}
}
%>
<body bgcolor="#FFFFFF">
<CENTER><B>橱柜编码：<%=cgbm%></B><BR><HR>
<form method="post" action="viewPhoto.jsp" name="editform">
<input type="hidden" name="cgbm" value="<%=cgbm%>" >
<input type="hidden" name="zp" value="<%=zp%>" >
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
if (dir.isDirectory())
{
	filename=dir.list();
	for (int i=0;i<filename.length ;i++ )
	{
		if (filename[i].equals(zp.toUpperCase()))
		{
%>
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> 
		<div align="center"><input name="filename" type=checkbox value="<%=filename[i]%>"></div>
	  </td>
	  <td width="25%"> 
		<div align="center"><%=filename[i]%></div>
	  </td>
	  <td width="60%"> 
		<div align="center"><img src="/jcjj/cgjg/cgjg/images/<%=filename[i].toUpperCase() %>"></div>
	  </td>
	</tr>
<%
		}
	}
}
else{
	out.println(dir+"不是目录");
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