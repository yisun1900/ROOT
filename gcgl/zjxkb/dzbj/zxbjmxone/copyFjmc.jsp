<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<%
	String zjxxh=request.getParameter("zjxxh");
	String khbh=request.getParameter("khbh");
	String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
%>
<body bgcolor="#FFFFFF">
<div align="center"><b>拷贝房间信息－－>输入新房间名称</b>
</div>
<form method="post" action="" name="insertform">
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF">
	  <td height="56" align="right"><span class="STYLE1">被拷贝房间名</span>：</td>
	  <td><%=jgwzbm%></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="35%" height="62" align="right"><b><span class="STYLE2">*</span>输入新房间名称：</b></td>
	  <td width="65%"><input name="newjgwzbm" type="text" size="50" maxlength="50"></td>
	</tr>
	<tr> 
	  <td colspan="2" align="center"> 
		  <input type="button"  value="存盘" onClick="f_do(insertform)">
	  <input type="reset"  value="重输" name="reset">
	  <input name="zjxxh" type="hidden" value="<%=zjxxh%>">
	  <input name="khbh" type="hidden" value="<%=khbh%>">
	  <input name="oldjgwzbm" type="hidden" value="<%=jgwzbm%>">
	 </td>
	</tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.newjgwzbm)=="") {
		alert("请输入[新房间名称]！");
		FormName.newjgwzbm.focus();
		return false;
	}


	FormName.action="copyFjxx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
