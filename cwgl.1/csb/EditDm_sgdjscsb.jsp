<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
String bfcs=null;
String bfjs=null;
String bfbl=null;
String sdlbfbl=null;
String kzbjjs=null;
String sfwgjs=null;
String sdljsfs=null;
String sfkclk=null;
String sfkgdyp=null;
String sfkyfgf=null;
String sfkzbj=null;
String sgdjbxg=null;
String sfhzjx=null;
double kzbjbl=0;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String wherebfcs=cf.GB2Uni(request.getParameter("bfcs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,bfcs,bfjs,bfbl,sdlbfbl,kzbjjs,sfwgjs,sdljsfs,sfkclk,sfkgdyp,sfkyfgf,sfkzbj,sgdjbxg,sfhzjx,kzbjbl ";
	ls_sql+=" from  dm_sgdjscsb";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (bfcs="+wherebfcs+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kzbjbl=rs.getDouble("kzbjbl");
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		bfcs=cf.fillNull(rs.getString("bfcs"));
		bfjs=cf.fillNull(rs.getString("bfjs"));
		bfbl=cf.fillNull(rs.getString("bfbl"));
		sdlbfbl=cf.fillNull(rs.getString("sdlbfbl"));
		kzbjjs=cf.fillNull(rs.getString("kzbjjs"));
		sfwgjs=cf.fillNull(rs.getString("sfwgjs"));
		sdljsfs=cf.fillNull(rs.getString("sdljsfs"));
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));
		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));
		sgdjbxg=cf.fillNull(rs.getString("sgdjbxg"));
		sfhzjx=cf.fillNull(rs.getString("sfhzjx"));
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
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditDm_sgdjscsb.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>拨付次数</td> 
  <td width="32%"> 
    <select name="bfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"1+第一次&2+第二次&3+第三次&4+第四次&5+第五次&6+第六次&7+第七次&8+第八次&9+第九次&10+第十次",bfcs,false);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>拨付基数</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "bfjs","1+工程费<BR>&2+工程费＋其它费<BR>&3+实收款总额<BR>&4+一期款<BR>&5+二期款<BR>&6+三期款<BR>&7+工程基础报价<BR>&8+工程基础报价＋其它费基础报价<BR>&9+工程施工成本价<BR>&A+工程施工成本价＋其它费施工成本<BR>&B+工程成本价<BR>&C+工程成本价＋其它费成本",bfjs);
%>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>拨付比例</td> 
  <td width="32%"> 
    <input type="text" name="bfbl" size="10" maxlength="9"  value="<%=bfbl%>" >
    %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>水电路结算方式</td>
  <td><%
	cf.radioToken(out, "sdljsfs","1+统一比例结算<BR>&2+独立比例结算<BR>&3+手工录入结算金额<BR>&9+不结算",sdljsfs);
%></td>
  <td align="right">水电路拨付比例</td>
  <td><input type="text" name="sdlbfbl" size="10" maxlength="9"  value="<%=sdlbfbl%>" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否扣质保金</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfkzbj","Y+扣质保金比例不可改<BR>&M+扣质保金比例可改<BR>&N+不扣质保金",sfkzbj);
%></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">扣质保金基数</td>
  <td><%
	cf.radioToken(out, "kzbjjs","1+结算基数&2+结算总额",kzbjjs);
%></td>
  <td align="right">扣质保金比例</td>
  <td><input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="9" >
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否扣材料款</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfkclk","Y+是&N+否",sfkclk);
%>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否扣工地用品</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfkgdyp","Y+是&N+否",sfkgdyp);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否扣已付工费</td>
  <td><%
	cf.radioToken(out, "sfkyfgf","Y+是&N+否",sfkyfgf);
%></td>
  <td align="right"><span class="STYLE1">*</span>是否与施工队级别相关</td>
  <td><%
	cf.radioToken(out, "sgdjbxg","Y+是&N+否",sgdjbxg);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否完工结算</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfwgjs","Y+是&N+否",sfwgjs);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否含增减项</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfhzjx","Y+是&N+否",sfhzjx);
%></td>
</tr>
<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
<input type="hidden" name="wherebfcs"  value="<%=wherebfcs%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	  <input name="button3" type="button" onClick="f_lr(editform)"  value="单额结算比例">
	  <input type="button" onClick="f_lr(editform)"  value="扣质保金比例">
	  <input name="button" type="button" onClick="f_jbtz(editform)"  value="施工队级别调结算比例">
	  <input name="button2" type="button" onClick="f_zbjtz(editform)"  value="质保金调结算比例">
	</div>      </td>
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
		alert("请选择[拨付次数]！");
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
	if(	javaTrim(FormName.bfbl)=="") {
		alert("请输入[拨付比例]！");
		FormName.bfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bfbl, "拨付比例"))) {
		return false;
	}
	if(	!radioChecked(FormName.sdljsfs)) {
		alert("请选择[水电路结算方式]！");
		FormName.sdljsfs[0].focus();
		return false;
	}
	if (FormName.sdljsfs[1].checked)
	{
		if(	javaTrim(FormName.sdlbfbl)=="") {
			alert("请输入[水电路拨付比例]！");
			FormName.sdlbfbl.focus();
			return false;
		}
	}
	if(!(isFloat(FormName.sdlbfbl, "水电路拨付比例"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfwgjs)) {
		alert("请选择[是否完工结算]！");
		FormName.sfwgjs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkclk)) {
		alert("请选择[是否扣材料款]！");
		FormName.sfkclk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkgdyp)) {
		alert("请选择[是否扣工地用品]！");
		FormName.sfkgdyp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkyfgf)) {
		alert("请选择[是否扣已付工费]！");
		FormName.sfkyfgf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkzbj)) {
		alert("请选择[是否扣质保金]！");
		FormName.sfkzbj[0].focus();
		return false;
	}
	if (FormName.sfkzbj[0].checked)
	{
		if(	!radioChecked(FormName.kzbjjs)) {
			alert("请选择[扣质保金基数]！");
			FormName.kzbjjs[0].focus();
			return false;
		}
		if(	javaTrim(FormName.kzbjbl)=="") {
			alert("请输入[扣质保金比例]！");
			FormName.kzbjbl.focus();
			return false;
		}
		if(!(isFloat(FormName.kzbjbl, "扣质保金比例"))) {
			return false;
		}
	}
	if(	!radioChecked(FormName.sgdjbxg)) {
		alert("请选择[是否与施工队级别相关]！");
		FormName.sgdjbxg[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhzjx)) {
		alert("请选择[是否含增减项]！");
		FormName.sfhzjx[0].focus();
		return false;
	}

	FormName.action="SaveEditDm_sgdjscsb.jsp";
	FormName.target="";
	FormName.submit();
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("请选择[拨付次数]！");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "拨付次数"))) {
		return false;
	}

	FormName.action="InsertDm_kzbjbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_jbtz(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("请选择[拨付次数]！");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "拨付次数"))) {
		return false;
	}

	FormName.action="InsertDm_jbtjsbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_zbjtz(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("请选择[拨付次数]！");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "拨付次数"))) {
		return false;
	}

	FormName.action="InsertDm_zbjtjsbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
