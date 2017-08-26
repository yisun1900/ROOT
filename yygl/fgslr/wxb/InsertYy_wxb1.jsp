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

String ssfgs=request.getParameter("yy_wxb_ssfgs");
String lrbm=request.getParameter("yy_wxb_ssbm");
String zqs=request.getParameter("yy_wxb_zqs");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String bmmc=null;//部门名称
String bmrs=null;//部门人数

String date_ss=null;//上周开始时间
String date_se=null;//上周结束时间
String date_bs=null;//本周开始时间
String date_be=null;//本周结束时间


try {
	conn=cf.getConnection();
 
	
	//查询日期
	ls_sql="SELECT yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
	ls_sql+=" FROM yy_rqsd ";
	ls_sql+=" where zqs='"+zqs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
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
	ls_sql+=" FROM YY_WXB ";
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
	<form method="POST" name="listform" action="SaveInsertYy_wxb.jsp" target="_blank" >
<table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
	<tr>
	  <td height="37" colspan="14" align="center">
		<p>
			<input type="button" value="存盘"  onClick="cf_submit(listform)" >
			<span class="STYLE1">（注意：所有数据要求一次录完，不能空）</span>
		</p>

		<p>    
			<input type="button" value="Excel导入" onClick="window.open('LoadData.jsp?ssfgs=<%=ssfgs%>&dwbh=<%=lrbm%>&zqs=<%=zqs%>')"  >
			<A HREF="网销部导入.xls"><B>下载【导入Excel】模板</B></A>
		</p>
		</td>
	</tr>
  <tr>
    <td height="41" colspan="14" align="center">网销部录入表</td>
	<input type="hidden" name="yy_wxb_lrr" value="<%=yhmc%>">
	<input type="hidden" name="zqs" value="<%=zqs%>">
  </tr>
  <tr>
    <td width="95" height="28" align="center">上周日期</td>
    <td colspan="3"  align="center"><%=date_ss%>至<%=date_se%></td>
    <td width="81" align="center">本周日期</td>
    <td colspan="3"  align="center"><%=date_bs%>至<%=date_be%></td>
    <td width="81" align="center">单位：个</td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="center">部门名称</td>
    <td colspan="2" align="center"><%=bmmc%></td>
    <td colspan="2" align="center">网销专员人数</td>
    <td width="87" align="center"><%=bmrs%></td>
    <td width="89">&nbsp;</td>
    <td width="84">&nbsp;</td>
    <td width="81">&nbsp;</td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td rowspan="2" align="center">姓名</td>
    <td height="20" colspan="5" align="center">目标客户数量</td>
    <td colspan="5" align="center">收取定金数量</td>
  </tr>
  <tr>
    <td width="55" height="20" align="center">本月计划</td>
    <td width="82" align="center">本月累计</td>
    <td width="82" align="center">上周计划</td>
    <td width="81" align="center">上周完成</td>
    <td align="center">本周预计</td>
    <td align="center">本月计划</td>
    <td align="center">本月累计</td>
    <td align="center">上周计划</td>
    <td width="91" align="center">上周完成</td>
    <td width="102" align="center">本周预计</td>
  </tr>
  <%
    
	String yy_wxb_ygmc=null;
	String ssbm=null;
	
	ls_sql="SELECT dwbh,yhmc";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and  dwbh='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while(rs.next())
	{
		yy_wxb_ygmc=rs.getString("yhmc");
		ssbm=rs.getString("dwbh");

		%>
		<tr align="center" height="20">
			<td height="20" ><%=yy_wxb_ygmc%>
				<input type="hidden" name="yy_wxb_ygmc" value="<%=yy_wxb_ygmc%>">
				<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
				<input type="hidden" name="ssbm" value="<%=ssbm%>">			
			</td>
			<td><input type="text" name="yy_wxbkh_byjh " size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbkh_bylj" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onChange="calValue(insertform)"></td>
			<td><input type="text" name="yy_wxbkh_szjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbkh_szwc" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbkh_bzyj" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbdj_byjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbdj_bylj" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbdj_szjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbdj_szwc" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
			<td><input type="text" name="yy_wxbdj_bzjh" size="4" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  ></td>
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

