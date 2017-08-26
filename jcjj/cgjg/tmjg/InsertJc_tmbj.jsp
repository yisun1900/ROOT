<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

<form method="post" action="SaveInsertJc_tmbj.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">台面编码</div>
              </td>
              <td width="34%"> 
                <input type="text" name="tmbm" value="" size="20" maxlength="5" >
              </td>
              <td width="15%"> 
                <div align="right">品牌</div>
              </td>
              <td width="35%"> 
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ppbm,ppmc from jdm_ppbm order by ppbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">台面名称</td>
              <td colspan="3"> 
                <input type="text" name="tmmc" value="" size="72" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">台面系列</div>
              </td>
              <td width="34%"> 
                <select name="tmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tmxlbm,tmxlmc from jdm_tmxlbm order by tmxlbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">型号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xh" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">延米价格</div>
              </td>
              <td width="34%"> 
                <input type="text" name="ymjg" value="0" size="20" maxlength="9" >
              </td>
              <td width="15%"> 
                <div align="right">平米价格</div>
              </td>
              <td width="35%"> 
                <input type="text" name="pmjg" value="0" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">照片</td>
              <td colspan="3"> 
                <input type="text" name="zp" value="" size="72" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
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
	if(	javaTrim(FormName.tmbm)=="") {
		alert("请输入[台面编码]！");
		FormName.tmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tmmc)=="") {
		alert("请输入[台面名称]！");
		FormName.tmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.tmxlbm)=="") {
		alert("请选择[台面系列]！");
		FormName.tmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ymjg)=="") {
		alert("请输入[延米价格]！");
		FormName.ymjg.focus();
		return false;
	}
	if(!(isFloat(FormName.ymjg, "延米价格"))) {
		return false;
	}
	if(	javaTrim(FormName.pmjg)=="") {
		alert("请输入[平米价格]！");
		FormName.pmjg.focus();
		return false;
	}
	if(!(isFloat(FormName.pmjg, "平米价格"))) {
		return false;
	}
	if(	javaTrim(FormName.ppbm)=="") {
		alert("请选择[品牌]！");
		FormName.ppbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
