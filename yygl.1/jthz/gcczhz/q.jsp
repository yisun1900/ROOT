<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>工程产值汇总表</title>
</head>

<body>
<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}


	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	String ls_sql=null;

	String yy_rqsd_szs=null;
	String yy_rqsd_sze=null;
	String yy_rqsd_bzs=null;
	String yy_rqsd_bze=null;
	String zqs=request.getParameter("zqs");//周期数

	try
	{
		conn=cf.getConnection();

		ls_sql="SELECT yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
		ls_sql+=" FROM yy_rqsd ";
		ls_sql+=" where zqs='"+zqs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			yy_rqsd_szs=cf.fillNull(rs.getDate("yy_rqsd_szs"));
			yy_rqsd_sze=cf.fillNull(rs.getDate("yy_rqsd_sze"));
			yy_rqsd_bzs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
			yy_rqsd_bze=cf.fillNull(rs.getDate("yy_rqsd_bze"));
		}
		rs.close();
		ps.close();
	
%>
<body>

<div align="center">工程产值汇总</div>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
<tr>
 <td width="11%" height="28" align="right">上周日期：</td>
 <td width="20%"><%=yy_rqsd_szs%> 至 <%=yy_rqsd_sze%></td>
<td width="11%" align="right">本周日期：</td>
 <td width="20%" ><%=yy_rqsd_bzs%> 至 <%=yy_rqsd_bze%></td>
 <td width="38%" >&nbsp;</td>

  </tr>
</table>
<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr height=28  align="center" bgcolor="#CCCCCC"  >
	<td rowspan="2" align="center" width="150">分公司</td>
	<td rowspan="2" align="center" width="88">设计师人数</td>
	<td height="21" colspan="10" align="center">收取定金情况</td>
	<td colspan="8" align="center">工程产值</td>
	</tr>
	 <tr height=28  align="center" bgcolor="#CCCCCC"  >
	<td width="100">以往(非本月)储备</td>
	<td width="100">本月计划</td>
	<td width="100">本月累计</td>
	<td width="100">本月达成率</td>
	<td width="100">本月人均定金数量</td>
	<td width="100">上周计划</td>
	<td width="100">上周完成</td>
	<td width="100">本周预计</td>
	<td width="100">本周累计退定金</td>
	<td width="100">本月累计退定金</td>
	<td width="100">去年同期月度工程产值</td>
	<td width="100">本月计划</td>
	<td width="100">本月累计</td>
	<td width="100">本月达成率</td>
	<td width="100">本月人均工程产值</td>
	<td width="100">上周计划</td>
	<td width="100">上周完成</td>
	<td width="100">本周预计</td>
 <%
	int xjsjsrs=0;//设计师人数
	double xjyy_sjbdj_sydjcb=0;//以往(非本月)储备

	double xjyy_sjbdj_byjh=0;//本月计划(定金)
	double xjyy_sjbdj_bylj=0;//本月累计(定金)

	double xjyy_sjbdj_szjh=0;//上周计划
	double xjyy_sjbdj_szwc=0;//上周完成
	double xjyy_sjbdj_bzyj=0;//本周预计

	double xjyy_sjbdj_bztdj=0;//本周退定金
	double xjyy_sjbdj_byljtdj=0;//本月累计退定金

	double xjyy_sjsjb_tqgccz=0;//去年同期月度工程产值

	double xjyy_sjbgccz_byjh=0;//本月计划(gc)
	double xjyy_sjbgccz_bylj=0;//工程产值本月累计

	double xjyy_sjbgccz_szjh=0;//上周计划
	double xjyy_sjbgccz_szwc=0;//上周完成
	double xjyy_sjbgccz_bzyj=0;//本周预计

	double djdcl=0;//本月达成率(定金)
	double rjdj=0;
	double gcdcl=0;//本月达成率(gc)
	double gcrj=0;

	String dwmc=null;
	String dwbh=null;

	ls_sql="select dwbh,dwmc";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
    ls_sql+=" order by dwbh";
    ps1=conn.prepareStatement(ls_sql);
    rs1=ps1.executeQuery();
	while(rs1.next())
	{
		dwbh=rs1.getString("dwbh");	
		dwmc=rs1.getString("dwmc");
	
		int sjsrs=0;//设计师人数
		double yy_sjbdj_sydjcb=0;//以往(非本月)储备

		double yy_sjbdj_byjh=0;//本月计划(定金)
		double yy_sjbdj_bylj=0;//本月累计(定金)

		double yy_sjbdj_szjh=0;//上周计划
		double yy_sjbdj_szwc=0;//上周完成
		double yy_sjbdj_bzyj=0;//本周预计

		double yy_sjbdj_bztdj=0;//本周退定金
		double yy_sjbdj_byljtdj=0;//本月累计退定金

		double yy_sjsjb_tqgccz=0;//去年同期月度工程产值

		double yy_sjbgccz_byjh=0;//本月计划(gc)
		double yy_sjbgccz_bylj=0;//工程产值本月累计

		double yy_sjbgccz_szjh=0;//上周计划
		double yy_sjbgccz_szwc=0;//上周完成
		double yy_sjbgccz_bzyj=0;//本周预计

		ls_sql=" select count(*) sjsrs,sum(yy_sjbdj_sydjcb),sum(yy_sjbdj_byjh),sum(yy_sjbdj_bylj),sum(yy_sjbdj_szjh),sum(yy_sjbdj_szwc),sum(yy_sjbdj_bzyj),sum(yy_sjbdj_bztdj),sum(yy_sjbdj_byljtdj) ";
		ls_sql+=" ,sum(yy_sjbgccz_byjh),sum(yy_sjbgccz_bylj),sum(yy_sjbgccz_szjh),sum(yy_sjbgccz_szwc),sum(yy_sjbsjf_bzyj) ";
		ls_sql+=" from yy_sjb";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and zqs='"+zqs+"'";
		ls_sql+=" and yy_sjbgccz_byjh>0";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			sjsrs=rs.getInt("sjsrs");
			yy_sjbdj_sydjcb=yy_sjbdj_byjh=rs.getDouble(1);

			yy_sjbdj_byjh=rs.getDouble(2);
			yy_sjbdj_bylj=rs.getDouble(3);
			yy_sjbdj_szjh=rs.getDouble(4);
			yy_sjbdj_szwc=rs.getDouble(5);
			yy_sjbdj_bzyj=rs.getDouble(6);
			yy_sjbdj_bztdj=rs.getDouble(7);
			yy_sjbdj_byljtdj=rs.getDouble(8);

			yy_sjbgccz_byjh=rs.getDouble(9);
			yy_sjbgccz_bylj=rs.getDouble(10);
			yy_sjbgccz_szjh=rs.getDouble(11);
			yy_sjbgccz_szwc=rs.getDouble(12);
			yy_sjbgccz_bzyj=rs.getDouble(13);
		}
		rs.close();
		ps.close();

		out.println(ls_sql);
		out.println(yy_sjbgccz_byjh);


		ls_sql="select sum(yy_sjsjb_tqgccz)";
		ls_sql+=" from yy_sj";
		ls_sql+=" where yy_sj_fgs='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			yy_sjsjb_tqgccz=rs.getDouble(1);
		}
		rs.close();
		ps.close();
	


	  
		if(yy_sjbdj_byjh==0)
		{
			djdcl=0;
		}
		else
		{
			djdcl=cf.round(yy_sjbdj_bylj*100.0/yy_sjbdj_byjh,2);
		}

		if(sjsrs==0)
		{
			rjdj=0;
		}
		else
		{
			rjdj=cf.round(yy_sjbdj_bylj/sjsrs,2);
		}

		if(yy_sjbgccz_byjh==0)
		{
			gcdcl=0;
		}
		else
		{
			gcdcl=cf.round(yy_sjbgccz_bylj*100.0/yy_sjbgccz_byjh,2);
		}

		if(sjsrs==0)
		{
			gcrj=0;
		}
		else
		{
			gcrj=cf.round(yy_sjbgccz_bylj/sjsrs,2);
		}

		xjsjsrs+=sjsrs;//设计师人数
		xjyy_sjbdj_sydjcb+=yy_sjbdj_sydjcb;//以往(非本月)储备

		xjyy_sjbdj_byjh+=yy_sjbdj_byjh;//本月计划(定金)
		xjyy_sjbdj_bylj+=yy_sjbdj_bylj;//本月累计(定金)

		xjyy_sjbdj_szjh+=yy_sjbdj_szjh;//上周计划
		xjyy_sjbdj_szwc+=yy_sjbdj_szwc;//上周完成
		xjyy_sjbdj_bzyj+=yy_sjbdj_bzyj;//本周预计

		xjyy_sjbdj_bztdj+=yy_sjbdj_bztdj;//本周退定金
		xjyy_sjbdj_byljtdj+=yy_sjbdj_byljtdj;//本月累计退定金

		xjyy_sjsjb_tqgccz+=yy_sjsjb_tqgccz;//去年同期月度工程产值

		xjyy_sjbgccz_byjh+=yy_sjbgccz_byjh;//本月计划(gc)
		xjyy_sjbgccz_bylj+=yy_sjbgccz_bylj;//工程产值本月累计

		xjyy_sjbgccz_szjh+=yy_sjbgccz_szjh;//上周计划
		xjyy_sjbgccz_szwc+=yy_sjbgccz_szwc;//上周完成
		xjyy_sjbgccz_bzyj+=yy_sjbgccz_bzyj;//本周预计
			
		%>
		<tr bgcolor="#FFFFFF" align="center">
			<td ><%=dwmc%></td>
			<td><%=sjsrs%></td>
			<td><%=yy_sjbdj_sydjcb%></td>
			<td><%=yy_sjbdj_byjh%></td>
			<td><%=yy_sjbdj_bylj%></td>
			<td><%=djdcl%>%</td>
			<td><%=rjdj%></td>

			<td><%=yy_sjbdj_szjh%></td>
			<td><%=yy_sjbdj_szwc%></td>
			<td><%=yy_sjbdj_bzyj%></td>
			<td><%=yy_sjbdj_bztdj%></td>
			<td><%=yy_sjbdj_byljtdj%></td>

			<td><%=yy_sjsjb_tqgccz%></td>

			<td><%=yy_sjbgccz_byjh%></td>
			<td><%=yy_sjbgccz_bylj%></td>
			<td><%=gcdcl%>%</td>
			<td><%=gcrj%></td>
			<td><%=yy_sjbgccz_szjh%></td>
			<td><%=yy_sjbgccz_szwc%></td>
			<td><%=yy_sjbgccz_bzyj%></td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();

	if(xjyy_sjbdj_byjh==0)
	{
		djdcl=0;
	}
	else
	{
		djdcl=cf.round(xjyy_sjbdj_bylj*100.0/xjyy_sjbdj_byjh,2);
	}

	if(xjsjsrs==0)
	{
		rjdj=0;
	}
	else
	{
		rjdj=cf.round(xjyy_sjbdj_bylj/xjsjsrs,2);
	}

	if(xjyy_sjbgccz_byjh==0)
	{
		gcdcl=0;
	}
	else
	{
		gcdcl=cf.round(xjyy_sjbgccz_bylj*100.0/xjyy_sjbgccz_byjh,2);
	}

	if(xjsjsrs==0)
	{
		gcrj=0;
	}
	else
	{
		gcrj=cf.round(xjyy_sjbgccz_bylj/xjsjsrs,2);
	}

%>
<tr bgcolor="#FFFFFF" align="center">
	<td >小计</td>
	<td><%=xjsjsrs%></td>
	<td><%=xjyy_sjbdj_sydjcb%></td>
	<td><%=xjyy_sjbdj_byjh%></td>
	<td><%=xjyy_sjbdj_bylj%></td>
	<td><%=djdcl%>%</td>
	<td><%=rjdj%></td>

	<td><%=xjyy_sjbdj_szjh%></td>
	<td><%=xjyy_sjbdj_szwc%></td>
	<td><%=xjyy_sjbdj_bzyj%></td>
	<td><%=xjyy_sjbdj_bztdj%></td>
	<td><%=xjyy_sjbdj_byljtdj%></td>

	<td><%=xjyy_sjsjb_tqgccz%></td>

	<td><%=xjyy_sjbgccz_byjh%></td>
	<td><%=xjyy_sjbgccz_bylj%></td>
	<td><%=gcdcl%>%</td>
	<td><%=gcrj%></td>
	<td><%=xjyy_sjbgccz_szjh%></td>
	<td><%=xjyy_sjbgccz_szwc%></td>
	<td><%=xjyy_sjbgccz_bzyj%></td>
</tr>
</table>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print(ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</body>
</html>
