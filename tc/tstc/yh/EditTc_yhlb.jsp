<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String bjjbbm=null;
String lbmc=null;
String sfbx=null;
String lbzqj=null;
String lbyhj=null;
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String wherelbmc=cf.getParameter(request,"lbmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,bjjbbm,lbmc,sfbx,lbzqj,lbyhj ";
	ls_sql+=" from  tc_yhlb";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (lbmc='"+wherelbmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		lbmc=cf.fillNull(rs.getString("lbmc"));
		sfbx=cf.fillNull(rs.getString("sfbx"));
		lbzqj=cf.fillNull(rs.getString("lbzqj"));
		lbyhj=cf.fillNull(rs.getString("lbyhj"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditTc_yhlb.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">地区</td> 
  <td width="35%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
    </select>  </td>
  <td align="right" width="15%">报价级别</td> 
  <td width="35%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">礼包名称</td> 
  <td colspan="3"> 
    <input type="text" name="lbmc" size="73" maxlength="100"  value="<%=lbmc%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否必选</td>
  <td><%
	cf.radioToken(out, "sfbx","1+必选&2+非必选",sfbx);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">礼包折前价</td> 
  <td width="35%"> 
    <input type="text" name="lbzqj" size="20" maxlength="17"  value="<%=lbzqj%>" >  </td>
  <td align="right" width="15%">礼包优惠价</td> 
  <td width="35%"> 
    <input type="text" name="lbyhj" size="20" maxlength="17"  value="<%=lbyhj%>" >  </td>
</tr>
<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
<input type="hidden" name="wherelbmc"  value="<%=wherelbmc%>" >
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lbmc)=="") {
		alert("请输入[礼包名称]！");
		FormName.lbmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbx)) {
		alert("请选择[是否必选]！");
		FormName.sfbx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lbzqj)=="") {
		alert("请输入[礼包折前价]！");
		FormName.lbzqj.focus();
		return false;
	}
	if(!(isFloat(FormName.lbzqj, "礼包折前价"))) {
		return false;
	}
	if(	javaTrim(FormName.lbyhj)=="") {
		alert("请输入[礼包优惠价]！");
		FormName.lbyhj.focus();
		return false;
	}
	if(!(isFloat(FormName.lbyhj, "礼包优惠价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
