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
	xlxj=new double[xlsl];

	for (int i=0;i<xlsl ;i++ )
	{
		xlxj[i]=0;
	}

%>
<center><b>客户材料单统计（<%=fgsmc%>）
<BR>录入日期：（<%=tjsj%>－－<%=tjsj2%>）
</b></center><br>
<table width="<%=(230+xlsl*80+120)%>" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="40"><B>序号</b></td>
		<td width="70"><B>施工队</b></td>
		<td width="120"><B>签约额</b></td>
<%
		//获取标题名称
		String clxlmc="";
		ls_sql="SELECT jxc_clxlbm.cldlmc||'->'||jxc_clxlbm.clxlmc clxlmc";
		ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('2','3') ";
		ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			clxlmc=cf.fillNull(rs.getString("clxlmc"));
			
			%>
			<td width="80" ><B><%=clxlmc%></b></td>
			<%
		}
		rs.close();
		ps.close();
%>
			<td width="90"><B>合 计</b></td>
	</tr>
<%
	String bgcolor="";


	int row=0;

	//取客户
	String khbh=null;
	String hth=null;
	String khxm=null;
	String sgd=null;
	String sgdmc=null;
	String dwmc=null;
	String gcjdmc=null;
	double qye=0;
	ls_sql="select crm_khxx.sgd,sgdmc,sum(NVL(guanlif,0)+NVL(suijin,0)+qye) qye  ";
	ls_sql+=" from jxc_clpsd,crm_khxx,sq_sgd  ";
	ls_sql+=" where jxc_clpsd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and jxc_clpsd.psdzt in('2','3','5') ";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.sgd,sgdmc ";
	ls_sql+=" order by crm_khxx.sgd,sgdmc ";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		sgd=cf.fillNull(rs2.getString("sgd"));
		sgdmc=cf.fillNull(rs2.getString("sgdmc"));
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
			<td ><%=sgdmc%></td>
			<td ><%=qye%></td>
		<%

		double xjpsje=0;

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
			ls_sql+=" from jxc_clpsmx,jxc_clpsd,crm_khxx,sq_sgd  ";
			ls_sql+=" where jxc_clpsmx.psph=jxc_clpsd.psph  ";
			ls_sql+=" and jxc_clpsd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
			ls_sql+=" and jxc_clpsd.psdzt in('2','3','5') ";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
			ls_sql+=wheresql;
			ls_sql+=" and jxc_clpsmx.clxlbm='"+clxlmc+"' ";
			ls_sql+=" and crm_khxx.sgd='"+sgd+"' ";
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

			dlxh++;
		
			%>
				<td ><%=psje%></td>
			<%
		}
		rs.close();
		ps.close();

		//输出客户小计
		xjpsje=cf.doubleTrim(xjpsje);

		%>
			<td ><A HREF="ViewSgdJxc_clpsmx.jsp?sgd=<%=sgd%>&tjsj=<%=tjsj%>&tjsj2=<%=tjsj2%>" target="_blank"><%=xjpsje%></A></td>
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
	<td ><%=cf.formatDouble(zjqye)%></td>
<%
	zjpsje=0;

	//输出小类小计
	for (int i=0;i<xlsl ;i++ )
	{
		xlxj[i]=cf.doubleTrim(xlxj[i]);

		zjpsje+=xlxj[i];

		%>
		<td ><%=cf.formatDouble(xlxj[i])%></td>
		<%
	}

	zjpsje=cf.doubleTrim(zjpsje);
%>
	<td><%=cf.formatDouble(zjpsje)%></td>
</tr>
</table>
</body>
</html>