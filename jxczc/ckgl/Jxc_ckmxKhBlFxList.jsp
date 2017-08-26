<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<%
String fgs=request.getParameter("fgs");
String cksj=request.getParameter("cksj");
String cksj2=request.getParameter("cksj2");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String fgsmc=null;

double zjckje=0;
double zjqye=0;
int xlsl=0;

try {
	conn=cf.getConnection();

	double allbzlybl=0;
	double alllyblxx=0;
	double alllyblsx=0;
	ls_sql="SELECT dwmc,bzlybl,lyblxx,lyblsx";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+fgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsmc=rs.getString(1);
		allbzlybl=rs.getDouble(2);
		alllyblxx=rs.getDouble(3);
		alllyblsx=rs.getDouble(4);
	}
	rs.close();
	ps.close();


	//获得小类数量
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
	ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('1','3') ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xlsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xlsl++;

%>
<center><b>客户出库统计（<%=fgsmc%>）
<BR>实际完工时间：（<%=cksj%>－－<%=cksj2%>）
</b></center><br>
<table width="130%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="4%"><B>序号</b></td>
		<td width="8%"><B>合同号</b></td>
		<td width="6%"><B>客户</b></td>
		<td width="5%"><B>施工队</b></td>
		<td width="6%"><B>工程进度</b></td>
		<td width="7%"><B>实际完工时间</b></td>
		<td width="12%"><B>签单店面</b></td>
		<td width="10%"><B>签约额</b></td>
		<td width="15%"><B>材料小类</b></td>
		<td width="9%"><B>实际用量</b></td>
		<td width="6%"><B>材料使用比例</b></td>
		<td width="6%"><B>标准比例</b></td>
		<td width="6%"><B>差额比例</b></td>
	</tr>

<%
	String bgcolor="";


	int row=0;

	//取客户
	String khbh=null;
	String hth=null;
	String khxm=null;
	String sgdmc=null;
	String dwmc=null;
	String gcjdmc=null;
	String sjjgrq=null;
	double qye=0;
	ls_sql="select crm_khxx.khbh,crm_khxx.hth,khxm,sjjgrq,sgdmc,dwmc,gcjdmc,NVL(guanlif,0)+NVL(suijin,0)+qye qye  ";
	ls_sql+=" from crm_khxx,sq_sgd,sq_dwxx,dm_gcjdbm  ";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";

	ls_sql+=" and crm_khxx.fgsbh='"+fgs+"' ";
	ls_sql+=" and crm_khxx.gcjdbm in('4','5') ";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+cksj+"','YYYY/MM/DD')";
	ls_sql+=" and crm_khxx.sjjgrq<=TO_DATE('"+cksj2+" 23:59:59','YYYY-MM-DD hh24:mi:ss')";

	ls_sql+=" order by sgdmc,khxm ";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		khbh=cf.fillNull(rs2.getString("khbh"));
		hth=cf.fillNull(rs2.getString("hth"));
		khxm=cf.fillNull(rs2.getString("khxm"));
		sgdmc=cf.fillNull(rs2.getString("sgdmc"));
		sjjgrq=cf.fillNull(rs2.getDate("sjjgrq"));
		dwmc=cf.fillNull(rs2.getString("dwmc"));
		gcjdmc=cf.fillNull(rs2.getString("gcjdmc"));
		qye=rs2.getDouble("qye");

		zjqye+=qye;



		double xjckje=0;

		String clxlbm=null;
		String clxlmc=null;
		ls_sql="SELECT jxc_clxlbm.clxlbm,jxc_clxlbm.clxlmc";
		ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('1','3') ";
		ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clxlbm=cf.fillNull(rs.getString("clxlbm"));
			clxlmc=cf.fillNull(rs.getString("clxlmc"));

			double bzlybl=0;
			double lyblxx=0;
			double lyblsx=0;
			ls_sql=" select bzlybl,lyblxx,lyblsx";
			ls_sql+=" from jxc_fclybl";
			ls_sql+=" where dwbh='"+fgs+"' and clxlbm='"+clxlbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				bzlybl=rs1.getDouble(1);
				lyblxx=rs1.getDouble(2);
				lyblsx=rs1.getDouble(3);
			}
			rs1.close();
			ps1.close();

			double ckje=0;
			ls_sql="select sum(jxc_ckmx.ckje)  ";
			ls_sql+=" from jxc_ckmx,jxc_ckd  ";
			ls_sql+=" where jxc_ckmx.ckph=jxc_ckd.ckph  ";
			ls_sql+=" and jxc_ckd.ckdzt='9' ";//9：出库完成
			ls_sql+=" and jxc_ckd.cklx in('P','J') ";//P：材料单出库；J：代金券出库
			ls_sql+=" and jxc_ckmx.clxlbm='"+clxlmc+"' ";
			ls_sql+=" and jxc_ckd.khbh='"+khbh+"' ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ckje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			xjckje+=ckje;//客户小计
			zjckje+=ckje;//客户小计

			double sjbl=0;
			if (qye==0)
			{
				sjbl=0;
			}
			else{
				sjbl=ckje*100/qye;
			}
		
			double cebl=0;
			if (bzlybl==0)
			{
				cebl=0;
			}
			else{
				cebl=(sjbl-bzlybl)*100/bzlybl;
			}

		
			row++;

			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}

			%>
			<tr bgcolor="<%=bgcolor%>" align="center">
				<td rowspan="<%=xlsl%>"><%=row%></td>
				<td rowspan="<%=xlsl%>"><A HREF="/dzbj/zxbjmx/Bj_khbjmxDyList.jsp?khbh=<%=khbh%>" target="_blank"><%=hth%></A></td>
				<td rowspan="<%=xlsl%>"><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
				<td rowspan="<%=xlsl%>"><%=sgdmc%></td>
				<td rowspan="<%=xlsl%>"><%=gcjdmc%></td>
				<td rowspan="<%=xlsl%>"><%=sjjgrq%></td>
				<td rowspan="<%=xlsl%>"><%=dwmc%></td>
				<td rowspan="<%=xlsl%>"><%=qye%></td>
				<td ><%=clxlmc%></td>
				<td ><%=ckje%></td>
				<td ><%=cf.formatDouble(sjbl)%>%</td>
				<td ><%=bzlybl%>%</td>
				<td ><%=cf.formatDouble(cebl)%>%</td>
			</tr>
			<%
		}

		while (rs.next())
		{
			clxlbm=cf.fillNull(rs.getString("clxlbm"));
			clxlmc=cf.fillNull(rs.getString("clxlmc"));

			double bzlybl=0;
			double lyblxx=0;
			double lyblsx=0;
			ls_sql=" select bzlybl,lyblxx,lyblsx";
			ls_sql+=" from jxc_fclybl";
			ls_sql+=" where dwbh='"+fgs+"' and clxlbm='"+clxlbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				bzlybl=rs1.getDouble(1);
				lyblxx=rs1.getDouble(2);
				lyblsx=rs1.getDouble(3);
			}
			rs1.close();
			ps1.close();

			double ckje=0;
			ls_sql="select sum(jxc_ckmx.ckje)  ";
			ls_sql+=" from jxc_ckmx,jxc_ckd  ";
			ls_sql+=" where jxc_ckmx.ckph=jxc_ckd.ckph  ";
			ls_sql+=" and jxc_ckd.ckdzt='9' ";//9：出库完成
			ls_sql+=" and jxc_ckd.cklx in('P','J') ";//P：材料单出库；J：代金券出库
			ls_sql+=" and jxc_ckmx.clxlbm='"+clxlmc+"' ";
			ls_sql+=" and jxc_ckd.khbh='"+khbh+"' ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ckje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();


			xjckje+=ckje;//客户小计
			zjckje+=ckje;//客户小计

			double sjbl=0;
			if (qye==0)
			{
				sjbl=0;
			}
			else{
				sjbl=ckje*100/qye;
			}
		
			double cebl=0;
			if (bzlybl==0)
			{
				cebl=0;
			}
			else{
				cebl=(sjbl-bzlybl)*100/bzlybl;
			}

		
			row++;

			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}

			%>
			<tr bgcolor="<%=bgcolor%>" align="center">
				<td ><%=clxlmc%></td>
				<td ><%=ckje%></td>
				<td ><%=cf.formatDouble(sjbl)%>%</td>
				<td ><%=bzlybl%>%</td>
				<td ><%=cf.formatDouble(cebl)%>%</td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		double sjbl=0;
		if (qye==0)
		{
			sjbl=0;
		}
		else{
			sjbl=xjckje*100/qye;
		}
	
		double cebl=0;
		if (allbzlybl==0)
		{
			cebl=0;
		}
		else{
			cebl=(sjbl-allbzlybl)*100/allbzlybl;
		}
		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
			<td ><font color="#0000CC" size="3"><b>合 计</b></font></td>
			<td ><font color="#0000CC" size="3"><b><%=cf.formatDouble(xjckje)%></b></font></td>
			<td ><font color="#0000CC" size="3"><b><%=cf.formatDouble(sjbl)%>%</b></font></td>
			<td ><font color="#0000CC" size="3"><b><%=allbzlybl%>%</b></font></td>
			<td ><font color="#0000CC" size="3"><b><%=cf.formatDouble(cebl)%>%</b></font></td>
		</tr>
		<%
	}
	rs2.close();
	ps2.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close();
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

double sjbl=0;
if (zjqye==0)
{
	sjbl=0;
}
else{
	sjbl=zjckje*100/zjqye;
}
%>

<tr bgcolor="E8E8FF" align="center">
	<td colspan="4"><font color="#990033" size="3"><b>总  计</b></font></td>
	<td colspan="3">&nbsp;</td>
	<td ><font color="#990033" size="3"><b><%=cf.formatDouble(zjqye)%></b></font></td>
	<td >&nbsp;</td>
	<td><font color="#990033" size="3"><b><%=cf.formatDouble(zjckje)%></b></font></td>
	<td ><font color="#990033" size="3"><b><%=cf.formatDouble(sjbl)%>%</b></font></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
</tr>
</table>
</body>
</html>