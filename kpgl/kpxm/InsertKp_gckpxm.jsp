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

<form method="post" action="SaveInsertKp_gckpxm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">考评项目编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpxmbm" value="" size="20" maxlength="4" >
              </td>
              <td width="15%"> 
                <div align="right">考评项目名称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpxmmc" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">考评大类</div>
              </td>
              <td width="35%"> 
                <select name="kpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">严重程度</div>
              </td>
              <td width="35%"> 
                <select name="kpjg" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
	cf.selectItem(out,"select yzcdbm,ydcdmc from kp_sgdyzcdbm order by yzcdbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">扣分</div>
              </td>
              <td width="35%"> 
                <select name="kpkfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpkfbm,kpkfmc from kp_kpkfbm order by kpkfbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">处罚</div>
              </td>
              <td width="35%"> 
                <select name="kpcfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpcfbm,kpcfmc from kp_kpcfbm order by kpcfbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">罚款</td>
              <td width="35%">
                <input type="text" name="sgdfk" value="" size="20" maxlength="16" >
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">严重程度定义</td>
              <td colspan="3"> 
                <textarea name="kpjgdy" cols="71" rows="5"></textarea>
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
	if(	javaTrim(FormName.kpxmbm)=="") {
		alert("请输入[考评项目编码]！");
		FormName.kpxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpxmmc)=="") {
		alert("请输入[考评项目名称]！");
		FormName.kpxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.kpdlbm)=="") {
		alert("请选择[考评大类]！");
		FormName.kpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpjg)=="") {
		alert("请选择[严重程度]！");
		FormName.kpjg.focus();
		return false;
	}
	if(	javaTrim(FormName.kpkfbm)=="") {
		alert("请选择[扣分]！");
		FormName.kpkfbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdfk)=="") {
		alert("请选择[罚款]！");
		FormName.sgdfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfk, "罚款"))) {
		return false;
	}
	if(	javaTrim(FormName.kpjgdy)=="") {
		alert("请输入[严重程度定义]！");
		FormName.kpjgdy.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
