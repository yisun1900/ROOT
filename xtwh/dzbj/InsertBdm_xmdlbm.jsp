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

<form method="post" action="SaveInsertBdm_xmdlbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">项目大类编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xmdlbm" value="" size="20" maxlength="2" >
              </td>
              <td width="15%"> 
                <div align="right">项目大类名称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xmdlmc" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">项目类型</div>
              </td>
              <td colspan="3"> 
                <input type="radio" name="sftsxm"  value="1">
                工程类（与百分比收费项目相关）<BR>
				<input type="radio" name="sftsxm"  value="2">
                工程类（与其它收费项目无关） <BR>
				<input type="radio" name="sftsxm"  value="3">
                主材类</td>
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
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请输入[项目大类编码]！");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlmc)=="") {
		alert("请输入[项目大类名称]！");
		FormName.xmdlmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.sftsxm)) {
		alert("请选择[项目类型]！");
		FormName.sftsxm[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
