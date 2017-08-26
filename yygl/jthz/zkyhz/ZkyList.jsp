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

<div align="center">总客源汇总</div>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
<tr>
 <td width="11%" height="28" align="right">上周日期：</td>
 <td width="20%"><%=yy_rqsd_szs%> 至 <%=yy_rqsd_sze%></td>
<td width="11%" align="right">本周日期：</td>
 <td width="20%" ><%=yy_rqsd_bzs%> 至 <%=yy_rqsd_bze%></td>
 <td width="38%" >&nbsp;</td>

  </tr>
</table>
<table width="100%" height="144" border="1"  cellpadding="0" cellspacing="0" style="FONT-SIZE:12">
	  <tr height=28  align="center" bgcolor="#CCCCCC"  >
	  <td width="66" rowspan=2 align="center">分公司</td>
	  <td height="22" colspan=7 align="center">目标客户数量</td>
	  <td colspan=8 align="center">收取定金数量</td>
	  </tr>
	  <tr bgcolor="#CCCCCC"   align="center">
	  <td  width="60"  >本月计划</td>
	  <td  width="60"  >本月计划<br>(集团要求)</td>
	  <td  width="60" >本月累计</td>
	  <td  width="60" >本月达成率</td>
	  <td  width="60" >上周计划</td>
	  <td  width="60" >上周完成</td>
	  <td  width="60" >本周预计</td>
	  <td  width="60"  >本月计划</td>
	  <td  width="60"  >本月计划<br>(集团要求)</td>
	  <td  width="60" >本月累计</td>
	  <td  width="60" >本月达成率</td>
	  <td  width="60" >本月定金成功率</td>
	  <td  width="60" >上周计划</td>
	  <td  width="60" >上周完成</td>
	  <td  width="60" >本周预计</td>
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


	int xjkh_byjh=0;//目标客户数量本月计划
	int xjkh_bylj=0;//目标客户数量本月累计
	int xjkh_szjh=0;//目标客户数量上周计划
	int xjkh_szwc=0;//目标客户数量上周完成
	int xjkh_bzyj=0;//目标客户数量本周预计

	int xjdj_byjh=0;//收取定金本月计划
	int xjdj_bylj=0;//收取定金本月累计
	int xjdj_szjh=0;//收取定金上周计划
	int xjdj_szwc=0;//收取定金上周完成
	int xjdj_bzyj=0;//收取定金本周预计


	//目标客户数量-本月达成率	 
	double kh_bydcl=0;
	//定金-本月达成率	 
	double dj_bydcl=0;
	//本月定金成功率
	double djcgl=0;

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
	  
		int yy_scbkh_byjh=0;//目标客户数量本月计划
		int yy_scbkh_bylj=0;//目标客户数量本月累计
		int yy_scbkh_szjh=0;//目标客户数量上周计划
		int yy_scbkh_szwc=0;//目标客户数量上周完成
		int yy_scbkh_bzyj=0;//目标客户数量本周预计

		int yy_scbdj_byjh=0;//收取定金本月计划
		int yy_scbdj_bylj=0;//收取定金本月累计
		int yy_scbdj_szjh=0;//收取定金上周计划
		int yy_scbdj_szwc=0;//收取定金上周完成
		int yy_scbdj_bzjh=0;//收取定金本周预计
		ls_sql="select sum(yy_scbkh_byjh),sum(yy_scbkh_bylj),sum(yy_scbkh_szjh),sum(yy_scbkh_szwc),sum(yy_scbkh_bzyj) ";
		ls_sql+="     ,sum(yy_scbdj_byjh),sum(yy_scbdj_bylj),sum(yy_scbdj_szjh),sum(yy_scbdj_szwc),sum(yy_scbdj_bzjh)";
		ls_sql+=" from yy_scb ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_scbkh_byjh=rs1.getInt(1);
			yy_scbkh_bylj=rs1.getInt(2);
			yy_scbkh_szjh=rs1.getInt(3);
			yy_scbkh_szwc=rs1.getInt(4);
			yy_scbkh_bzyj=rs1.getInt(5);

			yy_scbdj_byjh=rs1.getInt(6);
			yy_scbdj_bylj=rs1.getInt(7);
			yy_scbdj_szjh=rs1.getInt(8);
			yy_scbdj_szwc=rs1.getInt(9);
			yy_scbdj_bzjh=rs1.getInt(10);
		}
		rs1.close();
		ps1.close();
	  
		int yy_wxbkh_byjh=0;//目标客户数量本月计划
		int yy_wxbkh_bylj=0;//目标客户数量本月累计
		int yy_wxbkh_szjh=0;//目标客户数量上周计划
		int yy_wxbkh_szwc=0;//目标客户数量上周完成
		int yy_wxbkh_bzyj=0;//目标客户数量本周预计

		int yy_wxbdj_byjh=0;//收取定金本月计划
		int yy_wxbdj_bylj=0;//收取定金本月累计
		int yy_wxbdj_szjh=0;//收取定金上周计划
		int yy_wxbdj_szwc=0;//收取定金上周完成
		int yy_wxbdj_bzjh=0;//收取定金本周预计
		ls_sql="select sum(yy_wxbkh_byjh),sum(yy_wxbkh_bylj),sum(yy_wxbkh_szjh),sum(yy_wxbkh_szwc),sum(yy_wxbkh_bzyj) ";
		ls_sql+="     ,sum(yy_wxbdj_byjh),sum(yy_wxbdj_bylj),sum(yy_wxbdj_szjh),sum(yy_wxbdj_szwc),sum(yy_wxbdj_bzjh)";
		ls_sql+=" from yy_wxb ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_wxbkh_byjh=rs1.getInt(1);
			yy_wxbkh_bylj=rs1.getInt(2);
			yy_wxbkh_szjh=rs1.getInt(3);
			yy_wxbkh_szwc=rs1.getInt(4);
			yy_wxbkh_bzyj=rs1.getInt(5);

			yy_wxbdj_byjh=rs1.getInt(6);
			yy_wxbdj_bylj=rs1.getInt(7);
			yy_wxbdj_szjh=rs1.getInt(8);
			yy_wxbdj_szwc=rs1.getInt(9);
			yy_wxbdj_bzjh=rs1.getInt(10);
		}
		rs1.close();
		ps1.close();
	  
		int yy_qtqdkh_byjh=0;//目标客户数量本月计划
		int yy_qtqdkh_bylj=0;//目标客户数量本月累计
		int yy_qtqdkh_szjh=0;//目标客户数量上周计划
		int yy_qtqdkh_szwc=0;//目标客户数量上周完成
		int yy_qtqdkh_bzyj=0;//目标客户数量本周预计

		int yy_qtqddj_byjh=0;//收取定金本月计划
		int yy_qtqddj_bylj=0;//收取定金本月累计
		int yy_qtqddj_szjh=0;//收取定金上周计划
		int yy_qtqddj_szwc=0;//收取定金上周完成
		int yy_qtqddj_bzyj=0;//收取定金本周预计
		ls_sql="select sum(yy_qtqdkh_byjh),sum(yy_qtqdkh_bylj),sum(yy_qtqdkh_szjh),sum(yy_qtqdkh_szwc),sum(yy_qtqdkh_bzyj) ";
		ls_sql+="     ,sum(yy_qtqddj_byjh),sum(yy_qtqddj_bylj),sum(yy_qtqddj_szjh),sum(yy_qtqddj_szwc),sum(yy_qtqddj_bzyj)";
		ls_sql+=" from yy_qtqd ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			yy_qtqdkh_byjh=rs1.getInt(1);
			yy_qtqdkh_bylj=rs1.getInt(2);
			yy_qtqdkh_szjh=rs1.getInt(3);
			yy_qtqdkh_szwc=rs1.getInt(4);
			yy_qtqdkh_bzyj=rs1.getInt(5);

			yy_qtqddj_byjh=rs1.getInt(6);
			yy_qtqddj_bylj=rs1.getInt(7);
			yy_qtqddj_szjh=rs1.getInt(8);
			yy_qtqddj_szwc=rs1.getInt(9);
			yy_qtqddj_bzyj=rs1.getInt(10);
		}
		rs1.close();
		ps1.close();



		int kh_byjh=yy_scbkh_byjh+yy_wxbkh_byjh+yy_qtqdkh_byjh;//目标客户数量本月计划
		int kh_bylj=yy_scbkh_bylj+yy_wxbkh_bylj+yy_qtqdkh_bylj;//目标客户数量本月累计
		int kh_szjh=yy_scbkh_szjh+yy_wxbkh_szjh+yy_qtqdkh_szjh;//目标客户数量上周计划
		int kh_szwc=yy_scbkh_szwc+yy_wxbkh_szwc+yy_qtqdkh_szwc;//目标客户数量上周完成
		int kh_bzyj=yy_scbkh_bzyj+yy_wxbkh_bzyj+yy_qtqdkh_bzyj;//目标客户数量本周预计

		int dj_byjh=yy_scbdj_byjh+yy_wxbdj_byjh+yy_qtqddj_byjh;//收取定金本月计划
		int dj_bylj=yy_scbdj_bylj+yy_wxbdj_bylj+yy_qtqddj_bylj;//收取定金本月累计
		int dj_szjh=yy_scbdj_szjh+yy_wxbdj_szjh+yy_qtqddj_szjh;//收取定金上周计划
		int dj_szwc=yy_scbdj_szwc+yy_wxbdj_szwc+yy_qtqddj_szwc;//收取定金上周完成
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

		//本月定金成功率
		if (kh_bylj!=0)
		{
			djcgl=cf.round(dj_bylj*100.0/kh_bylj,2);
		}
		else{
			djcgl=0;
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


		xjkh_byjh+=kh_byjh;//目标客户数量本月计划
		xjkh_bylj+=kh_bylj;//目标客户数量本月累计
		xjkh_szjh+=kh_szjh;//目标客户数量上周计划
		xjkh_szwc+=kh_szwc;//目标客户数量上周完成
		xjkh_bzyj+=kh_bzyj;//目标客户数量本周预计

		xjdj_byjh+=dj_byjh;//收取定金本月计划
		xjdj_bylj+=dj_bylj;//收取定金本月累计
		xjdj_szjh+=dj_szjh;//收取定金上周计划
		xjdj_szwc+=dj_szwc;//收取定金上周完成
		xjdj_bzyj+=dj_bzyj;//收取定金本周预计

   %>
  <tr align="center">
	<td ><%=dwmc%></td>

	<td ><%=kh_byjh%></td> 
	<td ><%=yy_sjzky_mbkh %></td> 
	<td ><%=kh_bylj%></td>  
	<td ><%=kh_bydcl%>%</td>  
	<td ><%=kh_szjh%></td>  
	<td ><%=kh_szwc%></td>  
	<td ><%=kh_bzyj%></td>  

	<td ><%=dj_byjh%></td>  
	<td ><%=yy_sjzky_sqdj%></td>  
	<td ><%=dj_bylj%></td>  
	<td ><%=dj_bydcl%>%</td>  
	<td ><%=djcgl%>%</td>  
	<td ><%=dj_szjh%></td>  
	<td ><%=dj_szwc%></td>  
	<td ><%=dj_bzyj%></td>  
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
	   
	//本月定金成功率
	if (xjkh_bylj!=0)
	{
		djcgl=cf.round(xjdj_bylj*100.0/xjkh_bylj,2);
	}
	else{
		djcgl=0;
	}
%>
  <tr align="center">
	<td >小 计</td>

	<td ><%=xjkh_byjh%></td> 
	<td ><%=xjyy_sjzky_mbkh %></td> 
	<td ><%=xjkh_bylj%></td>  
	<td ><%=kh_bydcl%>%</td>  
	<td ><%=xjkh_szjh%></td>  
	<td ><%=xjkh_szwc%></td>  
	<td ><%=xjkh_bzyj%></td>  

	<td ><%=xjdj_byjh%></td>  
	<td ><%=xjyy_sjzky_sqdj%></td>  
	<td ><%=xjdj_bylj%></td>  
	<td ><%=dj_bydcl%>%</td>  
	<td ><%=djcgl%>%</td>  
	<td ><%=xjdj_szjh%></td>  
	<td ><%=xjdj_szwc%></td>  
	<td ><%=xjdj_bzyj%></td>  
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
</tr> 
</table>
</body>

</html>
