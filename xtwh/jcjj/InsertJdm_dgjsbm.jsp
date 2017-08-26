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

<form method="post" action="SaveInsertJdm_dgjsbm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">吊柜进深区间编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dgjsbm" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">吊柜进深区间名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dgjsmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">大于（mm）</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dy" value="" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">小于等于（mm）</div>
  </td>
  <td width="35%"> 
    <input type="text" name="xydy" value="" size="20" maxlength="8" >
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
	if(	javaTrim(FormName.dgjsbm)=="") {
		alert("请输入[吊柜进深区间编码]！");
		FormName.dgjsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dgjsmc)=="") {
		alert("请输入[吊柜进深区间名称]！");
		FormName.dgjsmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dy)=="") {
		alert("请输入[大于（mm）]！");
		FormName.dy.focus();
		return false;
	}
	if(!(isNumber(FormName.dy, "大于（mm）"))) {
		return false;
	}
	if(	javaTrim(FormName.xydy)=="") {
		alert("请输入[小于等于（mm）]！");
		FormName.xydy.focus();
		return false;
	}
	if(!(isNumber(FormName.xydy, "小于等于（mm）"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
