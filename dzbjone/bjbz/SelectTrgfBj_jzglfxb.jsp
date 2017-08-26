<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
%>


<html>
<head>
<title>家装工料分析表</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="Bj_jzglfxbTrgfList.jsp" name="insertform" target="_blank">
  <div align="center">工料分析－调整人工费</div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>

    <tr bgcolor="#FFFFFF">
      <td width="43%" height="35" align="right"><span class="STYLE2">*</span>地区</td>
      <td width="57%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="38" align="right"><span class="STYLE2">*</span>人工费名称</td>
      <td><input name="glfxclmc" type="text" id="glfxclmc" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="38" align="right"><span class="STYLE2">*</span>单价</td>
      <td><input type="text" name="dj" value="" size="20" maxlength="17" ></td>
    </tr>
    
    <tr align="center"> 
      <td height="40" colspan="2"> 
        <input type="button" onClick="f_do(insertform)"  value="修改单价" name="th">
        <input type="button"  value="查看需修改报价项目" onClick="f_ck(insertform)"></td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.glfxclmc)=="") {
		alert("请输入[人工费名称]！");
		FormName.glfxclmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}

	FormName.action="SavePlTrgfClbm.jsp";
	FormName.submit();
	FormName.th.disabled=true;
	return true;
}
function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.glfxclmc)=="") {
		alert("请输入[人工费名称]！");
		FormName.glfxclmc.focus();
		return false;
	}



	FormName.action="Bj_jzglfxbPlTrgfList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
