<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_zxjlbl.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">序号</td> 
      <td width="32%"> 
        <input type="text" name="xuhao" value="" size="20" maxlength="8" >
  </td>
      <td align="right" width="18%">名称</td> 
      <td width="32%"> 
        <input type="text" name="mc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">起点百分比（>=）</td> 
      <td width="32%"> 
        <input type="text" name="qd" value="" size="10" maxlength="17" >
        % </td>
      <td align="right" width="18%">终点百分比（<）</td> 
      <td width="32%"> 
        <input type="text" name="zd" value="" size="10" maxlength="17" >
        % </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">奖励百分比</td> 
      <td width="32%"> 
        <input type="text" name="bfb" value="" size="10" maxlength="17" >
        % </td>
      <td align="right" width="18%">分公司</td> 
      <td width="32%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xuhao)=="") {
		alert("请输入[序号]！");
		FormName.xuhao.focus();
		return false;
	}
	if(!(isNumber(FormName.xuhao, "序号"))) {
		return false;
	}
	if(	javaTrim(FormName.mc)=="") {
		alert("请输入[名称]！");
		FormName.mc.focus();
		return false;
	}
	if(	javaTrim(FormName.qd)=="") {
		alert("请输入[起点百分比（>=）]！");
		FormName.qd.focus();
		return false;
	}
	if(!(isFloat(FormName.qd, "起点百分比（>=）"))) {
		return false;
	}
	if(	javaTrim(FormName.zd)=="") {
		alert("请输入[终点百分比（<）]！");
		FormName.zd.focus();
		return false;
	}
	if(!(isFloat(FormName.zd, "终点百分比（<）"))) {
		return false;
	}
	if(	javaTrim(FormName.bfb)=="") {
		alert("请输入[奖励百分比]！");
		FormName.bfb.focus();
		return false;
	}
	if(!(isFloat(FormName.bfb, "奖励百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
