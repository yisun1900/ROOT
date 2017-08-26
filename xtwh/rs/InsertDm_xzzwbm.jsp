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
<form method="post" action="SaveInsertDm_xzzwbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">职务编码</td>
      <td width="35%"> 
        <input type="text" name="xzzwbm" value="" size="20" maxlength="2" >
      </td>
      <td align="right" width="15%">职务名称</td>
      <td width="35%"> 
        <input type="text" name="xzzwmc" value="" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">工种</td>
      <td width="35%"> 
        <select name="gzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm order by zwbm","");
%> 
        </select>
      </td>
      <td align="right" width="15%">职务分类</td>
      <td width="35%">
		<select name="zwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <%
cf.selectItem(out,"select zwflbm,zwflmc from dm_zwflbm order by zwflbm","");
%> 
		</select>
	  </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">岗位职责</td>
      <td colspan="3">
        <textarea name="gwzz" cols="72" rows="12"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.xzzwbm)=="") {
		alert("请输入[职务编码]！");
		FormName.xzzwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xzzwmc)=="") {
		alert("请输入[职务名称]！");
		FormName.xzzwmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gzbm)=="") {
		alert("请选择[工种]！");
		FormName.gzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zwflbm)=="") {
		alert("请选择[职务分类]！");
		FormName.zwflbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
