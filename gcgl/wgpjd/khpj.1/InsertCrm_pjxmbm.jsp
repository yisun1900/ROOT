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
<form method="post" action="SaveInsertCrm_pjxmbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">受评价人员</td>
      <td width="31%"> 
        <select name="spjrybm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="pjxmbm.value=spjrybm.value+xmflbm.value" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select spjrybm,spjry from crm_spjrybm order by spjrybm","");
%> 
        </select>
      </td>
      <td align="right" width="17%">项目分类</td>
      <td width="33%"> 
        <select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="pjxmbm.value=spjrybm.value+xmflbm.value" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select xmflbm,xmfl from crm_xmflbm order by xmflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">评价项目编码(6位)</td>
      <td width="31%"> 
        <input type="text" name="pjxmbm" value="" size="20" maxlength="6" >
      </td>
      <td align="right" width="17%">序号</td>
      <td width="33%"> 
        <input type="text" name="xh" value="" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">评价项目</td>
      <td colspan="3"> 
        <input type="text" name="pjxm" value="" size="71" maxlength="40" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">显示方式</td>
      <td colspan="3"> 
        <input type="radio" name="xsfs"  value="1">
        项目分类多选 
        <input type="radio" name="xsfs"  value="2">
        项目分类单选 </td>
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
	if(	javaTrim(FormName.spjrybm)=="") {
		alert("请选择[受评价人员]！");
		FormName.spjrybm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmflbm)=="") {
		alert("请选择[项目分类]！");
		FormName.xmflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pjxmbm)=="") {
		alert("请输入[评价项目编码(6位)]！");
		FormName.pjxmbm.focus();
		return false;
	}
	if (FormName.pjxmbm.value.length!=6)
	{
		alert("[评价项目编码]应为6位！");
		FormName.pjxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pjxm)=="") {
		alert("请输入[评价项目]！");
		FormName.pjxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xsfs)) {
		alert("请选择[显示方式]！");
		FormName.xsfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
