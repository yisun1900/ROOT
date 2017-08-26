<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
@media print{
	INPUT {display:none}
}
.STYLE2 {font-size: 18px}
</style>

</head>


<%
String zjxxh=request.getParameter("zjxxh");
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
 double qye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;
 
String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String dzbjbz=null;
String fwmj=null;
String dqbm=null;
String bjbbh=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj,bjbbh";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=cf.fillNull(rs.getString("fwmj"));
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

%>
<body >

<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0 style='FONT-SIZE: 14px'">

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="8" align="center" class="STYLE2" ><B>套餐－大店主材超量加价清单&nbsp;LWTC-08</B></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >客户姓名：<%=khxm%></td>
    <td colspan="3" >工程负责人：</td>
    <td width="27%" >设 计 师：<%=sjs%></td>
	<td width="21%" >制单日期：<%=cf.today()%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="12"  >客户地址：<%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >客户电话：<%=lxfs%></td>
    <td align="left" >竣工时间：</td>
	<td >建筑面积：<%=fwmj%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="9%">空间</td>
    <td  width="11%" >产品类别</td>
    <td  width="6%">标准数量</td>
    <td  width="6%">实际数量</td>
	<td  width="14%">名称</td>
	<td  width="13%">品牌</td>
	<td  width="13%">型号</td>
	<td  width="6%">计量单位</td>
	<td  width="7%">单价</td>
    <td  width="7%">需加价数量</td>
    <td  width="8%">需加价金额</td>
  </tr>

	
<%
	//房间主材超量加价
	String jgwzbm=null;
	String tccplbbm=null;
	String tccplbmc=null;
	double bzsl=0;
	double ccbfjj=0;
	double sjsl=0;
	double sjjshsl=0;

 	double xjsl=0;
 	double xjje=0;
 
	int row=0;

	ls_sql="SELECT jgwzbm,bj_khzcxmxjh.tccplbbm,clxlmc,bzsl,sjsl,sjjshsl";
	ls_sql+=" FROM bj_khzcxmxjh,jxc_clxlbm ";
    ls_sql+=" where bj_khzcxmxjh.tccplbbm=jxc_clxlbm.clxlbm";
    ls_sql+=" and bj_khzcxmxjh.zjxxh='"+zjxxh+"'";
    ls_sql+=" and bj_khzcxmxjh.sfxzsl='1' ";//1：可增项；2：不可增项；3：不控制
	ls_sql+=" order by bj_khzcxmxjh.jgwzbm,bj_khzcxmxjh.tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		jgwzmc=rs.getString("jgwzbm");
		tccplbbm=rs.getString("tccplbbm");
		tccplbmc=rs.getString("clxlmc");

		bzsl=rs.getDouble("bzsl");
		sjsl=rs.getDouble("sjsl");
		sjjshsl=rs.getDouble("sjjshsl");

		int rowsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and zclx='4'";//1：套餐内；2：套餐外收费；3：大店
		ls_sql+=" and bj_khzcxmh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_khzcxmh.tccplbbm='"+tccplbbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rowsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		String cpmc=null;
		String ppmc=null;
		String xh=null;
		String jldw=null;
		double sl=0;
		double dj=0;
		double je=0;
		ls_sql="SELECT cpmc,ppmc,xh,jldw,dj,sum(sl) sl,sum(ROUND(dj*sl,2)) je";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and zclx='4'";//1：套餐内；2：套餐外收费；3：大店
		ls_sql+=" and bj_khzcxmh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_khzcxmh.tccplbbm='"+tccplbbm+"'";
		ls_sql+=" group by cpmc,ppmc,xh,jldw,dj";
		ls_sql+=" order by cpmc,ppmc,xh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=rs1.getString("xh");
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");
			dj=rs1.getDouble("dj");
			je=rs1.getDouble("je");

			xjsl+=sl;
			xjje+=je;

			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td rowspan="<%=rowsl%>"><%=jgwzmc%></td>
			
				<td rowspan="<%=rowsl%>"><%=tccplbmc%></td>
				<td rowspan="<%=rowsl%>"><%=cf.formatDouble(bzsl)%></td>
				<td rowspan="<%=rowsl%>"><%=cf.formatDouble(sjsl)%></td>
				<td><%=cpmc%></td>
				<td><%=ppmc%></td>
				<td><%=xh%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(dj)%></td>
				<td><%=cf.formatDouble(sl)%></td>
				<td><%=cf.formatDouble(je)%></td>
			  </tr>
			<%
		}

		while (rs1.next())
		{
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=rs1.getString("xh");
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");
			dj=rs1.getDouble("dj");
			je=rs1.getDouble("je");

			xjsl+=sl;
			xjje+=je;

			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=cpmc%></td>
				<td><%=ppmc%></td>
				<td><%=xh%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(dj)%></td>
				<td><%=cf.formatDouble(sl)%></td>
				<td><%=cf.formatDouble(je)%></td>
			  </tr>
			<%
		}
		rs1.close();
		ps1.close();

		row++;
	}
	rs.close();
	ps.close();
%> 
  		
  <tr bgcolor="#FFFFFF"> 
	<td align="center" colspan="2">合计</td>

	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center"><%=cf.formatDouble(xjsl)%></td>
	<td align="center"><%=cf.formatDouble(xjje)%></td>
  </tr>

</table>


<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">甲方签字：</td>
    <td colspan="2" height="42">乙方签字：</td>
  </tr>
</table>

</td></tr>
</TBODY>

</table>


</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






