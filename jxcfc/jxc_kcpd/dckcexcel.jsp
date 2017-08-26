<%@ page contentType="application/vnd.ms-excel;charset=GBK" %>		
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>Excel</title>
<meta http-equiv="Content-Type" content="excel; charset=gb2312">
<style type="text/css">
　　.xian{BORDER-LEFT-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-TOP-STYLE: none}
</style> 
</head>
<form method="post" action="" name="selectform" target="_back">
<body bgcolor="#FFFFFF" align="center">
 <table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0" align="center">
	<tr bgcolor="CCCCCC" align="center" > 
	<td  width="2%">序号</td>
	<td  width="2%">地区</td>
	<td  width="5%">仓库</td>
	<td  width="3%">材料编码</td>
	<td  width="3%">材料名称</td>	
	<td  width="3%">型号</td>
	<td  width="3%">规格</td>
	<td  width="3%">内部编码</td>
	<td  width="2%">正常品数量</td>
	<td  width="2%">残次品数量</td>
	<td  width="2%">报废品数量</td>
    </tr>
		
<%
String ls_sql=null;
String pdph=request.getParameter("pdph");

String clbm=null; 
String clmc=null; 
String zljb=null; 
String hjbh="";
String hwbh="";
String xh=null; 
String gg=null;
String nbbm=null; 
String kcsl=null; 
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
double kczcpsl=0;
double kcccpsl=0;
double kcbfpsl=0;

String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
try {
	conn=cf.getConnection();

	String dqbm=null;
	String ckbh=null;
	String dqmc=null; 
	String ckmc=null; 

	ls_sql="SELECT jxc_kcpdjl.dqbm,dqmc,jxc_kcpdjl.ckbh,ckmc";
	ls_sql+=" FROM jxc_kcpdjl,jxc_ckmc,dm_dqbm";
	ls_sql+=" where jxc_kcpdjl.ckbh=jxc_ckmc.ckbh";
	ls_sql+=" and jxc_kcpdjl.dqbm=dm_dqbm.dqbm";
	ls_sql+=" and jxc_kcpdjl.pdph='"+pdph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		dqmc=cf.fillNull(rs.getString("dqmc"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		ckmc=cf.fillNull(rs.getString("ckmc"));
	}
	rs.close();
	ps.close();


	
	ls_sql="SELECT distinct jxc_cljgb.clbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.nbbm ";
	ls_sql+=" FROM jxc_kcb,jxc_clbm,jxc_cljgb ";
	ls_sql+=" where jxc_kcb.dqbm='"+dqbm+"'";
	ls_sql+=" and jxc_kcb.ckbh='"+ckbh+"'";
	ls_sql+=" and jxc_kcb.clbm= jxc_clbm.clbm ";
	ls_sql+=" and jxc_clbm.clbm=jxc_cljgb.clbm ";
	ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"'";
	ls_sql+=" and jxc_cljgb.xsfs in ('2','3')";
	ls_sql+=" and jxc_clbm.cllb='1'  ";
	ls_sql+=" order by  jxc_cljgb.clbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i+=1;

		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		nbbm=cf.fillNull(rs.getString("nbbm"));

		kczcpsl=0;
		ls_sql="SELECT sum(kcsl) kcsl ";
		ls_sql+=" FROM jxc_kcb ";
		ls_sql+=" where ckbh='"+ckbh+"' and clbm='"+clbm+"' and zljb='1'";//1：正常品；2：残次品；3：报废品；
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		if (rs2.next())
		{
			kczcpsl=rs2.getDouble("kcsl");
		}
		rs2.close();
		ps2.close();

		kcccpsl=0;
		ls_sql="SELECT sum(kcsl) kcsl ";
		ls_sql+=" FROM jxc_kcb ";
		ls_sql+=" where ckbh='"+ckbh+"' and clbm='"+clbm+"' and zljb='2'";//1：正常品；2：残次品；3：报废品；
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		if (rs2.next())
		{
			kcccpsl=rs2.getDouble("kcsl");
		}
		rs2.close();
		ps2.close();

		kcbfpsl=0;
		ls_sql="SELECT sum(kcsl) kcsl ";
		ls_sql+=" FROM jxc_kcb ";
		ls_sql+=" where ckbh='"+ckbh+"' and clbm='"+clbm+"' and zljb='3'";//1：正常品；2：残次品；3：报废品；
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		if (rs2.next())
		{
			kcbfpsl=rs2.getDouble("kcsl");
		}
		rs2.close();
		ps2.close();

		

		%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>" align="center" >
		<td><%=i%></td>
		<td><%=dqmc%></td>
		<td><%=ckmc%></td>
		<td><%=clbm%></td>
		<td><%=clmc%></td>
		<td><%=xh%></td>
		<td><%=gg%></td>
		<td><%=nbbm%></td>
		<td><%=kczcpsl%></td>
		<td><%=kcccpsl%></td>
		<td><%=kcbfpsl%></td>
		</tr>
	<%}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</table>
</form>
</body>
</html>
