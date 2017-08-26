<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sjzprs=null;
String sjzpfy=null;
String sjkssj=null;
String sjjssj=null;
String bz=null;
String wherezpjhbh=cf.GB2Uni(request.getParameter("zpjhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sjzprs,sjzpfy,sjkssj,sjjssj,bz ";
	ls_sql+=" from  rs_zpjhjg";
	ls_sql+=" where  (zpjhbh='"+wherezpjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjzprs=cf.fillNull(rs.getString("sjzprs"));
		sjzpfy=cf.fillNull(rs.getString("sjzpfy"));
		sjkssj=cf.fillNull(rs.getDate("sjkssj"));
		sjjssj=cf.fillNull(rs.getDate("sjjssj"));
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
<form method="post" action="SaveEditRs_zpjhjg.jsp" name="editform">
<div align="center">请修改招聘结果</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">实际招聘人数</td> 
  <td width="35%"> 
    <input type="text" name="sjzprs" size="20" maxlength="8"  value="<%=sjzprs%>" >
  </td>
  <td align="right" width="15%">实际招聘费用</td> 
  <td width="35%"> 
    <input type="text" name="sjzpfy" size="20" maxlength="9"  value="<%=sjzpfy%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">实际招聘开始时间</td> 
  <td width="35%"> 
    <input type="text" name="sjkssj" size="20" maxlength="10"  value="<%=sjkssj%>" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%">实际招聘结束时间</td> 
  <td width="35%"> 
    <input type="text" name="sjjssj" size="20" maxlength="10"  value="<%=sjjssj%>" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="71" rows=""><%=bz%></textarea>
  </td>
</tr>
<input type="hidden" name="wherezpjhbh"  value="<%=wherezpjhbh%>" >
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjzprs)=="") {
		alert("请输入[实际招聘人数]！");
		FormName.sjzprs.focus();
		return false;
	}
	if(!(isNumber(FormName.sjzprs, "实际招聘人数"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzpfy)=="") {
		alert("请输入[实际招聘费用]！");
		FormName.sjzpfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzpfy, "实际招聘费用"))) {
		return false;
	}
	if(	javaTrim(FormName.sjkssj)=="") {
		alert("请输入[实际招聘开始时间]！");
		FormName.sjkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjkssj, "实际招聘开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.sjjssj)=="") {
		alert("请输入[实际招聘结束时间]！");
		FormName.sjjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjssj, "实际招聘结束时间"))) {
		return false;
	}
	if(	javaTrim(FormName.bz)=="") {
		alert("请输入[备注]！");
		FormName.bz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
