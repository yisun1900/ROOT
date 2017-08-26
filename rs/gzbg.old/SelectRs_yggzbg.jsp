<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Rs_yggzbgList.jsp" name="selectform">
<div align="center"><strong>员工工作报告-维护</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right">所属分公司</td>
  <td><select name="rs_yggzbg_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="changeFgs(selectform)">
<%
	if (kfgssq.equals("2"))//2：授权多个分公司
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh",ssfgs);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
%> 
  </select></td>
  <td align="right">所属部门</td>
  <td><select name="rs_yggzbg_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
          <%
	if (!kfgssq.equals("2"))//2：授权多个分公司
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
%> 
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">报告时间起点 从</td>
  <td><input type="text" name="rs_yggzbg_sjqd" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="rs_yggzbg_sjqd2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">报告时间终点 从</td>
  <td><input type="text" name="rs_yggzbg_sjzd" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="rs_yggzbg_sjzd2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">姓名</td> 
  <td width="33%"><input type="text" name="rs_yggzbg_xm" size="20" maxlength="20" >
    <BR></td>
  <td align="right" width="17%">职务</td> 
  <td width="33%"><select name="rs_yggzbg_xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">员工序号</td> 
  <td width="33%"><input type="text" name="rs_yggzbg_ygbh" size="20" maxlength="8" ></td>
  <td align="right" width="17%">录入人</td> 
  <td width="33%"> 
    <input type="text" name="rs_yggzbg_lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">录入时间 从</td> 
  <td width="33%"><input type="text" name="rs_yggzbg_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
  <BR></td>
  <td align="right" width="17%">到 </td>
  <td width="33%"><input type="text" name="rs_yggzbg_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

var czlx;

function changeFgs(FormName)
{
	FormName.rs_yggzbg_dwbh.length=1;

	if (FormName.rs_yggzbg_ssfgs.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+FormName.rs_yggzbg_ssfgs.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.rs_yggzbg_dwbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.rs_yggzbg_ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yggzbg_sjqd, "报告时间起点"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yggzbg_sjqd2, "报告时间起点"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yggzbg_sjzd, "报告时间终点"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yggzbg_sjzd2, "报告时间终点"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yggzbg_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yggzbg_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
