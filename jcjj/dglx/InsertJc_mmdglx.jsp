<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
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

<form method="post" action="SaveInsertJc_mmdglx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
              <div align="right"><span class="STYLE1">*</span>木门订购类型编码</div>              </td>
              <td width="33%"> 
              <input type="text" name="mmdglxbm" value="" size="20" maxlength="2" >              </td>
              <td width="17%"> 
              <div align="right"><span class="STYLE1">*</span>木门订购类型名称</div>              </td>
              <td width="33%"> 
              <input type="text" name="mmdglxmc" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>计价方式</td>
              <td colspan="3"><%
	cf.radioToken(out, "jjfs","11+木门<BR>&12+双口哑口<BR>&13+双口窗套<BR>&14+单口哑口<BR>&15+单口窗套<BR>&21+门连窗<BR>&22+门顶窗<BR>&31+外飘窗立口<BR>&32+外飘窗平台上口<BR>&41+平方米计价<BR>&42+延米计价<BR>&43+分段平方米计价<BR>&44+分段延米计价<BR>&45+分段按长度计价","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
              <div align="right"><span class="STYLE1">*</span>特单加价率</div>              </td>
              <td width="33%"> 
                <input type="text" name="tdjjl" value="" size="20" maxlength="9" >
              % </td>
              <td width="17%"> 
              <div align="right"></div>              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("请输入[木门订购类型编码]！");
		FormName.mmdglxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mmdglxmc)=="") {
		alert("请输入[木门订购类型名称]！");
		FormName.mmdglxmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.jjfs)) {
		alert("请选择[计价方式]！");
		FormName.jjfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.tdjjl)=="") {
		alert("请输入[特单加价率]！");
		FormName.tdjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.tdjjl, "特单加价率"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
