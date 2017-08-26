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

	String ssfgs=cf.GB2Uni(request.getParameter("fgs"));
	String dysj=request.getParameter("dysj");
	String dysj2=request.getParameter("dysj2");
	String xzjg=request.getParameter("xzjg");

	String cldlmc=null;
	String clgg=null;
	String clbm=null;
	String clmc=null;
	String lrjsfs=null;
	String jldwmc=null;

	cldlmc=request.getParameter("cldlmc");
	if (cldlmc!=null)
	{
		cldlmc=cf.GB2Uni(cldlmc);
		if (!(cldlmc.equals("")))	wheresql+=" and  (cl_clbm.cldlmc='"+cldlmc+"') ";
	}
	clgg=request.getParameter("clgg");
	if (clgg!=null)
	{
		clgg=cf.GB2Uni(clgg);
		if (!(clgg.equals("")))	wheresql+=" and  (cl_clbm.clgg='"+clgg+"') ";
	}
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (cl_clbm.clbm='"+clbm+"')";
	}
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (cl_clbm.clmc='"+clmc+"')";
	}
	lrjsfs=request.getParameter("lrjsfs");
	if (lrjsfs!=null)
	{
		lrjsfs=cf.GB2Uni(lrjsfs);
		if (!(lrjsfs.equals("")))	wheresql+=" and  (cl_clbm.lrjsfs='"+lrjsfs+"')";
	}
	jldwmc=request.getParameter("jldwmc");
	if (jldwmc!=null)
	{
		jldwmc=cf.GB2Uni(jldwmc);
		if (!(jldwmc.equals("")))	wheresql+=" and  (cl_clbm.jldwmc='"+jldwmc+"')";
	}
%>

<center><b>代金券客户统计（<%=ssfgs%>）
<BR>打印时间：（<%=dysj%>－－<%=dysj2%>）
</b></center><br>

<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String khbh=null;
String hth=null;
String khxm=null;
String sgdmc=null;
double qye=0;

double zjdjjsl=0;
double zjdjjje=0;
double zjqye=0;

int dlsl=0;
double[] djjxj;

try {
	conn=cf.getConnection();

	//获得大类数量
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM cl_cldlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dlsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//大类小计保存到数组种
	djjxj=new double[dlsl];

	for (int i=0;i<dlsl ;i++ )
	{
		djjxj[i]=0;
	}

%>
<table width="<%=(160+dlsl*100+480)%>" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC" align="center"> 
		<td width="40"><B>序号</b></td>
		<td width="120"><B>合同号</b></td>
		<td width="120"><B>客户</b></td>
		<td width="120"><B>施工队</b></td>
		<td width="120"><B>签约额</b></td>
<%
		//获取标题名称
		ls_sql="SELECT cldlmc";
		ls_sql+=" FROM cl_cldlbm";
		ls_sql+=" order by cldlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			cldlmc=cf.fillNull(rs.getString("cldlmc"));
			
			%>
			<td width="100"><B><%=cldlmc%></b></td>
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
	ls_sql="select distinct cl_djj.khbh,crm_khxx.hth,khxm,sgdmc,crm_khxx.qye  ";
	ls_sql+=" from cl_djj,crm_khxx,sq_sgd  ";
	ls_sql+=" where cl_djj.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)  and cl_djj.dwbh='"+ssfgs+"'  ";
	ls_sql+=" and cl_djj.czzt='3' ";//注意起点不包括等于
	ls_sql+=" and cl_djj.dysj>=TO_DATE('"+dysj+"','YYYY-MM-DD') and cl_djj.dysj<=TO_DATE('"+dysj2+"','YYYY-MM-DD')";//注意起点不包括等于
	ls_sql+=" order by sgdmc ";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		khbh=cf.fillNull(rs2.getString("khbh"));
		hth=cf.fillNull(rs2.getString("hth"));
		khxm=cf.fillNull(rs2.getString("khxm"));
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
			<td ><%=hth%></td>
			<td ><%=khxm%></td>
			<td ><%=sgdmc%></td>
			<td ><%=qye%></td>
		<%

		double xjdjjsl=0;
		double xjdjjje=0;

		int dlxh=0;//大类序号
		ls_sql="SELECT cldlmc";
		ls_sql+=" FROM cl_cldlbm";
		ls_sql+=" order by cldlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			cldlmc=cf.fillNull(rs.getString("cldlmc"));


			double djjje=0;
			ls_sql="select sum(cl_djjmx.sjje)  ";
			ls_sql+=" from cl_djjmx,cl_djj  ";
			ls_sql+=" where cl_djjmx.czxh=cl_djj.czxh  ";
			ls_sql+=" and cl_djj.dwbh='"+ssfgs+"'  and cl_djj.khbh='"+khbh+"' ";
			ls_sql+=" and cl_djjmx.cldlmc='"+cldlmc+"' ";
			ls_sql+=" and cl_djj.czzt='3' ";//注意起点不包括等于
			ls_sql+=" and cl_djj.dysj>=TO_DATE('"+dysj+"','YYYY-MM-DD') and cl_djj.dysj<=TO_DATE('"+dysj2+"','YYYY-MM-DD')";//注意起点不包括等于
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				djjje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();


			xjdjjje+=djjje;//客户小计

			djjxj[dlxh]+=djjje;//大类小计

			dlxh++;
		
			%>
				<td ><%=djjje%></td>
			<%
		}
		rs.close();
		ps.close();

		//输出客户小计
		xjdjjsl=cf.doubleTrim(xjdjjsl);
		xjdjjje=cf.doubleTrim(xjdjjje);

		%>
			<td ><%=xjdjjje%></td>
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
	<td ><%=zjqye%></td>
<%
	zjdjjsl=0;
	zjdjjje=0;

	//输出大类小计
	for (int i=0;i<dlsl ;i++ )
	{
		djjxj[i]=cf.doubleTrim(djjxj[i]);

		zjdjjje+=djjxj[i];

		%>
		<td ><%=djjxj[i]%></td>
		<%
	}

	zjdjjsl=cf.doubleTrim(zjdjjsl);
	zjdjjje=cf.doubleTrim(zjdjjje);
%>
	<td ><%=zjdjjje%></td>
</tr>
</table>
</body>
</html>