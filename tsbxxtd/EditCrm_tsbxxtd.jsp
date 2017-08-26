<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tsjlh=null;
String xtdxh=null;
String khbh=null;
String xtyy=null;
String xtrq=null;
String xtfgs=null;
String xtbm=null;
String xtr=null;
String xtfy=null;
String lrr=null;
String lrsj=null;
String lrrbm=null;
String bz=null;
String wheretsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String wherextdxh=cf.GB2Uni(request.getParameter("xtdxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tsjlh,xtdxh,khbh,xtyy,xtrq,xtfgs,xtbm,xtr,xtfy,lrr,lrsj,lrrbm,bz ";
	ls_sql+=" from  crm_tsbxxtd";
	ls_sql+=" where  (tsjlh='"+wheretsjlh+"') and  (xtdxh="+wherextdxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		xtdxh=cf.fillNull(rs.getString("xtdxh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		xtyy=cf.fillNull(rs.getString("xtyy"));
		xtrq=cf.fillNull(rs.getDate("xtrq"));
		xtfgs=cf.fillNull(rs.getString("xtfgs"));
		xtbm=cf.fillNull(rs.getString("xtbm"));
		xtr=cf.fillNull(rs.getString("xtr"));
		xtfy=cf.fillNull(rs.getString("xtfy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrrbm=cf.fillNull(rs.getString("lrrbm"));
		bz=cf.fillNull(rs.getString("bz"));
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
<form method="post" action="SaveEditCrm_tsbxxtd.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">投诉报修记录号</td> 
  <td width="35%"> 
    <input type="text" name="tsjlh" value="<%=wheretsjlh%>" size="20" maxlength="9" readonly>
	<input type="hidden" name="xtdxh" value="<%=xtdxh%>"  readonly></td>
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#FF0033">*</font>协调原因</td> 
  <td colspan="3">
  <textarea name="xtyy" cols="72" rows="5"><%=xtyy%></textarea>
</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#FF0033">*</font>协调日期</td> 
  <td width="35%"> 
    <input type="text" name="xtrq" value="<%=xtrq%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="15%"><font color="#FF0033">*</font>协调费用</td> 
  <td width="35%"><input type="text" name="xtfy" value="<%=xtfy%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#FF0033">*</font>协调分公司</td> 
  <td width="35%">
  <select name="xtfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(editform);" >
   <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in ('A0','F0') ",xtfgs);
%> 
</select> </td>
  <td align="right" width="15%"><font color="#FF0033">*</font>协调部门</td> 
  <td width="35%">
  <select name="xtbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
<option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' ",xtbm);
%> 
</select> </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(editform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.xtbm.length=1;

	if (FormName.xtfgs.value=="")
	{
		return;
	}

//	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('F1','F2') and ssdw='"+FormName.xtfgs.value+"' order by dwbh";
	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+FormName.xtfgs.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}
function getAjax(ajaxRetStr) 
{
	strToSelect(editform.xtbm,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("请输入[投诉报修记录号]！");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xtyy)=="") {
		alert("请输入[协调原因]！");
		FormName.xtyy.focus();
		return false;
	}
	if(	javaTrim(FormName.xtrq)=="") {
		alert("请输入[协调日期]！");
		FormName.xtrq.focus();
		return false;
	}
	if(	javaTrim(FormName.xtfgs)=="") {
		alert("请输入[协调分公司]！");
		FormName.xtfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.xtbm)=="") {
		alert("请输入[协调部门]！");
		FormName.xtbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xtfy)=="") {
		alert("请输入[协调费用]！");
		FormName.xtfy.focus();
		return false;
	}
	if(!(isDatetime(FormName.xtrq, "协调日期"))) {
		return false;
	}
	if(!(isFloat(FormName.xtfy, "协调费用"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
