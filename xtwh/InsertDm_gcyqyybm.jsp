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

<form method="post" action="SaveInsertDm_gcyqyybm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right">类型</td>
              <td width="31%"> 
                <input type="radio" name="lx" value="1">
                工程延期原因
                <input type="radio" name="lx" value="2">
                工期核增原因 </td>
              <td width="16%">&nbsp;</td>
              <td width="34%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">工程延期原因编码</div>
              </td>
              <td width="31%"> 
                <input type="text" name="gcyqyybm" value="" size="20" maxlength="2" >
              </td>
              <td width="16%"> 
                <div align="right">工程延期原因名称</div>
              </td>
              <td width="34%"> 
                <input type="text" name="gcyqyymc" value="" size="20" maxlength="50" >
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
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.gcyqyybm)=="") {
		alert("请输入[工程延期原因编码]！");
		FormName.gcyqyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcyqyymc)=="") {
		alert("请输入[工程延期原因名称]！");
		FormName.gcyqyymc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
