<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=null;
String zjxxh=null;
String lx=null;
String zjxm=null;
String zjsl=null;
double zqdj=0;
double zqzjje=0;
double dj=0;
double zjje=0;

double cgzkl=0;
double tmzkl=0;
double wjzkl=0;
double dqzkl=0;

String bz=null;
String wherexh=request.getParameter("xh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ddbh,zjxxh,lx,zjxm,zjsl,zqdj,zqzjje,zjje,dj,zjje,bz ";
	ls_sql+=" from  jc_cgzjxmx";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		lx=cf.fillNull(rs.getString("lx"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		zjsl=cf.fillNull(rs.getString("zjsl"));
		zqdj=rs.getDouble("zqdj");
		zqzjje=rs.getDouble("zqzjje");
		dj=rs.getDouble("dj");
		zjje=rs.getDouble("zjje");
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


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
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJc_cgzjxmx.jsp" name="editform">
<div align="center">请修改橱柜增减项明细</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1"><span class="STYLE2">*</span>订单编号</span></td> 
  <td width="33%"> 
    <input type="text" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" readonly>  </td>
  <td width="17%" align="right" class="STYLE1"><span class="STYLE2">*</span>增减项序号</td> 
  <td width="33%"> 
    <input type="text" name="zjxxh" size="20" maxlength="8"  value="<%=zjxxh%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">*</span>类型</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "lx","1+柜体&2+台面&3+五金&4+电器",lx);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>增减项目</td>
  <td colspan="3"><input type="text" name="zjxm" size="73" maxlength="100"  value="<%=zjxm%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">*</span>增减数量</td> 
  <td width="33%"> 
    <input type="text" name="zjsl" size="20" maxlength="8"  value="<%=zjsl%>" onChange="f_jsjg(editform)">  </td>
  <td align="right" width="17%">&nbsp;</td> 
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><span class="STYLE2">*</span></span>折前－单价</td>
  <td><input type="text" name="zqdj" value="<%=zqdj%>" size="20" maxlength="17"  onChange="f_jsjg(editform)"></td>
  <td align="right"><span class="STYLE1"><span class="STYLE2">*</span>折后－单价</span></td>
  <td><input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" onChange="f_jsjg(editform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><span class="STYLE2">*</span>折前－增减金额</span></td>
  <td><input type="text" name="zqzjje" value="<%=zqzjje%>" size="20" maxlength="17" readonly onChange="f_jsjg(editform)"></td>
  <td align="right"><span class="STYLE1"><span class="STYLE2">*</span>折后－增减金额</span></td>
  <td><input type="text" name="zjje" size="20" maxlength="17"  value="<%=zjje%>" readonly onChange="f_jsjg(editform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" align="center"> 
	<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输"></td>
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
