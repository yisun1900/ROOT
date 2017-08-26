<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<%
String wheresql="";

String fgs=request.getParameter("fgs");
String cksj=request.getParameter("cksj");
String cksj2=request.getParameter("cksj2");
wheresql+="  and (jxc_ckd.cksj>=TO_DATE('"+cksj+"','YYYY/MM/DD'))";
wheresql+="  and (jxc_ckd.cksj<=TO_DATE('"+cksj2+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
wheresql+="  and jxc_ckd.fgsbh='"+fgs+"'";


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
double[] xlxj;

try {
	conn=cf.getConnection();

	ls_sql="SELECT dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+fgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsmc=rs.getString(1);
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

	//小类小计保存到数组种
	xlxj=new double[xlsl];

	for (int i=0;i<xlsl ;i++ )
	{
		xlxj[i]=0;
	}

%>
<center><b>客户出库统计（<%=fgsmc%>）
<BR>出库时间：（<%=cksj%>－－<%=cksj2%>）
</b></center><br>
<table width="<%=(610+xlsl*120+220)%>" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="40"><B>序号</b></td>
		<td width="90"><B>合同号</b></td>
		<td width="120"><B>客户</b></td>
		<td width="70"><B>施工队</b></td>
		<td width="70"><B>工程进度</b></td>
		<td width="200"><B>签单店面</b></td>
		<td width="120"><B>签约额</b></td>
<%
		//获取标题名称
		String clxlmc="";
		ls_sql="SELECT jxc_clxlbm.cldlmc||'->'||jxc_clxlbm.clxlmc clxlmc";
		ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('1','3') ";
		ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			clxlmc=cf.fillNull(rs.getString("clxlmc"));
			
			%>
			<td width="120" ><B><%=clxlmc%></b></td>
			<%
		}
		rs.close();
		ps.close();
%>
			<td width="120"><B>合 计</b></td>
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
	double qye=0;
	ls_sql="select distinct jxc_ckd.khbh,crm_khxx.hth,khxm,sgdmc,dwmc,gcjdmc,NVL(guanlif,0)+NVL(suijin,0)+qye qye  ";
	ls_sql+=" from jxc_ckd,crm_khxx,sq_sgd,sq_dwxx,dm_gcjdbm  ";
	ls_sql+=" where jxc_ckd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and jxc_ckd.ckdzt='9' ";//9：出库完成
	ls_sql+=" and jxc_ckd.cklx in('P','J') ";//P：材料单出库；J：代金券出库
	ls_sql+=wheresql;
	ls_sql+=" order by sgdmc,khxm ";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		khbh=cf.fillNull(rs2.getString("khbh"));
		hth=cf.fillNull(rs2.getString("hth"));
		khxm=cf.fillNull(rs2.getString("khxm"));
		sgdmc=cf.fillNull(rs2.getString("sgdmc"));
		dwmc=cf.fillNull(rs2.getString("dwmc"));
		gcjdmc=cf.fillNull(rs2.getString("gcjdmc"));
		qye=rs2.getDouble("qye");

		zjqye+=qye;

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
			<td ><%=row%></td>
			<td><A HREF="/dzbj/zxbjmx/Bj_khbjmxDyList.jsp?khbh=<%=khbh%>" target="_blank"><%=hth%></A></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td ><%=sgdmc%></td>
			<td ><%=gcjdmc%></td>
			<td ><%=dwmc%></td>
			<td ><%=qye%></td>
		<%

		double xjckje=0;

		int dlxh=0;//小类序号
		String clxlbm=null;
		ls_sql="SELECT jxc_clxlbm.clxlbm,jxc_clxlbm.clxlmc";
		ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('1','3') ";
		ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			clxlbm=cf.fillNull(rs.getString("clxlbm"));
			clxlmc=cf.fillNull(rs.getString("clxlmc"));


			double ckje=0;
			ls_sql="select sum(jxc_ckmx.ckje)  ";
			ls_sql+=" from jxc_ckmx,jxc_ckd  ";
			ls_sql+=" where jxc_ckmx.ckph=jxc_ckd.ckph  ";
			ls_sql+=" and jxc_ckd.ckdzt='9' ";//9：出库完成
			ls_sql+=" and jxc_ckd.cklx in('P','J') ";//P：材料单出库；J：代金券出库
			ls_sql+=wheresql;
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

			xlxj[dlxh]+=ckje;//小类小计

			dlxh++;
		
			%>
				<td ><%=ckje%></td>
			<%
		}
		rs.close();
		ps.close();

		//输出客户小计
		xjckje=cf.doubleTrim(xjckje);

		%>
			<td ><A HREF="ViewKhJxc_ckmx.jsp?khbh=<%=khbh%>&cksj=<%=cksj%>&cksj2=<%=cksj2%>" target="_blank"><%=xjckje%></A></td>
		<%


		%>
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

%>

<tr bgcolor="E8E8FF" align="center">
	<td colspan="4"><B>总  计</B></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=cf.formatDouble(zjqye)%></td>
<%
	zjckje=0;

	//输出小类小计
	for (int i=0;i<xlsl ;i++ )
	{
		xlxj[i]=cf.doubleTrim(xlxj[i]);

		zjckje+=xlxj[i];

		%>
		<td ><%=cf.formatDouble(xlxj[i])%></td>
		<%
	}

	zjckje=cf.doubleTrim(zjckje);
%>
	<td><%=cf.formatDouble(zjckje)%></td>
</tr>
</table>
</body>
</html>