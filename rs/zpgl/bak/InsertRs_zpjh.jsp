<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String zpjhbh=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(substr(zpjhbh,6,3)),0)";
	ls_sql+=" from  rs_zpjh";
	ls_sql+=" where ssfgs='"+ssfgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1)+1;
//		out.print(count);
	}
	rs.close();
	ps.close();

	zpjhbh=ssfgs+cf.addZero(count,3);
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center"><b>招聘计划（招聘计划编号：<%=zpjhbh%>）</b></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">招聘人数</td> 
  <td width="35%"> 
    <input type="text" name="zprs" value="" size="31" maxlength="8" ><font color=red>人</font>
  </td>
  <td align="right" width="15%">招聘费用</td> 
  <td width="35%"> 
    <input type="text" name="zpfy" value="" size="31" maxlength="9" ><font color=red>元</font>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计划申请公司</td> 
  <td width="35%"> 
     <select name="fgs" style="FONT-SIZE:12PX;WIDTH:230PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
      </select>
  </td>
  <td align="right" width="15%">等待审批</td> 
  <td width="35%"> 
    <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:230PX">
		<option value=""></option>
		                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{%> 
		<option value="0150">总裁：等待董事长审批</option>
		<option value="0160">副总裁：等待总裁审核</option>
		<option value="0170">部门总监/总裁助理：等待分管副总裁审核</option>
		<option value="0180">部门经理：等待部门总监审核</option>
		<option value="0190">集团员工：等待部门经理审核</option>
		<option value="0110">总经理：等待人力行政总监审核</option>
		<option value="0120">副总经理/总经理助理：等待大区经理审核</option>
		<option value="0130">部门经理：等待大区经理审核</option>
		<option value="0140">分公司员工：等待人力资源行政经理审核</option>
	<%}
	else{%> 
		<option value="0110">总经理：等待人力行政总监审核</option>
		<option value="0120">副总经理/总经理助理：等待大区经理审核</option>
		<option value="0130">部门经理：等待大区经理审核</option>
		<option value="0140">分公司员工：等待人力资源行政经理审核</option>

	<%}%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计划开始时间</td> 
  <td width="35%"> 
    <input type="text" name="jhkssj" value="" size="31" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%">计划结束时间</td> 
  <td width="35%"> 
    <input type="text" name="jhjssj" value="" size="31" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">录入人</font></td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="31" maxlength="20" readonly>
  </td>
  <td align="right" width="15%"><font color="#0000FF">录入时间</font></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="31" maxlength="10" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%" >备注</td> 
  <td width="35%" colspan="3"> 
     <textarea name="bz" cols="71" rows="2" onKeyUp="keyTo(savebutton)"></textarea>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
    <input name="zpjhbh" type="hidden" value="<%=zpjhbh%>">
    <input name="ssfgs" type="hidden" value="<%=ssfgs%>">
	<input type="button"  value="存盘" onClick="f_do(insertform)" name="savebutton">
	<input type="reset"  value="重输" name="reset">
	<input type="button"  value="录入明细" onClick="f_domx(insertform)" name="lrmxbutton" disabled>
	<input type="button"  value="录入完成" onClick="f_wc(insertform)" name="wcbutton" disabled>
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
	if(	javaTrim(FormName.zprs)=="") {
		alert("请输入[招聘人数]！");
		FormName.zprs.focus();
		return false;
	}
	if(!(isNumber(FormName.zprs, "招聘人数"))) {
		return false;
	}
	if(	javaTrim(FormName.zpfy)=="") {
		alert("请输入[招聘费用]！");
		FormName.zpfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zpfy, "招聘费用"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ztbm)=="") {
		alert("请选择[等待审批]！");
		FormName.ztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jhkssj)=="") {
		alert("请输入[计划开始时间]！");
		FormName.jhkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhkssj, "计划开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jhjssj)=="") {
		alert("请输入[计划结束时间]！");
		FormName.jhjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhjssj, "计划结束时间"))) {
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
	FormName.action="SaveInsertRs_zpjh.jsp";
	FormName.submit();
	FormName.savebutton.disabled=true;
	FormName.reset.disabled=true;
	FormName.lrmxbutton.disabled=false;
	//FormName.wcbutton.disabled=true;
	return true;
}
function f_domx(FormName)//参数FormName:Form的名称
{
	FormName.action="InsertRs_zpjhmx.jsp";
	FormName.submit();
	FormName.wcbutton.disabled=false;
	return true;
}
function f_wc(FormName)//参数FormName:Form的名称
{
	FormName.action="InsertRs_zpjhwc.jsp";
	FormName.submit();
	FormName.lrmxbutton.disabled=true;
	FormName.wcbutton.disabled=true;
	return true;
}
//-->
</SCRIPT>
