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
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
double dj=0;
double qye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;

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
    <td colspan="8" align="center" class="STYLE2" ><B>套餐－主材升级清单</B></td>
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
      <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >签约店面：&nbsp;</td>
    <td align="left" >材料顾问：&nbsp;</td>
	<td >套餐级别：&nbsp;</td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td  width="6%" align="center">空间</td>
    <td  width="10%" align="center">产品类别</td>
    <td  width="10%" align="center">升级分类</td>
	<td  width="10%" align="center">升级单价</td>
    <td  width="8%" align="center">升级数量</td>
    <td  width="8%" align="center">升级差价金额</td>
    <td  width="8%" align="center">级别</td>
  </tr>

	
<%
		String tccplbmc=null;
		String tcsjflbm=null;
		String tcsjflmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		double bzsl=0;
		double sjsl=0;
		double sjjshsl=0;
		double xjjsl=0;
		String ptcpsm=null;
		String bjjbmc=null;
		String khbjjbbm=null;
		String bjjbbm=null;
	int i=0;
	ls_sql="SELECT jgwzbm,clxlmc,bj_khzcxmxj.tcsjflbm,tcsjflmc,bzsl,sjsl,sjjshsl,xjjsl,bjjbmc,bj_khzcxmxj.khbjjbbm,bj_khzcxmxj.bjjbbm";
	ls_sql+=" FROM bj_khzcxmxj,bj_tcsjflbm,jxc_clxlbm,bdm_bjjbbm ";
    ls_sql+=" where bj_khzcxmxj.tcsjflbm=bj_tcsjflbm.tcsjflbm and bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm";
    ls_sql+=" and bj_khzcxmxj.bjjbbm=bdm_bjjbbm.bjjbbm ";
    ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.khbjjbbm!=bj_khzcxmxj.bjjbbm";
    ls_sql+=" and bj_khzcxmxj.sfyxsj='Y' ";//升级是否收费  Y：是；N：否
	ls_sql+=" order by bj_khzcxmxj.jgwzbm,bj_khzcxmxj.tcsjflbm,bj_khzcxmxj.tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		jgwzmc=rs.getString("jgwzbm");

		tccplbmc=rs.getString("clxlmc");
		tcsjflbm=rs.getString("tcsjflbm");
		tcsjflmc=rs.getString("tcsjflmc");
		khbjjbbm=rs.getString("khbjjbbm");
		bjjbbm=rs.getString("bjjbbm");

		bzsl=rs.getDouble("bzsl");
		sjsl=rs.getDouble("sjsl");
		sjjshsl=rs.getDouble("sjjshsl");
		xjjsl=rs.getDouble("xjjsl");

		bjjbmc=rs.getString("bjjbmc");

		double sjcj=0;
		ls_sql="select sjcj";
		ls_sql+=" from  bj_tcsjcjb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and tcsjflbm='"+tcsjflbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+bjjbbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjcj=rs1.getDouble("sjcj");
		}
		rs1.close();
		ps1.close();

		double sjcjje=sjcj*sjjshsl;

		allsl+=sjjshsl;
		allqye+=sjcjje;
		

		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td align="center" ><%=jgwzmc%></td>
		
			<td align="center"><%=tccplbmc%></td>
			<td align="center"><%=tcsjflmc%></td>
			<td align="center"><%=cf.formatDouble(sjcj)%></td>
			<td align="center"><%=cf.formatDouble(sjjshsl)%></td>
			<td align="center"><%=cf.formatDouble(sjcjje)%></td>
			<td align="center"><%=bjjbmc%></td>
		  </tr>
		  
	
		<%
	}
	rs.close();
	ps.close();
%> 
  		
  <tr bgcolor="#FFFFFF"> 
	<td align="center" colspan="2">合计</td>

	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center"><%=cf.formatDouble(allsl)%></td>
	<td align="center"><%=cf.formatDouble(allqye)%></td>
	<td align="center">&nbsp;</td>
  </tr>

</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">客户签字：            </td>
    <td colspan="2" height="32">设计师签字：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">日期：</td>
    <td colspan="2" height="32">日期：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">材料员签字：</td>
    <td colspan="2" height="32">店面经理签字：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">日期：</td>
    <td colspan="2" height="32">日期：</td>
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






