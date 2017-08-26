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
//把升级按空间、主材小类显示

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

int row=0;

String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
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
String bjjbmc=null;


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
    <td colspan="8" align="center" class="STYLE2" ><B>套餐－主材升级清单&nbspLWTC-03</B></td>
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
    <td  width="10%" align="center">品牌</td>
    <td  width="10%" align="center">型号</td>
	<td  width="10%" align="center">规格</td>
    <td  width="8%" align="center">单位</td>
  	<td  width="10%" align="center">升级单价</td>
    <td  width="8%" align="center">升级数量</td>
    <td  width="8%" align="center">升级差价金额</td>
    <td  width="15%" align="center">配套产品说明</td>
    <td  width="8%" align="center">级别</td>
  </tr>

	
<%
	int i=0;
	String tccplbbm=null;
	String oldjgwzmc="";
	double sjjmsl=0;
	double allje=0;
	double jmdj=0;
	ls_sql="SELECT distinct jgwzbm ";
	ls_sql+=" FROM tc_csrjkhzcqd ";
    ls_sql+=" where khbh='"+khbh+"' and dj!=0 and sl!=0";
	ls_sql+=" order by jgwzbm ";
//	out.println(ls_sql);
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		jgwzmc=rs2.getString("jgwzbm");


		//房间内[标准套餐：产品类别]数量
		int cpsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM tc_csrjkhzcqd";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"' and dj!=0 and sl!=0";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();



		//输出项目明细
		String ppmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		double sl=0;
		double dj=0;
		double je=0;
		String ptcpsm=null;

		//套餐主材
		ls_sql="SELECT ppmc,tccplbbm,xh,gg,jldw,sl,dj,ptcpsm,bjjbmc";
		ls_sql+=" FROM tc_csrjkhzcqd,bdm_bjjbbm";
		ls_sql+=" where tc_csrjkhzcqd.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
		ls_sql+=" and tc_csrjkhzcqd.khbh='"+khbh+"' and tc_csrjkhzcqd.jgwzbm='"+jgwzmc+"' and dj!=0 and sl!=0";
		ls_sql+=" order by xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ppmc=rs.getString("ppmc");
			tccplbbm=rs.getString("tccplbbm");
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			jldw=rs.getString("jldw");
			sl=rs.getDouble("sl");
			dj=rs.getDouble("dj");
			ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
			bjjbmc=rs.getString("bjjbmc");

			je=cf.round(dj*sl,2);

			allje+=je;
			allje=cf.round(allje,2);

			row++;

			if (!oldjgwzmc.equals(jgwzmc))//开始新房间
			{
				oldjgwzmc=jgwzmc;

				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=cpsl%>"><%=jgwzmc%></td>
					<td><%=tccplbbm%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(dj)%></td>
					<td><%=cf.formatDouble(sl)%></td>
					<td><%=cf.formatDouble(je)%></td>
					<td align="left" ><%=ptcpsm%></td>
					<td><%=bjjbmc%></td>
				  </tr>
				<%
			}
			else{
				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=tccplbbm%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(dj)%></td>
					<td><%=cf.formatDouble(sl)%></td>
					<td><%=cf.formatDouble(je)%></td>
					<td align="left" ><%=ptcpsm%></td>
					<td><%=bjjbmc%></td>
				  </tr>
				<%
			}
		}
		rs.close();
		ps.close();
	}
	rs2.close();
	ps2.close();
%> 
  		



  <tr bgcolor="#FFFFFF"> 
	<td align="center" colspan="2"><B>总 计</B></td>

	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center"><%=cf.formatDouble(allje)%></td>
	<td align="center">&nbsp;</td>
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






