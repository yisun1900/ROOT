<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String clxlmc=null;
String cldlmc=null;
String sfxzsl=null;
double tcslxz=0;
double ccbfjj=0;
String sfkjm=null;
double yxjmzdsl=0;
String clxlbm=cf.GB2Uni(request.getParameter("clxlbm"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select clxlmc,sfxzsl,tcslxz,ccbfjj,sfkjm,yxjmzdsl ";
	ls_sql+=" from  bj_khclxlxz";
	ls_sql+=" where  (khbh='"+khbh+"' and clxlbm='"+clxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcslxz=rs.getDouble("tcslxz");
		ccbfjj=rs.getDouble("ccbfjj");
		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		yxjmzdsl=rs.getDouble("yxjmzdsl");
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
<form method="post" action="SaveEditBj_khclxlxz.jsp" name="editform">
<div align="center">请修改－客户材料小类数量限制</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>材料小类编码</td> 
  <td width="32%"> 
    <input type="text" name="clxlbm" size="10" maxlength="4"  value="<%=clxlbm%>" readonly>（不可修改）  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>材料小类名称</td>
  <td colspan="3"><input type="text" name="clxlmc" size="73" maxlength="50"  value="<%=clxlmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否限制数量</td>
  <td><%
	cf.radioToken(out, "sfxzsl","1+不限制&2+不能超量&3+可超量需加价",sfxzsl);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">数量限制</td>
  <td><input name="tcslxz" type="text" value="<%=tcslxz%>" size="20" maxlength="16"></td>
  <td align="right">超出部分加价</td>
  <td><input name="ccbfjj" type="text" value="<%=ccbfjj%>" size="20" maxlength="16"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否限制减免数量</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfkjm","1+不限制&2+限制",sfkjm);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">允许减免最大数量</td>
  <td><input name="yxjmzdsl" type="text" value="<%=yxjmzdsl%>" size="20" maxlength="16"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="khbh"  value="<%=khbh%>" >
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
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("请输入[材料小类编码]！");
		FormName.clxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlmc)=="") {
		alert("请输入[材料小类名称]！");
		FormName.clxlmc.focus();
		return false;
	}
 

	if(	!radioChecked(FormName.sfxzsl)) {
		alert("请选择[是否限制数量]！");
		FormName.sfxzsl[0].focus();
		return false;
	}

	if (FormName.sfxzsl[0].checked)
	{
		if(	javaTrim(FormName.tcslxz)!="" && parseFloat(FormName.tcslxz.value)!=0 ) {
			alert("错误！数量不限制，不需要[数量限制]！");
			FormName.tcslxz.select();
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)!="" && parseFloat(FormName.ccbfjj.value)!=0 ) {
			alert("错误！数量不限制，不需要[超出部分加价]！");
			FormName.ccbfjj.select();
			return false;
		}
	}
	else if (FormName.sfxzsl[1].checked)
	{
		if(	javaTrim(FormName.tcslxz)=="") {
			alert("错误！数量不能超量，必须输入[数量限制]！");
			FormName.tcslxz.focus();
			return false;
		}
		if(!(isFloat(FormName.tcslxz, "数量限制"))) {
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)!="" && parseFloat(FormName.ccbfjj.value)!=0 ) {
			alert("错误！数量不能超量，不需要[超出部分加价]！");
			FormName.ccbfjj.select();
			return false;
		}
	}
	else
	{
		if(	javaTrim(FormName.tcslxz)=="") {
			alert("错误！数量可超量需加价，必须输入[数量限制]！");
			FormName.tcslxz.focus();
			return false;
		}
		if(!(isFloat(FormName.tcslxz, "数量限制"))) {
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)=="") {
			alert("错误！数量可超量需加价，必须输入[超出部分加价]！");
			FormName.ccbfjj.focus();
			return false;
		}
		if(!(isFloat(FormName.ccbfjj, "超出部分加价"))) {
			return false;
		}
	}
	if(	!radioChecked(FormName.sfkjm)) {
		alert("请选择[是否限制减免数量]！");
		FormName.sfkjm[0].focus();
		return false;
	}

	if (FormName.sfkjm[1].checked)
	{
		if(	javaTrim(FormName.yxjmzdsl)=="") {
			alert("错误！输入[允许减免最大数量]！");
			FormName.yxjmzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.yxjmzdsl, "允许减免最大数量"))) {
			return false;
		}
	}
	else{
		FormName.yxjmzdsl.value="";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
