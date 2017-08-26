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
.STYLE1 {color: #CC0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String lrr=(String)session.getAttribute("yhmc");

String yhmc=null;
String xb=null;
String fgsbh=null;
String dwbh=null;
String xzzwbm=null;
String rzsj=null;
String lzrq=null;
String lzyy=null;
String bianhao=null;
String sfzh=null;

String ygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String sqxh=null;

try {
	conn=cf.getConnection();

	ls_sql="select yhmc,xb,ssfgs,dwbh,xzzwbm,rzsj,lzrq,lzyy,bianhao,sfzh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xb=cf.fillNull(rs.getString("xb"));
		fgsbh=cf.fillNull(rs.getString("ssfgs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		lzrq=cf.fillNull(rs.getDate("lzrq"));
		lzyy=cf.fillNull(rs.getString("lzyy"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(sqxh,6,5)),0)";
	ls_sql+=" from  rs_czsq";
	ls_sql+=" where fgsbh='"+fgsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	sqxh=fgsbh+cf.addZero(count+1,5);

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


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_yggzbg.jsp" name="insertform" target="_blank">
<div align="center"><strong>员工工作报告（员工序号：<%=ygbh%>）</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>报告时间起点</td>
  <td><input type="text" name="sjqd" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right"><span class="STYLE1">*</span>报告时间终点</td>
  <td><input type="text" name="sjzd" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">姓名</span></td> 
  <td width="35%"><input type="text" name="xm" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">职务</span></td> 
  <td width="35%">
	<input type="text" name="xzzwbm" value="<%=xzzwbm%>" size="20" maxlength="20" readonly>  
	</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">所属分公司</span></td> 
  <td width="35%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"' ","");
%>
  </select></td>
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">所属部门</span></td> 
  <td width="35%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">工作说明</span></td> 
  <td colspan="3"><textarea name="gzsm" cols="72" rows="20"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	    <input type="hidden" name="ygbh" value="<%=ygbh%>" >
	    <input type="button"  value="存盘" onClick="f_do(insertform)">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[员工序号]！");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
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
