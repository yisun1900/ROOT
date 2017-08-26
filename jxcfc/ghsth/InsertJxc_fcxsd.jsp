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
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String yhdlm=(String)session.getAttribute("yhdlm");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_fcxsd.jsp" name="insertform" >
<div align="center">录入－供货商退货单</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>供货商退货单类型</td> 
  <td width="32%"><select name="xsdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select xsdlx,xsdlxmc from dm_xsdlx where xsdlx='6' order by xsdlx","");
%>
  </select></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>材料类型</td> 
  <td width="32%"><input name="cllx" type="radio"  value="1" checked>
辅材 </td>
</tr>



<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>所属分公司</td>
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
  <td align="right">收货部门</td>
  <td><select name="shbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">收款类型</td>
  <td><select name="sklx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">现金</option>
    <option value="2">转账</option>
    <option value="3">支票</option>
    <option value="9">其它</option>
  </select></td>
  <td align="right">是否全款</td>
  <td><input type="radio" name="sfqk"  value="1">
    全款
      <input type="radio" name="sfqk"  value="2">
      部分款
      <input type="radio" name="sfqk"  value="3">
      未付款</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>供货商</td>
  <td colspan="3">
    <select name="shfmc" style="FONT-SIZE:12PX;WIDTH:522PX">
      <option value=""></option>
<%
	if (yhjs.equals("A0"))
	{
		cf.selectItem(out,"select distinct jxc_gysxx.gysmc c1,jxc_gysxx.gysmc c2 from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm order by  jxc_gysxx.gysmc","");
	}
	else{
		cf.selectItem(out,"select distinct jxc_gysxx.gysmc c1,jxc_gysxx.gysmc c2 from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ssfgs='"+ssfgs+"' order by jxc_gysxx.gysmc","");
	}
%>
	</select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">收货人联系方式</td>
  <td colspan="3"><input type="text" name="shrlxfs" value="" size="73" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">收货方地址</td> 
  <td colspan="3"><input type="text" name="shfdz" value="" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">销售员</td> 
  <td width="32%"> 
    <input type="text" name="xsy" value="" size="20" maxlength="50" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>销售日期</td> 
  <td width="32%"> 
    <input type="text" name="xsrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
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
	cf.ajax(out);//启用AJAX
%>

function changeFgs(FormName) 
{
	FormName.shbm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql;
	sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.ssfgs.value+"'  order by cxbz,dwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.shbm,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsdlx)=="") {
		alert("请选择[供货商退货单类型]！");
		FormName.xsdlx.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.shfmc)=="") {
		alert("请选择[供货商]！");
		FormName.shfmc.focus();
		return false;
	}
	if (FormName.xsdlx.value=="5")//5：内部使用
	{
		if(	javaTrim(FormName.shbm)=="") {
			alert("请选择[收货部门]！");
			FormName.shbm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.xsrq)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "销售日期"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
