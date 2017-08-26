<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

<style type="text/css">
<!--
.STYLE1 {
	font-size: 15px;
	color: #0000CC;
}
-->
</style>
</head>

<%
String fgsbh=cf.fillNull(request.getParameter("fgsbh"));
String dmbh=cf.fillNull(request.getParameter("dwbh"));

String dmmc="";
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
try {
	conn=cf.getConnection();

	ls_sql="SELECT dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+dmbh+"'";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	if(rs2.next())
	{
		dmmc=rs2.getString(1);
	}
	rs2.close();
	ps2.close();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<center>[<%=dmmc%>]设计师积单</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="10%">设计师</td>
	<td  width="10%">积单客户数</td>
	<td  width="15%">交款总额</td>
	<td  width="10%">家装订金客户数</td>
	<td  width="10%">套餐订金客户数</td>
	<td  width="10%">设计费客户数</td>
</tr>


<%
	String getsjs="";
	int jds=0;
	double fkze=0;

	int xjjdsdm=0;
	int xjfkzedm=0;
	int xjlfdjkhsdm=0;
	int xjhddjkhsdm=0;
	int xjsjfkhsdm=0;
	int xjqthsdm=0;

	ls_sql="SELECT crm_zxkhxx.sjs,count(distinct crm_zxkhxx.khbh) jds,sum(NVL(crm_zxkhxx.lfdj,0)+NVL(crm_zxkhxx.hddj,0)+NVL(crm_zxkhxx.sjf,0)) fkze";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
	ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
	ls_sql+=" and (NVL(crm_zxkhxx.lfdj,0)+NVL(crm_zxkhxx.hddj,0)+NVL(crm_zxkhxx.sjf,0))!=0";
	ls_sql+=" group by crm_zxkhxx.sjs";
	ls_sql+=" order by crm_zxkhxx.sjs";

	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while(rs1.next())
	{
		getsjs=cf.fillHtml(rs1.getString("sjs"));
		jds=rs1.getInt("jds");
		fkze=rs1.getDouble("fkze");


		int lfdjkhs=0;
		int hddjkhs=0;
		int sjfkhs=0;
		int qths=0;

		if (getsjs.equals("&nbsp;"))
		{
			ls_sql="SELECT count(distinct crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and  crm_zxkhxx.sjs is null";
			ls_sql+=" and  crm_zxkhxx.lfdj>0";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				lfdjkhs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();


			ls_sql="SELECT count(distinct crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and  crm_zxkhxx.sjs is null";
			ls_sql+=" and  crm_zxkhxx.hddj>0";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				hddjkhs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();


			ls_sql="SELECT count(distinct crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and  crm_zxkhxx.sjs is null";
			ls_sql+=" and  crm_zxkhxx.sjf>0";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				sjfkhs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			ls_sql="SELECT count(distinct crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and  crm_zxkhxx.sjs is null";
			ls_sql+=" and  NVL(crm_zxkhxx.lfdj,0)+NVL(crm_zxkhxx.hddj,0)+NVL(crm_zxkhxx.sjf,0)=0 ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				qths=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();
		}
		else{
			ls_sql="SELECT count(distinct crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and  crm_zxkhxx.sjs='"+getsjs+"'";
			ls_sql+=" and  crm_zxkhxx.lfdj>0";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				lfdjkhs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();


			ls_sql="SELECT count(distinct crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and  crm_zxkhxx.sjs='"+getsjs+"'";
			ls_sql+=" and  crm_zxkhxx.hddj>0";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				hddjkhs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();


			ls_sql="SELECT count(distinct crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and  crm_zxkhxx.sjs='"+getsjs+"'";
			ls_sql+=" and  crm_zxkhxx.sjf>0";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				sjfkhs=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			ls_sql="SELECT count(distinct crm_zxkhxx.khbh)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and  crm_zxkhxx.ssfgs='"+fgsbh+"'";
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and  crm_zxkhxx.sjs='"+getsjs+"'";
			ls_sql+=" and  NVL(crm_zxkhxx.lfdj,0)+NVL(crm_zxkhxx.hddj,0)+NVL(crm_zxkhxx.sjf,0)=0 ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if(rs2.next())
			{
				qths=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();
		}
		
		xjjdsdm+=jds;
		xjfkzedm+=fkze;
		xjlfdjkhsdm+=lfdjkhs;
		xjhddjkhsdm+=hddjkhs;
		xjsjfkhsdm+=sjfkhs;
		xjqthsdm+=qths;
		
		
		%>
		<tr align="center">
			<td><A HREF="ViewSjsJdMx.jsp?dwbh=<%=dmbh%>&sjs=<%=getsjs%>" target="_blank"><%=getsjs%></A></td>
			<td><%=jds%></td>
			<td><%=fkze%></td>
			<td><%=lfdjkhs%></td>
			<td><%=hddjkhs%></td>
			<td><%=sjfkhs%></td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();

	%>
	<tr align="center" bgcolor="#E8E8FF" >
		<td><B>小计</B></td>
		<td><%=xjjdsdm%></td>
		<td><%=xjfkzedm%></td>
		<td><%=xjlfdjkhsdm%></td>
		<td><%=xjhddjkhsdm%></td>
		<td><%=xjsjfkhsdm%></td>
	</tr>

</table>
</body>

</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (rs3!= null) rs3.close(); 
		if (ps3!= null) ps3.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

