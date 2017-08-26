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
String dzld=null;
String sfkclk=null;
String clkzdbl=null;
String sfkybgf=null;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String wherebfcs=cf.GB2Uni(request.getParameter("bfcs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,bfcs,bfjs,bfbl,dzld,sfkclk,clkzdbl,sfkybgf ";
	ls_sql+=" from  cw_lfbgfcsb";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (bfcs="+wherebfcs+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		bfcs=cf.fillNull(rs.getString("bfcs"));
		bfjs=cf.fillNull(rs.getString("bfjs"));
		bfbl=cf.fillNull(rs.getString("bfbl"));
		dzld=cf.fillNull(rs.getString("dzld"));
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		clkzdbl=cf.fillNull(rs.getString("clkzdbl"));
		sfkybgf=cf.fillNull(rs.getString("sfkybgf"));
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
<form method="post" action="SaveEditCw_lfbgfcsb.jsp" name="editform">
<div align="center">拨工费参数表－修改</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
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
		cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd not in('0','B') order by gdjsjd",bfcs);
	%>
    </select></td>
  <td align="right"><span class="STYLE1">*</span>拨付比例</td>
  <td><input type="text" name="bfbl" size="10" maxlength="9"  value="<%=bfbl%>" >
    百分比</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>拨付基数</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "bfjs","3+实收款<BR>&1+折前工程费<BR>&2+折后工程费<BR>&9+由打折力度决定折前折后",bfjs);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">打折力度</td> 
  <td colspan="3"> 
    <p>
      <input type="text" name="dzld" size="20" maxlength="9"  value="<%=dzld%>" >      
      （&gt;=0且&lt;=10）</p>
    <p>客户折扣若大于【打折力度】拨付基数取折前；客户折扣若小于【打折力度】拨付基数取折后</p></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否扣材料款</td>
  <td><%
	cf.radioToken(out, "sfkclk","Y+是&N+否",sfkclk);
%></td>
  <td align="right">材料款最低比例</td>
  <td><input name="clkzdbl" type="text" id="clkzdbl" value="<%=clkzdbl%>" size="10" maxlength="9" >
    百分比</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否扣已拨工费</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfkybgf","Y+是&N+否",sfkybgf);
%></td>
</tr>
<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
<input type="hidden" name="wherebfcs"  value="<%=wherebfcs%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
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

	if (FormName.bfjs[2].checked)
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
