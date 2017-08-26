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

	String sjwjrq=request.getParameter("sjwjrq");
	String sjwjrq2=request.getParameter("sjwjrq2");
	String sfwj=request.getParameter("sfwj");//类型

%>

<center><b>材料统计
<%
		if(sfwj.equals("5")){%>
	<BR>完结时间：（<%=sjwjrq%>－－<%=sjwjrq2%>）
		<%}
		else if(sfwj.equals("4")){%>
	<BR>完工时间：（<%=sjwjrq%>－－<%=sjwjrq2%>）

		<%}
%>

</b></center><br>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="5%"><B>序号</b></td>
		<td width="19%"><B>材料大类</b></td>
		<td width="13%"><B>应领取金额</b></td>
		<td width="13%"><B>实领取金额</b></td>
		<td width="8%"><B>结算工地数</b></td>
		<td width="13%"><B>签约额</b></td>
		<td width="8%"><B>减免工地数</b></td>
		<td width="13%"><B>减免金额</b></td>
		<td width="8%"><B>领取比例</b></td>
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
int zjjssl=0;
double zjjsje=0;
int zjjmsl=0;
double zjjmje=0;
double qye=0;
double xjqye=0;
double allqye=0;

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
		int xjjssl=0;
		double xjjsje=0;
		double xjjmje=0;
		int xjjmsl=0;

		String cldlmc="";
		double qybfb=0;
		double ylqje=0;
		double sqlqje=0;
		double sjje=0;
		int jssl=0;
		double jsje=0;
		int jmsl=0;
		double jmje=0;
		xjqye=0;

		ls_sql="select count(crm_khxx.khbh),sum(crm_khxx.khjsje)";
		ls_sql+=" from crm_khxx  ";
		if(sfwj.equals("5")){
		ls_sql+=" where crm_khxx.fgsbh='"+dwbh+"' and crm_khxx.gcjdbm='5' ";
		ls_sql+=" and crm_khxx.sjwjrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjwjrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
		}
		else if(sfwj.equals("4")){
		ls_sql+=" where crm_khxx.fgsbh='"+dwbh+"' and crm_khxx.gcjdbm='4' ";
		ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjjgrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
		}

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xjjssl=rs.getInt(1);
			xjjsje=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		ls_sql="select count(distinct cl_djjflmx.khbh)";
		ls_sql+=" from cl_djjflmx,crm_khxx  ";
		ls_sql+=" where cl_djjflmx.khbh=crm_khxx.khbh ";
		if(sfwj.equals("5")){
		ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and crm_khxx.gcjdbm='5' ";
		ls_sql+=" and crm_khxx.sjwjrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjwjrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
		}
		else if(sfwj.equals("4")){
		ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and crm_khxx.gcjdbm='4' ";
		ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjjgrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
		}
		ls_sql+=" and cl_djjflmx.ylqje>cl_djjflmx.sjje ";
		ls_sql+=" and cl_djjflmx.ylqje*0.98>cl_djjflmx.sjje ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xjjmsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(cl_djjflmx.ylqje-cl_djjflmx.sjje)";
		ls_sql+=" from cl_djjflmx,crm_khxx  ";
		ls_sql+=" where cl_djjflmx.khbh=crm_khxx.khbh ";
		if(sfwj.equals("5")){
		ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and crm_khxx.gcjdbm='5' ";
		ls_sql+=" and crm_khxx.sjwjrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjwjrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
		}
		else if(sfwj.equals("4")){
		ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and crm_khxx.gcjdbm='4' ";
		ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjjgrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xjjmje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		zjjssl+=xjjssl;
		zjjsje+=xjjsje;
		zjjmsl+=xjjmsl;
		zjjmje+=xjjmje;



		ls_sql="select cl_djjflmx.cldlmc,cl_djjflmx.qybfb,sum(cl_djjflmx.ylqje),sum(cl_djjflmx.sqlqje),sum(cl_djjflmx.sjje),sum(cl_djjflmx.ylqje-cl_djjflmx.sjje),sum(crm_khxx.qye)  ";
		ls_sql+=" from cl_djjflmx,crm_khxx  ";
		ls_sql+=" where cl_djjflmx.khbh=crm_khxx.khbh ";
		if(sfwj.equals("5")){
		ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and crm_khxx.gcjdbm='5' ";
		ls_sql+=" and crm_khxx.sjwjrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjwjrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
		}
		else if(sfwj.equals("4")){
		ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and crm_khxx.gcjdbm='4' ";
		ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjjgrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
		}

		ls_sql+=" group by cl_djjflmx.cldlmc,cl_djjflmx.qybfb ";
		ls_sql+=" order by cl_djjflmx.cldlmc ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			cldlmc=rs1.getString(1);
			qybfb=rs1.getDouble(2);
			ylqje=rs1.getDouble(3);
			sqlqje=rs1.getDouble(4);
			sjje=rs1.getDouble(5);
			jmje=rs1.getDouble(6);
			qye=rs1.getDouble(7);

/*
			jssl=0;
			jsje=0;
			ls_sql="select count(khbh),sum(khjsje)";
			ls_sql+=" from ( ";
			ls_sql+=" select distinct crm_khxx.khbh,crm_khxx.khjsje";
			ls_sql+=" from cl_djjflmx,crm_khxx  ";
			ls_sql+=" where cl_djjflmx.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and crm_khxx.gcjdbm='5' ";
			ls_sql+=" and crm_khxx.sjwjrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjwjrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
			ls_sql+=" and cl_djjflmx.cldlmc='"+cldlmc+"' ";
			ls_sql+=" ) ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				jssl=rs.getInt(1);
				jsje=rs.getDouble(2);
			}
			rs.close();
			ps.close();
*/

			jmsl=0;
			ls_sql="select count(distinct cl_djjflmx.khbh)";
			ls_sql+=" from cl_djjflmx,crm_khxx  ";
			ls_sql+=" where cl_djjflmx.khbh=crm_khxx.khbh ";
			if(sfwj.equals("5")){
			ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and crm_khxx.gcjdbm='5' ";
			ls_sql+=" and crm_khxx.sjwjrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjwjrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
			}
			else if(sfwj.equals("4")){
			ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and crm_khxx.gcjdbm='4' ";
			ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjjgrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
			}
			ls_sql+=" and cl_djjflmx.cldlmc='"+cldlmc+"' ";
			ls_sql+=" and cl_djjflmx.ylqje*0.98>cl_djjflmx.sjje ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				jmsl=rs.getInt(1);
			}
			rs.close();
			ps.close();


			if (qye!=0)
			{
				lqbl=sjje/qye*100;
			}
			else{
				lqbl=0;
			}

			xjqye+=qye;
			allqye+=qye;
				
			xjylqje+=ylqje;
			xjsqlqje+=sqlqje;
			xjsjje+=sjje;

			zjylqje+=ylqje;
			zjsqlqje+=sqlqje;
			zjsjje+=sjje;

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
				<td ><%=ylqje%></td>
				<td ><%=sjje%></td>
				<td ><%=xjjssl%></td>
				<td ><%=qye%></td>
				<td ><%=jmsl%></td>
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
		xjjsje=cf.doubleTrim(xjjsje);
		xjjmje=cf.doubleTrim(xjjmje);
		xjqye=cf.doubleTrim(xjqye);

		if (xjqye!=0)
		{
			lqbl=xjsjje/xjqye*100;
		}
		else{
			lqbl=0;
		}

		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="2"><B>[<%=dwmc%>]小计</B></td>
			<td ><%=xjylqje%></td>
			<td ><%=xjsjje%></td>
			<td ><%=xjjssl%></td>
			<td ><%=xjqye%></td>
			<td ><%=xjjmsl%></td>
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
zjjsje=cf.doubleTrim(zjjsje);
zjjmje=cf.doubleTrim(zjjmje);
allqye=cf.doubleTrim(allqye);

if (allqye!=0)
{
	lqbl=zjsjje/allqye*100;
}
else{
	lqbl=0;
}

%>

<tr bgcolor="E8E8FF" align="center">
	<td colspan="2"><B>总  计</B></td>
	<td ><%=zjylqje%></td>
	<td ><%=zjsjje%></td>
	<td ><%=zjjssl%></td>
	<td ><%=allqye%></td>
	<td ><%=zjjmsl%></td>
	<td ><%=zjjmje%></td>
	<td ><%=cf.formatDouble(lqbl)%>%</td>
</tr>
</table>
</body>
</html>
