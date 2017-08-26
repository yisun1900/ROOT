<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
double bzjgzk=10;
double mjzjzk=10;
double zcsjzk=10;
double zcclzk=10;
double zcsfzk=10;
double zcjmzk=10;
double ddzccjzk=10;
double ddzcclzk=10;
double tcwgczk=10;
double tcgcclzk=10;

String tzjlh=cf.GB2Uni(request.getParameter("tzjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tctzk";
	ls_sql+=" where tzjlh='"+tzjlh+"'";
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
		ls_sql="select bzjgzk,mjzjzk,zcsjzk,zcclzk,zcsfzk,zcjmzk,ddzccjzk,ddzcclzk,tcwgczk,tcgcclzk ";
		ls_sql+=" from  crm_tctzk";
		ls_sql+=" where tzjlh='"+tzjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bzjgzk=rs.getDouble("bzjgzk");
			mjzjzk=rs.getDouble("mjzjzk");
			zcsjzk=rs.getDouble("zcsjzk");
			zcclzk=rs.getDouble("zcclzk");
			zcsfzk=rs.getDouble("zcsfzk");
			zcjmzk=rs.getDouble("zcjmzk");
			ddzccjzk=rs.getDouble("ddzccjzk");
			ddzcclzk=rs.getDouble("ddzcclzk");
			tcwgczk=rs.getDouble("tcwgczk");
			tcgcclzk=rs.getDouble("tcgcclzk");
		}
		rs.close();
		ps.close();
	}
	else{
		ls_sql="select bzjgzk,mjzjzk,zcsjzk,zcclzk,zcsfzk,zcjmzk,ddzccjzk,ddzcclzk,tcwgczk,tcgcclzk ";
		ls_sql+=" from  crm_khzk";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bzjgzk=rs.getDouble("bzjgzk");
			mjzjzk=rs.getDouble("mjzjzk");
			zcsjzk=rs.getDouble("zcsjzk");
			zcclzk=rs.getDouble("zcclzk");
			zcsfzk=rs.getDouble("zcsfzk");
			zcjmzk=rs.getDouble("zcjmzk");
			ddzccjzk=rs.getDouble("ddzccjzk");
			ddzcclzk=rs.getDouble("ddzcclzk");
			tcwgczk=rs.getDouble("tcwgczk");
			tcgcclzk=rs.getDouble("tcgcclzk");
		}
		rs.close();
		ps.close();
	}



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
<title>套餐客户调折扣</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
  <div align="center">套餐客户调折扣(调整记录号：<%=tzjlh%>)</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr>
      <td colspan="4" ><div align="center">
            <input type="button"  value="保存" onClick="f_do(insertform)">
            <input type="reset"  value="重输">
		<input type="hidden" name="tzjlh" value="<%=tzjlh%>">
		<input type="hidden" name="khbh" value="<%=khbh%>">
      </div></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>套餐标准价格折扣</td>
      <td><input type="text" name="bzjgzk" size="8" maxlength="9"  value="<%=bzjgzk%>" >
          <b><font color="#0000FF">（>=0且<=10）</font></b> </td>
      <td align="right"><font color="#FF0000">*</font>面积增加金额折扣</td>
      <td><input type="text" name="mjzjzk" size="8" maxlength="9"  value="<%=mjzjzk%>" >
          <b><font color="#0000FF">（>=0且<=10）</font></b> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>主材升级差价折扣</td>
      <td><input type="text" name="zcsjzk" size="8" maxlength="9"  value="<%=zcsjzk%>" >
          <b><font color="#0000FF">（>=0且<=10）</font></b></td>
      <td align="right"><font color="#FF0000">*</font>主材超量加价折扣</td>
      <td><input type="text" name="zcclzk" size="8" maxlength="8" value="<%=zcclzk%>">
          <b><font color="#0000FF">（>=0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>需收费主材折扣</td>
      <td><input type="text" name="zcsfzk" size="8" maxlength="8" value="<%=zcsfzk%>">
          <b><font color="#0000FF">（>=0且<=10）</font></b></td>
      <td align="right"><font color="#FF0000">*</font>主材减免折扣</td>
      <td><input type="text" name="zcjmzk" size="8" maxlength="8" value="<%=zcjmzk%>">
          <b><font color="#0000FF">（>=0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>顶配主材折扣</td>
      <td><input type="text" name="ddzccjzk" size="8" maxlength="8" value="<%=ddzccjzk%>">
          <b><font color="#0000FF">（>=0且<=10）</font></b></td>
      <td align="right"><font color="#FF0000">*</font>选配主材折扣</td>
      <td><input type="text" name="ddzcclzk" size="8" maxlength="8" value="<%=ddzcclzk%>">
        <b><font color="#0000FF">（>=0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>套餐外施工项折扣</td>
      <td><input type="text" name="tcwgczk" size="8" maxlength="8" value="<%=tcwgczk%>">
        <b><font color="#0000FF">（>=0且<=10）</font></b></td>
      <td align="right"><font color="#FF0000">*</font>工程超量加价折扣</td>
      <td><input type="text" name="tcgcclzk" size="8" maxlength="8" value="<%=tcgcclzk%>">
        <b><font color="#0000FF">（>=0且<=10）</font></b></td>
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
	if(	javaTrim(FormName.tzjlh)=="") {
		alert("请输入[调整记录号]！");
		FormName.tzjlh.focus();
		return false;
	}

	if(	javaTrim(FormName.bzjgzk)=="") {
		alert("请输入[套餐标准价格折扣]！");
		FormName.bzjgzk.focus();
		return false;
	}
	if(!(isFloat(FormName.bzjgzk, "套餐标准价格折扣"))) {
		return false;
	}
	if (FormName.bzjgzk.value<0 || FormName.bzjgzk.value>10)
	{
		alert("错误！[套餐标准价格折扣]应该在0和10之间！");
		FormName.bzjgzk.select();
		return false;
	}
	if(	javaTrim(FormName.mjzjzk)=="") {
		alert("请输入[面积增加金额折扣]！");
		FormName.bzjgzk.focus();
		return false;
	}
	if(!(isFloat(FormName.mjzjzk, "面积增加金额折扣"))) {
		return false;
	}
	if (FormName.mjzjzk.value<0 || FormName.mjzjzk.value>10)
	{
		alert("错误！[面积增加金额折扣]应该在0和10之间！");
		FormName.mjzjzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcsjzk)=="") {
		alert("请输入[主材升级差价折扣]！");
		FormName.zcsjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcsjzk, "主材升级差价折扣"))) {
		return false;
	}
	if (FormName.zcsjzk.value<0 || FormName.zcsjzk.value>10)
	{
		alert("错误！[主材升级差价折扣]应该在0和10之间！");
		FormName.zcsjzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcclzk)=="") {
		alert("请输入[主材超量加价折扣]！");
		FormName.zcclzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcclzk, "主材超量加价折扣"))) {
		return false;
	}
	if (FormName.zcclzk.value<0 || FormName.zcclzk.value>10)
	{
		alert("错误！[主材超量加价折扣]应该在0和10之间！");
		FormName.zcclzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcsfzk)=="") {
		alert("请输入[需收费主材折扣]！");
		FormName.zcsfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcsfzk, "需收费主材折扣"))) {
		return false;
	}
	if (FormName.zcsfzk.value<0 || FormName.zcsfzk.value>10)
	{
		alert("错误！[需收费主材折扣]应该在0和10之间！");
		FormName.zcsfzk.select();
		return false;
	}
	if(	javaTrim(FormName.zcjmzk)=="") {
		alert("请输入[主材减免折扣]！");
		FormName.zcjmzk.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjmzk, "主材减免折扣"))) {
		return false;
	}
	if (FormName.zcjmzk.value<0 || FormName.zcjmzk.value>10)
	{
		alert("错误！[主材减免折扣]应该在0和10之间！");
		FormName.zcjmzk.select();
		return false;
	}
	if(	javaTrim(FormName.ddzccjzk)=="") {
		alert("请输入[顶配主材折扣]！");
		FormName.ddzccjzk.focus();
		return false;
	}
	if(!(isFloat(FormName.ddzccjzk, "顶配主材折扣"))) {
		return false;
	}
	if (FormName.ddzccjzk.value<0 || FormName.ddzccjzk.value>10)
	{
		alert("错误！[顶配主材折扣]应该在0和10之间！");
		FormName.ddzccjzk.select();
		return false;
	}
	
	if(	javaTrim(FormName.ddzcclzk)=="") {
		alert("请输入[选配主材折扣]！");
		FormName.ddzcclzk.focus();
		return false;
	}
	if(!(isFloat(FormName.ddzcclzk, "选配主材折扣"))) {
		return false;
	}
	if (FormName.ddzcclzk.value<0 || FormName.ddzcclzk.value>10)
	{
		alert("错误！[选配主材折扣]应该在0和10之间！");
		FormName.ddzcclzk.select();
		return false;
	}

	if(	javaTrim(FormName.tcwgczk)=="") {
		alert("请输入[套餐外施工项折扣]！");
		FormName.tcwgczk.focus();
		return false;
	}
	if(!(isFloat(FormName.tcwgczk, "套餐外施工项折扣"))) {
		return false;
	}
	if (FormName.tcwgczk.value<0 || FormName.tcwgczk.value>10)
	{
		alert("错误！[套餐外施工项折扣]应该在0和10之间！");
		FormName.tcwgczk.select();
		return false;
	}

	if(	javaTrim(FormName.tcgcclzk)=="") {
		alert("请输入[工程超量加价折扣]！");
		FormName.tcgcclzk.focus();
		return false;
	}
	if(!(isFloat(FormName.tcgcclzk, "工程超量加价折扣"))) {
		return false;
	}
	if (FormName.tcgcclzk.value<0 || FormName.tcgcclzk.value>10)
	{
		alert("错误！[工程超量加价折扣]应该在0和10之间！");
		FormName.tcgcclzk.select();
		return false;
	}
	FormName.action="SaveInsertCrm_tctzk.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
