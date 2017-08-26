<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>
<%
String ddbh=request.getParameter("ddbh");
String zjxxh=request.getParameter("zjxxh");

double cgzkl=0;
double tmzkl=0;
double wjzkl=0;
double dqzkl=0;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select jc_cgzjx.cgzkl,jc_cgzjx.tmzkl,jc_cgzjx.wjzkl,jc_cgzjx.dqzkl";
	ls_sql+=" from  jc_cgzjx";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cgzkl=rs.getDouble("cgzkl");
		tmzkl=rs.getDouble("tmzkl");
		wjzkl=rs.getDouble("wjzkl");
		dqzkl=rs.getDouble("dqzkl");
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJc_cgzjxmx.jsp" name="insertform" >
<div align="center">请录入橱柜增减项明细</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1"><span class="STYLE2">*</span>订单编号</span></td> 
  <td width="33%"><input type="text" name="ddbh" value="<%=ddbh%>" size="20" maxlength="9" readonly></td>
  <td align="right" width="17%"><span class="STYLE1"><span class="STYLE2">*</span>增减项序号</span></td> 
  <td width="33%"><input type="text" name="zjxxh" value="<%=zjxxh%>" size="20" maxlength="8" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1"><span class="STYLE2">*</span></span>类型</td> 
  <td colspan="3"><input type="radio" name="lx"  value="1">
    柜体
      <input type="radio" name="lx"  value="2">
      台面
      <input type="radio" name="lx"  value="3">
      五金
      <input type="radio" name="lx"  value="4">
      电器 </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1"><span class="STYLE2">*</span></span>增减项目</td> 
  <td colspan="3"> 
    <input type="text" name="zjxm" value="" size="73" maxlength="100" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><span class="STYLE2">*</span></span>增减数量</td>
  <td><input type="text" name="zjsl" value="" size="20" maxlength="8" onChange="f_jsjg(insertform)"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><span class="STYLE2">*</span></span>折前－单价</td>
  <td><input type="text" name="zqdj" value="" size="20" maxlength="17"  onChange="f_jsjg(insertform)"></td>
  <td align="right"><span class="STYLE1"><span class="STYLE2">*</span>折后－单价</span></td>
  <td><input type="text" name="dj" value="" size="20" maxlength="17"  onChange="f_jsjg(insertform)" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1"><span class="STYLE2">*</span>折前－增减金额</span></td> 
  <td width="33%"><input type="text" name="zqzjje" value="" size="20" maxlength="17" readonly onChange="f_jsjg(insertform)"></td>
  <td align="right" width="17%"><span class="STYLE1"><span class="STYLE2">*</span>折后－增减金额</span></td> 
  <td width="33%"><input type="text" name="zjje" value="" size="20" maxlength="17" readonly onChange="f_jsjg(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsjg(FormName)//参数FormName:Form的名称
{
	var dj;
	if (FormName.lx[0].checked)//1：柜体；2：台面；3：五金；4：电器
	{
		dj=FormName.zqdj.value*<%=cgzkl%>/10;
		dj=round(dj,2);
		FormName.dj.value=dj;
	}
	else if (FormName.lx[1].checked)//1：柜体；2：台面；3：五金；4：电器
	{
		dj=FormName.zqdj.value*<%=tmzkl%>/10;
		dj=round(dj,2);
		FormName.dj.value=dj;
	}
	else if (FormName.lx[2].checked)//1：柜体；2：台面；3：五金；4：电器
	{
		dj=FormName.zqdj.value*<%=wjzkl%>/10;
		dj=round(dj,2);
		FormName.dj.value=dj;
	}
	else if (FormName.lx[3].checked)//1：柜体；2：台面；3：五金；4：电器
	{
		dj=FormName.zqdj.value*<%=dqzkl%>/10;
		dj=round(dj,2);
		FormName.dj.value=dj;
	}

	var zqzjje=FormName.zjsl.value*FormName.zqdj.value;
	zqzjje=round(zqzjje,2);
	FormName.zqzjje.value=zqzjje;

	var zjje=FormName.zjsl.value*FormName.dj.value;
	zjje=round(zjje,2);
	FormName.zjje.value=zjje;
}
function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.zjxm)=="") {
		alert("请输入[增减项目]！");
		FormName.zjxm.focus();
		return false;
	}
	if(	javaTrim(FormName.zjsl)=="") {
		alert("请输入[增减数量]！");
		FormName.zjsl.focus();
		return false;
	}
	if(!(isInt(FormName.zjsl, "增减数量"))) {
		return false;
	}
	if(	javaTrim(FormName.zqdj)=="") {
		alert("请输入[折前单价]！");
		FormName.zqdj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqdj, "折前单价"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}

	if(	javaTrim(FormName.zqzjje)=="") {
		alert("请输入[折前增减金额]！");
		FormName.zqzjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqzjje, "折前增减金额"))) {
		return false;
	}
	if (FormName.zqzjje.value=="0")
	{
		alert("请输入[折前增减金额]！");
		FormName.zqzjje.focus();
		return false;
	}

	if(	javaTrim(FormName.zjje)=="") {
		alert("请输入[增减金额]！");
		FormName.zjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjje, "增减金额"))) {
		return false;
	}
	if (FormName.zjje.value=="0")
	{
		alert("请输入[增减金额]！");
		FormName.zjje.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
