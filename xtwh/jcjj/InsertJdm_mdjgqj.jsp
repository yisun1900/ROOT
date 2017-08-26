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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJdm_mdjgqj.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">门类型</td>
              <td width="35%"> 
                <select name="mlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mlx,mlxmc from jdm_mlx order by mlx","");
%> 
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">门洞价格区间编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="mdjgqjbm" value="" size="20" maxlength="2" >
              </td>
              <td width="15%"> 
                <div align="right">门洞价格区间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="mdjgqj" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">起始宽度（>）</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qskd" value="" size="20" maxlength="8" >
                mm </td>
              <td width="15%"> 
                <div align="right">终止宽度（<=）</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zzkd" value="" size="20" maxlength="8" >
                mm </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">起始高度（>）</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qsgd" value="" size="20" maxlength="8" >
                mm </td>
              <td width="15%"> 
                <div align="right">终止高度（<=）</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zzgd" value="" size="20" maxlength="8" >
                mm </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.mlx)=="") {
		alert("请选择[门类型]！");
		FormName.mlx.focus();
		return false;
	}
	if(	javaTrim(FormName.mdjgqjbm)=="") {
		alert("请输入[门洞价格区间编码]！");
		FormName.mdjgqjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mdjgqj)=="") {
		alert("请输入[门洞价格区间]！");
		FormName.mdjgqj.focus();
		return false;
	}
	if(	javaTrim(FormName.qskd)=="") {
		alert("请输入[起始宽度]！");
		FormName.qskd.focus();
		return false;
	}
	if(!(isNumber(FormName.qskd, "起始宽度"))) {
		return false;
	}
	if(	javaTrim(FormName.zzkd)=="") {
		alert("请输入[终止宽度]！");
		FormName.zzkd.focus();
		return false;
	}
	if(!(isNumber(FormName.zzkd, "终止宽度"))) {
		return false;
	}
	if(	javaTrim(FormName.qsgd)=="") {
		alert("请输入[起始高度]！");
		FormName.qsgd.focus();
		return false;
	}
	if(!(isNumber(FormName.qsgd, "起始高度"))) {
		return false;
	}
	if(	javaTrim(FormName.zzgd)=="") {
		alert("请输入[终止高度]！");
		FormName.zzgd.focus();
		return false;
	}
	if(!(isNumber(FormName.zzgd, "终止高度"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
