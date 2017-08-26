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

<form method="post" action="SaveInsertDm_hflxbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <div align="right">回访类型编码              </td>
              <td width="33%"> 
                <input type="text" name="hflxbm" value="" size="20" maxlength="2" >              </td>
              <td width="18%" align="right"> 
                <div align="right">回访类型名称              </td>
              <td width="32%"> 
                <input type="text" name="hflxmc" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">是否自动设置</td>
              <td><%
	cf.radioToken(out, "sfzdsz","1+自动设置&2+手动设置","");
%></td>
              <td align="right">回访时间间隔</td>
              <td><input type="text" name="sjjg" value="" size="20" maxlength="8" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <div align="right">回访大类              </td>
              <td width="33%"> 
                <select name="hfdl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">咨询客户回访</option>
                  <option value="2">在施工程回访</option>
                  <option value="3">保修客户回访</option>
                  <option value="4">投诉报修回访</option>
                </select>              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">              </td>
            </tr>
        </table>
</form>
	  
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
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("请输入[回访类型编码]！");
		FormName.hflxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hflxmc)=="") {
		alert("请输入[回访类型名称]！");
		FormName.hflxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hfdl)=="") {
		alert("请选择[回访大类]！");
		FormName.hfdl.focus();
		return false;
	}
	if(!(isNumber(FormName.sjjg, "回访时间间隔"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
