<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_ppgysdzb.jsp" name="insertform" target="_blank">
<div align="center">
  <p>请录入数据</p>
  <p class="STYLE1"><strong>请按顺序选择：分公司 -> 子品牌 -> 供应商</strong></p>
</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(insertform)">
    <%
	if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
	}
	else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>子品牌</td>
  <td colspan="3"><select name="ppbm" style="FONT-SIZE:12PX;WIDTH:522PX" onChange="changePp(insertform)">
    <%
	if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
	}
	else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
	}
	else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
	{
		cf.selectItem(out,"select jxc_ppxx.ppbm,jxc_ppxx.ppmc||DECODE(jxc_scsxx.scslb,'1','（主材）','2','（辅材）','3','（通用）') from jxc_ppxx,jxc_scsxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppxx.scsmc=jxc_scsxx.scsmc and jxc_ppgysdzb.ssfgs='"+ssfgs+"'   order by jxc_scsxx.scslb,ppmc","");
	}
	else{
		out.println("错误！未进行客户资料授权，请联系系统管理员");
		return;
	}
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>供应商</td> 
  <td colspan="3"><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:522PX">
    <option value=""></option>
  </select></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset"></td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

var lx="";

<%
	cf.ajax(out);//启用AJAX
%>


function changeFgs(FormName) 
{
	if (FormName.ssfgs.value=="")
	{
		return;
	}

	FormName.ppbm.length=1;
	FormName.gysbm.length=1;

	var sql;
	sql="select jxc_ppxx.ppbm,jxc_ppxx.ppmc||DECODE(jxc_scsxx.scslb,'1','（主材）','2','（辅材）','3','（通用）') from jxc_ppxx,jxc_scsxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppxx.scsmc=jxc_scsxx.scsmc and jxc_ppgysdzb.ssfgs='"+FormName.ssfgs.value+"'   order by jxc_scsxx.scslb,ppmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	lx="pp";

//	window.open(actionStr);
	openAjax(actionStr);
}


function changePp(FormName) 
{
	if (FormName.ssfgs.value=="")
	{
		return;
	}

	if (FormName.gysbm.length!=1)
	{
		return;
	}

	var sql;
	sql="select jxc_gysxx.gysbm,jxc_gysxx.gysmc||DECODE(jxc_gysxx.sfhz,'Y','（合作）','N','（不合作）')||DECODE(jxc_gysxx.cllx,'1','（主材）','2','（辅材）','3','（主材及辅材）') from jxc_gysxx,jxc_gyssqfgs where jxc_gysxx.gysbm=jxc_gyssqfgs.gysbm and jxc_gyssqfgs.ssfgs='"+FormName.ssfgs.value+"' order by sfhz desc,gysmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	lx="gys";

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (lx=="pp")
	{
		strToSelect(insertform.ppbm,ajaxRetStr);
	}
	else{
		strToSelect(insertform.gysbm,ajaxRetStr);
	}
}



function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ppbm)=="") {
		alert("请输入[子品牌]！");
		FormName.ppbm.focus();
		return false;
	}
	if(!(isNumber(FormName.ppbm, "子品牌"))) {
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商]！");
		FormName.gysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "供应商"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
