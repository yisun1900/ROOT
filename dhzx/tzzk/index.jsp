<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title></title>
<style type="text/css">
.3dfont { FILTER: glow(color=ffffff,strength=5) shadow(color=cccccc,direction:120); POSITION: relative; WIDTH: 100% } 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="/css/default.css">
<SCRIPT language=javascript src="./js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function submit_onclick()//参数FormName:Form的名称
{
	if(	loginform.yhdlm.value=="") {
		alert("请输入[用户名]！");
		loginform.yhdlm.focus();
		return false;
	}
	if(	loginform.yhkl.value=="") {
		alert("请输入[密 码]！");
		loginform.yhkl.focus();
		return false;
	}
   
	loginform.submit();
	return true;
}
function nextFocus(itemname)
{
	if (event.keyCode==13)
	{
		if (itemname=="yhdlm"){
			if(	loginform.yhdlm.value=="") {
				alert("请输入[用户名]！");
				loginform.yhdlm.focus();
				return false;
			}
			else{
				loginform.yhkl.focus();
			}
		}
		else if(itemname=="yhkl"){
			submit_onclick();
		}
	}
}
//-->
</SCRIPT>


<style type="text/css">
<!--
.style1 {color: #D6D3CE}
-->
</style>
</head>  

<%
	String khbh=request.getParameter("khbh");
%>

<body bgcolor="#999999" onLoad="loginform.yhdlm.focus();"   >
<p>&nbsp; </p>
<p align="center"><strong>调折扣－－请输入用户名、密码</strong></p>
<form  name="loginform" method="post" action="login.jsp">

<table width="32%" border="1" align="center" cellspacing="0" bordercolor="#FFFFFF" >
<tr>
  <td width="43%"><div align="center"><strong>用户名：</strong></div></td>
  <td width="57%"><input name=yhdlm size=18  maxlength="16"  onKeyup="nextFocus(this.name)">
  </td>
</tr>
<tr>
  <td width="43%"><div align="center"><strong>密 码：</strong></div></td>
  <td width="57%"><input type="password" name=yhkl size=18  maxlength="50" onKeyup="nextFocus(this.name)">
  </td>
</tr>
<tr>
  <td width="43%" align="right">
	  <input type="hidden" name="khbh" value="<%=khbh%>" >
	  <input type="button" value=" 登陆 " onClick="submit_onclick()">
	</td>
  <td width="57%">&nbsp;</td>
</tr>
</table>

</form>
</body>
</html>

