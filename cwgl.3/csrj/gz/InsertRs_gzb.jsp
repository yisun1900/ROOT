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
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_gzb.jsp" name="insertform" >
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>分公司</td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(insertform)">
    <%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>发薪日期</td>
  <td><input type="text" name="fxrq" value="<%=cf.today()%>" size="20" maxlength="10" <%=cf.today()%>></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>考核周期</td> 
  <td colspan="3"><select name="khzq" style="FONT-SIZE:12PX;WIDTH:525PX">
    <option value=""></option>
  </select></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否扣社保</td>
  <td><%
	cf.radioToken(out, "sfksb","Y+扣社保&N+不扣社保","");
%></td>
  <td align="right"><span class="STYLE1">*</span>是否扣意外险</td>
  <td><%
	cf.radioToken(out, "sfkywx","Y+扣除&N+不扣除","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="32%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="32%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea></td>
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

var fieldName="";

function changeFgs(FormName)
{
	FormName.khzq.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	fieldName="khzq";

	var sql;
	sql="select khzq c1,khzq||'('||TO_CHAR(khqssj,'YYYY-MM-DD')||'至'||TO_CHAR(khjzsj,'YYYY-MM-DD')||')' c2 from cw_jrkhzq where fgsbh='"+FormName.ssfgs.value+"' order by khzq desc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getDwbh(FormName)
{
	FormName.dwbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	var sql;
	sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeDwbh(FormName)
{
	FormName.ygbh.length=1;

	if (FormName.dwbh.value=="")
	{
		return;
	}

	fieldName="ygbh";

	var sql;
	sql="select ygbh,yhmc||'('||xzzwbm||')' c2 from sq_yhxx where dwbh='"+FormName.dwbh.value+"' and sfzszg in('Y','N') order by yhmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="khzq")
	{
		strToSelect(insertform.khzq,ajaxRetStr);
		getDwbh(insertform);
	}
	else if (fieldName=="dwbh")
	{
		strToSelect(insertform.dwbh,ajaxRetStr);
	}
	else if (fieldName=="ygbh")
	{
		strToSelect(insertform.ygbh,ajaxRetStr);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.khzq)=="") {
		alert("请输入[考核周期]！");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.fxrq)=="") {
		alert("请输入[发薪日期]！");
		FormName.fxrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.fxrq, "发薪日期"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfksb)) {
		alert("请选择[是否扣社保]！");
		FormName.sfksb[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkywx)) {
		alert("请选择[是否扣意外险]！");
		FormName.sfkywx[0].focus();
		return false;
	}

	FormName.action="SaveInsertRs_gzb.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
