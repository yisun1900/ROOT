<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fklxbm=null;
String fklxmc=null;
String fkdl=null;
String pzfl=null;
String wherefklxbm=cf.GB2Uni(request.getParameter("fklxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fklxbm,fklxmc,fkdl,pzfl ";
	ls_sql+=" from  cw_fklxbm";
	ls_sql+=" where  (fklxbm='"+wherefklxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fklxbm=cf.fillNull(rs.getString("fklxbm"));
		fklxmc=cf.fillNull(rs.getString("fklxmc"));
		fkdl=cf.fillNull(rs.getString("fkdl"));
		pzfl=cf.fillNull(rs.getString("pzfl"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_fklxbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">付款类型编码</td> 
  <td width="35%"> 
    <input type="text" name="fklxbm" size="20" maxlength="2"  value="<%=fklxbm%>" >
  </td>
  <td align="right" width="15%">付款类型名称</td> 
  <td width="35%"> 
    <input type="text" name="fklxmc" size="20" maxlength="50"  value="<%=fklxmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">付款大类</td> 
  <td width="35%"> 
    <select name="fkdl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+家装款&2+集成款&3+集成订金&4+咨询收款&5+预付款&9+其它收款",fkdl);
%>
    </select>
  </td>
  <td align="right" width="15%">凭证分类</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "pzfl","1+工程款&2+集成款",pzfl);
%>
  </td>
</tr>
<input type="hidden" name="wherefklxbm"  value="<%=wherefklxbm%>" >
    <tr> 
      <td colspan="4" height="2">
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>
      </td>
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
	if(	javaTrim(FormName.fklxbm)=="") {
		alert("请输入[付款类型编码]！");
		FormName.fklxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fklxmc)=="") {
		alert("请输入[付款类型名称]！");
		FormName.fklxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.fkdl)=="") {
		alert("请选择[付款大类]！");
		FormName.fkdl.focus();
		return false;
	}
	if(	!radioChecked(FormName.pzfl)) {
		alert("请选择[凭证分类]！");
		FormName.pzfl[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
