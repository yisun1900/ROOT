<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String sjzprs=null;
String sjzpfy=null;
String sjkssj=null;
String sjjssj=null;
String sjzpsj=null;
String zpjglrr=null;
String zpjglsj=null;
String wherezpsqbh=cf.GB2Uni(request.getParameter("zpsqbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sjzprs,sjzpfy,sjkssj,sjjssj,sjzpsj,zpjglrr,zpjglsj ";
	ls_sql+=" from  rs_zpsq";
	ls_sql+=" where  (zpsqbh='"+wherezpsqbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjzprs=cf.fillNull(rs.getString("sjzprs"));
		sjzpfy=cf.fillNull(rs.getString("sjzpfy"));
		sjkssj=cf.fillNull(rs.getDate("sjkssj"));
		sjjssj=cf.fillNull(rs.getDate("sjjssj"));
		sjzpsj=cf.fillNull(rs.getString("sjzpsj"));
		zpjglrr=cf.fillNull(rs.getString("zpjglrr"));
		zpjglsj=cf.fillNull(rs.getDate("zpjglsj"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertWcRs_zpsq.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" style="FONT-SIZE:12" border="1" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">实际招聘人数</td> 
  <td width="35%"> 
    <input type="text" name="sjzprs" size="20" maxlength="8"  value="<%=sjzprs%>" >  </td>
  <td align="right" width="15%">实际招聘费用</td> 
  <td width="35%"> 
    <input type="text" name="sjzpfy" size="20" maxlength="9"  value="<%=sjzpfy%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">实际招聘开始时间</td> 
  <td width="35%"><input type="text" name="sjkssj" size="20" maxlength="10"  value="<%=sjkssj%>" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%">实际招聘结束时间</td> 
  <td width="35%"> 
    <input type="text" name="sjjssj" size="20" maxlength="10"  value="<%=sjjssj%>" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">招聘说明</td> 
  <td width="35%" colspan="3"> 
    <textarea name="sjzpsj" cols="72" rows=""><%=sjzpsj%></textarea>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">结果录入人</span></td> 
  <td width="35%"> 
    <input type="text" name="zpjglrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="15%"><span class="STYLE1">结果录入时间</span></td> 
  <td width="35%"> 
    <input type="text" name="zpjglsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>
<input type="hidden" name="wherezpsqbh"  value="<%=wherezpsqbh%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
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
	if(!(isDatetime(FormName.zpjglsj, "招聘结果录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
