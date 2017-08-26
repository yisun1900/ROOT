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



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;

double allpssl=0;
double allpsje=0;
double allcksl=0;

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

		double fgsxjpssl=0;
		double fgsxjpsje=0;
		double fgscksl=0;


		%>
		<BR><center><b>材料单统计（<%=fgsmc%>）
		<BR>录入日期：（<%=tjsj%>－－<%=tjsj2%>）
		</b></center><br>
		<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
			<tr bgcolor="CCCCCC" align="center"> 
			<td width="6%"><B>序号</b></td>
			<td width="10%"><B>内部编码</b></td>
			<td width="18%"><B>材料名称</b></td>
			<td width="15%"><B>材料规格</b></td>
			<td width="9%"><B>计量单位</b></td>
			<td width="10%"><B>单价</b></td>
			<td width="10%"><B>开单数量</b></td>
			<td width="12%"><B>金额</b></td>
			<td width="10%"><B>出库数量</b></td>
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
			double dj=0;
			double pssl=0;
			double psje=0;
			double cksl=0;

			double dlxjpssl=0;
			double dlxjpsje=0;
			double dlxjcksl=0;

			ls_sql="SELECT jxc_clpsmx.clbm,clmc,gg,nbbm,jldwbm,jxc_clpsmx.dj,sum(jxc_clpsmx.pssl) pssl,sum(jxc_clpsmx.psje) psje,sum(jxc_clpsmx.cksl) cksl";
			ls_sql+=" FROM jxc_clpsmx,jxc_clpsd";
			ls_sql+=" where jxc_clpsmx.psph=jxc_clpsd.psph and jxc_clpsmx.clxlbm='"+clxlmc+"' and jxc_clpsd.ssfgs='"+fgsbh+"'";
			ls_sql+=" and jxc_clpsd.psdzt in('2','3','5') ";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
			ls_sql+=wheresql;
			ls_sql+=" group by jxc_clpsmx.clbm,clmc,gg,nbbm,jldwbm,jxc_clpsmx.dj ";
			ls_sql+=" order by clbm ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				clbm=cf.fillNull(rs.getString("clbm"));
				clmc=cf.fillNull(rs.getString("clmc"));
				gg=cf.fillNull(rs.getString("gg"));
				nbbm=cf.fillNull(rs.getString("nbbm"));
				jldwbm=cf.fillNull(rs.getString("jldwbm"));
				dj=rs.getDouble("dj");
				pssl=rs.getDouble("pssl");
				psje=rs.getDouble("psje");
				cksl=rs.getDouble("cksl");

				row++;


				dlxjpssl+=pssl;
				dlxjpsje+=psje;
				dlxjcksl+=cksl;

				fgsxjpssl+=pssl;
				fgsxjpsje+=psje;
				fgscksl+=cksl;

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
					<td ><%=dj%></td>
					<td ><%=pssl%></td>
					<td ><%=psje%></td>
					<td ><%=cksl%></td>
				</tr>
				<%
			}
			rs.close();
			ps.close();

			dlxjpssl=cf.doubleTrim(dlxjpssl);
			dlxjpsje=cf.doubleTrim(dlxjpsje);

			%>
			<tr bgcolor="E8E8FF" align="center">
				<td colspan="4"><B>[<%=cldlmc%>-><%=clxlmc%>]小计</B></td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td ><%=dlxjpssl%></td>
				<td ><%=dlxjpsje%></td>
				<td ><%=dlxjcksl%></td>
			</tr>
			<%
		}
		rs2.close();
		ps2.close();

		fgsxjpssl=cf.doubleTrim(fgsxjpssl);
		fgsxjpsje=cf.doubleTrim(fgsxjpsje);

		allpssl+=fgsxjpssl;
		allpsje+=fgsxjpsje;
		allcksl+=fgscksl;

		%>
		<tr bgcolor="E8E8FF" align="center">
			<td colspan="4"><B>[<%=fgsmc%>]合计</B></td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td ><%=fgsxjpssl%></td>
			<td ><%=fgsxjpsje%></td>
			<td ><%=fgscksl%></td>
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
		<td colspan="4"><B>总计</B></td>
		<td width="9%">&nbsp;</td>
		<td width="10%">&nbsp;</td>
		<td width="10%"><%=allpssl%></td>
		<td width="12%"><%=allpsje%></td>
		<td  width="10%"><%=allcksl%></td>
	</tr>
	</table>
</body>
</html>