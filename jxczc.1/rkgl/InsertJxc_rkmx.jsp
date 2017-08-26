<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String xsfsmc=null;
String xsfs=null;
String jldwbm=null;
double xsj=0;
double cbj=0;
double zxqdl=0;
String cldlbm=null; 
String clxlbm=null;

String ppmc=null;
String gysmc=null;

double zcpzsl=0;
double ccpzsl=0;
double bfpzsl=0;
double dhsl=0;
double ycgsl=0;

String rksl="";
double rkje=0;
double rkj=0;
String scrq="";
String scph="";
String ckbh="";
String hjbh="";
String hwbh="";

String clbm=request.getParameter("clbm");
String dqbm=request.getParameter("dqbm");
String rkph=request.getParameter("rkph");

String khbh=null;
String fgsbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sgdmc=null;
double qye=0;

double bzlyje=0;
double lyxxje=0;
double lysxje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql=" select ckbh";
	ls_sql+=" from jxc_rkd ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckbh=cf.fillNull(rs.getString("ckbh"));
	}
	rs.close();
	ps.close();


	ls_sql="select nbbm,clmc,xh,gg,DECODE(xsfs,'1','代销品','2','现货销售','3','期货销售','4','允许负库存') xsfsmc,xsfs,jldwbm,cbj,xsj,zxqdl,cldlbm,clxlbm,ppmc,jxc_cljgb.gysmc,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl ";
	ls_sql+=" from  jxc_cljgb,jxc_clbm";
	ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
	ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nbbm=cf.fillNull(rs.getString("nbbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		xsfsmc=cf.fillNull(rs.getString("xsfsmc"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		cbj=rs.getDouble("cbj");
		xsj=rs.getDouble("xsj");
		zxqdl=rs.getDouble("zxqdl");
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysmc=cf.fillNull(rs.getString("gysmc"));

		zcpzsl=rs.getDouble("zcpzsl");
		ccpzsl=rs.getDouble("ccpzsl");
		bfpzsl=rs.getDouble("bfpzsl");
		dhsl=rs.getDouble("dhsl");
		ycgsl=rs.getDouble("ycgsl");
	}
	rs.close();
	ps.close();

/*
	//材料配送明细:开单数量	 
	ls_sql=" select rksl,rkje,rkj,scrq,scph,hjbh,hwbh ";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where clbm='"+clbm+"'  and rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		rksl=cf.fillNull(rs.getString("rksl"));
		rkje=rs.getDouble("rkje");
		rkj=rs.getDouble("rkj");
		scrq=cf.fillNull(rs.getString("scrq"));
		scph=cf.fillNull(rs.getString("scph"));
		hjbh=cf.fillNull(rs.getString("hjbh"));
		hwbh=cf.fillNull(rs.getString("hwbh"));
	}
	rs.close();
	ps.close();
*/
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>入库单－入库材料明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	font-size: 14px;
	font-weight: bold;
	color: #0000CC;
}
.STYLE3 {color: #0000CC}
.STYLE4 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">内部编码【<%=nbbm%>】已录入明细，<span class="STYLE4"><strong>注意：不要重复录入</strong></span></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="7%">入库价</td>
	<td  width="8%">入库数量</td>
	<td  width="9%">入库金额</td>
	<td  width="8%">正常品数量</td>
	<td  width="8%">残次品数量</td>
	<td  width="7%">厂家缺失数</td>
	<td  width="7%">物流丢失数</td>
	<td  width="8%">生产日期</td>
	<td  width="12%">生产批号</td>
	<td  width="11%">入库货架</td>
	<td  width="11%">入库货位</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT jxc_rkmx.rkxh,TO_CHAR(jxc_rkmx.rkj),jxc_rkmx.rksl,jxc_rkmx.rkje,jxc_rkmx.zcpsl,jxc_rkmx.ccpsl,jxc_rkmx.thpsl,jxc_rkmx.wldssl,to_char(scrq,'YYYY-MM-DD'),scph,hjmc,hwmc ";
	ls_sql+=" FROM jxc_rkmx,jxc_hjmc,jxc_hwmc  ";
    ls_sql+=" where jxc_rkmx.rkph='"+rkph+"' and jxc_rkmx.clbm='"+clbm+"' ";
    ls_sql+=" and jxc_rkmx.hjbh=jxc_hjmc.hjbh(+) and jxc_rkmx.hwbh=jxc_hwmc.hwbh(+) ";
    ls_sql+=" order by jxc_rkmx.rkxh ";
    pageObj.sql=ls_sql;

	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

<div align="center">入库单－入库材料明细（入库批号：<%=rkph%>）</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">材料编码</td>
  <td bgcolor="#FFFFFF"><%=clbm%></td>
  <td align="right" bgcolor="#FFFFFF">内部编码</td>
  <td bgcolor="#FFFFFF"><%=nbbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">材料名称</td>
  <td bgcolor="#FFFFFF"><%=clmc%></td>
  <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td bgcolor="#FFFFFF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">型号</td>
  <td bgcolor="#FFFFFF"><%=xh%></td>
  <td align="right" bgcolor="#FFFFFF">规格</td>
  <td bgcolor="#FFFFFF"><%=gg%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">供应商</td>
  <td bgcolor="#FFFFFF"><%=gysmc%></td>
  <td align="right" bgcolor="#FFFFFF">子品牌</td>
  <td bgcolor="#FFFFFF"><%=ppmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">材料大类</td>
  <td width="32%" bgcolor="#FFFFFF"><%=cldlbm%></td>
  <td width="18%" align="right" bgcolor="#FFFFFF">材料小类</td>
  <td width="32%" bgcolor="#FFFFFF"><%=clxlbm%></td>
</tr>
</table>
<BR>

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF"><strong>库存、订货数量</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">正常品库存数</td>
  <td width="32%" bgcolor="#FFFFFF"><%=zcpzsl%></td>
  <td width="18%" align="right" bgcolor="#FFFFFF">残次品库存数</td>
  <td width="32%" bgcolor="#FFFFFF"><%=ccpzsl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">报废品库存数</td>
  <td width="32%" bgcolor="#FFFFFF"><%=bfpzsl%></td>
  <td width="18%" align="right" bgcolor="#FFFFFF">可订货数</td>
  <td width="32%" bgcolor="#FFFFFF"><%=cf.formatDouble(zcpzsl-dhsl)%></td>
</tr>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right" bgcolor="#FFFFFF">订货数量</td>
    <td width="32%" bgcolor="#FFFFFF"><%=dhsl%></td>
    <td width="18%" align="right" bgcolor="#FFFFFF">已采购数量</td>
    <td width="32%" bgcolor="#FFFFFF"><%=ycgsl%></td>
  </tr>
</table>
<BR>


		<form method="post" action="SaveInsertJxc_rkmx.jsp" name="insertform">
			
    <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF">
        <td colspan="4" align="center" bgcolor="#CCFFCC"><span class="STYLE1">录入数量</span></td>
      </tr>
	  

      <tr bgcolor="#FFFFFF">
        <td width="18%" align="right" bgcolor="#FFFFFF"><span class="STYLE3">成本价</span></td>
        <td width="32%" bgcolor="#FFFFFF" ><%=cbj%>      
        <td width="18%" align="right"><span class="STYLE3">销售价</span></td>
        <td width="32%" bgcolor="#FFFFFF" ><%=xsj%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">销售方式</span></td>
        <td bgcolor="#FFFFFF" ><%=xsfsmc%>      
        <td align="right"><span class="STYLE3">最小起订量</span></td>
        <td bgcolor="#FFFFFF" ><%=zxqdl%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">计量单位</span></td>
        <td bgcolor="#FFFFFF" ><%=jldwbm%>      
        <td align="right"><span class="STYLE4">*</span>入库数量</td>
        <td bgcolor="#FFFFFF" ><input type="text" name="rksl" value="<%=rksl%>" size="20" maxlength="20"  onChange="jsjg(insertform)" ></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE4">*</span>入库单价</td>
        <td bgcolor="#FFFFFF" ><input type="text" name="rkj" value="<%=cbj%>" size="20" maxlength="16"  onChange="jsjg(insertform)">      
        <td align="right"><span class="STYLE4">*</span><span class="STYLE3">入库金额</span></td>
        <td bgcolor="#FFFFFF" ><input type="text" name="rkje" value="<%=rkje%>" size="20" maxlength="20" readonly></td>
      </tr>
      
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE4">*</span>生产日期</td>
        <td bgcolor="#FFFFFF" >
		<input type="text" name="scrq" value="<%=scrq%>" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
		</td>
        <td align="right"><span class="STYLE4">*</span>生产批号</td>
        <td bgcolor="#FFFFFF" ><input type="text" name="scph" value="<%=scph%>" size="20" maxlength="50"  ></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE4">*</span>入库货架</td>
        <td bgcolor="#FFFFFF" >
		<select name="hjbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeHj(insertform)">
          <option value=""></option>
          <%
				cf.selectItem(out,"select hjbh,hjmc from jxc_hjmc where ckbh='"+ckbh+"' order by hjbh",hjbh);
			%>
        </select>      
        <td align="right">入库货位</td>
        <td bgcolor="#FFFFFF" ><select name="hwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
				cf.selectItem(out,"select hwbh,hwmc from jxc_hwmc where hjbh='"+hjbh+"' order by hjbh,hwbh",hwbh);
			%>
        </select></td>
      </tr>
      
      <tr align="center"> 
        <td colspan="4">
          <input type="button"  value="存盘" onClick="f_do(insertform)">
          <input type="reset"  value="重输" name="reset">
          <input type="hidden" name="rkph" value="<%=rkph%>"  >
          <input type="hidden" name="clbm" value="<%=clbm%>"  >
          <input type="hidden" name="dqbm" value="<%=dqbm%>"  >
		</td>
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

function changeHj(FormName) 
{
	FormName.hwbh.length=1;

	if (FormName.hjbh.value=="")
	{
		return;
	}

	var sql;
	sql="select hwbh,hwmc from jxc_hwmc where hjbh='"+FormName.hjbh.value+"' order by hwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.hwbh,ajaxRetStr);
}

function jsjg(FormName)
{	
	var rkje=0;
	rkje=FormName.rksl.value*1.0*FormName.rkj.value;
	rkje=round(rkje,2);
	FormName.rkje.value=rkje;
}

function f_do(FormName)//参数FormName:Form的名称
{
	jsjg(FormName);

	if(	javaTrim(FormName.rkj)=="") {
		alert("请输入[入库价]！");
		FormName.rkj.focus();
		return false;
	}
	if(!(isFloat(FormName.rkj, "入库价"))) {
		return false;
	}

	if(	javaTrim(FormName.rksl)=="") {
		alert("请输入[入库数量]！");
		FormName.rksl.select();
		return false;
	}
	if(!(isFloat(FormName.rksl, "入库数量"))) {
		return false;
	}

	if (parseFloat(FormName.rksl.value)<=0)
	{
		alert("【入库数量】必须大于零！！！");
		FormName.rksl.select();
		return false;
	}

	if(	javaTrim(FormName.rkje)=="") {
		alert("请输入[入库金额]！");
		FormName.rkje.focus();
		return false;
	}
	if(!(isFloat(FormName.rkje, "入库金额"))) {
		return false;
	}


	if(	javaTrim(FormName.scrq)=="") {
		alert("请输入[生产日期]！");
		FormName.scrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.scrq, "生产日期"))) {
		return false;
	}

	if(	javaTrim(FormName.scph)=="") {
		alert("请输入[生产批号]！");
		FormName.scph.focus();
		return false;
	}
	if(	javaTrim(FormName.hjbh)=="") {
		alert("请输入[入库货架]！");
		FormName.hjbh.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>