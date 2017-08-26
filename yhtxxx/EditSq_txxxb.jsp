<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yhdlm=null;
String ygbh=null;
String yhmc=null;
String txfs=null;
String txlx=null;
String txgjz=null;
String txnr=null;
String kstxsj=null;
String txzt=null;
String txsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yhdlm,ygbh,yhmc,txfs,txlx,txgjz,txnr,kstxsj,txzt,txsj,lrr,lrsj,lrbm ";
	ls_sql+=" from  sq_txxxb";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		txfs=cf.fillNull(rs.getString("txfs"));
		txlx=cf.fillNull(rs.getString("txlx"));
		txgjz=cf.fillNull(rs.getString("txgjz"));
		txnr=cf.fillNull(rs.getString("txnr"));
		kstxsj=cf.fillNull(rs.getDate("kstxsj"));
		txzt=cf.fillNull(rs.getString("txzt"));
		txsj=cf.fillNull(rs.getDate("txsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
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
<form method="post" action="SaveEditSq_txxxb.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">用户登录名</td> 
  <td width="35%"> 
    <input type="text" name="yhdlm" size="20" maxlength="16"  value="<%=yhdlm%>" >
  </td>
  <td align="right" width="15%">员工序号</td> 
  <td width="35%"> 
    <input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">员工名称</td> 
  <td width="35%"> 
    <input type="text" name="yhmc" size="20" maxlength="20"  value="<%=yhmc%>" >
  </td>
  <td align="right" width="15%">提醒方式</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "txfs","1+系统&2+电话&3+传真&4+短信&9+全部",txfs);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">提醒类型</td> 
  <td width="35%"> 
    <select name="txlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"01+咨询回访&02+在施工程回访&03+投诉报修回访&04+投诉报修",txlx);
%>
    </select>
  </td>
  <td align="right" width="15%">提醒关键字</td> 
  <td width="35%"> 
    <input type="text" name="txgjz" size="20" maxlength="50"  value="<%=txgjz%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">提醒内容</td> 
  <td width="35%"> 
    <textarea name="txnr" cols="29" rows=""><%=txnr%></textarea>
  </td>
  <td align="right" width="15%">开始提醒时间</td> 
  <td width="35%"> 
    <input type="text" name="kstxsj" size="20" maxlength="10"  value="<%=kstxsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">提醒状态</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "txzt","1+未提醒&2+提醒&3+处理",txzt);
%>
  </td>
  <td align="right" width="15%">提醒时间</td> 
  <td width="35%"> 
    <input type="text" name="txsj" size="20" maxlength="10"  value="<%=txsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" >
  </td>
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入部门</td> 
  <td width="35%"> 
    <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by ssfgs,dwbh",lrbm);
%>
    </select>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
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
	if(	javaTrim(FormName.yhdlm)=="") {
		alert("请输入[用户登录名]！");
		FormName.yhdlm.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[员工序号]！");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("请输入[员工名称]！");
		FormName.yhmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.txfs)) {
		alert("请选择[提醒方式]！");
		FormName.txfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.txlx)=="") {
		alert("请选择[提醒类型]！");
		FormName.txlx.focus();
		return false;
	}
	if(	javaTrim(FormName.txgjz)=="") {
		alert("请输入[提醒关键字]！");
		FormName.txgjz.focus();
		return false;
	}
	if(	javaTrim(FormName.txnr)=="") {
		alert("请输入[提醒内容]！");
		FormName.txnr.focus();
		return false;
	}
	if(	javaTrim(FormName.kstxsj)=="") {
		alert("请输入[开始提醒时间]！");
		FormName.kstxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kstxsj, "开始提醒时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.txzt)) {
		alert("请选择[提醒状态]！");
		FormName.txzt[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.txsj, "提醒时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
