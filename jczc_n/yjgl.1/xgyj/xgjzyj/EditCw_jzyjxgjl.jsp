<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String xgsj=null;
String xgr=null;
String zt=null;
String hth=null;
String khxm=null;
String xglx=null;
String yjzrq=null;
String ywdzgce=null;
String yqye=null;
String xjzrq=null;
String xwdzgce=null;
String xqye=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wherexgsj=cf.GB2Uni(request.getParameter("xgsj"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,xgsj,xgr,zt,hth,khxm,xglx,yjzrq,ywdzgce,yqye,xjzrq,xwdzgce,xqye ";
	ls_sql+=" from  cw_jzyjxgjl";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (xgsj=TO_DATE('"+wherexgsj+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		xgsj=cf.fillNull(rs.getDate("xgsj"));
		xgr=cf.fillNull(rs.getString("xgr"));
		zt=cf.fillNull(rs.getString("zt"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xglx=cf.fillNull(rs.getString("xglx"));
		yjzrq=cf.fillNull(rs.getDate("yjzrq"));
		ywdzgce=cf.fillNull(rs.getString("ywdzgce"));
		yqye=cf.fillNull(rs.getString("yqye"));
		xjzrq=cf.fillNull(rs.getDate("xjzrq"));
		xwdzgce=cf.fillNull(rs.getString("xwdzgce"));
		xqye=cf.fillNull(rs.getString("xqye"));
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
<form method="post" action="SaveEditCw_jzyjxgjl.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >
  </td>
  <td align="right" width="15%">修改时间</td> 
  <td width="35%"> 
    <input type="text" name="xgsj" size="20" maxlength="10"  value="<%=xgsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">修改人</td> 
  <td width="35%"> 
    <input type="text" name="xgr" size="20" maxlength="20"  value="<%=xgr%>" >
  </td>
  <td align="right" width="15%">客户类型</td> 
  <td width="35%"> 
    <select name="zt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"2+家装客户&3+退单客户&4+集成客户&5+设计客户",zt);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">合同号</td> 
  <td width="35%"> 
    <input type="text" name="hth" size="20" maxlength="20"  value="<%=hth%>" >
  </td>
  <td align="right" width="15%">客户姓名</td> 
  <td width="35%"> 
    <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">修改类型</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "xglx","1+修改&2+删除&3+增加",xglx);
%>
  </td>
  <td align="right" width="15%">原业绩结转时间</td> 
  <td width="35%"> 
    <input type="text" name="yjzrq" size="20" maxlength="10"  value="<%=yjzrq%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">原合同原报价</td> 
  <td width="35%"> 
    <input type="text" name="ywdzgce" size="20" maxlength="17"  value="<%=ywdzgce%>" >
  </td>
  <td align="right" width="15%">原工程签约额</td> 
  <td width="35%"> 
    <input type="text" name="yqye" size="20" maxlength="17"  value="<%=yqye%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">修改后业绩结转时间</td> 
  <td width="35%"> 
    <input type="text" name="xjzrq" size="20" maxlength="10"  value="<%=xjzrq%>" >
  </td>
  <td align="right" width="15%">修改后合同原报价</td> 
  <td width="35%"> 
    <input type="text" name="xwdzgce" size="20" maxlength="17"  value="<%=xwdzgce%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">修改后工程签约额</td> 
  <td width="35%"> 
    <input type="text" name="xqye" size="20" maxlength="17"  value="<%=xqye%>" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
<input type="hidden" name="wherexgsj"  value="<%=wherexgsj%>" >
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xgsj)=="") {
		alert("请输入[修改时间]！");
		FormName.xgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xgsj, "修改时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xgr)=="") {
		alert("请输入[修改人]！");
		FormName.xgr.focus();
		return false;
	}
	if(	javaTrim(FormName.zt)=="") {
		alert("请选择[客户类型]！");
		FormName.zt.focus();
		return false;
	}
	if(	javaTrim(FormName.hth)=="") {
		alert("请输入[合同号]！");
		FormName.hth.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xglx)) {
		alert("请选择[修改类型]！");
		FormName.xglx[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.yjzrq, "原业绩结转时间"))) {
		return false;
	}
	if(	javaTrim(FormName.ywdzgce)=="") {
		alert("请输入[原合同原报价]！");
		FormName.ywdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.ywdzgce, "原合同原报价"))) {
		return false;
	}
	if(	javaTrim(FormName.yqye)=="") {
		alert("请输入[原工程签约额]！");
		FormName.yqye.focus();
		return false;
	}
	if(!(isFloat(FormName.yqye, "原工程签约额"))) {
		return false;
	}
	if(!(isDatetime(FormName.xjzrq, "修改后业绩结转时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xwdzgce)=="") {
		alert("请输入[修改后合同原报价]！");
		FormName.xwdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.xwdzgce, "修改后合同原报价"))) {
		return false;
	}
	if(	javaTrim(FormName.xqye)=="") {
		alert("请输入[修改后工程签约额]！");
		FormName.xqye.focus();
		return false;
	}
	if(!(isFloat(FormName.xqye, "修改后工程签约额"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
