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



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;

double allcksl=0;
double allckje=0;

try {
	conn=cf.getConnection();

	String bgcolor="";
	String fgsbh="";
	String fgsmc="";

	ls_sql="SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwlx='F0' and cxbz='N'";
	if (!fgs.equals(""))
	{
		ls_sql+=" and dwbh='"+fgs+"'";
	}
    ls_sql+=" order by dwbh";
	ps3= conn.prepareStatement(ls_sql);
	rs3 =ps3.executeQuery();
	while (rs3.next())
	{
		fgsbh=cf.fillNull(rs3.getString("dwbh"));
		fgsmc=cf.fillNull(rs3.getString("dwmc"));

		int row=0;

		double fgsxjcksl=0;
		double fgsxjckje=0;


		%>
		<BR><center><b>出库统计（<%=fgsmc%>）
		<BR>出库时间：（<%=cksj%>－－<%=cksj2%>）
		</b></center><br>
		<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
			<tr bgcolor="CCCCCC" align="center"> 
				<td width="6%"><B>序号</b></td>
				<td width="10%"><B>内部编码</b></td>
				<td width="18%"><B>材料名称</b></td>
				<td width="18%"><B>材料规格</b></td>
				<td width="10%"><B>计量单位</b></td>
				<td width="10%"><B>出库单价</b></td>
				<td width="12%"><B>出库数量</b></td>
				<td width="16%"><B>出库金额</b></td>
			</tr>
		<%
		
		String cldlmc="";
		String clxlmc="";
		ls_sql="SELECT jxc_clxlbm.cldlmc,jxc_clxlbm.clxlmc";
		ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where jxc_cldlbm.cldlmc=jxc_clxlbm.cldlmc and jxc_cldlbm.cldllb in('2','3') ";
		ls_sql+=" order by jxc_clxlbm.cldlmc,jxc_clxlbm.clxlbm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			cldlmc=cf.fillNull(rs2.getString("cldlmc"));
			clxlmc=cf.fillNull(rs2.getString("clxlmc"));


			String clbm=null;
			String clmc=null;
			String gg=null;
			String nbbm=null;
			String jldwbm=null;
			double ckdj=0;
			double cksl=0;
			double ckje=0;

			double dlxjcksl=0;
			double dlxjckje=0;

			ls_sql="SELECT jxc_ckmx.clbm,clmc,gg,nbbm,jldwbm,jxc_ckmx.ckdj,jxc_ckmx.cksl,jxc_ckmx.ckje";
			ls_sql+=" FROM jxc_ckmx,jxc_ckd";
			ls_sql+=" where jxc_ckmx.ckph=jxc_ckd.ckph and jxc_ckmx.clxlbm='"+clxlmc+"' and jxc_ckd.fgsbh='"+fgsbh+"'";
			ls_sql+=" and jxc_ckd.ckdzt='9' ";//9：出库完成
			ls_sql+=" and jxc_ckd.cklx in('P','J') ";//P：材料单出库；J：代金券出库
			ls_sql+=wheresql;
			ls_sql+=" order by clxlbm,clbm ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				clbm=cf.fillNull(rs.getString("clbm"));
				clmc=cf.fillNull(rs.getString("clmc"));
				gg=cf.fillNull(rs.getString("gg"));
				nbbm=cf.fillNull(rs.getString("nbbm"));
				jldwbm=cf.fillNull(rs.getString("jldwbm"));
				ckdj=rs.getDouble("ckdj");
				cksl=rs.getDouble("cksl");
				ckje=rs.getDouble("ckje");

				row++;


				dlxjcksl+=cksl;
				dlxjckje+=ckje;

				fgsxjcksl+=cksl;
				fgsxjckje+=ckje;

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
					<td ><%=nbbm%></td>
					<td ><%=clmc%></td>
					<td ><%=gg%></td>
					<td ><%=jldwbm%></td>
					<td ><%=ckdj%></td>
					<td ><%=cksl%></td>
					<td ><%=ckje%></td>
				</tr>
				<%
			}
			rs.close();
			ps.close();

			dlxjcksl=cf.doubleTrim(dlxjcksl);
			dlxjckje=cf.doubleTrim(dlxjckje);

			%>
			<tr bgcolor="E8E8FF" align="center">
				<td colspan="4"><B>[<%=cldlmc%>-><%=clxlmc%>]小计</B></td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td ><%=dlxjcksl%></td>
				<td ><%=dlxjckje%></td>
			</tr>
			<%
		}
		rs2.close();
		ps2.close();

		fgsxjcksl=cf.doubleTrim(fgsxjcksl);
		fgsxjckje=cf.doubleTrim(fgsxjckje);

		allcksl+=fgsxjcksl;
		allckje+=fgsxjckje;

		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="4"><B>[<%=fgsmc%>]合计</B></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td ><%=fgsxjcksl%></td>
			<td ><%=fgsxjckje%></td>
		</tr>
		</table>
		<%
	}
	rs3.close();
	ps3.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
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
		<td ><B>总计</B></td>
		<td width="10%" >&nbsp;</td>
		<td width="10%" >&nbsp;</td>
		<td width="12%" ><%=allcksl%></td>
		<td width="16%" ><%=allckje%></td>
	</tr>
	</table>
</body>
</html>