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

<form method="post" action="SaveInsertKp_pfxmbm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">评分项目编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="pfxmbm" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">评分项目名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="pfxmmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">分值</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fz" value="" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">对应考评大类</div>
  </td>
  <td width="35%"> 
    <select name="kpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm","");
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
	if(	javaTrim(FormName.pfxmbm)=="") {
		alert("请输入[评分项目编码]！");
		FormName.pfxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pfxmmc)=="") {
		alert("请输入[评分项目名称]！");
		FormName.pfxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.fz)=="") {
		alert("请输入[分值]！");
		FormName.fz.focus();
		return false;
	}
	if(!(isNumber(FormName.fz, "分值"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
