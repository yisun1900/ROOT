<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
double dzsjftcbl=0;
double dzzxftcbl=0;
double wyzxftcbl=0;
double khjlsjftcbl=0;
double khjlzxftcbl=0;
double sjssjftcbl=0;
double sjszxftcbl=0;
double sjsycftcbl=0;
double zjzxftcbl=0;
double zjycftcbl=0;
double xqzgzxftcbl=0;
double xqzzzxftcbl=0;
double xqzyzxftcbl=0;
double wlyxzgzxftcbl=0;
double yxzyzxftcbl=0;
double wzchzxftcbl=0;
double wysjzxftcbl=0;
double wzcxyzxftcbl=0;
double dhzyzxftcbl=0;
double wztgyzxftcbl=0;
double sjzxftcbl=0;
double clyzxftcbl=0;
String lrr=null;
String lrsj=null;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,dzsjftcbl,dzzxftcbl,wyzxftcbl,khjlsjftcbl,khjlzxftcbl,sjssjftcbl,sjszxftcbl,sjsycftcbl,zjzxftcbl,zjycftcbl,xqzgzxftcbl,xqzzzxftcbl,xqzyzxftcbl,wlyxzgzxftcbl,yxzyzxftcbl,wzchzxftcbl,wysjzxftcbl,wzcxyzxftcbl,dhzyzxftcbl,wztgyzxftcbl,sjzxftcbl,clyzxftcbl,lrr,lrsj ";
	ls_sql+=" from  cw_jrtcbl";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dzsjftcbl=rs.getDouble("dzsjftcbl");
		dzzxftcbl=rs.getDouble("dzzxftcbl");
		wyzxftcbl=rs.getDouble("wyzxftcbl");
		khjlsjftcbl=rs.getDouble("khjlsjftcbl");
		khjlzxftcbl=rs.getDouble("khjlzxftcbl");
		sjssjftcbl=rs.getDouble("sjssjftcbl");
		sjszxftcbl=rs.getDouble("sjszxftcbl");
		sjsycftcbl=rs.getDouble("sjsycftcbl");
		zjzxftcbl=rs.getDouble("zjzxftcbl");
		zjycftcbl=rs.getDouble("zjycftcbl");
		xqzgzxftcbl=rs.getDouble("xqzgzxftcbl");
		xqzzzxftcbl=rs.getDouble("xqzzzxftcbl");
		xqzyzxftcbl=rs.getDouble("xqzyzxftcbl");
		wlyxzgzxftcbl=rs.getDouble("wlyxzgzxftcbl");
		yxzyzxftcbl=rs.getDouble("yxzyzxftcbl");
		wzchzxftcbl=rs.getDouble("wzchzxftcbl");
		wysjzxftcbl=rs.getDouble("wysjzxftcbl");
		wzcxyzxftcbl=rs.getDouble("wzcxyzxftcbl");
		dhzyzxftcbl=rs.getDouble("dhzyzxftcbl");
		wztgyzxftcbl=rs.getDouble("wztgyzxftcbl");
		sjzxftcbl=rs.getDouble("sjzxftcbl");
		clyzxftcbl=rs.getDouble("clyzxftcbl");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
<form method="post" action="SaveEditCw_jrtcbl.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">分公司</td> 
  <td width="28%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx",fgsbh);
%>
    </select>  </td>
  <td align="right" width="22%">&nbsp;</td> 
  <td width="28%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">店长设计费提成比例</td>
  <td><input type="text" name="dzsjftcbl" size="10" maxlength="17"  value="<%=dzsjftcbl%>" >
    %</td>
  <td align="right">店长装修费提成比例</td>
  <td><input type="text" name="dzzxftcbl" size="10" maxlength="17"  value="<%=dzzxftcbl%>" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">文员装修费提成比例</td> 
  <td width="28%"><input type="text" name="wyzxftcbl" size="10" maxlength="17"  value="<%=wyzxftcbl%>" >
    %</td>
  <td align="right" width="22%">&nbsp;</td> 
  <td width="28%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">业务员设计费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="khjlsjftcbl" size="10" maxlength="17"  value="<%=khjlsjftcbl%>" >
    % </td>
  <td align="right" width="22%">业务员装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="khjlzxftcbl" size="10" maxlength="17"  value="<%=khjlzxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">设计师设计费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="sjssjftcbl" size="10" maxlength="17"  value="<%=sjssjftcbl%>" >
    % </td>
  <td align="right" width="22%">设计师装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="sjszxftcbl" size="10" maxlength="17"  value="<%=sjszxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">设计师远程费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="sjsycftcbl" size="10" maxlength="17"  value="<%=sjsycftcbl%>" >
    % </td>
  <td align="right" width="22%">&nbsp;</td> 
  <td width="28%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">客户经理装修费提成比例</td>
  <td><input type="text" name="zjzxftcbl" size="10" maxlength="17"  value="<%=zjzxftcbl%>" >
% </td>
  <td align="right">客户经理远程费提成比例</td>
  <td><input type="text" name="zjycftcbl" size="10" maxlength="17"  value="<%=zjycftcbl%>" >
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">材料员装修费提成比例</td> 
  <td width="28%"><input type="text" name="clyzxftcbl" size="10" maxlength="17"  value="<%=clyzxftcbl%>" >
%</td>
  <td align="right" width="22%">小区主管装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="xqzgzxftcbl" size="10" maxlength="17"  value="<%=xqzgzxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">小区组长装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="xqzzzxftcbl" size="10" maxlength="17"  value="<%=xqzzzxftcbl%>" >
    % </td>
  <td align="right" width="22%">小区专员装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="xqzyzxftcbl" size="10" maxlength="17"  value="<%=xqzyzxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">网络营销主管装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="wlyxzgzxftcbl" size="10" maxlength="17"  value="<%=wlyxzgzxftcbl%>" >
    % </td>
  <td align="right" width="22%">营销专员装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="yxzyzxftcbl" size="10" maxlength="17"  value="<%=yxzyzxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">网站策划装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="wzchzxftcbl" size="10" maxlength="17"  value="<%=wzchzxftcbl%>" >
    % </td>
  <td align="right" width="22%">网页设计装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="wysjzxftcbl" size="10" maxlength="17"  value="<%=wysjzxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">网站程序员装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="wzcxyzxftcbl" size="10" maxlength="17"  value="<%=wzcxyzxftcbl%>" >
    % </td>
  <td align="right" width="22%">电话专员装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="dhzyzxftcbl" size="10" maxlength="17"  value="<%=dhzyzxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">网站推广员装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="wztgyzxftcbl" size="10" maxlength="17"  value="<%=wztgyzxftcbl%>" >
    % </td>
  <td align="right" width="22%">司机装修费提成比例</td> 
  <td width="28%"> 
    <input type="text" name="sjzxftcbl" size="10" maxlength="17"  value="<%=sjzxftcbl%>" >
    % </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">录入人</td> 
  <td width="28%"><input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" ></td>
  <td align="right" width="22%">录入时间 </td>
  <td width="28%"><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" ></td>
</tr>
<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dzsjftcbl)=="") {
		alert("请输入[店长设计费提成比例]！");
		FormName.dzsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzsjftcbl, "店长设计费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.dzzxftcbl)=="") {
		alert("请输入[店长装修费提成比例]！");
		FormName.dzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzzxftcbl, "店长装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wyzxftcbl)=="") {
		alert("请输入[文员装修费提成比例]！");
		FormName.wyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wyzxftcbl, "文员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlsjftcbl)=="") {
		alert("请输入[业务员设计费提成比例]！");
		FormName.khjlsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlsjftcbl, "业务员设计费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlzxftcbl)=="") {
		alert("请输入[业务员装修费提成比例]！");
		FormName.khjlzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlzxftcbl, "业务员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sjssjftcbl)=="") {
		alert("请输入[设计师设计费提成比例]！");
		FormName.sjssjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjssjftcbl, "设计师设计费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sjszxftcbl)=="") {
		alert("请输入[设计师装修费提成比例]！");
		FormName.sjszxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjszxftcbl, "设计师装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsycftcbl)=="") {
		alert("请输入[设计师远程费提成比例]！");
		FormName.sjsycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsycftcbl, "设计师远程费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zjzxftcbl)=="") {
		alert("请输入[客户经理装修费提成比例]！");
		FormName.zjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjzxftcbl, "客户经理装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zjycftcbl)=="") {
		alert("请输入[客户经理远程费提成比例]！");
		FormName.zjycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjycftcbl, "客户经理远程费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgzxftcbl)=="") {
		alert("请输入[小区主管装修费提成比例]！");
		FormName.xqzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgzxftcbl, "小区主管装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzzxftcbl)=="") {
		alert("请输入[小区组长装修费提成比例]！");
		FormName.xqzzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzzxftcbl, "小区组长装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzyzxftcbl)=="") {
		alert("请输入[小区专员装修费提成比例]！");
		FormName.xqzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzyzxftcbl, "小区专员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgzxftcbl)=="") {
		alert("请输入[网络营销主管装修费提成比例]！");
		FormName.wlyxzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgzxftcbl, "网络营销主管装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.yxzyzxftcbl)=="") {
		alert("请输入[营销专员装修费提成比例]！");
		FormName.yxzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yxzyzxftcbl, "营销专员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wzchzxftcbl)=="") {
		alert("请输入[网站策划装修费提成比例]！");
		FormName.wzchzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzchzxftcbl, "网站策划装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wysjzxftcbl)=="") {
		alert("请输入[网页设计装修费提成比例]！");
		FormName.wysjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wysjzxftcbl, "网页设计装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wzcxyzxftcbl)=="") {
		alert("请输入[网站程序员装修费提成比例]！");
		FormName.wzcxyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcxyzxftcbl, "网站程序员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.dhzyzxftcbl)=="") {
		alert("请输入[电话专员装修费提成比例]！");
		FormName.dhzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dhzyzxftcbl, "电话专员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgyzxftcbl)=="") {
		alert("请输入[网站推广员装修费提成比例]！");
		FormName.wztgyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgyzxftcbl, "网站推广员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzxftcbl)=="") {
		alert("请输入[司机装修费提成比例]！");
		FormName.sjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzxftcbl, "司机装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.clyzxftcbl)=="") {
		alert("请输入[材料员装修费提成比例]！");
		FormName.clyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.clyzxftcbl, "材料员装修费提成比例"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
