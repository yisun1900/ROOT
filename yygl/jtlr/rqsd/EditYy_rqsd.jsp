<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String yy_rqsd_szs=null;
String yy_rqsd_sze=null;
String yy_rqsd_bzs=null;
String yy_rqsd_bze=null;
String lrr=null;
String lrsj=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze,lrr,lrsj ";
	ls_sql+=" from  yy_rqsd";
	ls_sql+=" where  (zqs="+wherezqs+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		yy_rqsd_szs=cf.fillNull(rs.getDate("yy_rqsd_szs"));
		yy_rqsd_sze=cf.fillNull(rs.getDate("yy_rqsd_sze"));
		yy_rqsd_bzs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
		yy_rqsd_bze=cf.fillNull(rs.getDate("yy_rqsd_bze"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditYy_rqsd.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>周期数</td> 
  <td width="32%"> 
    <input type="text" name="zqs" size="20" maxlength="8"  value="<%=zqs%>" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>上周日期开始</td>
  <td><input type="text" name="yy_rqsd_szs" size="20" maxlength="10"  value="<%=yy_rqsd_szs%>" onDblClick="JSCalendar(this)"></td>
  <td align="right"><span class="STYLE1">*</span>上周日期结束</td>
  <td><input type="text" name="yy_rqsd_sze" size="20" maxlength="10"  value="<%=yy_rqsd_sze%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>本周日期开始</td> 
  <td width="32%"><input type="text" name="yy_rqsd_bzs" size="20" maxlength="10"  value="<%=yy_rqsd_bzs%>" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>本周日期结束</td> 
  <td width="32%"><input type="text" name="yy_rqsd_bze" size="20" maxlength="10"  value="<%=yy_rqsd_bze%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="32%"><input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="32%"><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly></td>
</tr>

<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zqs)=="") {
		alert("请输入[周期数]！");
		FormName.zqs.focus();
		return false;
	}
	if(!(isNumber(FormName.zqs, "周期数"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_rqsd_szs)=="") {
		alert("请输入[上周日期开始]！");
		FormName.yy_rqsd_szs.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_szs, "上周日期开始"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_rqsd_sze)=="") {
		alert("请输入[上周日期结束]！");
		FormName.yy_rqsd_sze.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_sze, "上周日期结束"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_rqsd_bzs)=="") {
		alert("请输入[本周日期开始]！");
		FormName.yy_rqsd_bzs.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_bzs, "本周日期开始"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_rqsd_bze)=="") {
		alert("请输入[本周日期结束]！");
		FormName.yy_rqsd_bze.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_bze, "本周日期结束"))) {
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
