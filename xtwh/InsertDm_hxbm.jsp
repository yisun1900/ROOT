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

<form method="post" action="SaveInsertDm_hxbm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right">户型编码 </td>
  <td width="32%"> 
    <input type="text" name="hxbm" value="" size="20" maxlength="2" >  </td>
  <td width="18%" align="right">户型名称</td>
  <td width="32%"> 
    <input type="text" name="hxmc" value="" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">套餐停用标志</td>
  <td><%
	cf.radioToken(out, "tctybz","N+未停用&Y+停用","");
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
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
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请输入[户型编码]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxmc)=="") {
		alert("请输入[户型名称]！");
		FormName.hxmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
