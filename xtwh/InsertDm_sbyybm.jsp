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

<form method="post" action="SaveInsertDm_sbyybm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">失败原因编码</div>
              </td>
              <td width="33%"> 
                <input type="text" name="sbyybm" value="" size="20" maxlength="2" >
              </td>
              <td width="18%"> 
                <div align="right">失败原因名称</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sbyymc" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">店面咨询状态</td>
              <td width="33%">
                <select name="dmzxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="2">店面退回客户</option>
                  <option value="4">公司签单失败</option>
                </select>
			  </td>
              <td width="18%" align="right">分公司咨询状态</td>
              <td width="32%">
                <select name="fgszxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="2">店面退回客户</option>
                  <option value="4">公司签单失败</option>
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
	if(	javaTrim(FormName.sbyybm)=="") {
		alert("请输入[失败原因编码]！");
		FormName.sbyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.sbyymc)=="") {
		alert("请输入[失败原因名称]！");
		FormName.sbyymc.focus();
		return false;
	}
	if(	javaTrim(FormName.dmzxzt)=="") {
		alert("请输入[店面咨询状态]！");
		FormName.dmzxzt.focus();
		return false;
	}
	if(	javaTrim(FormName.fgszxzt)=="") {
		alert("请输入[分公司咨询状态]！");
		FormName.fgszxzt.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
