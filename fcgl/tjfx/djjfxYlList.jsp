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

<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;

double jtzjdjjsl=0;
double jtzjdjjje=0;

try {
	conn=cf.getConnection();

	String bgcolor="";
	String dwbh="";
	String dwmc="";

	ls_sql="SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwlx='F0' and cxbz='N'";
	if (!ssfgs.equals(""))
	{
		ls_sql+=" and dwbh='"+ssfgs+"'";
	}
    ls_sql+=" order by dwbh";
	ps3= conn.prepareStatement(ls_sql);
	rs3 =ps3.executeQuery();
	while (rs3.next())
	{
		dwbh=cf.fillNull(rs3.getString("dwbh"));
		dwmc=cf.fillNull(rs3.getString("dwmc"));

		int row=0;
		double zjdjjsl=0;
		double zjdjjje=0;


		%>
		<BR><center><b>代金券统计（<%=dwmc%>）
		<BR>打印时间：（<%=dysj%>－－<%=dysj2%>）
		</b></center><br>
		<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
			<tr bgcolor="CCCCCC" align="center"> 
				<td width="6%"><B>序号</b></td>
				<td width="18%"><B>材料名称</b></td>
				<td width="18%"><B>材料规格</b></td>
				<td width="10%"><B>计量单位</b></td>
				<td width="10%"><B>分公司材料单价</b></td>
				<td width="10%"><B>工队价</b></td>
				<td width="12%"><B>所开数量</b></td>
				<td width="16%"><B>所开金额</b></td>
			</tr>
		<%
		
		ls_sql="SELECT cldlmc";
		ls_sql+=" FROM cl_cldlbm";
		ls_sql+=" order by cldlbm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			cldlmc=cf.fillNull(rs2.getString("cldlmc"));

			double xjdjjsl=0;
			double xjdjjje=0;

			double fgsdj=0;
			double gdj=0;

			ls_sql="SELECT cl_clbm.clbm,clmc,clgg,cldlmc,jldwmc,DECODE(lrjsfs,'1','差价方式','2','百分比方式') lrjsfs,cl_jgmx.fgsdj,cl_jgmx.gdj";
			ls_sql+=" FROM cl_clbm,cl_jgmx";
			ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm and cl_clbm.cldlmc='"+cldlmc+"' and cl_jgmx.dwbh='"+dwbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" order by cldlmc,clbm ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				clbm=cf.fillNull(rs.getString("clbm"));
				clmc=cf.fillNull(rs.getString("clmc"));
				clgg=cf.fillNull(rs.getString("clgg"));
				cldlmc=cf.fillNull(rs.getString("cldlmc"));
				jldwmc=cf.fillNull(rs.getString("jldwmc"));
				lrjsfs=cf.fillNull(rs.getString("lrjsfs"));
				fgsdj=rs.getDouble("fgsdj");
				gdj=rs.getDouble("gdj");

				row++;

				double djjsl=0;
				double djjje=0;
				ls_sql="select sum(cl_djjmx.sjsl),sum(cl_djjmx.sjje)";
				ls_sql+=" from cl_djjmx,cl_djj  ";
				ls_sql+=" where cl_djjmx.czxh=cl_djj.czxh  ";
				ls_sql+=" and cl_djj.dwbh='"+dwbh+"'  ";
				ls_sql+=" and cl_djjmx.clbm='"+clbm+"' ";
				ls_sql+=" and cl_djj.dysj>=TO_DATE('"+dysj+"','YYYY-MM-DD') and cl_djj.dysj<=TO_DATE('"+dysj2+"','YYYY-MM-DD')";//注意起点不包括等于
				ls_sql+=" group by cl_djj.czzt";//注意起点不包括等于
				ls_sql+=" having cl_djj.czzt='3' ";//注意起点不包括等于
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					djjsl=rs1.getDouble(1);
					djjje=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				djjje=cf.doubleTrim(djjje);


				xjdjjsl+=djjsl;
				xjdjjje+=djjje;

				zjdjjsl+=djjsl;
				zjdjjje+=djjje;

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
					<td ><%=clmc%></td>
					<td ><%=clgg%></td>
					<td ><%=jldwmc%></td>
					<td ><%=fgsdj%></td>
					<td ><%=gdj%></td>
					<td ><%=djjsl%></td>
					<td ><%=djjje%></td>
				</tr>
				<%
			}
			rs.close();
			ps.close();

			xjdjjsl=cf.doubleTrim(xjdjjsl);
			xjdjjje=cf.doubleTrim(xjdjjje);

			%>
			<tr bgcolor="E8E8FF" align="center">
				<td colspan="4"><B>[<%=cldlmc%>]小计</B></td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td ><%=xjdjjsl%></td>
				<td ><%=xjdjjje%></td>
			</tr>
			<%
		}
		rs2.close();
		ps2.close();

		zjdjjsl=cf.doubleTrim(zjdjjsl);
		zjdjjje=cf.doubleTrim(zjdjjje);

		jtzjdjjsl+=zjdjjsl;
		jtzjdjjje+=zjdjjje;

		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="4"><B>总  计</B></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td ><%=zjdjjsl%></td>
			<td ><%=zjdjjje%></td>
		</tr>
		</table>
		<%
	}

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
		if (rs3 != null) rs3.close(); 
		if (ps3 != null) ps3.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

	<P>
	<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="E8E8FF" align="center">
		<td ><B>全部总计</B></td>
		<td width="10%" >&nbsp;</td>
		<td width="10%" >&nbsp;</td>
		<td width="12%" ><%=jtzjdjjsl%></td>
		<td width="16%" ><%=jtzjdjjje%></td>
	</tr>
	</table>
</body>
</html>