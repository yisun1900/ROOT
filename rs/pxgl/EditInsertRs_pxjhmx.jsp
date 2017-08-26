<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String pxjhbh=cf.GB2Uni(request.getParameter("wherepxjhbh"));
String pxjhmc=cf.GB2Uni(request.getParameter("pxjhmc"));
String yhmc=(String)session.getAttribute("yhmc");
//String dwbh=cf.executeQuery("select dwbh from cl_clsgd where sgph='"+sgph+"'");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String pxmxbh=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(substr(pxmxbh,9,3)),0)";
	ls_sql+=" from  rs_pxjhmx";
	ls_sql+=" where pxjhbh='"+pxjhbh+"'  ";
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

	pxmxbh=pxjhbh+cf.addZero(count,3);
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
<div align="center"><b>培训计划明细（<%=pxjhmc%>：<%=pxmxbh%>）</b></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>培训人数</td> 
  <td width="35%"> 
    <input type="text" name="pxrs" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%"><font color=red>*</font>培训费用</td> 
  <td width="35%"> 
    <input type="text" name="pxfy" value="" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>培训类型</td> 
  <td width="35%"> 
   内训<INPUT TYPE="radio" NAME="pxlx" value="0">
   外训<INPUT TYPE="radio" NAME="pxlx" value="1">
  </td>
  <td align="right" width="15%">培训讲师</td> 
  <td width="35%"> 
    <input type="text" name="pxjs" value="" size="20" maxlength="40" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>授课形式</td> 
  <td width="35%"> 
    <select name="skxs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
	<%
	cf.selectItem(out,"select skxs,skxsmc from rs_pxskxsbm order by skxs","");
	%> 
    </select>
  </td>
  <td align="right" width="15%"><font color=red>*</font>课程类型</td> 
  <td width="35%"> 
    <select name="kclx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
	<%
	cf.selectItem(out,"select kclx,lxmc  from rs_pxkclxbm order by kclx","");
	%> 
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">培训场地</td> 
  <td width="35%"> 
    <input type="text" name="pxcd" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%"><font color=red>*</font>高层人数</td> 
  <td width="35%"> 
    <input type="text" name="gcrs" value="0" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>中层人数</td> 
  <td width="35%"> 
    <input type="text" name="zcrs" value="0" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%"><font color=red>*</font>基层人数</td> 
  <td width="35%"> 
    <input type="text" name="jcrs" value="0" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>培训开始时间</td> 
  <td width="35%"> 
    <input type="text" name="pxkssj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%"><font color=red>*</font>培训结束时间</td> 
  <td width="35%"> 
    <input type="text" name="pxjssj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=blue>录入人</font></td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
  </td>
  <td align="right" width="15%"><font color=blue>录入时间</font></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">课程内容</td> 
  <td width="35%" colspan="3"> 
    <textarea name="kcnr" cols="71" rows=""></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">培训课程</td> 
  <td width="35%" colspan="3"> 
    <textarea name="pxkc" cols="71" rows=""></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="71" rows=""></textarea>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4">
	<input name="pxjhbh" type="hidden" value="<%=pxjhbh%>">
    <input name="pxmxbh" type="hidden" value="<%=pxmxbh%>">
	<input type="button"  value="存盘" onClick="f_do(insertform)" name="savebutton">
	<input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.pxrs)=="") {
		alert("请输入[培训人数]！");
		FormName.pxrs.focus();
		return false;
	}
	if(!(isNumber(FormName.pxrs, "培训人数"))) {
		return false;
	}
	if(	javaTrim(FormName.pxfy)=="") {
		alert("请输入[培训费用]！");
		FormName.pxfy.focus();
		return false;
	}
	if(!(isFloat(FormName.pxfy, "培训费用"))) {
		return false;
	}
	if(	!radioChecked(FormName.pxlx)) {
		alert("请选择[培训类型]！");
		FormName.pxlx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.skxs)=="") {
		alert("请选择[授课形式]！");
		FormName.skxs.focus();
		return false;
	}
	if(	javaTrim(FormName.kclx)=="") {
		alert("请选择[课程类型]！");
		FormName.kclx.focus();
		return false;
	}
	if(	javaTrim(FormName.gcrs)=="") {
		alert("请输入[高层人数]！");
		FormName.gcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.gcrs, "高层人数"))) {
		return false;
	}
	if(	javaTrim(FormName.zcrs)=="") {
		alert("请输入[中层人数]！");
		FormName.zcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.zcrs, "中层人数"))) {
		return false;
	}
	if(	javaTrim(FormName.jcrs)=="") {
		alert("请输入[基层人数]！");
		FormName.jcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.jcrs, "基层人数"))) {
		return false;
	}
	if(	javaTrim(FormName.pxkssj)=="") {
		alert("请输入[培训开始时间]！");
		FormName.pxkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pxkssj, "培训开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.pxjssj)=="") {
		alert("请输入[培训结束时间]！");
		FormName.pxjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pxjssj, "培训结束时间"))) {
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
	FormName.action="SaveInsertRs_pxjhmx.jsp";
	FormName.submit();
	FormName.savebutton.disabled=true;
	return true;
}
//-->
</SCRIPT>
