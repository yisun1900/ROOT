<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ygbh=null;
String sjqd=null;
String sjzd=null;
String xm=null;
String xzzwbm=null;
String ssfgs=null;
String dwbh=null;
String gzsm=null;
String lrr=null;
String lrsj=null;
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
String wheresjqd=cf.GB2Uni(request.getParameter("sjqd"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ygbh,sjqd,sjzd,xm,xzzwbm,ssfgs,dwbh,gzsm,lrr,lrsj ";
	ls_sql+=" from  rs_yggzbg";
	ls_sql+=" where  (ygbh="+whereygbh+") and  (sjqd=TO_DATE('"+wheresjqd+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		sjqd=cf.fillNull(rs.getDate("sjqd"));
		sjzd=cf.fillNull(rs.getDate("sjzd"));
		xm=cf.fillNull(rs.getString("xm"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		gzsm=cf.fillNull(rs.getString("gzsm"));
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
.STYLE1 {color: #0000CC}
.STYLE2 {color: #CC0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_yggzbg.jsp" name="editform">
<div align="center"><strong>修改员工工作报告（员工序号：<%=ygbh%>）</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE2">*</span>报告时间起点</td> 
  <td width="35%"><input type="text" name="sjqd" size="20" maxlength="10"  value="<%=sjqd%>" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%"><span class="STYLE2">*</span>报告时间终点</td> 
  <td width="35%"><input type="text" name="sjzd" size="20" maxlength="10"  value="<%=sjzd%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1"><span class="STYLE2">*</span>姓名</span></td> 
  <td width="35%"><input type="text" name="xm" size="20" maxlength="20"  value="<%=xm%>" readonly></td>
  <td align="right" width="15%"><span class="STYLE1"><span class="STYLE2">*</span>职务</span></td> 
  <td width="35%"><input type="text" name="xzzwbm2" value="<%=xzzwbm%>" size="20" maxlength="20" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1"><span class="STYLE2">*</span>所属分公司</span></td> 
  <td width="35%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' ","");
%>
  </select></td>
  <td align="right" width="15%"><span class="STYLE1"><span class="STYLE2">*</span>所属部门</span></td> 
  <td width="35%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE2">*</span>工作说明</td> 
  <td colspan="3"><textarea name="gzsm" cols="72" rows="20"><%=gzsm%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1"><span class="STYLE2">*</span>录入人</span></td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>  </td>
  <td align="right" width="15%"><span class="STYLE1"><span class="STYLE2">*</span>录入时间</span></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>  </td>
</tr>
<input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
<input type="hidden" name="wheresjqd"  value="<%=wheresjqd%>" >
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
	if(	javaTrim(FormName.sjqd)=="") {
		alert("请输入[报告时间起点]！");
		FormName.sjqd.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjqd, "报告时间起点"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzd)=="") {
		alert("请输入[报告时间终点]！");
		FormName.sjzd.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjzd, "报告时间终点"))) {
		return false;
	}
	if(	javaTrim(FormName.xm)=="") {
		alert("请输入[姓名]！");
		FormName.xm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[所属部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gzsm)=="") {
		alert("请输入[工作说明]！");
		FormName.gzsm.focus();
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
