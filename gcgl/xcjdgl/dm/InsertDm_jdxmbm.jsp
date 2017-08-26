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
<form method="post" action="SaveInsertDm_jdxmbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">交底项目编码</td> 
  <td width="35%"> 
    <input type="text" name="jdxmbm" value="" size="20" maxlength="2" >
  </td>
  <td align="right" width="15%">交底项目名称</td> 
  <td width="35%"> 
    <input type="text" name="jdxmmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">交底类型编码</td> 
  <td width="35%"> 
    <select name="jdlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jdlxbm,jdlxmc from dm_jdlxbm order by jdlxbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">交底确认类型</td> 
  <td width="35%"> 
    <select name="jdqrlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jdqrlx,jdqrlxmc from dm_jdqrlx order by jdqrlx","");
%>
    </select>
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
	if(	javaTrim(FormName.jdxmbm)=="") {
		alert("请输入[交底项目编码]！");
		FormName.jdxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jdxmmc)=="") {
		alert("请输入[交底项目名称]！");
		FormName.jdxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jdlxbm)=="") {
		alert("请选择[交底类型编码]！");
		FormName.jdlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jdqrlx)=="") {
		alert("请选择[交底确认类型]！");
		FormName.jdqrlx.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
