<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fkfabm=null;
String fkcs=null;
String lx=null;
String sfbhglf=null;
String sfbhsj=null;

String sfbhgcf=null;
String sfbhjrqtf=null;
String sfbhbjrqtf=null;
String sfbhsjf=null;
String sfbhzcf=null;
String sfsjfsesk=null;

String yfkbl=null;
String bqfkbl=null;
String wherefkfabm=cf.GB2Uni(request.getParameter("fkfabm"));
String wherefkcs=cf.GB2Uni(request.getParameter("fkcs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fkfabm,fkcs,lx,sfbhglf,sfbhsj,yfkbl,bqfkbl,sfbhgcf,sfbhjrqtf,sfbhbjrqtf,sfbhsjf,sfbhzcf,sfsjfsesk ";
	ls_sql+=" from  cw_fkfamx";
	ls_sql+=" where  (fkfabm='"+wherefkfabm+"') and  (fkcs="+wherefkcs+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkfabm=cf.fillNull(rs.getString("fkfabm"));
		fkcs=cf.fillNull(rs.getString("fkcs"));
		lx=cf.fillNull(rs.getString("lx"));
		sfbhglf=cf.fillNull(rs.getString("sfbhglf"));
		sfbhsj=cf.fillNull(rs.getString("sfbhsj"));
		yfkbl=cf.fillNull(rs.getString("yfkbl"));
		bqfkbl=cf.fillNull(rs.getString("bqfkbl"));
		sfbhgcf=cf.fillNull(rs.getString("sfbhgcf"));
		sfbhjrqtf=cf.fillNull(rs.getString("sfbhjrqtf"));
		sfbhbjrqtf=cf.fillNull(rs.getString("sfbhbjrqtf"));
		sfbhsjf=cf.fillNull(rs.getString("sfbhsjf"));
		sfbhzcf=cf.fillNull(rs.getString("sfbhzcf"));
		sfsjfsesk=cf.fillNull(rs.getString("sfsjfsesk"));
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
<form method="post" action="SaveEditCw_fkfamx.jsp" name="editform">
<div align="center">请修改信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><span class="STYLE1">*</span>付款方案</td>
      <td width="29%"> 
        <select name="fkfabm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fkfabm,fkfamc from cw_fkfabm order by fkfabm",fkfabm);
%> 
      </select>      </td>
      <td align="right" width="21%"><span class="STYLE1">*</span>收款期数</td>
      <td width="29%"> 
        <select name="fkcs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs order by fkcs",fkcs);
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span>本期收款比率（%）</td>
      <td><input type="text" name="bqfkbl" size="20" maxlength="9"  value="<%=bqfkbl%>" >      </td>
      <td align="right"><span class="STYLE1">*</span>累计收款比率（%）</td>
      <td><input type="text" name="yfkbl" size="20" maxlength="9"  value="<%=yfkbl%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><span class="STYLE1">*</span>收款方式</td>
      <td colspan="3"> 
          <%
	cf.radioToken(out,"lx","1+按折前收款(不含增减项)<BR>&2+按折前收款（含增减项一次收取）<BR>&3+按折前收款（含增减项分次收取）<BR><BR>&6+按折后收款(不含增减项)<BR>&7+按折后收款（含增减项一次收取）<BR>&8+按折后收款（含增减项分次收取）<BR><BR>&A+折前增减项<BR>&B+折后增减项<BR>",lx);
%>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span>是否按实际发生总额收款</td>
      <td><%
	cf.radioToken(out, "sfsjfsesk","Y+是&N+不含全部费用",sfsjfsesk);
%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFFF"><span class="STYLE1"><strong>如果【不含全部费用】，请选择下述选项</strong></span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">是否含工程费</td>
      <td><%
	cf.radioToken(out, "sfbhgcf","N+不包含&Y+包含",sfbhgcf);
%></td>
      <td align="right">是否含设计费</td>
      <td><%
	cf.radioToken(out, "sfbhsjf","N+不包含&Y+包含",sfbhsjf);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">是否含记业绩其它费</td>
      <td><%
	cf.radioToken(out, "sfbhjrqtf","N+不包含&Y+包含",sfbhjrqtf);
%></td>
      <td align="right">是否含不记业绩其它费</td>
      <td><%
	cf.radioToken(out, "sfbhbjrqtf","N+不包含&Y+包含",sfbhbjrqtf);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">收款是否包含管理费</td>
      <td>
<%
	cf.radioToken(out, "sfbhglf","N+不包含&Y+包含",sfbhglf);
%>	  </td>
      <td align="right">收款是否包含税金</td>
      <td>
<%
	cf.radioToken(out, "sfbhsj","N+不包含&Y+包含",sfbhsj);
%>	  </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">是否含主材费</td>
      <td><%
	cf.radioToken(out, "sfbhzcf","N+不包含&Y+包含",sfbhzcf);
%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <input type="hidden" name="wherefkfabm"  value="<%=wherefkfabm%>" >
    <input type="hidden" name="wherefkcs"  value="<%=wherefkcs%>" >
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
	if(	javaTrim(FormName.fkfabm)=="") {
		alert("请选择[付款方案]！");
		FormName.fkfabm.focus();
		return false;
	}
	if(	javaTrim(FormName.fkcs)=="") {
		alert("请选择[收款期数]！");
		FormName.fkcs.focus();
		return false;
	}
	if(!(isNumber(FormName.fkcs, "收款期数"))) {
		return false;
	}
	if(	javaTrim(FormName.yfkbl)=="") {
		alert("请输入[累计收款比率（%）]！");
		FormName.yfkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yfkbl, "累计收款比率（%）"))) {
		return false;
	}
	if(	javaTrim(FormName.bqfkbl)=="") {
		alert("请输入[本期收款比率（%）]！");
		FormName.bqfkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bqfkbl, "本期收款比率（%）"))) {
		return false;
	}

	if(	!radioChecked(FormName.lx)) {
		alert("请选择[收款基数]！");
		FormName.lx[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfsjfsesk)) {
		alert("请选择[是否按实际发生总额收款]！");
		FormName.sfsjfsesk[0].focus();
		return false;
	}

	if (FormName.sfsjfsesk[1].checked)
	{
		if(	!radioChecked(FormName.sfbhgcf)) {
			alert("请选择[是否含工程费]！");
			FormName.sfbhgcf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhjrqtf)) {
			alert("请选择[是否含记业绩其它费]！");
			FormName.sfbhjrqtf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhbjrqtf)) {
			alert("请选择[是否含不记业绩其它费]！");
			FormName.sfbhbjrqtf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhsjf)) {
			alert("请选择[是否含设计费]！");
			FormName.sfbhsjf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhglf)) {
			alert("请选择[收款是否包含管理费]！");
			FormName.sfbhglf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhsj)) {
			alert("请选择[收款是否包含税金]！");
			FormName.sfbhsj[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhzcf)) {
			alert("请选择[是否含主材费]！");
			FormName.sfbhzcf[0].focus();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
