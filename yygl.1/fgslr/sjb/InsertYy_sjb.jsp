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
String lrbm=(String)session.getAttribute("dwbh");


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
	ls_sql+=" FROM YY_SJB ";
	ls_sql+=" where zqs='"+zqs+"' and ssbm='"+lrbm+"'";
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
	ls_sql+=" where dwbh='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bmmc=rs.getString("dwmc");
	}
	rs.close();
	ps.close();
	
	//查询部门人数
	ls_sql="SELECT count(*) rs";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and  dwbh='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		bmrs=rs.getString("rs");
	}
	rs.close();
	ps.close();

	%>
	<form method="POST" name="listform" action="SaveInsertYy_sjb.jsp" target="_blank" >
<table width="220%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">

	<tr>
	  <td height="37" colspan="28">
		<p>
			<input type="button" value="存盘"  onClick="cf_submit(listform)" >
			<span class="STYLE1">（注意：所有数据要求一次录完，不能空）</span>
		</p>

		<p>    
			<input type="button" value="Excel导入" onClick="window.open('LoadData.jsp')"  >
			<A HREF="设计部导入.xls"><B>下载【导入Excel】模板</B></A>
		</p>
	
	</td>
	</tr>
  <tr  align="center">
    <td height="30" colspan="28" align="left">设计部录入表
	<input type="hidden" name="yy_sjb_lrr" value="<%=yhmc%>">
	<input type="hidden" name="zqs" value="<%=zqs%>">	</td>
  </tr>
  <tr  align="center">
    <td width="127" height="28">上周日期</td>
    <td colspan="5"><%=date_ss%>至<%=date_se%></td>
    <td width="79">本周日期</td>
    <td colspan="5"><%=date_bs%>至<%=date_be%></td>
    <td colspan="12">单位：个&amp;万元（保留两位小数点）</td>
    </tr>
  <tr  align="center">
    <td height="20">部门名称</td>
    <td colspan="5"><%=bmmc%></td>
    <td colspan="6">设计师人数:<%=bmrs%></td>
    <td colspan="12">&nbsp;</td>
    </tr>
  <tr  align="center">
    <td rowspan="2" width="70">姓名</td>
    <td colspan="8">收取定金情况</td>
    <td colspan="5">设计费</td>
	<td colspan="5">工程产值</td>
	<td colspan="5">主材产值</td>
  </tr>
  <tr  align="center">
    <td width="45" height="20">以往(非本月)储备</td>
    <td width="70">本月计划</td>
    <td width="70">本月累计</td>
    <td width="70">上周计划</td>
    <td width="70">上周完成</td>
    <td width="79">本周预计</td>
    <td width="70">本周退定金</td>
    <td width="70">本月累计退定金</td>
    <td width="85">本月计划</td>
    <td width="85">本月累计</td>
    <td width="85">上周计划</td>
    <td width="85">上周完成</td>
    <td width="85">本周预计</td>
    <td width="85">本月计划</td>
    <td width="85">本月累计</td>
    <td width="85">上周计划</td>
    <td width="85">上周完成</td>
    <td width="85">本周预计</td>
    <td width="85">本月计划</td>
    <td width="85">本月累计</td>
    <td width="85">上周计划</td>
    <td width="85">上周完成</td>
    <td width="85">本周预计</td>
  </tr>
  <%
	String yy_sjb_ygmc=null;
	String ssfgs=null;
	String ssbm=null;
	
	ls_sql="SELECT ssfgs,dwbh,yhmc";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and  dwbh='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while(rs.next())
	{
		yy_sjb_ygmc=rs.getString("yhmc");
		ssfgs=rs.getString("ssfgs");
		ssbm=rs.getString("dwbh");

	  %>
		<tr  height="20" align="center">
			<td ><%=yy_sjb_ygmc%>
				<input type="hidden" name="yy_sjb_ygmc" value="<%=yy_sjb_ygmc%>">
				<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
				<input type="hidden" name="ssbm" value="<%=ssbm%>">			</td>
			<td><input type="text" name="yy_sjbdj_sydjcb" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbdj_byjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onChange="calValue(insertform)"></td>
			<td><input type="text" name="yy_sjbdj_bylj" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbdj_szjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbdj_szwc" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbdj_bzyj" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbdj_bztdj" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbdj_byljtdj" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbsjf_byjh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbsjf_bylj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbsjf_szjh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbsjf_szwc" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbsjf_bzyj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbgccz_byjh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbgccz_bylj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbgccz_szjh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbgccz_szwc" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbgccz_bzyj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbzccz_byjh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbzccz_bylj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbzccz_szjh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbzccz_szwc" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_sjbzccz_bzyj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
	  </tr>
    <% 
	}
	rs.close();
	ps.close();
		
	%>
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
function cf_submit(formName)
{
	formName.submit();
	return true;
} 

//-->
</script>

