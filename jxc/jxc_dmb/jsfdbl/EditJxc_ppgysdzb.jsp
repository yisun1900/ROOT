<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ycfbl=null;
String zcbljs=null;
String ppbm=null;
String ppmc=null;
String gysbm=null;
String gysmc=null;
String ssfgs=null;
double fdbl=0;
double cxfdbl=0;
double khfdbl=0;
double khcxfdbl=0;
double tcjrbl=0;
double tccxjrbl=0;

double xpjsbl=0;
double xpcxjsbl=0;
double xpkhfdbl=0;
double xpkhcxfdbl=0;
double xptcjrbl=0;
double xptccxjrbl=0;

double azfjsbl=0;
double ycfjsbl=0;


String whereppbm=cf.GB2Uni(request.getParameter("ppbm"));
String wheregysbm=cf.GB2Uni(request.getParameter("gysbm"));
String wheressfgs=cf.GB2Uni(request.getParameter("ssfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ycfbl,zcbljs,ppbm,ppmc,gysbm,gysmc,ssfgs,fdbl,cxfdbl,khfdbl,khcxfdbl,tcjrbl,tccxjrbl,xpjsbl,xpcxjsbl,xpkhfdbl,xpkhcxfdbl,xptcjrbl,xptccxjrbl ";
	ls_sql+=" ,azfjsbl,ycfjsbl";
	ls_sql+=" from  jxc_ppgysdzb";
	ls_sql+=" where  (ppbm="+whereppbm+") and  (gysbm="+wheregysbm+") and  (ssfgs='"+wheressfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		azfjsbl=rs.getDouble("azfjsbl");
		ycfjsbl=rs.getDouble("ycfjsbl");

		ycfbl=cf.fillNull(rs.getString("ycfbl"));
		zcbljs=cf.fillNull(rs.getString("zcbljs"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		fdbl=rs.getDouble("fdbl");
		cxfdbl=rs.getDouble("cxfdbl");
		khfdbl=rs.getDouble("khfdbl");
		khcxfdbl=rs.getDouble("khcxfdbl");
		tcjrbl=rs.getDouble("tcjrbl");
		tccxjrbl=rs.getDouble("tccxjrbl");
		xpjsbl=rs.getDouble("xpjsbl");
		xpcxjsbl=rs.getDouble("xpcxjsbl");
		xpkhfdbl=rs.getDouble("xpkhfdbl");
		xpkhcxfdbl=rs.getDouble("xpkhcxfdbl");
		xptcjrbl=rs.getDouble("xptcjrbl");
		xptccxjrbl=rs.getDouble("xptccxjrbl");
	}
	rs.close();
	ps.close();
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_ppgysdzb.jsp" name="editform">
<div align="center">辅材－子品牌供应商对照表修改</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">分公司</span></td>
  <td width="74%" >
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="26%"><span class="STYLE2">子品牌</span></td> 
  <td > 
    <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:422PX">
   <%
	cf.selectItem(out,"select jxc_ppxx.ppbm,jxc_ppxx.ppmc from jxc_ppxx where ppbm='"+ppbm+"'",ppbm);
%>
  </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">供应商</span></td>
  <td><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:422PX">
	<%
	cf.selectItem(out,"select jxc_gysxx.gysbm,'('||dqmc||')'||jxc_gysxx.gysmc||DECODE(jxc_gysxx.sfhz,'Y','（合作）','N','（不合作）') from jxc_gysxx,dm_dqbm where jxc_gysxx.dqbm=dm_dqbm.dqbm and jxc_gysxx.cllx='1' and gysbm='"+gysbm+"'",gysbm);
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>安装费结算比例</td>
  <td><input name="azfjsbl" type="text" size="10" maxlength="8" value="<%=azfjsbl%>">
    %</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>远程费结算比例</td>
  <td><input name="ycfjsbl" type="text" size="10" maxlength="8" value="<%=ycfjsbl%>">
    %</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="2" bgcolor="#FFFF66">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>代购厂商正常结算比例</td>
  <td>

    <input name="fdbl" type="text" size="10" maxlength="8" value="<%=fdbl%>">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>代购厂商促销结算比例</td>
  <td>

    <input name="cxfdbl" type="text" size="10" maxlength="8" value="<%=cxfdbl%>">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>代购客户正常结算比例</td>
  <td>

    <input name="khfdbl" type="text" size="10" maxlength="8" value="<%=khfdbl%>">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>代购客户促销结算比例</td>
  <td>

    <input name="khcxfdbl" type="text" size="10" maxlength="8" value="<%=khcxfdbl%>">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>代购提成正常记入比例</td>
  <td>

    <input name="tcjrbl" type="text" size="10" maxlength="8" value="<%=tcjrbl%>">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>代购提成促销记入比例</td>
  <td>

    <input name="tccxjrbl" type="text" size="10" maxlength="8" value="<%=tccxjrbl%>">
    %</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>选配厂商正常结算比例</td>
  <td>

    <input name="xpjsbl" type="text" size="10" maxlength="8" value="<%=xpjsbl%>">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>选配厂商促销结算比例</td>
  <td>

    <input name="xpcxjsbl" type="text" size="10" maxlength="8" value="<%=xpcxjsbl%>">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>选配客户正常结算比例</td>
  <td>

    <input name="xpkhfdbl" type="text" size="10" maxlength="8" value="<%=xpkhfdbl%>">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>选配客户促销结算比例</td>
  <td>

    <input name="xpkhcxfdbl" type="text" size="10" maxlength="8" value="<%=xpkhcxfdbl%>">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>选配提成正常记入比例</td>
  <td>

    <input name="xptcjrbl" type="text" size="10" maxlength="8" value="<%=xptcjrbl%>">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>选配提成促销记入比例</td>
  <td>

    <input name="xptccxjrbl" type="text" size="10" maxlength="8" value="<%=xptccxjrbl%>">
    %</td>
</tr>

    <tr> 
      <td colspan="4" align="center" >
	<input type="hidden" name="whereppbm"  value="<%=whereppbm%>" >
	<input type="hidden" name="wheregysbm"  value="<%=wheregysbm%>" >
	<input type="hidden" name="wheressfgs"  value="<%=wheressfgs%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">      </td>
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ppbm)=="") {
		alert("请输入[子品牌编码]！");
		FormName.ppbm.focus();
		return false;
	}
	if(!(isNumber(FormName.ppbm, "子品牌编码"))) {
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商编码]！");
		FormName.gysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "供应商编码"))) {
		return false;
	}


	if(	javaTrim(FormName.azfjsbl)=="") {
		alert("请输入[安装费结算比例]！");
		FormName.azfjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.azfjsbl, "安装费结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.azfjsbl.value)<0 || parseFloat(FormName.azfjsbl.value)>100) {
		alert("提醒！[安装费结算比例]应在0与100之间");
//		FormName.azfjsbl.select();
//		return false;
	}

	if(	javaTrim(FormName.ycfjsbl)=="") {
		alert("请输入[远程费结算比例]！");
		FormName.ycfjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ycfjsbl, "远程费结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.ycfjsbl.value)<0 || parseFloat(FormName.ycfjsbl.value)>100) {
		alert("提醒！[远程费结算比例]应在0与100之间");
//		FormName.ycfjsbl.select();
//		return false;
	}
	
	
	if(	javaTrim(FormName.fdbl)=="") {
		alert("请输入[正常结算比例]！");
		FormName.fdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.fdbl, "正常结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.fdbl.value)<0 || parseFloat(FormName.fdbl.value)>100) {
		alert("提醒！[正常结算比例]应在0与100之间");
//		FormName.fdbl.select();
//		return false;
	}
	if(	javaTrim(FormName.cxfdbl)=="") {
		alert("请输入[促销结算比例]！");
		FormName.cxfdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cxfdbl, "促销结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.cxfdbl.value)<0 || parseFloat(FormName.cxfdbl.value)>100) {
		alert("提醒！[促销结算比例]应在0与100之间");
//		FormName.cxfdbl.select();
//		return false;
	}

	
	if(	javaTrim(FormName.khfdbl)=="") {
		alert("请输入[正常结算比例]！");
		FormName.khfdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khfdbl, "正常结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.khfdbl.value)<0 || parseFloat(FormName.khfdbl.value)>100) {
		alert("提醒！[正常结算比例]应在0与100之间");
//		FormName.khfdbl.select();
//		return false;
	}
	if(	javaTrim(FormName.khcxfdbl)=="") {
		alert("请输入[促销结算比例]！");
		FormName.khcxfdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khcxfdbl, "促销结算比例"))) {
		return false;
	}
	if(	parseFloat(FormName.khcxfdbl.value)<0 || parseFloat(FormName.khcxfdbl.value)>100) {
		alert("提醒！[促销结算比例]应在0与100之间");
//		FormName.khcxfdbl.select();
//		return false;
	}
	if(	javaTrim(FormName.tcjrbl)=="") {
		alert("请输入[提成正常记入比例]！");
		FormName.tcjrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjrbl, "提成正常记入比例"))) {
		return false;
	}
	if(	parseFloat(FormName.tcjrbl.value)<0 || parseFloat(FormName.tcjrbl.value)>100) {
		alert("提醒！[提成正常记入比例]应在0与100之间");
//		FormName.tcjrbl.select();
//		return false;
	}
	if(	javaTrim(FormName.tccxjrbl)=="") {
		alert("请输入[提成促销记入比例]！");
		FormName.tccxjrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tccxjrbl, "提成促销记入比例"))) {
		return false;
	}
	if(	parseFloat(FormName.tccxjrbl.value)<0 || parseFloat(FormName.tccxjrbl.value)>100) {
		alert("提醒！[提成促销记入比例]应在0与100之间");
//		FormName.tccxjrbl.select();
//		return false;
	}
	
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
