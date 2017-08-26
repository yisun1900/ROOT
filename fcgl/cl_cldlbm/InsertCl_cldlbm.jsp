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
<form method="post" action="SaveInsertCl_cldlbm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">材料大类编码</td>
      <td width="32%"> 
        <input type="text" name="cldlbm" value="" size="10" maxlength="2" >
        <font color="red">（2位数字或字母）</font> </td>
      <td align="right" width="16%">材料大类名称</td>
      <td width="34%"> 
        <input type="text" name="cldlmc" value="" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">签约百分比</td>
      <td width="32%"> 
        <input type="text" name="qybfb" value="" size="10" maxlength="15" >
        %</td>
      <td align="right" width="16%">&nbsp;</td>
      <td width="34%">&nbsp;</td>
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
	if(	javaTrim(FormName.cldlbm)=="") {
		alert("请输入[材料大类编码]！");
		FormName.cldlbm.focus();
		return false;
	}
	if(	FormName.cldlbm.value.length!=2) {
		alert("[材料大类编码]应该为2位！");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cldlmc)=="") {
		alert("请输入[材料大类名称]！");
		FormName.cldlmc.focus();
		return false;
	}

	if(	javaTrim(FormName.qybfb)=="") {
		alert("请输入[签约百分比]！");
		FormName.qybfb.focus();
		return false;
	}

	if(!(isFloat(FormName.qybfb, "签约百分比"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
