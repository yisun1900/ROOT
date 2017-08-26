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
String tjsj=request.getParameter("tjsj");
String tjsj2=request.getParameter("tjsj2");
wheresql+="  and (jxc_clpsd.lrrq>=TO_DATE('"+tjsj+"','YYYY/MM/DD'))";
wheresql+="  and (jxc_clpsd.lrrq<=TO_DATE('"+tjsj2+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
wheresql+="  and jxc_clpsd.ssfgs='"+fgs+"'";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String fgsmc=null;

double zjpsje=0;
double zjqye=0;
double zjallbzlyje=0;
double zjalllyxxje=0;
double zjalllysxje=0;

int xlsl=0;
double[] xlbzxj;
double[] xlxxxj;
double[] xlsxxj;
double[] xlxj;
double[] ckxlxj;//出库小类小计

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
	ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('2','3') ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xlsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//小类小计保存到数组种
	xlbzxj=new double[xlsl];
	xlxxxj=new double[xlsl];
	xlsxxj=new double[xlsl];
	xlxj=new double[xlsl];
	ckxlxj=new double[xlsl];

	for (int i=0;i<xlsl ;i++ )
	{
		xlbzxj[i]=0;
		xlxxxj[i]=0;
		xlsxxj[i]=0;
		xlxj[i]=0;
		ckxlxj[i]=0;
	}

%>
<center><b>客户材料单统计（<%=fgsmc%>）
<BR>录入日期：（<%=tjsj%>－－<%=tjsj2%>）
</b></center><br>
<table width="<%=(700+xlsl*280+360)%>" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="40" rowspan="2"><B>序号</b></td>
		<td width="90" rowspan="2"><B>合同号</b></td>
		<td width="140" rowspan="2"><B>&nbsp;&nbsp;客&nbsp;&nbsp;户&nbsp;&nbsp;</b></td>
		<td width="80" rowspan="2"><B>施工队</b></td>
		<td width="80" rowspan="2"><B>工程进度</b></td>
		<td width="150" rowspan="2"><B>签单店面</b></td>
		<td width="120" rowspan="2"><B>签约额</b></td>
<%
		//获取标题名称
		String clxlmc="";
		ls_sql="SELECT jxc_clxlbm.cldlmc||'.'||jxc_clxlbm.clxlmc clxlmc";
		ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('2','3') ";
		ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			clxlmc=cf.fillNull(rs.getString("clxlmc"));
			
			%>
			<td width="280" colspan="4"><B><%=clxlmc%></b></td>
			<%
		}
		rs.close();
		ps.close();
%>
			<td width="360" colspan="4"><B>合 计</b></td>
	</tr>

	<tr bgcolor="CCCCCC" align="center"> 
<%
		//获取标题名称
		ls_sql="SELECT clxlmc";
		ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('2','3') ";
		ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			clxlmc=cf.fillNull(rs.getString("clxlmc"));
			
			%>
			<td width="80"><B>材料单金额</b></td>
			<td width="60"><B>比例</b></td>
			<td width="80"><B>出库金额</b></td>
			<td width="60"><B>比例</b></td>
			<%
		}
		rs.close();
		ps.close();
%>
		<td width="100"><B>材料单金额</b></td>
		<td width="80"><B>比例</b></td>
		<td width="100"><B>出库金额</b></td>
		<td width="80"><B>比例</b></td>
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
	ls_sql="select distinct jxc_clpsd.khbh,crm_khxx.hth,khxm,sgdmc,dwmc,gcjdmc,NVL(guanlif,0)+NVL(suijin,0)+qye qye  ";
	ls_sql+=" from jxc_clpsd,crm_khxx,sq_sgd,sq_dwxx,dm_gcjdbm  ";
	ls_sql+=" where jxc_clpsd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and jxc_clpsd.psdzt in('2','3','5') ";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
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

		double sgcbj=0;
		double zxsgcbj=0;
		ls_sql=" select sgcbj,zxsgcbj";
		ls_sql+=" from crm_khqye";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sgcbj=rs.getDouble("sgcbj");
			zxsgcbj=rs.getDouble("zxsgcbj");
		}
		rs.close();
		ps.close();

		double allbzlyje=0;
		double alllyxxje=0;
		double alllysxje=0;
		ls_sql=" select ROUND(bzlybl/100*"+zxsgcbj+",2),ROUND(lyblxx/100*"+zxsgcbj+",2),ROUND(lyblsx/100*"+zxsgcbj+",2)";
		ls_sql+=" FROM sq_dwxx ";
		ls_sql+=" where dwbh='"+fgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			allbzlyje=rs.getDouble(1);
			alllyxxje=rs.getDouble(2);
			alllysxje=rs.getDouble(3);
		}
		rs.close();
		ps.close();

		zjallbzlyje+=allbzlyje;
		zjalllyxxje+=alllyxxje;
		zjalllysxje+=alllysxje;


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

		double xjpsje=0;
		double xjckje=0;

		int dlxh=0;//小类序号
		String clxlbm=null;
		ls_sql="SELECT jxc_clxlbm.clxlbm,jxc_clxlbm.clxlmc";
		ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('2','3') ";
		ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			clxlbm=cf.fillNull(rs.getString("clxlbm"));
			clxlmc=cf.fillNull(rs.getString("clxlmc"));

			
			double psje=0;
			ls_sql="select sum(jxc_clpsmx.psje)  ";
			ls_sql+=" from jxc_clpsmx,jxc_clpsd  ";
			ls_sql+=" where jxc_clpsmx.psph=jxc_clpsd.psph  ";
			ls_sql+=" and jxc_clpsd.psdzt in('2','3','5') ";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
			ls_sql+=wheresql;
			ls_sql+=" and jxc_clpsmx.clxlbm='"+clxlmc+"' ";
			ls_sql+=" and jxc_clpsd.khbh='"+khbh+"' ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				psje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();


			xjpsje+=psje;//客户小计

			
			xlxj[dlxh]+=psje;//小类小计


           
			double ckje=0;
			ls_sql="select sum(jxc_ckmx.ckje)  ";
			ls_sql+=" from jxc_ckmx,jxc_ckd  ";
			ls_sql+=" where jxc_ckmx.ckph=jxc_ckd.ckph  ";
			ls_sql+=" and jxc_ckd.ckdzt='9' ";//9：出库完成
			ls_sql+=" and jxc_ckd.cklx in('P','J') ";//P：材料单出库；J：代金券出库
//			ls_sql+=wheresql;
			ls_sql+=" and jxc_ckmx.clxlbm='"+clxlmc+"' ";
			ls_sql+=" and jxc_ckd.khbh='"+khbh+"' ";
//			out.println(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ckje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			ckxlxj[dlxh]+=ckje;//小类小计

			xjckje+=ckje;//客户小计
		
			dlxh++;
			%>
				<td ><%=psje%></td>
				<td ><%=cf.formatDouble(100*psje/qye)%>%</td>
				<td ><%=ckje%></td>
			    <td ><%=cf.formatDouble(100*ckje/qye)%>%</td>
			<%
		}
		rs.close();
		ps.close();

		//输出客户材料单小计
		xjpsje=cf.doubleTrim(xjpsje);
       //输出客户出库小计
		xjckje=cf.doubleTrim(xjckje);

		%>
			<td ><A HREF="ViewKhJxc_clpsmx.jsp?khbh=<%=khbh%>&tjsj=<%=tjsj%>&tjsj2=<%=tjsj2%>" target="_blank"><%=xjpsje%></A></td>
			<td ><%=cf.formatDouble(100*xjpsje/qye)%>%</td>
			<td ><A HREF="ViewKhJxc_ckmx.jsp?khbh=<%=khbh%>" target="_blank"><%=xjckje%></td>
			<td ><%=cf.formatDouble(100*xjckje/qye)%>%</td>
			
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
	zjpsje=0;
	double zjckje=0;

	//输出小类小计
	for (int i=0;i<xlsl ;i++ )
	{
		xlxj[i]=cf.doubleTrim(xlxj[i]);
		ckxlxj[i]=cf.doubleTrim(ckxlxj[i]);
		zjpsje+=xlxj[i];
		zjckje+=ckxlxj[i];

		%>
		<td ><%=cf.formatDouble(xlxj[i])%></td>
		<td >&nbsp;</td>
		<td ><%=cf.formatDouble(ckxlxj[i])%></td>
		<td >&nbsp;</td>
		
		<%
	}

	zjpsje=cf.doubleTrim(zjpsje);
	zjckje=cf.doubleTrim(zjckje);
%>
	<td><%=cf.formatDouble(zjpsje)%></td>
	<td >&nbsp;</td>
	<td><%=cf.formatDouble(zjckje)%></td>
	<td >&nbsp;</td>
	</tr>
</table>
</body>
</html>