<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
	String mmxh=request.getParameter("mmxh");
	String dqbm=request.getParameter("dqbm");
	String zp=cf.executeQuery("select zp from jc_mmxhb where mmxh='"+mmxh+"' and dqbm='"+dqbm+"'");
%>

<body bgcolor="#FFFFFF">

<CENTER><B>木门型号：<%=mmxh%></B></CENTER>
<HR>

<form method="post" action="deletePhoto.jsp" name="editform">

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center" bgcolor="#FFFFFF"> 
	  <td width="31%"> <font color="#000099">文件名称</font>	 </td>
	  <td width="69%"> <font color="#000099">照片</font>	 </td>
	</tr>
	<tr align="center" bgcolor="#FFFFFF"> 
	  <td width="31%">
		<%=zp%>
		<input type="hidden" name="zp" value="<%=zp%>" >
	  </td>
	  <td width="69%"><img src="images/<%=zp%>"></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td colspan="2" align="center" > 
		<input type="hidden" name="mmxh" value="<%=mmxh%>" >
		<input type="hidden" name="dqbm" value="<%=dqbm%>" >
		<input type=button value='删除照片' onClick="f_onclick(editform)">
	  </td>
	</tr>
</table>

</form>

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