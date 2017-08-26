<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String dwbh=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");

String rklx=cf.GB2Uni(request.getParameter("rklx"));
if (rklx.equals(""))
{
	rklx="Z";//Z：直接入库
}
String lydh="";
String sgph="";
String dqbm="";
String sfrksgdw="";//是否直接入库申购公司
if (rklx.equals("S"))//C：采购入库；T：退货入库；R：调拨入库；S：申购入库；J：代金券退货入库；D：主材订单退货；F：发货单入库；Z：直接入库
{
	sgph=cf.GB2Uni(request.getParameter("sgph"));
	lydh=cf.GB2Uni(request.getParameter("gysddph"));
	dqbm=cf.executeQuery("select sq_dwxx.dqbm from jxc_clsgd,sq_dwxx where jxc_clsgd.ssfgs=sq_dwxx.dwbh and  jxc_clsgd.sgph='"+sgph+"'");
	sfrksgdw=cf.executeQuery("select sfrksgdw from jxc_gysdd where gysddph='"+lydh+"'");//是否直接入库申购公司
}
else if (rklx.equals("C"))
{
	lydh=cf.GB2Uni(request.getParameter("gysddph"));
	dqbm=cf.executeQuery("select sq_dwxx.dqbm from jxc_clsgd,sq_dwxx where jxc_clsgd.ssfgs=sq_dwxx.dwbh and  jxc_clsgd.sgph='"+sgph+"'");
	sfrksgdw=cf.executeQuery("select sfrksgdw from jxc_gysdd where gysddph='"+lydh+"'");//是否直接入库申购公司
}
else if (rklx.equals("F"))
{
	lydh=cf.GB2Uni(request.getParameter("ckph"));
	dqbm=cf.executeQuery("select mddqbm from jxc_ckd where ckph='"+lydh+"'");
}


%>

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

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform">
<div align="center">请录入入库单</div>
<div align="center">

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>地区</td>
    <td width="32%">
	<select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changedqbm(insertform)">
        <%
	if (rklx.equals("S") && sfrksgdw.equals("Y"))//C：采购入库；T：退货入库；R：调拨入库；S：申购入库；J：代金券退货入库；D：主材订单退货；Z：直接入库
	{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'","");
	}
	else if (rklx.equals("F"))
	{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'","");
	}
	else{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm in(select jxc_ckmc.dqbm from jxc_ckmc,jxc_kgy,dm_dqbm where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' )","");
	}
%>
      </select>    </td>
    <td width="18%" align="right"><span class="STYLE1">*</span>入库仓库</td>
    <td width="32%"><select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <%
	if (rklx.equals("S") && sfrksgdw.equals("Y"))//C：采购入库；T：退货入库；R：调拨入库；S：申购入库；J：代金券退货入库；D：主材订单退货；Z：直接入库
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' and jxc_ckmc.dqbm='"+dqbm+"' order by ckmc","");
	}
	else if (rklx.equals("F"))
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' and jxc_ckmc.dqbm='"+dqbm+"' order by ckmc","");
	}
	else{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' order by ckmc","");
	}

%>
  </select></td>  
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>负库存入库标志</td>
    <td><%
	cf.radioToken(out,"fkcrkbz","1+正常入库&2+负库存入库","1",true);
%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>材料类型</td>
    <td><select name="rkcllx" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value="1">辅材</option>
    </select></td>
    <td align="right"><span class="STYLE1">*</span>入库类型 </td>
    <td><select name="rklx" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"C+采购入库&T+退货入库&R+调拨入库&S+申购入库&J+代金券退货入库&D+主材订单退货&F+发货单入库&Z+直接入库",rklx,false);
%>
    </select>	  </td>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>供货单位</td> 
  <td colspan="3">
  <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:522PX" >
<%
	String sql="";
	if (rklx.equals("S"))//C：采购入库；T：退货入库；R：调拨入库；S：申购入库；J：代金券退货入库；D：主材订单退货；Z：直接入库
	{
		sql="select gysmc c1,gysmc c2 from jxc_gysdd where gysddph='"+lydh+"'";
	}
	else if (rklx.equals("F"))
	{
		sql="select dwmc c1,dwmc c2 from jxc_ckd,sq_dwxx where jxc_ckd.fgsbh=sq_dwxx.dwbh and jxc_ckd.ckph='"+lydh+"'";
	}
	else if (rklx.equals("C"))
	{
		sql="select gysmc c1,gysmc c2 from jxc_gysdd where gysddph='"+lydh+"'";
	}
	else{
		out.print("<option value=\"\"></option>");
		sql="select gysmc c1,gysmc c2 from jxc_gysxx where sfhz='Y' and cllx in('2','3') order by gysmc";
	}

	cf.selectItem(out,sql,"");
%>
  </select>	</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">来源单号</td> 
  <td colspan="3"><input type="text" name="lydh" value="<%=lydh%>" size="58" maxlength="50" readonly>
收货人签字单据号</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">入库人</span></td>
  <td><input type="text" name="rkr" value="<%=yhmc%>" size="20"  readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">入库时间</span></td>
  <td><input type="text" name="rksj" value="<%=cf.today()%>" size="20"  readonly></td>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">所属部门</span></td>
  <td><select name="rkrssbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'  order by dwbh","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">所属分公司</span></td>
  <td><select name="rkrssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'  order by dwbh","");
%>
</select></td>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3" ></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	      <input type="button"  value="存盘" onClick="f_do(insertform)">
	      <input type="reset"  value="重输" name="reset">
      </td>
    </tr>
</table>
<br>
<center>
</center>
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

function changedqbm(FormName) 
{
	FormName.ckbh.length=1;

	if (FormName.dqbm.value=="")
	{
		return;
	}

	var sql;

	sql="select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='<%=yhdlm%>' and jxc_ckmc.dqbm='"+FormName.dqbm.value+"' order by ckmc";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.ckbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ckbh)=="") {
		alert("请输入[入库仓库]！");
		FormName.ckbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("请输入[供货单位]！");
		FormName.gysmc.focus();
		return false;
	}

/*
	if(	!radioChecked(FormName.fkcrkbz)) {
		alert("请选择[负库存入库标志]！");
		FormName.fkcrkbz[0].focus();
		return false;
	}
*/	
	if(	javaTrim(FormName.rkcllx)=="") {
		alert("请输入[材料类型]！");
		FormName.rkcllx.focus();
		return false;
	}
	if(	javaTrim(FormName.rklx)=="") {
		alert("请输入[入库类型]！");
		FormName.rklx.focus();
		return false;
	}
	if(	javaTrim(FormName.rksj)=="") {
		alert("请输入[入库时间]！");
		FormName.rksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.rksj, "入库时间"))) {
		return false;
	}

	FormName.action="SaveInsertJxc_rkd.jsp";
	FormName.submit();
	return true;
}



//-->
</SCRIPT>