<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看版库照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String cpjjbh=request.getParameter("cpjjbh");
String cktp=cf.executeQuery("select cktp from jc_cpjjbj where cpjjbh='"+cpjjbh+"'");
String cptp=cf.executeQuery("select cptp from jc_cpjjbj where cpjjbh='"+cpjjbh+"'");

String[] filename=request.getParameterValues("filename");//传递的删除文件名
String ls=getServletContext().getRealPath("")+"/jcjj/jjbj/cpjjbj/images";


java.io.File dir=new java.io.File(ls);
java.io.File lsFile=null;
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
			out.println("<BR>删除图片失败："+filename[i]);
		}
	}
}
%>
<body bgcolor="#FFFFFF">
<CENTER><B>成品家具编号：<%=cpjjbh%></B><BR><HR>
<form method="post" action="viewPhoto.jsp" name="editform">
<input type="hidden" name="cpjjbh" value="<%=cpjjbh%>" >
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
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> 
		<div align="center"><input name="filename" type=checkbox value="<%=cktp.toUpperCase()%>"></div>
	  </td>
	  <td width="25%"> 
		<div align="center"><%=cktp.toUpperCase()%></div>
	  </td>
	  <td width="60%"> 
		<div align="center"><img src="/jcjj/jjbj/cpjjbj/images/<%=cktp.toUpperCase() %>"></div>
	  </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> 
		<div align="center"><input name="filename" type=checkbox value="<%=cptp.toUpperCase()%>"></div>
	  </td>
	  <td width="25%"> 
		<div align="center"><%=cptp.toUpperCase()%></div>
	  </td>
	  <td width="60%"> 
		<div align="center"><img src="/jcjj/jjbj/cpjjbj/images/<%=cptp.toUpperCase() %>"></div>
	  </td>
	</tr>

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