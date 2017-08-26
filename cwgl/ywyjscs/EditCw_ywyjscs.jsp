<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
String csbm=null;
String csmc=null;
String csz=null;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String wherecsbm=cf.GB2Uni(request.getParameter("csbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,csbm,csmc,csz ";
	ls_sql+=" from  cw_ywyjscs";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (csbm='"+wherecsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		csbm=cf.fillNull(rs.getString("csbm"));
		csmc=cf.fillNull(rs.getString("csmc"));
		csz=cf.fillNull(rs.getString("csz"));
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
<form method="post" action="SaveEditCw_ywyjscs.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",fgsbh);
%>
    </select>
  </td>
  <td align="right" width="15%">参数编码</td> 
  <td width="35%"> 
    <input type="text" name="csbm" size="20" maxlength="2"  value="<%=csbm%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">参数名称</td> 
  <td width="35%"> 
    <input type="text" name="csmc" size="20" maxlength="50"  value="<%=csmc%>" >
  </td>
  <td align="right" width="15%">参数值</td> 
  <td width="35%"> 
    <input type="text" name="csz" size="20" maxlength="17"  value="<%=csz%>" >
  </td>
</tr>
<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
<input type="hidden" name="wherecsbm"  value="<%=wherecsbm%>" >
    <tr> 
      <td colspan="4" >
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.csbm)=="") {
		alert("请输入[参数编码]！");
		FormName.csbm.focus();
		return false;
	}
	if(	javaTrim(FormName.csmc)=="") {
		alert("请输入[参数名称]！");
		FormName.csmc.focus();
		return false;
	}
	if(	javaTrim(FormName.csz)=="") {
		alert("请输入[参数值]！");
		FormName.csz.focus();
		return false;
	}
	if(!(isFloat(FormName.csz, "参数值"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
