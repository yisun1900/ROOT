<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cpztbm=null;
String cpztmc=null;
String cplx=null;
String ghf=null;
String ztxh=null;
String wherecpztbm=cf.GB2Uni(request.getParameter("cpztbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cpztbm,cpztmc,cplx,ghf,ztxh ";
	ls_sql+=" from  dm_cpztbm";
	ls_sql+=" where  (cpztbm='"+wherecpztbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpztbm=cf.fillNull(rs.getString("cpztbm"));
		cpztmc=cf.fillNull(rs.getString("cpztmc"));
		cplx=cf.fillNull(rs.getString("cplx"));
		ghf=cf.fillNull(rs.getString("ghf"));
		ztxh=cf.fillNull(rs.getString("ztxh"));
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
<form method="post" action="SaveEditDm_cpztbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品状态编码</td> 
  <td width="32%"> 
    <input type="text" name="cpztbm" size="20" maxlength="2"  value="<%=cpztbm%>" >  </td>
  <td align="right" width="18%">产品状态名称</td> 
  <td width="32%"> 
    <input type="text" name="cpztmc" size="20" maxlength="50"  value="<%=cpztmc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">产品类型</td>
  <td><%
	cf.radioToken(out, "cplx","0+全部&1+定制品&2+成品",cplx);
%></td>
  <td align="right">供货方</td>
  <td><%
	cf.radioToken(out, "ghf","甲供+甲供&公司供+公司供",ghf);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">状态序号</td> 
  <td width="32%"><input type="text" name="ztxh" value="<%=ztxh%>" size="20" maxlength="8" ></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<input type="hidden" name="wherecpztbm"  value="<%=wherecpztbm%>" >
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
	if(	javaTrim(FormName.cpztbm)=="") {
		alert("请输入[产品状态编码]！");
		FormName.cpztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpztmc)=="") {
		alert("请输入[产品状态名称]！");
		FormName.cpztmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.cplx)) {
		alert("请选择[产品类型]！");
		FormName.cplx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.ghf)) {
		alert("请选择[供货方]！");
		FormName.ghf[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ztxh)=="") {
		alert("请输入[状态序号]！");
		FormName.ztxh.focus();
		return false;
	}
	if(!(isNumber(FormName.ztxh, "状态序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
