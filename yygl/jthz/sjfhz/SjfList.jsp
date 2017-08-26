<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>设计费汇总表</title>
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

String date_ss=null;
String date_se=null;
String date_bs=null;
String date_be=null;
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
		date_ss=cf.fillNull(rs.getDate("yy_rqsd_szs"));
		date_se=cf.fillNull(rs.getDate("yy_rqsd_sze"));
		date_bs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
		date_be=cf.fillNull(rs.getDate("yy_rqsd_bze"));
	}
	rs.close();
	ps.close();
	
%>
<div align="center">设计费汇总</div>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
<tr>
 <td width="11%" height="28" align="right">上周日期：</td>
 <td width="20%"><%=date_ss%> 至 <%=date_se%></td>
<td width="11%" align="right">本周日期：</td>
 <td width="20%" ><%=date_bs%> 至 <%=date_be%></td>
 <td width="38%" >&nbsp;</td>
  </tr>
</table>
 <table width="100%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">
	<tr  align="center" bgcolor="#CCCCCC"  >
		<td width="10%">分公司</td>
		<td width="8%">设计师人数</td>
		<td width="8%">去年同期月度设计费</td>
		<td width="8%">设计费本月计划</td>
		<td width="8%">本月累计</td>
		<td width="8%">本月达成率</td>
		<td width="8%">本月人均设计费</td>
		<td width="8%">本月累计工程产值</td>
		<td width="8%">本月设计/工程占比</td>
		<td width="8%">上周计划</td>
		<td width="8%">上周完成</td>
		<td width="8%">本周预计</td>
	</tr>
<%
	double bydcl=0;//本月达成率
	double rjsjf=0;//本月人均设计费
	double sjgczb=0;//本月设计/工程占比

	int xjsjsrs=0;//设计师人数

	double xjyy_sjbsjf_byjh=0;//设计费本月计划
	double xjyy_sjbsjf_bylj=0;//本月累计
	double xjyy_sjbsjf_szjh=0;//上周计划
	double xjyy_sjbsjf_szwc=0;//上周完成
	double xjyy_sjbsjf_bzyj=0;//本周预计
	double xjyy_sjbgccz_bylj=0;//本月累计工程产值

	double xjyy_sjsjb_tqsjf=0;//去年同期月度设计费

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

		double yy_sjbsjf_byjh=0;//设计费本月计划
		double yy_sjbsjf_bylj=0;//本月累计
		double yy_sjbsjf_szjh=0;//上周计划
		double yy_sjbsjf_szwc=0;//上周完成
		double yy_sjbsjf_bzyj=0;//本周预计
		double yy_sjbgccz_bylj=0;//本月累计工程产值

		double yy_sjsjb_tqsjf=0;//去年同期月度设计费

		ls_sql="select count(*) sjsrs,sum(yy_sjbsjf_bylj) ";
		ls_sql+=",sum(yy_sjbsjf_szjh),sum(yy_sjbsjf_szwc),sum(yy_sjbsjf_bzyj),sum(yy_sjbgccz_bylj) ";
		ls_sql+=" from yy_sjb";
		ls_sql+=" where yy_sjb.ssfgs='"+dwbh+"'";
		ls_sql+=" and zqs='"+zqs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			sjsrs=rs.getInt(1);
			yy_sjbsjf_bylj=rs.getDouble(2);

			yy_sjbsjf_szjh=rs.getDouble(3);
			yy_sjbsjf_szwc=rs.getDouble(4);
			yy_sjbsjf_bzyj=rs.getDouble(5);
			yy_sjbgccz_bylj=rs.getDouble(6);
		}
		rs.close();
		ps.close();

		ls_sql="select yy_sjsjb_sjf ";
		ls_sql+=" from YY_SJ";
		ls_sql+=" where yy_sj_fgs='"+dwbh+"'";
		ls_sql+=" and zqs='"+zqs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			yy_sjbsjf_byjh=rs.getDouble("yy_sjsjb_sjf");
		}
		rs.close();
		ps.close();

		ls_sql="select yy_sjsjb_tqsjf";
		ls_sql+=" from Yy_sj";
		ls_sql+=" where yy_sj_fgs='"+dwbh+"'";
		ls_sql+=" and zqs='"+zqs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{
			yy_sjsjb_tqsjf=rs.getDouble("yy_sjsjb_tqsjf");
		}
		rs.close();
	    ps.close();


		if(yy_sjbsjf_byjh==0)
		{
			bydcl=0;
		}
		else
		{
			bydcl=cf.round(yy_sjbsjf_bylj*100.0/yy_sjbsjf_byjh,2);
		}
	    
		
		if(sjsrs==0)
		{
			rjsjf=0;
		}
		else
		{
			rjsjf=cf.round(yy_sjbsjf_bylj/sjsrs,2);
		}
		
		if(yy_sjbgccz_bylj==0)
		{
			sjgczb=0;
		}
		else
		{
			sjgczb=cf.round(yy_sjbsjf_bylj*100.0/yy_sjbgccz_bylj,2);
		}


		xjsjsrs+=sjsrs;//设计师人数

		xjyy_sjbsjf_byjh+=yy_sjbsjf_byjh;//设计费本月计划
		xjyy_sjbsjf_bylj+=yy_sjbsjf_bylj;//本月累计
		xjyy_sjbsjf_szjh+=yy_sjbsjf_szjh;//上周计划
		xjyy_sjbsjf_szwc+=yy_sjbsjf_szwc;//上周完成
		xjyy_sjbsjf_bzyj+=yy_sjbsjf_bzyj;//本周预计
		xjyy_sjbgccz_bylj+=yy_sjbgccz_bylj;//本月累计工程产值

		xjyy_sjsjb_tqsjf+=yy_sjsjb_tqsjf;//去年同期月度设计费


		%>
		<tr bgcolor="#FFFFFF" align="center">
			<td><%=dwmc%></td>
			<td><%=sjsrs%></td>
			<td><%=yy_sjsjb_tqsjf%></td>

			<td><%=yy_sjbsjf_byjh%></td>
			<td><%=yy_sjbsjf_bylj%></td>
			<td><%=bydcl%>%</td>
			<td><%=rjsjf%></td>

			<td><%=yy_sjbgccz_bylj%></td>

			<td><%=sjgczb%>%</td>

			<td><%=yy_sjbsjf_szjh%></td>
			<td><%=yy_sjbsjf_szwc%></td>
			<td><%=yy_sjbsjf_bzyj%></td>
		</tr>
		<%

	}
	rs1.close();
	ps1.close();

	if(xjyy_sjbsjf_byjh==0)
	{
		bydcl=0;
	}
	else
	{
		bydcl=cf.round(xjyy_sjbsjf_bylj*100.0/xjyy_sjbsjf_byjh,2);
	}


	if(xjsjsrs==0)
	{
		rjsjf=0;
	}
	else
	{
		rjsjf=cf.round(xjyy_sjbsjf_bylj/xjsjsrs,2);
	}

	if(xjyy_sjbgccz_bylj==0)
	{
		sjgczb=0;
	}
	else
	{
		sjgczb=cf.round(xjyy_sjbsjf_bylj*100.0/xjyy_sjbgccz_bylj,2);
	}
%>
<tr bgcolor="#FFFFFF" align="center">
	<td>小计</td>
	<td><%=xjsjsrs%></td>
	<td><%=cf.round(xjyy_sjsjb_tqsjf,2)%></td>

	<td><%=cf.round(xjyy_sjbsjf_byjh,2)%></td>
	<td><%=cf.round(xjyy_sjbsjf_bylj,2)%></td>
	<td><%=cf.round(bydcl,2)%>%</td>
	<td><%=cf.round(rjsjf,2)%></td>

	<td><%=cf.round(xjyy_sjbgccz_bylj,2)%></td>

	<td><%=cf.round(sjgczb,2)%>%</td>

	<td><%=cf.round(xjyy_sjbsjf_szjh,2)%></td>
	<td><%=cf.round(xjyy_sjbsjf_szwc,2)%></td>
	<td><%=cf.round(xjyy_sjbsjf_bzyj,2)%></td>
</tr>
</table>
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
