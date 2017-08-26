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

double zjckje=0;
double zjqye=0;
int zjkhs=0;

int xlsl=0;
double[] xlxj;

try {
	conn=cf.getConnection();


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
<center><b>材料使用比例分析
<BR>实际完工时间：（<%=cksj%>－－<%=cksj2%>）
</b></center><br>
<table width="<%=(700+xlsl*400+550)%>" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="40" rowspan="2"><B>序号</b></td>
		<td width="130" rowspan="2"><B>分公司</b></td>
		<td width="80" rowspan="2"><B>客户数</b></td>
		<td width="120" rowspan="2"><B>签约额</b></td>
<%
		//获取标题名称
		String clxlmc="";
		ls_sql="SELECT jxc_clxlbm.cldlmc||'.'||jxc_clxlbm.clxlmc clxlmc";
		ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('1','3') ";
		ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			clxlmc=cf.fillNull(rs.getString("clxlmc"));
			
			%>
			<td width="400" colspan="4"><B><%=clxlmc%></b></td>
			<%
		}
		rs.close();
		ps.close();
%>
			<td width="480" colspan="4"><B>合 计</b></td>
	</tr>

	<tr bgcolor="CCCCCC" align="center"> 
<%
		//获取标题名称
		ls_sql="SELECT clxlmc";
		ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('1','3') ";
		ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			clxlmc=cf.fillNull(rs.getString("clxlmc"));
			
			%>
			<td width="100"><B>实际用量</b></td>
			<td width="100"><B>材料使用比例</b></td>
			<td width="100"><B>标准比例</b></td>
			<td width="100"><B>差额比例</b></td>
			<%
		}
		rs.close();
		ps.close();
%>
		<td width="120"><B>实际用量</b></td>
		<td width="120"><B>材料使用比例</b></td>
		<td width="120"><B>标准比例</b></td>
		<td width="120"><B>差额比例</b></td>
	</tr>
<%
	String bgcolor="";
	String fgsbh="";
	String fgsmc="";

	int row=0;
	ls_sql="SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwlx='F0' and cxbz='N'";
	if (!fgs.equals(""))
	{
		ls_sql+=" and dwbh='"+fgs+"'";
	}
    ls_sql+=" order by dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		fgsbh=cf.fillNull(rs2.getString("dwbh"));
		fgsmc=cf.fillNull(rs2.getString("dwmc"));


		double qye=0;
		int khs=0;
		ls_sql=" select sum(NVL(guanlif,0)+NVL(suijin,0)+qye),count(*)";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and crm_khxx.gcjdbm in('4','5') ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+cksj+"','YYYY/MM/DD')";
		ls_sql+=" and crm_khxx.sjjgrq<=TO_DATE('"+cksj2+" 23:59:59','YYYY-MM-DD hh24:mi:ss')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qye=rs.getDouble(1);
			khs=rs.getInt(2);
		}
		rs.close();
		ps.close();

		zjqye+=qye;
		zjkhs+=khs;

		double allbzlybl=0;
		double alllyblxx=0;
		double alllyblsx=0;
		ls_sql=" select bzlybl,lyblxx,lyblsx";
		ls_sql+=" FROM sq_dwxx ";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			allbzlybl=rs.getDouble(1);
			alllyblxx=rs.getDouble(2);
			alllyblsx=rs.getDouble(3);
		}
		rs.close();
		ps.close();

	

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
			<td ><A HREF="ViewFgsBlJxc_ckmx.jsp?dwbh=<%=fgsbh%>&cksj=<%=cksj%>&cksj2=<%=cksj2%>" target="_blank"><%=fgsmc%></A></td>
			<td ><%=khs%></td>
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

			double bzlybl=0;
			double lyblxx=0;
			double lyblsx=0;
			ls_sql=" select bzlybl,lyblxx,lyblsx";
			ls_sql+=" from jxc_fclybl";
			ls_sql+=" where dwbh='"+fgsbh+"' and clxlbm='"+clxlbm+"'";
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
			ls_sql+=" from jxc_ckmx,jxc_ckd,crm_khxx  ";
			ls_sql+=" where jxc_ckmx.ckph=jxc_ckd.ckph and jxc_ckd.khbh=crm_khxx.khbh ";
			ls_sql+=" and jxc_ckd.ckdzt='9' ";//9：出库完成
			ls_sql+=" and jxc_ckd.cklx in('P','J') ";//P：材料单出库；J：代金券出库
			ls_sql+=" and jxc_ckmx.clxlbm='"+clxlmc+"' ";
			ls_sql+=" and jxc_ckd.fgsbh='"+fgsbh+"' ";

			ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"' ";
			ls_sql+=" and crm_khxx.gcjdbm in('4','5') ";
			ls_sql+=" and crm_khxx.zt='2'";
			ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+cksj+"','YYYY/MM/DD')";
			ls_sql+=" and crm_khxx.sjjgrq<=TO_DATE('"+cksj2+" 23:59:59','YYYY-MM-DD hh24:mi:ss')";
				
			
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ckje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();


			xjckje+=ckje;//分公司小计
			xjckje=cf.round(xjckje,2);

			zjckje+=ckje;//总计

			xlxj[dlxh]+=ckje;//小类小计

			dlxh++;

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

			%>
				<td ><%=ckje%></td>
				<td ><%=cf.formatDouble(sjbl)%>%</td>
				<td ><%=bzlybl%>%</td>
				<td ><%=cf.formatDouble(cebl)%>%</td>
			<%
		}
		rs.close();
		ps.close();

		//输出客户小计
		double sjbl=0;//材料使用比例
		if (qye==0)
		{
			sjbl=0;
		}
		else{
			sjbl=xjckje*100/qye;
		}
	
		double cebl=0;//差额比例
		if (allbzlybl==0)
		{
			cebl=0;
		}
		else{
			cebl=(sjbl-allbzlybl)*100/allbzlybl;
		}

		%>
			<td ><%=xjckje%></td>
			<td ><%=cf.formatDouble(sjbl)%>%</td>
			<td ><%=allbzlybl%>%</td>
			<td ><%=cf.formatDouble(cebl)%>%</td>
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
	<td colspan="2"><B>总  计</B></td>
	<td ><%=zjkhs%></td>
	<td ><%=cf.formatDouble(zjqye)%></td>
<%
	//输出小类小计
	for (int i=0;i<xlsl ;i++ )
	{
		double sjbl=0;//材料使用比例
		if (zjqye==0)
		{
			sjbl=0;
		}
		else{
			sjbl=xlxj[i]*100/zjqye;
		}
		%>
		<td><%=cf.formatDouble(xlxj[i])%></td>
		<td><%=cf.formatDouble(sjbl)%>%</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<%
	}

	zjckje=cf.doubleTrim(zjckje);

	double sjbl=0;//材料使用比例
	if (zjqye==0)
	{
		sjbl=0;
	}
	else{
		sjbl=zjckje*100/zjqye;
	}
%>
	<td><%=cf.formatDouble(zjckje)%></td>
	<td><%=cf.formatDouble(sjbl)%>%</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
</table>
</body>
</html>