<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {	color: #0000CC;
	font-weight: bold;
}
.STYLE2 {color: #FF0000}
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<%
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khbh=request.getParameter("khbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String fgsbh=null;
String khxm=null;
String hth=null;
String lxfs=null;
String qtdh=null;
String sjs=null;
double cwsfke=0;
double cxhddj=0;

try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,khxm,hth,lxfs,qtdh,sjs,cwsfke";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		hth=cf.fillNull(rs.getString("hth"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		cwsfke=rs.getDouble("cwsfke");
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje) cxhddj";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='51' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhddj=rs.getDouble("cxhddj");
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cw_jcfkd";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("错误！已录入集成返款");
		return;
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jcfkd.jsp" name="insertform" target="_blank">
<div align="center">录入集成返款单（客户编号：<%=khbh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">客户姓名</span></td>
    <td><%=khxm%></td>
    <td align="right"><span class="STYLE1">合同号</span></td>
    <td><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">联系电话</span></td>
    <td><%=lxfs%>、<%=qtdh%></td>
    <td align="right"><span class="STYLE1">家装设计师</span></td>
    <td><%=sjs%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1"><span class="STYLE2">*</span>家装实收款</span></td> 
  <td width="31%"> 
    <input type="text" name="jzssk" value="<%=cwsfke%>" size="20" maxlength="16" readonly>  </td>
  <td align="right" width="19%"><span class="STYLE1"><span class="STYLE2">*</span>促销活动订金</span></td> 
  <td width="31%"> 
    <input type="text" name="cxhddj" value="<%=cxhddj%>" size="20" maxlength="17" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE2">*</span>集成家居可计入活动金额</td> 
  <td colspan="3"> 
    <input type="text" name="jrhdje" value="" size="20" maxlength="17" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>应补（扣）款</td>
  <td colspan="3"><input type="text" name="ybkje" value="" size="20" maxlength="17" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE2">*</span>最终应返款</td> 
  <td colspan="3"> 
    <input type="text" name="yfkje" value="" size="20" maxlength="17" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>办理人</td>
  <td><input type="text" name="blr" value="<%=yhmc%>" size="20" maxlength="20" ></td>
  <td align="right"><span class="STYLE2">*</span>办理时间 </td>
  <td><input type="text" name="blsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span><span class="STYLE3">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE2">*</span><span class="STYLE3">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE2">*</span><span class="STYLE3">录入部门</span></td> 
  <td width="31%">
  <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right" width="19%"><span class="STYLE2">*</span><span class="STYLE3">所属分公司</span></td> 
  <td width="31%"><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
	<input name="button" type="button" onClick="window.open('ViewCw_jcfkd.jsp?khbh=<%=khbh%>')"  value="打印"></td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[所属分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jzssk)=="") {
		alert("请输入[家装实收款]！");
		FormName.jzssk.focus();
		return false;
	}
	if(!(isFloat(FormName.jzssk, "家装实收款"))) {
		return false;
	}
	if(	javaTrim(FormName.cxhddj)=="") {
		alert("请输入[促销活动订金]！");
		FormName.cxhddj.focus();
		return false;
	}
	if(!(isFloat(FormName.cxhddj, "促销活动订金"))) {
		return false;
	}
	if(	javaTrim(FormName.jrhdje)=="") {
		alert("请输入[计入活动金额]！");
		FormName.jrhdje.focus();
		return false;
	}
	if(!(isFloat(FormName.jrhdje, "计入活动金额"))) {
		return false;
	}
	if(	javaTrim(FormName.ybkje)=="") {
		alert("请输入[应补（扣）款金额]！");
		FormName.ybkje.focus();
		return false;
	}
	if(!(isFloat(FormName.ybkje, "应补（扣）款金额"))) {
		return false;
	}
	if(	javaTrim(FormName.yfkje)=="") {
		alert("请输入[应返款金额]！");
		FormName.yfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.yfkje, "应返款金额"))) {
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
	if(	javaTrim(FormName.blr)=="") {
		alert("请输入[办理人]！");
		FormName.blr.focus();
		return false;
	}
	if(	javaTrim(FormName.blsj)=="") {
		alert("请输入[办理时间]！");
		FormName.blsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.blsj, "办理时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
