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
<form method="post" action="SaveInsertDm_dwflbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">单位分类编码</td>
      <td width="35%"> 
        <input type="text" name="dwflbm" value="" size="20" maxlength="2" >
      </td>
      <td align="right" width="15%">单位分类名称</td>
      <td width="35%"> 
        <input type="text" name="dwflmc" value="" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">单位大类</td>
      <td width="35%"> 
        <input type="radio" name="dwdl"  value="1">
        业绩部门 
        <input type="radio" name="dwdl"  value="2">
        非业绩部门 </td>
      <td align="right" width="15%">统计分类</td>
      <td width="35%">
        <select name="dwtjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwtjflbm,dwtjflmc from dm_dwtjflbm order by dwtjflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">职责范围</td>
      <td colspan="3"> 
        <textarea name="zzfw" cols="72" rows="12"></textarea>
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
	if(	javaTrim(FormName.dwflbm)=="") {
		alert("请输入[单位分类编码]！");
		FormName.dwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dwflmc)=="") {
		alert("请输入[单位分类名称]！");
		FormName.dwflmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.dwdl)) {
		alert("请选择[单位大类]！");
		FormName.dwdl[0].focus();
		return false;
	}
	if(	javaTrim(FormName.dwtjflbm)=="") {
		alert("请输入[统计分类]！");
		FormName.dwtjflbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
