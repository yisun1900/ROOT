<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000;
	font-weight: bold;
	font-size: 16px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String bmmc=null;//部门名称
String bmrs=null;//部门人数

int zqs=0;
String date_ss=null;//上周开始时间
String date_se=null;//上周结束时间
String date_bs=null;//本周开始时间
String date_be=null;//本周结束时间


try {
	conn=cf.getConnection();

	//查询日期
	ls_sql="SELECT zqs,yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
	ls_sql+=" FROM yy_rqsd ";
	ls_sql+=" order by yy_rqsd_bzs desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zqs=rs.getInt("zqs");
		date_ss=cf.fillNull(rs.getDate("yy_rqsd_szs"));
		date_se=cf.fillNull(rs.getDate("yy_rqsd_sze"));
		date_bs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
		date_be=cf.fillNull(rs.getDate("yy_rqsd_bze"));
	}
	rs.close();
	ps.close();

  	//是否之前已经录入过 
	int count=0;
    ls_sql="SELECT count(*)";
	ls_sql+=" FROM YY_QTQD ";
	ls_sql+=" where zqs='"+zqs+"' and ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		count=rs.getInt(1);
    }
    rs.close();
	ps.close();

	if (count>0)
	{
		out.println("你已经录入了数据，请到【维护】中进行修改或增加！");
		return;
	}
	
 		
    //查询所属所属部门
	ls_sql="SELECT dwmc";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bmmc=rs.getString("dwmc");
	}
	rs.close();
	ps.close();
	

	%>
	<form method="POST" name="listform" action="SaveInsertYy_qtqd.jsp" target="_blank" >
	  <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
        <tr>
          <td height="37" colspan="14" align="center"><input type="button" value="保存"  width="200" onClick="cf_submit(listform)" name="save">
          <span class="STYLE1">（注意：所有数据要求一次录完，不能空）</span> </td>
        </tr>
        <tr>
          <td height="41" colspan="14" align="center">【<%=bmmc%>】其他渠道录入表（周期数：<%=zqs%>）
            <input type="hidden" name="ssfgs" value="<%=ssfgs%>">
            <input type="hidden" name="yy_qtqd_lrr" value="<%=yhmc%>">
              <input type="hidden" name="zqs" value="<%=zqs%>"></td>
        </tr>
        <tr>
          <td width="100" height="28" align="center">上周日期</td>
          <td colspan="3" align="center"><%=date_ss%>至<%=date_se%></td>
          <td width="114" align="center">本周日期</td>
          <td colspan="3"  align="center"><%=date_bs%>至<%=date_be%></td>
          <td width="67" colspan="2" align="center">单位：个</td>
        </tr>
        <tr>
          <td height="36" colspan="5" align="center">目标客户数量</td>
          <td colspan="5" align="center">收取定金数量</td>
        </tr>
        <tr>
          <td width="100" height="42" align="center">本月计划</td>
          <td width="100" align="center">本月累计</td>
          <td width="100" align="center">上周计划</td>
          <td width="100" align="center">上周完成</td>
          <td width="100" align="center">本周预计</td>
          <td width="100" align="center">本月计划</td>
          <td width="100" align="center">本月累计</td>
          <td width="100" align="center">上周计划</td>
          <td width="100" align="center">上周完成</td>
          <td width="100" align="center">本周预计</td>
        </tr>
        <tr align="center">
          <td><input type="text" name="yy_qtqdkh_byjh" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqdkh_bylj" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onChange="calValue(insertform)"></td>
          <td ><input type="text" name="yy_qtqdkh_szjh" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqdkh_szwc" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqdkh_bzyj" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqddj_byjh" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqddj_bylj" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqddj_szjh" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqddj_szwc" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
          <td ><input type="text" name="yy_qtqddj_bzyj" size="5" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
        </tr>
      </table>
	</form>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("sql: " + ls_sql);
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

</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function cf_submit(FormName)
{
	if(	javaTrim(FormName.zqs)=="") {
		alert("请输入[周期数]！");
		FormName.zqs.focus();
		return false;
	}
	if(!(isNumber(FormName.zqs, "周期数"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}

	if(	javaTrim(FormName.yy_qtqdkh_byjh)=="") {
		alert("请输入[目标客户数量本月计划]！");
		FormName.yy_qtqdkh_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_byjh, "目标客户数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_bylj)=="") {
		alert("请输入[目标客户数量本月累计]！");
		FormName.yy_qtqdkh_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_bylj, "目标客户数量本月累计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_szjh)=="") {
		alert("请输入[目标客户数量上周计划]！");
		FormName.yy_qtqdkh_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_szjh, "目标客户数量上周计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_szwc)=="") {
		alert("请输入[目标客户数量上周完成]！");
		FormName.yy_qtqdkh_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_szwc, "目标客户数量上周完成"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_bzyj)=="") {
		alert("请输入[目标客户数量本周预计]！");
		FormName.yy_qtqdkh_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_bzyj, "目标客户数量本周预计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_byjh)=="") {
		alert("请输入[收取定金数量本月计划]！");
		FormName.yy_qtqddj_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_byjh, "收取定金数量本月计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_bylj)=="") {
		alert("请输入[收取定金数量本月累计]！");
		FormName.yy_qtqddj_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_bylj, "收取定金数量本月累计"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_szjh)=="") {
		alert("请输入[收取定金数量上周计划]！");
		FormName.yy_qtqddj_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_szjh, "收取定金数量上周计划"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_szwc)=="") {
		alert("请输入[收取定金数量上周完成]！");
		FormName.yy_qtqddj_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_szwc, "收取定金数量上周完成"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_bzyj)=="") {
		alert("请输入[收取定金数量本周预计]！");
		FormName.yy_qtqddj_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_bzyj, "收取定金数量本周预计"))) {
		return false;
	}

	FormName.submit();
	return true;
} 

//-->
</script>

