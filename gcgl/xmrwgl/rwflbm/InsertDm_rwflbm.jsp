<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_rwflbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">大类</td>
    <td><select name="dl" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="rwflbm.value=this.value">
        <option value=""></option>
        <option value="1">一般</option>
        <option value="2">交底</option>
        <option value="3">进场</option>
        <option value="4">验收</option>
        <option value="5">复尺</option>
        <option value="6">下单</option>
        <option value="7">入库</option>
        <option value="8">送货</option>
        <option value="9">安装</option>
      </select>
    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">任务分类编码(2位)</td> 
  <td width="32%"> 
    <input type="text" name="rwflbm" value="" size="20" maxlength="2" >  </td>
  <td align="right" width="17%">任务分类名称</td> 
  <td width="33%"> 
    <input type="text" name="rwflmc" value="" size="20" maxlength="50" >  </td>
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
	if(	javaTrim(FormName.dl)=="") {
		alert("请选择[大类]！");
		FormName.dl.focus();
		return false;
	}
	if(	javaTrim(FormName.rwflbm)=="") {
		alert("请输入[任务分类编码]！");
		FormName.rwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwflmc)=="") {
		alert("请输入[任务分类名称]！");
		FormName.rwflmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
