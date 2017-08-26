<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_ppgysdzbCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">分公司</td>
  <td width="32%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">子品牌（模糊查询）</td>
  <td><input name="ppmc" type="text"  value="" size="20" maxlength="50"></td>
  <td align="right">供应商（模糊查询）</td>
  <td><input name="gysmc" type="text"  value="" size="20" maxlength="50"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">子品牌</td> 
  <td colspan="3"><select name="ppbm" style="FONT-SIZE:12PX;WIDTH:522PX" onChange="changePp(selectform)">
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
  <td align="right" width="18%">供应商</td> 
  <td colspan="3"><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:522PX">
    <option value=""></option>
  </select></td>
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
	sql="select jxc_gysxx.gysbm,jxc_gysxx.gysmc||DECODE(jxc_gysxx.sfhz,'Y','（合作）','N','（不合作）') from jxc_gysxx,jxc_gyssqfgs where jxc_gysxx.gysbm=jxc_gyssqfgs.gysbm and jxc_gyssqfgs.ssfgs='"+FormName.ssfgs.value+"' order by sfhz desc,gysmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	lx="gys";

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (lx=="pp")
	{
		strToSelect(selectform.ppbm,ajaxRetStr);
	}
	else{
		strToSelect(selectform.gysbm,ajaxRetStr);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.ppbm, "子品牌编码"))) {
		return false;
	}
	if(!(isNumber(FormName.gysbm, "供应商编码"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
