<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");

String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

%>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_rkdCxList.jsp" name="selectform">
<div align="center">入库－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

  <tr bgcolor="#FFFFFF">
    <td align="right">入库类型</td>
    <td>
	<select name="jxc_rkd_rklx" style="FONT-SIZE:12PX;WIDTH:152PX" >
		<option value=""></option>
		<option value="C">采购入库</option>
		<option value="T">退货入库</option>
		<option value="R">调拨入库</option>
		<option value="S">申购入库</option>
		<option value="J">代金券退货入库</option>
		<option value="D">主材订单退货</option>
		<option value="P">直接入库</option>
    </select></td>
    <td align="right">入库单状态</td>
    <td><select name="jxc_rkd_rkdzt" style="FONT-SIZE:12PX;WIDTH:152PX" >
      <option value=""></option>
      <option value="0">未提交</option>
      <option value="1">等待审核</option>
      <option value="2">等待入库</option>
      <option value="3">已入库</option>
      <option value="4">已结算</option>
      <option value="6">等待总部审核</option>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">地区</td>
    <td><select name="jxc_rkd_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changedqbm(selectform)">
      <%
	if (yhjs.equals("A0"))
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqmc","");
	}
	else
	{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqmc","");
	}
%>
    </select></td>
    <td align="right">入库仓库</td>
    <td><select name="jxc_rkd_ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
      <option value=""></option>
      <%
		cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' order by dqbm,ckmc","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%">入库批号</td> 
  <td width="32%"><input type="text" name="jxc_rkd_rkph" size="20" maxlength="11" ></td>
  <td align="right" width="18%">来源单号</td> 
  <td width="32%"><input type="text" name="jxc_rkd_lydh" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供货单位</td> 
  <td colspan="3">
  <select name="jxc_rkd_gysmc" style="FONT-SIZE:12PX;WIDTH:522PX" >
    <%
	if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
	}
	else
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select gysmc mc,gysmc from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ssfgs='"+ssfgs+"'  order by gysmc","");
	}
%>
  </select></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right">供货单位</td>
  <td><input type="text" name="jxc_rkd_gysmc2" size="20" maxlength="13" >
    （模糊查询）</td>
  <td align="right">入库人</td>
  <td><input type="text" name="jxc_rkd_rkr" value="" size="20" maxlength="50" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">入库时间 从</td> 
  <td width="32%"><input type="text" name="jxc_rkd_rksj" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="jxc_rkd_rksj2" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
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


function changedqbm(FormName)
{
	if (FormName.jxc_rkd_dqbm.value=='')
	{
		return;
	}

	FormName.jxc_rkd_gysmc.length=1;

	var sql;
	sql="select jxc_gysxx.gysmc from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dwlx in('A0','F0') and dqbm='"+FormName.jxc_rkd_dqbm.value+"')  order by jxc_ppgysdzb.ssfgs,gysmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToItem2(selectform.jxc_rkd_gysmc,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.jxc_rkd_rksj, "入库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_rkd_rksj2, "入库时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
