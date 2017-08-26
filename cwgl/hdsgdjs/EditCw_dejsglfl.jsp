<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xh=null;
String qsz=null;
String jzz=null;
String jsbl=null;
String dqbm=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xh,qsz,jzz,jsbl,dqbm ";
	ls_sql+=" from  cw_dejsglfl";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		qsz=cf.fillNull(rs.getString("qsz"));
		jzz=cf.fillNull(rs.getString("jzz"));
		jsbl=cf.fillNull(rs.getString("jsbl"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
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
<form method="post" action="SaveEditCw_dejsglfl.jsp" name="editform">
<div align="center">请修改信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">序号</td>
      <td width="29%"> 
        <input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" >
      </td>
      <td align="right" width="21%">地区</td>
      <td width="29%"> 
        <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">成本金额起始值（>=）</td>
      <td width="29%"> 
        <input type="text" name="qsz" size="20" maxlength="17"  value="<%=qsz%>" >
      </td>
      <td align="right" width="21%">成本金额截止值（<）</td>
      <td width="29%"> 
        <input type="text" name="jzz" size="20" maxlength="17"  value="<%=jzz%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">结算比例(0-100)</td>
      <td width="29%"> 
        <input type="text" name="jsbl" size="20" maxlength="17"  value="<%=jsbl%>" >
      </td>
      <td align="right" width="21%">&nbsp;</td>
      <td width="29%">&nbsp; </td>
    </tr>
    <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
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
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	if(	javaTrim(FormName.qsz)=="") {
		alert("请输入[成本金额起始值（>=）]！");
		FormName.qsz.focus();
		return false;
	}
	if(!(isFloat(FormName.qsz, "成本金额起始值（>=）"))) {
		return false;
	}
	if(	javaTrim(FormName.jzz)=="") {
		alert("请输入[成本金额截止值（<）]！");
		FormName.jzz.focus();
		return false;
	}
	if(!(isFloat(FormName.jzz, "成本金额截止值（<）"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("请输入[结算比例(0-100)]！");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "结算比例(0-100)"))) {
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
