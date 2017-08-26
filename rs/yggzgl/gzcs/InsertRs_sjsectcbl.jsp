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
<form method="post" action="SaveInsertRs_sjsectcbl.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">序号</td> 
  <td width="32%"> 
    <input type="text" name="xh" value="" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">签单类型</td>
  <td colspan="3"><input type="radio" name="qdlx"  value="1">
非市场部家装
  <input type="radio" name="qdlx"  value="2">
市场部家装
<input type="radio" name="qdlx"  value="3">
工装 </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">分公司编号</td>
  <td><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') and cxbz='N' order by dwbh","");
%>
  </select>  </td>
  <td align="right">设计师级别</td>
  <td><select name="sjsjb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb","");
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">分段名称</td>
  <td colspan="3"><input type="text" name="fdmc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">起点</td> 
  <td width="32%"> 
    <input type="text" name="qd" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">终点</td> 
  <td width="32%"> 
    <input type="text" name="zd" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">提成百分比</td> 
  <td width="32%"> 
    <input type="text" name="tcbfb" value="" size="10" maxlength="9" >
    %  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	if(	javaTrim(FormName.fdmc)=="") {
		alert("请输入[分段名称]！");
		FormName.fdmc.focus();
		return false;
	}
	if(	javaTrim(FormName.qd)=="") {
		alert("请输入[起点]！");
		FormName.qd.focus();
		return false;
	}
	if(!(isFloat(FormName.qd, "起点"))) {
		return false;
	}
	if(	javaTrim(FormName.zd)=="") {
		alert("请输入[终点]！");
		FormName.zd.focus();
		return false;
	}
	if(!(isFloat(FormName.zd, "终点"))) {
		return false;
	}
	if(	javaTrim(FormName.tcbfb)=="") {
		alert("请输入[提成百分比]！");
		FormName.tcbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.tcbfb, "提成百分比"))) {
		return false;
	}
	if(	!radioChecked(FormName.qdlx)) {
		alert("请选择[签单类型]！");
		FormName.qdlx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司编号]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sjsjb)=="") {
		alert("请选择[设计师级别]！");
		FormName.sjsjb.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
