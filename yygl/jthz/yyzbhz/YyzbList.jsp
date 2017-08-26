<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}


	String yy_rqsd_szs=null;
	String yy_rqsd_sze=null;
	String yy_rqsd_bzs=null;
	String yy_rqsd_bze=null;
	String zqs=request.getParameter("zqs");//周期数



	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	String ls_sql=null;
	
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


<div align="center">运营关键指标汇总表</div>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
	<tr>
	 <td width="11%" height="28" align="right">上周日期：</td>
	 <td width="20%"><%=yy_rqsd_szs%> 至 <%=yy_rqsd_sze%></td>
	<td width="11%" align="right">本周日期：</td>
	 <td width="20%" ><%=yy_rqsd_bzs%> 至 <%=yy_rqsd_bze%></td>
	 <td width="38%" >&nbsp;</td>
	
	  </tr>
</table>
<table width="150%" border="1"  cellpadding="0" cellspacing="0" style="FONT-SIZE:12">
	<tr bgcolor="#CCCCCC"  align="center">
	  <td width="138" rowspan=2 >分公司</td>
	  <td  colspan=4 >目标客户数量</td>
	  <td colspan=4 >收取定金数量</td>
	  <td colspan=4 >设计费</td>
	  <td colspan=4 >工程产值</td>
	  <td colspan=4 >主材产值</td>
	 </tr>
	 <tr bgcolor="#CCCCCC" align="center">
	  <td  width="110" >本月计划</td>
	  <td  width="110" >本月累计</td>
	  <td  width="110" >本月达成率</td>
	  <td  width="110" >本周预计</td>
	  <td  width="110" >本月计划</td>
	  <td  width="110">本月累计</td>
	  <td  width="110" >本月达成率</td>
	  <td  width="110">本周预计</td>
	  <td  width="110" >本月计划</td>
	  <td  width="110" >本月累计</td>
	  <td  width="110" >本月达成率</td>
	  <td  width="110" >本周预计</td>
	  <td  width="110" >本月计划</td>
	  <td  width="110" >本月累计</td>
	  <td  width="110" >本月达成率</td>
	  <td  width="110" >本周预计</td>
	  <td  width="110" >本月计划</td>
	  <td  width="110" >本月累计</td>
	  <td  width="110" >本月达成率</td>
	  <td  width="110" >本周预计</td>
	 </tr>
 <%
	int xjyy_sjzky_mbkh=0;//总客源目标客户数量本月计划
	int xjyy_sjzky_sqdj=0;//总客源收取定金数量本月计划

	double xjyy_sjsjb_sjf=0;//设计部设计费本月计划
	double xjyy_sjsjb_tqsjf=0;//设计部去年同期月度设计费
	double xjyy_sjsjb_gccz=0;//设计部工程产值本月计划
	double xjyy_sjsjb_tqgccz=0;//设计部去年同期月度工程产值
	double xjyy_sjjjb_byjh=0;//家居部主材产值本月计划
	double xjyy_sjjjb_qntq=0;//家居部去年同期月度主材产值

	int xjyy_sjscb_mbkh=0;//市场部目标客户数量本月计划
	int xjyy_sjwxb_mbkh=0;//市场部收取定金数量本月计划
	int xjyy_sjqtqd_mbkh=0;//网销部目标客户数量本月计划
	int xjyy_sjscb_sqdj=0;//网销部收取定金数量本月计划
	int xjyy_sjwxb_sqdj=0;//其他渠道目标客户数量本月计划
	int xjyy_sjqtqd_sqdj=0;//其他渠道收取定金数量本月计划


	int xjkh_bylj=0;//目标客户数量本月累计
	int xjkh_bzyj=0;//目标客户数量本周预计
	int xjdj_bylj=0;//收取定金本月累计
	int xjdj_bzyj=0;//收取定金本周预计

	double xjyy_sjbsjf_bylj=0;//设计费本月累计
	double xjyy_sjbsjf_bzyj=0;//设计费本周预计

	double xjyy_sjbgccz_bylj=0;//工程产值本月累计
	double xjyy_sjbgccz_bzyj=0;//工程产值本周预计

	double xjyy_jjbylj=0;//主材本月累计
	double xjyy_jjbbzyj=0;//主材本周预计

	//目标客户数量-本月达成率	 
	double kh_bydcl=0;
	//定金-本月达成率	 
	double dj_bydcl=0;
	//定金-本月达成率	 
	double sjf_bydcl=0;
	//定金-本月达成率	 
	double gc_bydcl=0;
	//定金-本月达成率	 
	double zc_bydcl=0;

	String dwmc=null;
	String dwbh=null;
	ls_sql="select dwbh,dwmc";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
	ls_sql+=" order by dwbh";
	ps = conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while(rs.next())
	{
		dwbh=rs.getString("dwbh");	
		dwmc=rs.getString("dwmc");	

		int yy_sjzky_mbkh=0;//总客源目标客户数量本月计划
		int yy_sjzky_sqdj=0;//总客源收取定金数量本月计划

		double yy_sjsjb_sjf=0;//设计部设计费本月计划
		double yy_sjsjb_tqsjf=0;//设计部去年同期月度设计费
		double yy_sjsjb_gccz=0;//设计部工程产值本月计划
		double yy_sjsjb_tqgccz=0;//设计部去年同期月度工程产值
		double yy_sjjjb_byjh=0;//家居部主材产值本月计划
		double yy_sjjjb_qntq=0;//家居部去年同期月度主材产值

		int yy_sjscb_mbkh=0;//市场部目标客户数量本月计划
		int yy_sjwxb_mbkh=0;//市场部收取定金数量本月计划
		int yy_sjqtqd_mbkh=0;//网销部目标客户数量本月计划
		int yy_sjscb_sqdj=0;//网销部收取定金数量本月计划
		int yy_sjwxb_sqdj=0;//其他渠道目标客户数量本月计划
		int yy_sjqtqd_sqdj=0;//其他渠道收取定金数量本月计划

		ls_sql="select yy_sjzky_mbkh,yy_sjzky_sqdj,yy_sjsjb_sjf,yy_sjsjb_tqsjf,yy_sjsjb_gccz,yy_sjsjb_tqgccz,yy_sjjjb_byjh,yy_sjjjb_qntq,yy_sjscb_mbkh,yy_sjwxb_mbkh,yy_sjqtqd_mbkh,yy_sjscb_sqdj,yy_sjwxb_sqdj,yy_sjqtqd_sqdj,yy_sj_lrsj,lrr ";
		ls_sql+=" from  yy_sj";
		ls_sql+=" where zqs="+zqs+" and yy_sj_fgs='"+dwbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yy_sjzky_mbkh=rs1.getInt("yy_sjzky_mbkh");
			yy_sjzky_sqdj=rs1.getInt("yy_sjzky_sqdj");

			yy_sjsjb_sjf=rs1.getDouble("yy_sjsjb_sjf");
			yy_sjsjb_tqsjf=rs1.getDouble("yy_sjsjb_tqsjf");
			yy_sjsjb_gccz=rs1.getDouble("yy_sjsjb_gccz");
			yy_sjsjb_tqgccz=rs1.getDouble("yy_sjsjb_tqgccz");
			yy_sjjjb_byjh=rs1.getDouble("yy_sjjjb_byjh");
			yy_sjjjb_qntq=rs1.getDouble("yy_sjjjb_qntq");

			yy_sjscb_mbkh=rs1.getInt("yy_sjscb_mbkh");
			yy_sjwxb_mbkh=rs1.getInt("yy_sjwxb_mbkh");
			yy_sjqtqd_mbkh=rs1.getInt("yy_sjqtqd_mbkh");
			yy_sjscb_sqdj=rs1.getInt("yy_sjscb_sqdj");
			yy_sjwxb_sqdj=rs1.getInt("yy_sjwxb_sqdj");
			yy_sjqtqd_sqdj=rs1.getInt("yy_sjqtqd_sqdj");
		}
		rs1.close();
		ps1.close();

		int yy_scbkh_bylj=0;//目标客户数量本月累计
		int yy_scbkh_bzyj=0;//目标客户数量本周预计
		int yy_scbdj_bylj=0;//收取定金本月累计
		int yy_scbdj_bzjh=0;//收取定金本周预计
		ls_sql="select sum(yy_scbkh_bylj),sum(yy_scbkh_bzyj),sum(yy_scbdj_bylj),sum(yy_scbdj_bzjh)";
		ls_sql+=" from yy_scb ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_scbkh_bylj=rs1.getInt(1);
			yy_scbkh_bzyj=rs1.getInt(2);
			yy_scbdj_bylj=rs1.getInt(3);
			yy_scbdj_bzjh=rs1.getInt(4);
		}
		rs1.close();
		ps1.close();

		int yy_wxbkh_bylj=0;//目标客户数量本月累计
		int yy_wxbkh_bzyj=0;//目标客户数量本周预计
		int yy_wxbdj_bylj=0;//收取定金本月累计
		int yy_wxbdj_bzjh=0;//收取定金本周预计
		ls_sql="select sum(yy_wxbkh_bylj),sum(yy_wxbkh_bzyj),sum(yy_wxbdj_bylj),sum(yy_wxbdj_bzjh)";
		ls_sql+=" from yy_wxb ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_wxbkh_bylj=rs1.getInt(1);
			yy_wxbkh_bzyj=rs1.getInt(2);
			yy_wxbdj_bylj=rs1.getInt(3);
			yy_wxbdj_bzjh=rs1.getInt(4);
		}
		rs1.close();
		ps1.close();

		int yy_qtqdkh_bylj=0;//目标客户数量本月累计
		int yy_qtqdkh_bzyj=0;//目标客户数量本周预计
		int yy_qtqddj_bylj=0;//收取定金本月累计
		int yy_qtqddj_bzyj=0;//收取定金本周预计
		ls_sql="select sum(yy_qtqdkh_bylj),sum(yy_qtqdkh_bzyj),sum(yy_qtqddj_bylj),sum(yy_qtqddj_bzyj)";
		ls_sql+=" from yy_qtqd ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_qtqdkh_bylj=rs1.getInt(1);
			yy_qtqdkh_bzyj=rs1.getInt(2);
			yy_qtqddj_bylj=rs1.getInt(3);
			yy_qtqddj_bzyj=rs1.getInt(4);
		}
		rs1.close();
		ps1.close();



		int kh_bylj=yy_scbkh_bylj+yy_wxbkh_bylj+yy_qtqdkh_bylj;//目标客户数量本月累计
		int kh_bzyj=yy_scbkh_bzyj+yy_wxbkh_bzyj+yy_qtqdkh_bzyj;//目标客户数量本周预计
		int dj_bylj=yy_scbdj_bylj+yy_wxbdj_bylj+yy_qtqddj_bylj;//收取定金本月累计
		int dj_bzyj=yy_scbdj_bzjh+yy_wxbdj_bzjh+yy_qtqddj_bzyj;//收取定金本周预计

		//目标客户数量-本月达成率	 
		if (yy_sjzky_mbkh!=0)
		{
			kh_bydcl=cf.round(kh_bylj*100.0/yy_sjzky_mbkh,2);
		}
		else{
			kh_bydcl=0;
		}

		//定金-本月达成率	 
		if (yy_sjzky_sqdj!=0)
		{
			dj_bydcl=cf.round(dj_bylj*100.0/yy_sjzky_sqdj,2);
		}
		else{
			dj_bydcl=0;
		}
		 
		double yy_sjbsjf_bylj=0;//设计费本月累计
		double yy_sjbsjf_bzyj=0;//设计费本周预计

		double yy_sjbgccz_bylj=0;//工程产值本月累计
		double yy_sjbgccz_bzyj=0;//工程产值本周预计
	 	
		ls_sql="select sum(yy_sjbsjf_bylj),sum(yy_sjbsjf_bzyj),sum(yy_sjbgccz_bylj),sum(yy_sjbgccz_bzyj)";
		ls_sql+=" from yy_sjb";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and zqs='"+zqs+"'" ;
		ps1 =conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_sjbsjf_bylj=rs1.getDouble(1);
			yy_sjbsjf_bzyj=rs1.getDouble(2);
			yy_sjbgccz_bylj=rs1.getDouble(3);
			yy_sjbgccz_bzyj=rs1.getDouble(4);
		}
		rs1.close();
		ps1.close();


		double yy_jjbylj=0;//主材本月累计
		double yy_jjbbzyj=0;//主材本周预计
		ls_sql="select sum(yy_jjbylj),sum(yy_jjbbzyj)";
		ls_sql+=" from yy_jjb";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and zqs='"+zqs+"'" ;
		ps1 =conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_jjbylj=rs1.getDouble(1);
			yy_jjbbzyj=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

 		//设计费-本月达成率	 
		if (yy_sjsjb_sjf!=0)
		{
			sjf_bydcl=cf.round(yy_sjbsjf_bylj*100.0/yy_sjsjb_sjf,2);
		}
		else{
			sjf_bydcl=0;
		}
		//工程-本月达成率	 
		if (yy_sjsjb_gccz!=0)
		{
			gc_bydcl=cf.round(yy_sjbgccz_bylj*100.0/yy_sjsjb_gccz,2);
		}
		else{
			gc_bydcl=0;
		}
		//主材-本月达成率	 
		if (yy_sjjjb_byjh!=0)
		{
			zc_bydcl=cf.round(yy_jjbylj*100.0/yy_sjjjb_byjh,2);
		}
		else{
			zc_bydcl=0;
		}

		xjyy_sjzky_mbkh+=yy_sjzky_mbkh;//总客源目标客户数量本月计划
		xjyy_sjzky_sqdj+=yy_sjzky_sqdj;//总客源收取定金数量本月计划

		xjyy_sjsjb_sjf+=yy_sjsjb_sjf;//设计部设计费本月计划
		xjyy_sjsjb_tqsjf+=yy_sjsjb_tqsjf;//设计部去年同期月度设计费
		xjyy_sjsjb_gccz+=yy_sjsjb_gccz;//设计部工程产值本月计划
		xjyy_sjsjb_tqgccz+=yy_sjsjb_tqgccz;//设计部去年同期月度工程产值
		xjyy_sjjjb_byjh+=yy_sjjjb_byjh;//家居部主材产值本月计划
		xjyy_sjjjb_qntq+=yy_sjjjb_qntq;//家居部去年同期月度主材产值

		xjyy_sjscb_mbkh+=yy_sjscb_mbkh;//市场部目标客户数量本月计划
		xjyy_sjwxb_mbkh+=yy_sjwxb_mbkh;//市场部收取定金数量本月计划
		xjyy_sjqtqd_mbkh+=yy_sjqtqd_mbkh;//网销部目标客户数量本月计划
		xjyy_sjscb_sqdj+=yy_sjscb_sqdj;//网销部收取定金数量本月计划
		xjyy_sjwxb_sqdj+=yy_sjwxb_sqdj;//其他渠道目标客户数量本月计划
		xjyy_sjqtqd_sqdj+=yy_sjqtqd_sqdj;//其他渠道收取定金数量本月计划


		xjkh_bylj+=kh_bylj;//目标客户数量本月累计
		xjkh_bzyj+=kh_bzyj;//目标客户数量本周预计
		xjdj_bylj+=dj_bylj;//收取定金本月累计
		xjdj_bzyj+=dj_bzyj;//收取定金本周预计

		xjyy_sjbsjf_bylj+=yy_sjbsjf_bylj;//设计费本月累计
		xjyy_sjbsjf_bzyj+=yy_sjbsjf_bzyj;//设计费本周预计

		xjyy_sjbgccz_bylj+=yy_sjbgccz_bylj;//工程产值本月累计
		xjyy_sjbgccz_bzyj+=yy_sjbgccz_bzyj;//工程产值本周预计

		xjyy_jjbylj+=yy_jjbylj;//主材本月累计
		xjyy_jjbbzyj+=yy_jjbbzyj;//主材本周预计
	     
   %>
  <tr align="center">
	<td ><%=dwmc%></td>

	<td ><%=yy_sjzky_mbkh %></td> 
	<td ><%=kh_bylj%></td>  
	<td ><%=kh_bydcl%>%</td>  
	<td ><%=kh_bzyj%></td>  

	<td ><%=yy_sjzky_sqdj%></td>  
	<td ><%=dj_bylj%></td>  
	<td ><%=dj_bydcl%>%</td>  
	<td ><%=dj_bzyj%></td>  

    <td ><%=yy_sjsjb_sjf%></td> 
	<td ><%=yy_sjbsjf_bylj%></td>  
	<td ><%=sjf_bydcl%>%</td>  
	<td ><%=yy_sjbsjf_bzyj%></td>  

	<td ><%=yy_sjsjb_gccz%></td>  
	<td ><%=yy_sjbgccz_bylj%></td>  
	<td ><%=gc_bydcl%>%</td>  
	<td ><%=yy_sjbgccz_bzyj%></td>  

	<td ><%=yy_sjjjb_byjh%></td>  
	<td ><%=yy_jjbylj%></td>  
	<td ><%=zc_bydcl%>%</td>  
	<td ><%=yy_jjbbzyj%></td>  
</tr> 
<%		 
		 
   }
   rs.close();
   ps.close();

	//目标客户数量-本月达成率	 
	if (xjyy_sjzky_mbkh!=0)
	{
		kh_bydcl=cf.round(xjkh_bylj*100.0/xjyy_sjzky_mbkh,2);
	}
	else{
		kh_bydcl=0;
	}

	//定金-本月达成率	 
	if (xjyy_sjzky_sqdj!=0)
	{
		dj_bydcl=cf.round(xjdj_bylj*100.0/xjyy_sjzky_sqdj,2);
	}
	else{
		dj_bydcl=0;
	}

	//定金-本月达成率	 
	if (xjyy_sjsjb_sjf!=0)
	{
		sjf_bydcl=cf.round(xjyy_sjbsjf_bylj*100.0/xjyy_sjsjb_sjf,2);
	}
	else{
		sjf_bydcl=0;
	}
	//定金-本月达成率	 
	if (xjyy_sjsjb_gccz!=0)
	{
		gc_bydcl=cf.round(xjyy_sjbgccz_bylj*100.0/xjyy_sjsjb_gccz,2);
	}
	else{
		gc_bydcl=0;
	}
	//定金-本月达成率	 
	if (xjyy_sjjjb_byjh!=0)
	{
		zc_bydcl=cf.round(xjyy_jjbylj*100.0/xjyy_sjjjb_byjh,2);
	}
	else{
		zc_bydcl=0;
	}
%>
  <tr align="center">
	<td >小 计</td>

	<td ><%=xjyy_sjzky_mbkh %></td> 
	<td ><%=xjkh_bylj%></td>  
	<td ><%=kh_bydcl%>%</td>  
	<td ><%=xjkh_bzyj%></td>  

	<td ><%=xjyy_sjzky_sqdj%></td>  
	<td ><%=xjdj_bylj%></td>  
	<td ><%=dj_bydcl%>%</td>  
	<td ><%=xjdj_bzyj%></td>  

    <td ><%=xjyy_sjsjb_sjf%></td> 
	<td ><%=xjyy_sjbsjf_bylj%></td>  
	<td ><%=sjf_bydcl%>%</td>  
	<td ><%=xjyy_sjbsjf_bzyj%></td>  

	<td ><%=xjyy_sjsjb_gccz%></td>  
	<td ><%=xjyy_sjbgccz_bylj%></td>  
	<td ><%=gc_bydcl%>%</td>  
	<td ><%=xjyy_sjbgccz_bzyj%></td>  

	<td ><%=xjyy_sjjjb_byjh%></td>  
	<td ><%=xjyy_jjbylj%></td>  
	<td ><%=zc_bydcl%>%</td>  
	<td ><%=xjyy_jjbbzyj%></td>  
</tr> 

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

</table>
</body>

</html>
