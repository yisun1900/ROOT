<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwbh=null;
String clxlbm=null;
double bzlybl=0;
double lyblxx=0;
double lyblsx=0;
String wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
String whereclxlbm=cf.GB2Uni(request.getParameter("clxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwbh,clxlbm,bzlybl,lyblxx,lyblsx ";
	ls_sql+=" from  jxc_fclybl";
	ls_sql+=" where  (dwbh='"+wheredwbh+"') and  (clxlbm="+whereclxlbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
		bzlybl=rs.getDouble("bzlybl");
		lyblxx=rs.getDouble("lyblxx");
		lyblsx=rs.getDouble("lyblsx");
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
<form method="post" action="SaveEditJxc_fclybl.jsp" name="editform">
<div align="center"><strong>辅材领用比例－维护</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>材料小类编码</td> 
  <td width="32%"> 
    <select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm='"+clxlbm+"'",clxlbm);
%>
    </select>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>标准－领用比例</td> 
  <td width="32%"> 
    <input type="text" name="bzlybl" size="14" maxlength="9"  value="<%=bzlybl%>" >
百分比 </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>领用比例－下限</td> 
  <td width="32%"><input type="text" name="lyblxx" size="14" maxlength="9"  value="<%=lyblxx%>" >
百分比</td>
  <td align="right" width="18%"><span class="STYLE1">*</span>领用比例－上限 </td>
  <td width="32%"><input type="text" name="lyblsx" size="14" maxlength="9"  value="<%=lyblsx%>" >
百分比</td>
</tr>
<input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >
<input type="hidden" name="whereclxlbm"  value="<%=whereclxlbm%>" >
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[分公司]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("请选择[材料小类编码]！");
		FormName.clxlbm.focus();
		return false;
	}
	if(!(isNumber(FormName.clxlbm, "材料小类编码"))) {
		return false;
	}
	if(	javaTrim(FormName.bzlybl)=="") {
		alert("请输入[标准领用比例]！");
		FormName.bzlybl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzlybl, "标准领用比例"))) {
		return false;
	}
	if(	javaTrim(FormName.lyblxx)=="") {
		alert("请输入[领用比例下限]！");
		FormName.lyblxx.focus();
		return false;
	}
	if(!(isFloat(FormName.lyblxx, "领用比例下限"))) {
		return false;
	}
	if(	javaTrim(FormName.lyblsx)=="") {
		alert("请输入[领用比例上限]！");
		FormName.lyblsx.focus();
		return false;
	}
	if(!(isFloat(FormName.lyblsx, "领用比例上限"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
