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

<form method="post" action="SaveInsertJdm_mlx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">门类型编码</div>
              </td>
              <td width="32%"> 
                <input type="text" name="mlx" value="" size="20" maxlength="1" >
              </td>
              <td width="18%"> 
                <div align="right">门类型名称</div>
              </td>
              <td width="32%"> 
                <input type="text" name="mlxmc" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">高度不小于（MM）</td>
              <td width="32%"> 
                <input type="text" name="gdbxy" size="20" maxlength="8"  value="" >
              </td>
              <td width="18%" align="right">高度不大于（MM）</td>
              <td width="32%"> 
                <input type="text" name="gdbdy" size="20" maxlength="8"  value="" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">宽度不小于（MM）</td>
              <td width="32%"> 
                <input type="text" name="kdbxy" size="20" maxlength="8"  value="" >
              </td>
              <td width="18%" align="right">宽度不大于（MM）</td>
              <td width="32%"> 
                <input type="text" name="kdbdy" size="20" maxlength="8"  value="" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">提醒</td>
              <td colspan="3"> 
                <textarea name="tx" rows="3" cols="71"></textarea>
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
	if(	javaTrim(FormName.mlx)=="") {
		alert("请输入[门类型编码]！");
		FormName.mlx.focus();
		return false;
	}
	if(	javaTrim(FormName.mlxmc)=="") {
		alert("请输入[门类型名称]！");
		FormName.mlxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gdbxy)=="") {
		alert("请输入[高度不小于]！");
		FormName.gdbxy.focus();
		return false;
	}
	if(!(isNumber(FormName.gdbxy, "高度不小于"))) {
		return false;
	}
	if(	javaTrim(FormName.gdbdy)=="") {
		alert("请输入[高度不大于]！");
		FormName.gdbdy.focus();
		return false;
	}
	if(!(isNumber(FormName.gdbdy, "高度不大于"))) {
		return false;
	}
	if(	javaTrim(FormName.kdbxy)=="") {
		alert("请输入[宽度不小于]！");
		FormName.kdbxy.focus();
		return false;
	}
	if(!(isNumber(FormName.kdbxy, "宽度不小于"))) {
		return false;
	}
	if(	javaTrim(FormName.kdbdy)=="") {
		alert("请输入[宽度不大于]！");
		FormName.kdbdy.focus();
		return false;
	}
	if(!(isNumber(FormName.kdbdy, "宽度不大于"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
