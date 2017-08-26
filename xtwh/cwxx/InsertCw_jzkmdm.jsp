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
<form method="post" action="SaveInsertCw_jzkmdm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td width="35%"> 
    <input type="text" name="xuhao" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">科目代码</td> 
  <td width="35%"> 
    <input type="text" name="kmdm" value="" size="20" maxlength="40" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">科目名称</td> 
  <td width="35%"> 
    <input type="text" name="kmmc" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">科目类别</td> 
  <td width="35%"> 
    <input type="text" name="kmlb" value="" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">余额方向</td> 
  <td width="35%"> 
    <input type="text" name="yefx" value="" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">全名</td> 
  <td width="35%"> 
    <input type="text" name="qm" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">项目辅助核算</td> 
  <td width="35%"> 
    <input type="text" name="xmfzhs" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">收款类型</td> 
  <td width="35%"> 
    <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where pzfl='1' order by fklxbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">收款期数</td> 
  <td width="35%"> 
    <select name="fkcs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs order by fkcs","");
%>
    </select>
  </td>
  <td align="right" width="15%">借贷标志</td> 
  <td width="35%"> 
    <input type="radio" name="jdbz"  value="1">借（退款）
    <input type="radio" name="jdbz"  value="0">贷（收款）
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司名称</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
if (yhjs.equals("A0") || yhjs.equals("A1"))
{
	out.println("<option value=\"\"></option>");
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') order by dwbh","");
}
else{
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') ans dwbh='"+ssfgs+"' order by dwbh","");
}

%> 
    </select>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
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
	if(	javaTrim(FormName.kmdm)=="") {
		alert("请输入[科目代码]！");
		FormName.kmdm.focus();
		return false;
	}
	if(	javaTrim(FormName.kmmc)=="") {
		alert("请输入[科目名称]！");
		FormName.kmmc.focus();
		return false;
	}
	if(!(isNumber(FormName.fkcs, "收款期数"))) {
		return false;
	}
	if(	!radioChecked(FormName.jdbz)) {
		alert("请选择[借贷标志]！");
		FormName.jdbz[0].focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司名称]！");
		FormName.fgsbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
