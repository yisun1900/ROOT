<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String sgd=cf.GB2Uni(request.getParameter("sgd"));

String ssfgs=null;
String jlh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select ssfgs";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString(1);
	}
	rs.close();
	ps.close();



	int count=0;
	ls_sql="select NVL(max(substr(jlh,6,3)),0)";
	ls_sql+=" from  cw_fllyjl";
	ls_sql+=" where sgd='"+sgd+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jlh=sgd+cf.addZero(count+1,3);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">辅料领用记录</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">记录号</td>
	<td  width="5%">施工队</td>
	<td  width="7%">数量</td>
	<td  width="8%">金额</td>
	<td  width="6%">办理人</td>
	<td  width="8%">办理时间</td>
	<td  width="6%">录入人</td>
	<td  width="6%">结算标志</td>
	<td  width="6%">删除标志</td>
	<td  width="44%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_fllyjl.jlh,sq_sgd.sgdmc,cw_fllyjl.zsl,cw_fllyjl.zje,cw_fllyjl.jkblr,cw_fllyjl.jkblsj,cw_fllyjl.lrr, DECODE(cw_fllyjl.jsbz,'0','未结算','1','已结算'), DECODE(cw_fllyjl.scbz,'N','未删除','Y','删除'),cw_fllyjl.bz  ";
	ls_sql+=" FROM cw_fllyjl,sq_sgd  ";
    ls_sql+=" where cw_fllyjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_fllyjl.sgd='"+sgd+"'";
    ls_sql+=" order by cw_fllyjl.lrsj desc";
    pageObj.sql=ls_sql;
	pageObj.initPage("cw_fllyjlCxList.jsp","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">记录号</span></td> 
  <td width="32%"> 
    <input type="text" name="jlh" value="<%=jlh%>" size="20" maxlength="10" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">施工队</span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
    </select></td>
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">分公司</span></td>
    <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
      <%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">总数量</span></td> 
  <td width="32%"> 
    <input type="text" name="zsl" value="0" size="20" maxlength="17"  onchange="getJe(insertform)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">总金额</span></td> 
  <td width="32%"> 
    <input type="text" name="zje" value="0" size="20" maxlength="17" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>办理人</td> 
  <td width="32%"> 
    <input type="text" name="jkblr" value="<%=yhmc%>" size="20" maxlength="20" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>办理时间</td> 
  <td width="32%"> 
    <input type="text" name="jkblsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input name="lrmx" type="button" onClick="f_lrmx(insertform)"  value="录入明细" disabled>
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
	if(	javaTrim(FormName.jlh)=="") {
		alert("请输入[记录号]！");
		FormName.jlh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.zsl)=="") {
		alert("请输入[总数量]！");
		FormName.zsl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsl, "总数量"))) {
		return false;
	}
	if(	javaTrim(FormName.zje)=="") {
		alert("请输入[总金额]！");
		FormName.zje.focus();
		return false;
	}
	if(!(isFloat(FormName.zje, "总金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jkblr)=="") {
		alert("请输入[办理人]！");
		FormName.jkblr.focus();
		return false;
	}
	if(	javaTrim(FormName.jkblsj)=="") {
		alert("请输入[办理时间]！");
		FormName.jkblsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jkblsj, "办理时间"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.action="SaveInsertCw_fllyjl.jsp";
	FormName.submit();
	FormName.lrmx.disabled=false;
	return true;
}

function f_lrmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jlh)=="") {
		alert("请输入[记录号]！");
		FormName.jlh.focus();
		return false;
	}

	FormName.action="InsertCw_fllymx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
