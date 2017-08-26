<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khzq=null;
String fgsbh=null;
String khqssj=null;
String khjzsj=null;
double qqts=0;
String wherekhzq=cf.GB2Uni(request.getParameter("khzq"));
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khzq,fgsbh,khqssj,khjzsj,qqts ";
	ls_sql+=" from  cw_jrkhzq";
	ls_sql+=" where  (khzq='"+wherekhzq+"') and  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khzq=cf.fillNull(rs.getString("khzq"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khqssj=cf.fillNull(rs.getDate("khqssj"));
		khjzsj=cf.fillNull(rs.getDate("khjzsj"));
		qqts=rs.getDouble("qqts");
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_jrkhzq.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>考核周期</td> 
  <td width="32%"> 
    <input type="text" name="khzq" size="20" maxlength="6"  value="<%=khzq%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",fgsbh);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>考核起始时间</td> 
  <td width="32%"> 
    <input type="text" name="khqssj" size="20" maxlength="10"  value="<%=khqssj%>" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>考核截至时间</td> 
  <td width="32%"> 
    <input type="text" name="khjzsj" size="20" maxlength="10"  value="<%=khjzsj%>" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>全勤天数</td>
  <td><input type="text" name="qqts" value="<%=qqts%>" size="20" maxlength="10"  ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wherekhzq"  value="<%=wherekhzq%>" >
		<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
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
	if(	javaTrim(FormName.khzq)=="") {
		alert("请输入[考核周期]！");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khqssj)=="") {
		alert("请输入[考核起始时间]！");
		FormName.khqssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.khqssj, "考核起始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.khjzsj)=="") {
		alert("请输入[考核截至时间]！");
		FormName.khjzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.khjzsj, "考核截至时间"))) {
		return false;
	}

	if(	javaTrim(FormName.qqts)=="") {
		alert("请输入[全勤天数]！");
		FormName.qqts.focus();
		return false;
	}
	if(!(isFloat(FormName.qqts, "全勤天数"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
