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
String pxjhbh=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(substr(pxjhbh,6,3)),0)";
	ls_sql+=" from  rs_pxjh";
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

	pxjhbh=ssfgs+cf.addZero(count,3);
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
<div align="center"><b>培训计划（培训计划编号：<%=pxjhbh%>）</b></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>培训计划名称</td> 
  <td width="35%"> 
    <input type="text" name="pxjhmc" value="" size="24" maxlength="50" >
  </td>
  <td align="right" width="15%"><font color=red>*</font>计划申请公司</td> 
  <td width="35%"> 
     <select name="fgs" style="FONT-SIZE:12PX;WIDTH:180PX" >
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
</tr>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>等待审批</td> 
  <td width="35%"> 
    <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:180PX">
		<option value=""></option>
		                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{%> 
		<option value="0210">计划内：等待分公司总经理审批</option>
		<option value="0220">计划外：等待分公司总经理审核</option>
	<%}
	else{%> 
		<option value="0210">计划内：等待分公司总经理审批</option>
		<option value="0220">计划外：等待分公司总经理审核</option>
	<%}%>
    </select>
  </td>
  	<td align="right" width="15%"><font color=red>*</font>是否计划内</td> 
	<td width="31%"> 
	<input type="radio" name="sfjhn"  value="0" >
	计划内 
	<input type="radio" name="sfjhn"  value="1" >
	计划外 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">录入人</font></td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="24" maxlength="20" readonly>
  </td>
  <td align="right" width="15%"><font color="#0000FF">录入时间</font></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="24" maxlength="10" readonly>
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
    <input name="pxjhbh" type="hidden" value="<%=pxjhbh%>">
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

	if(	javaTrim(FormName.pxjhmc)=="") {
		alert("请输入[培训名称]！");
		FormName.pxjhmc.focus();
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

	if(	!radioChecked(FormName.sfjhn)) {
		alert("请选择[是否计划内]！");
		FormName.sfjhn[0].focus();
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
	FormName.action="SaveInsertRs_pxjh.jsp";
	FormName.submit();
	FormName.savebutton.disabled=true;
	FormName.reset.disabled=true;
	FormName.lrmxbutton.disabled=false;
	//FormName.wcbutton.disabled=true;
	return true;
}
function f_domx(FormName)//参数FormName:Form的名称
{
	FormName.action="InsertRs_pxjhmx.jsp";
	FormName.submit();
	FormName.wcbutton.disabled=false;
	return true;
}
function f_wc(FormName)//参数FormName:Form的名称
{
	FormName.action="InsertRs_pxjhwc.jsp";
	FormName.submit();
	FormName.lrmxbutton.disabled=true;
	FormName.wcbutton.disabled=true;
	return true;
}
//-->
</SCRIPT>
