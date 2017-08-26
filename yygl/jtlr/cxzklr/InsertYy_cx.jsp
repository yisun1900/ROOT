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
.STYLE1 {	color: #FF0000;
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
	ls_sql+=" FROM YY_CX ";
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
<form  name="insert" method="post" action="SaveInsertYy_cx.jsp" target="_blank">
<table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
<tr>
 <td height="37" colspan="14" align="left">
 <input type="button" value="存盘" onClick="dos(insert)">
	<input type="hidden" name="lrr" value="<%=yhmc%>">
	<input type="hidden" name="zqs" value="<%=zqs%>">
	
    <span class="STYLE1">（注意：所有数据要求一次录完，不能空）</span>
	
	<BR><BR>
	<input type="button" value="Excel导入" onClick="window.open('LoadData.jsp')"  >
	<A HREF="促销折扣指标录入.xls"><B>下载【导入Excel】模板</B></A>
	
	</td>
</tr>
<tr >
<td height="26" colspan="13" align="center" >促销折扣指标录入表（周期数：<%=zqs%>）</td>
</tr>
<tr>
    <td  height="28" align="center" width="147">上周日期</td>
    <td colspan="4" align="center"><%=date_ss%>至<%=date_se%></td>
    <td align="center" >本周日期</td>
    <td colspan="4"  align="center" ><%=date_bs%>至<%=date_be%></td>
    </tr>
<tr>
<td rowspan="2" align="center">分公司</td>
<td colspan="2" align="center">直接折扣</td>
<td colspan="2" align="center">赠品赠券</td>
<td colspan="2" align="center">工程返现</td>
<td colspan="2" align="center">让利合计</td>
</tr>

<tr align="center">
	<td width="101">去年平均(%)</td>
	<td width="101">本周指数(%)</td>
	<td width="101" >去年平均(%)</td>
	<td width="101">本周指数(%)</td>
	<td width="101">去年平均(%)</td>
	<td width="101">本周指数(%)</td>
	<td width="101">去年平均(%)</td>
	<td width="101">本周指数(%)</td>
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


<tr>
<td align="center"><%=dwmc%>
	<input type="hidden" name="yy_cx_fgs" value="<%=dwbh%>">	
	<input type="hidden" name="dwmc" value="<%=dwmc%>">	
	</td>
<td align="center"><input type="text" name="yy_cxzjzk_qnpj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td align="center"><input type="text" name="yy_cxzjzk_bzzs" size="7" value=""  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  > </td>
<td align="center"><input type="text" name="yy_cxzpzq_qnpj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td align="center"><input type="text" name="yy_cxzpzq_bzzs" size="7" value=""  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td align="center"><input type="text" name="yy_cxgcfx_qnpj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td align="center"><input type="text" name="yy_cxgcfx_bzzs" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td align="center"><input type="text" name="yy_cxrlhj_qnpj" size="7" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
<td align="center"><input type="text" name="yy_cxrlhj_bzzs" size="7" value=""  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
</tr>


<%
}
rs.close();
ps.close();




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