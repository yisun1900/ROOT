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

	String fgs=cf.GB2Uni(request.getParameter("fgs"));

	String dysj=request.getParameter("dysj");
	String dysj2=request.getParameter("dysj2");

	String getcldlmc=cf.GB2Uni(request.getParameter("cldlmc"));

%>

<center><b>代金券统计
<BR>打印时间：（<%=dysj%>－－<%=dysj2%>）
</b></center><br>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="6%"><B>序号</b></td>
		<td width="20%"><B>材料大类</b></td>
		<td width="9%"><B>签约百分比</b></td>
		<td width="14%"><B>应领取金额</b></td>
		<td width="14%"><B>申请领取金额</b></td>
		<td width="14%"><B>实领取金额</b></td>
		<td width="14%"><B>减免金额</b></td>
		<td width="9%"><B>领取比例</b></td>
	</tr>
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

double zjylqje=0;
double zjsqlqje=0;
double zjsjje=0;
double zjjmje=0;

double lqbl=0;

try {
	conn=cf.getConnection();

	String bgcolor="";


	int row=0;

	String dwbh="";
	String dwmc="";

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
		dwbh=cf.fillNull(rs2.getString("dwbh"));
		dwmc=cf.fillNull(rs2.getString("dwmc"));

		double xjylqje=0;
		double xjsqlqje=0;
		double xjsjje=0;
		double xjjmje=0;

		String cldlmc="";
		double qybfb=0;
		double ylqje=0;
		double sqlqje=0;
		double sjje=0;
		double jmje=0;


		ls_sql=" select cl_djjmx.cldlmc,sum(cl_djjmx.sqlqje),sum(cl_djjmx.sjje)";
		ls_sql+=" from cl_djjmx,cl_djj  ";
		ls_sql+=" where cl_djjmx.czxh=cl_djj.czxh";
		if (!getcldlmc.equals(""))
		{
			ls_sql+=" and cl_djjmx.cldlmc='"+getcldlmc+"' ";
		}
		ls_sql+=" and cl_djj.dysj>=TO_DATE('"+dysj+"','YYYY-MM-DD') and cl_djj.dysj<=TO_DATE('"+dysj2+"','YYYY-MM-DD')";
		ls_sql+=" and cl_djj.dwbh='"+dwbh+"' and cl_djj.czzt='3'  ";
		ls_sql+=" group by cldlmc ";
		ls_sql+=" order by cldlmc ";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			cldlmc=rs1.getString(1);
			sqlqje=rs1.getDouble(2);
			sjje=rs1.getDouble(3);


			ls_sql=" select qybfb,sum(ylqje)";
			ls_sql+=" from ( ";
			ls_sql+=" select distinct cl_djjflmx.khbh,cl_djjflmx.cldlmc,cl_djjflmx.qybfb,cl_djjflmx.ylqje";
			ls_sql+=" from cl_djjflmx,cl_djj  ";
			ls_sql+=" where cl_djjflmx.khbh=cl_djj.khbh";
			ls_sql+=" and cl_djjflmx.cldlmc='"+cldlmc+"' ";
			ls_sql+=" and cl_djj.dysj>=TO_DATE('"+dysj+"','YYYY-MM-DD') and cl_djj.dysj<=TO_DATE('"+dysj2+"','YYYY-MM-DD')";
			ls_sql+=" and cl_djj.dwbh='"+dwbh+"' and cl_djj.czzt='3'  ";
			ls_sql+=" ) ";
			ls_sql+=" group by qybfb";
	//		out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				qybfb=rs.getDouble(1);
				ylqje=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			jmje=ylqje-sjje;
			jmje=cf.doubleTrim(jmje);


			if (ylqje!=0)
			{
				lqbl=sjje/ylqje*100;
			}
			else{
				lqbl=0;
			}

			xjylqje+=ylqje;
			xjsqlqje+=sqlqje;
			xjsjje+=sjje;
			xjjmje+=jmje;

			zjylqje+=ylqje;
			zjsqlqje+=sqlqje;
			zjsjje+=sjje;
			zjjmje+=jmje;

			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}

			row++;
		
			%>
			<tr bgcolor="<%=bgcolor%>" align="center">
				<td ><%=row%></td>
				<td ><%=cldlmc%></td>
				<td ><%=qybfb%>%</td>
				<td ><%=ylqje%></td>
				<td ><%=sqlqje%></td>
				<td ><%=sjje%></td>
				<td ><%=jmje%></td>
				<td ><%=cf.formatDouble(lqbl)%>%</td>
			</tr>
			<%
		}
		rs1.close();
		ps1.close();

		xjylqje=cf.doubleTrim(xjylqje);
		xjsqlqje=cf.doubleTrim(xjsqlqje);
		xjsjje=cf.doubleTrim(xjsjje);
		xjjmje=cf.doubleTrim(xjjmje);

		if (xjylqje!=0)
		{
			lqbl=xjsjje/xjylqje*100;
		}
		else{
			lqbl=0;
		}

		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="3"><B>[<%=dwmc%>]小计</B></td>
			<td ><%=xjylqje%></td>
			<td ><%=xjsqlqje%></td>
			<td ><%=xjsjje%></td>
			<td ><%=xjjmje%></td>
			<td ><%=cf.formatDouble(lqbl)%>%</td>
		</tr>
		<%
	}
	rs2.close();
	ps2.close();

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
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

zjylqje=cf.doubleTrim(zjylqje);
zjsqlqje=cf.doubleTrim(zjsqlqje);
zjsjje=cf.doubleTrim(zjsjje);
zjjmje=cf.doubleTrim(zjjmje);

if (zjylqje!=0)
{
	lqbl=zjsjje/zjylqje*100;
}
else{
	lqbl=0;
}

%>

<tr bgcolor="E8E8FF" align="center">
	<td colspan="3"><B>总  计</B></td>
	<td ><%=zjylqje%></td>
	<td ><%=zjsqlqje%></td>
	<td ><%=zjsjje%></td>
	<td ><%=zjjmje%></td>
	<td ><%=cf.formatDouble(lqbl)%>%</td>
</tr>
</table>
</body>
</html>