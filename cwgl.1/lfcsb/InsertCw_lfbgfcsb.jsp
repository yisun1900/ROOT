<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_lfbgfcsb.jsp" name="insertform" target="_blank">
<div align="center">拨工费参数表－录入</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>拨付次数</td>
  <td><select name="bfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd not in('0','B') order by gdjsjd","");
	%>
    </select></td>
  <td align="right"><span class="STYLE1">*</span>拨付比例</td>
  <td><input type="text" name="bfbl" value="" size="10" maxlength="9" >
    百分比</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>拨付基数</td> 
  <td colspan="3"><input type="radio" name="bfjs"  value="3">实收款<BR> 
      <input type="radio" name="bfjs"  value="1">折前工程费 <BR>
    <input type="radio" name="bfjs"  value="2">折后工程费
    <BR><input type="radio" name="bfjs"  value="9">由打折力度决定折前折后  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">打折力度</td> 
  <td colspan="3"> 
    <p>
      <input type="text" name="dzld" value="" size="20" maxlength="9" >  
      （&gt;=0且&lt;=10）</p>
    <p>客户折扣若大于【打折力度】拨付基数取折前；客户折扣若小于【打折力度】拨付基数取折后</p></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否扣材料款</td>
  <td><input type="radio" name="sfkclk"  value="Y">
    是
    <input type="radio" name="sfkclk"  value="N">
    否 </td>
  <td align="right">材料款最低比例</td>
  <td><input name="clkzdbl" type="text" id="clkzdbl" value="" size="10" maxlength="9" >
    百分比</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否扣已拨工费</td>
  <td colspan="3"><input type="radio" name="sfkybgf"  value="Y">
    是
    <input type="radio" name="sfkybgf"  value="N">
    否 </td>
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("请输入[拨付次数]！");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "拨付次数"))) {
		return false;
	}
	if(	!radioChecked(FormName.bfjs)) {
		alert("请选择[拨付基数]！");
		FormName.bfjs[0].focus();
		return false;
	}

	if (FormName.bfjs[3].checked)
	{
		if(	javaTrim(FormName.dzld)=="") {
			alert("请输入[打折力度]！");
			FormName.dzld.focus();
			return false;
		}
		if(!(isFloat(FormName.dzld, "打折力度"))) {
			return false;
		}

		if (parseFloat(FormName.dzld.value)<0 || parseFloat(FormName.dzld.value)>10)
		{
			alert("错误！[打折力度]应在0到10之间");
			FormName.dzld.select();
			return false;
		}
	}
	else{
		FormName.dzld.value="";
	}

	if(	javaTrim(FormName.bfbl)=="") {
		alert("请输入[拨付比例]！");
		FormName.bfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bfbl, "拨付比例"))) {
		return false;
	}
	if (parseFloat(FormName.bfbl.value)<0 || parseFloat(FormName.bfbl.value)>100)
	{
		alert("错误！[拨付比例]应在0到100之间");
		FormName.bfbl.select();
		return false;
	}

	if(	!radioChecked(FormName.sfkclk)) {
		alert("请选择[是否扣材料款]！");
		FormName.sfkclk[0].focus();
		return false;
	}
	if (FormName.sfkclk[0].checked)
	{
		if(	javaTrim(FormName.clkzdbl)=="") {
			alert("请输入[材料款最低比例]！");
			FormName.clkzdbl.focus();
			return false;
		}
		if(!(isFloat(FormName.clkzdbl, "材料款最低比例"))) {
			return false;
		}

		if (parseFloat(FormName.clkzdbl.value)<0 || parseFloat(FormName.clkzdbl.value)>100)
		{
			alert("错误！[材料款最低比例]应在0到100之间");
			FormName.clkzdbl.select();
			return false;
		}
	}
	else{
		FormName.clkzdbl.value="";
	}

	if(	!radioChecked(FormName.sfkybgf)) {
		alert("请选择[是否扣已拨工费]！");
		FormName.sfkybgf[0].focus();
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
