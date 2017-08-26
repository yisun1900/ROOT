<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_pdqybm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>地区</td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="pdqybm.value=dqbm.value">
        <option value=""></option>
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
      </select>
    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>派单区域编码</td> 
  <td width="32%"> 
    <input type="text" name="pdqybm" value="" size="20" maxlength="4" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>派单区域名称</td> 
  <td width="32%"> 
    <input type="text" name="pdqymc" value="" size="20" maxlength="50" >  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.pdqybm)=="") {
		alert("请输入[派单区域编码]！");
		FormName.pdqybm.focus();
		return false;
	}
	if(	javaTrim(FormName.pdqymc)=="") {
		alert("请输入[派单区域名称]！");
		FormName.pdqymc.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
