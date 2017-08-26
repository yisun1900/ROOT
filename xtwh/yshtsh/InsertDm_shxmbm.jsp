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
<%
String str=cf.getItemData("select shxmxlbm,shxmxlmc,shxmdlbm from dm_ysshxmxlbm order by shxmdlbm,shxmxlbm");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">预算审核项目编码</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertDm_shxmbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><span class="STYLE1">*</span>审核项目大类</div>              </td>
              <td width="33%"> 
                <select name="shxmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(shxmdlbm,shxmxlbm,<%=str%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select shxmdlbm,shxmdlmc from dm_ysshxmdlbm order by shxmdlbm","");
%> 
                </select>              </td>
              <td width="19%"> 
                <div align="right"><span class="STYLE1">*</span>审核项目小类</div>              </td>
              <td width="31%"> 
                <select name="shxmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select shxmxlbm,shxmxlmc from dm_ysshxmxlbm order by shxmdlbm,shxmxlbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><span class="STYLE1">*</span>审核项目编码</div>              </td>
              <td width="33%"> 
                <input type="text" name="shxmbm" value="" size="20" maxlength="4" >              </td>
              <td width="19%"> 
                <div align="right"><span class="STYLE1">*</span>扣分</div>              </td>
              <td width="31%"> 
                <input type="text" name="kf" value="" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>审核项目名称</td>
              <td colspan="3"><input type="text" name="shxmmc" value="" size="75" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>扣分规则</td>
              <td colspan="3">
				  <input type="radio" name="kfgz" value="1">第2次审核开始扣分
				  <BR>
				  <input type="radio" name="kfgz" value="2">每次都扣分
				  <BR>
				  <input type="radio" name="kfgz" value="3">相同项目出现2次开始扣分
				  <BR>
				  <input type="radio" name="kfgz" value="4">相同项目只扣1次分
			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"><textarea name="bz" cols="74" rows="4"></textarea></td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">              </td>
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
	if(	javaTrim(FormName.shxmbm)=="") {
		alert("请输入[审核项目编码]！");
		FormName.shxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmmc)=="") {
		alert("请输入[审核项目名称]！");
		FormName.shxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmdlbm)=="") {
		alert("请选择[审核项目大类]！");
		FormName.shxmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmxlbm)=="") {
		alert("请选择[审核项目小类]！");
		FormName.shxmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kf)=="") {
		alert("请输入[扣分]！");
		FormName.kf.focus();
		return false;
	}
	if(!(isFloat(FormName.kf, "扣分"))) {
		return false;
	}

	if(	!radioChecked(FormName.kfgz)) {
		alert("请选择[扣分规则]！");
		FormName.kfgz[0].focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
