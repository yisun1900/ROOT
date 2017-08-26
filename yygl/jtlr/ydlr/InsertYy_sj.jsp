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
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
	font-size: 16px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<%
String yhmc=(String)session.getAttribute("yhmc");

int zqs=0;
String date_ss=null;//上周开始时间
String date_se=null;//上周结束时间
String date_bs=null;//本周开始时间
String date_be=null;//本周结束时间

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
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
	ls_sql+=" FROM YY_SJ ";
	ls_sql+=" where zqs='"+zqs+"'";
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
	%>


<form  name="insert" method="post" action="SaveInsertYy_sj.jsp" target="_blank">
<table width="170%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
<tr>
 <td height="37" colspan="15" align="left">
 <input type="button" value="存盘" onClick="dos(insert)">
	<input type="hidden" name="lrr" value="<%=yhmc%>">
	<input type="hidden" name="zqs" value="<%=zqs%>">
	
    <span class="STYLE1">（注意：所有数据要求一次录完，不能空） 
    <input name="button" type="button" onClick="window.open('enetercopy.jsp')" value="复制月度指标">
    </span>
		
	<BR><BR>
	<input type="button" value="Excel导入" onClick="window.open('LoadData.jsp')"  >
	<A HREF="月度指标和同期数据录入.xls"><B>下载【导入Excel】模板</B></A>
	
	</td>
</tr>
<tr>
<td colspan="15" align="center" >月度指标和同期数据录入表</td>
</tr>
<tr>
    <td  height="28" align="center" width="242">上周日期</td>
    <td colspan="6"  align="center"><%=date_ss%>至<%=date_se%></td>
    <td  align="center" >本周日期</td>
    <td colspan="7"  align="center" ><%=date_bs%>至<%=date_be%></td>
  </tr>
<tr>
<td rowspan="2" align="center">分公司</td>
<td colspan="2" align="center">总客源</td>

<td colspan="2" align="center">市场部</td>
<td colspan="2" align="center">网销部</td>

<td colspan="4" align="center">设计部</td>

<td colspan="2" align="center">家居部</td>

<td colspan="2" align="center">其他渠道</td>
</tr>
<tr align="center">
<td width="130" >目标客户数量本月计划</td>
<td width="130" >收取定金数量本月计划</td>

<td width="130" >目标客户数量本月计划</td>
<td width="130" >收取定金数量本月计划</td>
<td width="130" >目标客户数量本月计划</td>
<td width="130" >收取定金数量本月计划</td>

<td width="130" >设计费本月计划</td>
<td width="130" >去年同期月度设计费</td>
<td width="130" >工程产值本月计划</td>
<td width="130" >去年同期月度工程产值</td>

<td width="130" >主材产值本月计划</td>
<td width="130" >去年同期月度主材产值</td>

<td width="130" >目标客户数量本月计划</td>
<td width="130" >收取定金数量本月计划</td>
</tr>
<%
	String dwbh=null;
	String dwmc=null;
	ls_sql="select  dwbh,dwmc ";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N' order by dwbh";
	ps=conn.prepareStatement(ls_sql);
    rs=ps.executeQuery(ls_sql);
	while(rs.next())
	{
		dwbh=rs.getString("dwbh");
		dwmc=rs.getString("dwmc");
%>



<tr align="center">

<td ><%=dwmc%>
	<input type="hidden" name="yy_sj_fgs" value="<%=dwbh%>">	
	<input type="hidden" name="dwmc" value="<%=dwmc%>">	</td>

<td><input type="text" name="yy_sjzky_mbkh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
<td><input type="text" name="yy_sjzky_sqdj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>

<td><input type="text" name="yy_sjscb_mbkh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
<td><input type="text" name="yy_sjscb_sqdj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_sjwxb_mbkh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
<td><input type="text" name="yy_sjwxb_sqdj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>

<td><input type="text" name="yy_sjsjb_sjf" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_sjsjb_tqsjf" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_sjsjb_gccz" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_sjsjb_tqgccz" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>

<td><input type="text" name="yy_sjjjb_byjh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td><input type="text" name="yy_sjjjb_qntq" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>

<td><input type="text" name="yy_sjqtqd_mbkh" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
<td><input type="text" name="yy_sjqtqd_sqdj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
</tr>


<%
}
rs.close();
ps.close();

%>
</table>
</form>
</body>
</html>
<SCRIPT language="javascript">
<!--
function dos(FormName)
{
	FormName.submit();
	return true;
}
//-->
</script>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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