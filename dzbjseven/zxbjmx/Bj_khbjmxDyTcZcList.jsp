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
//把主材按房间显示数量
String qydmbh=null;
String qydm=null;

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String jgwzmc=null;
String xdjldwmc=null;


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
String clgw=null;
int fwmj=0;

String bjbbh=null;
String dqbm =null;
String hxbm =null;
String bjjbmc  =null;
String bjjbbm  =null;
String ysshr="";
String ysshbz="";

try {
	conn=cf.getConnection();

	


	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,ssfgs,fwmj,bjbbh,hxbm,zxdm,ysshr,DECODE(ysshbz,'N','未审核','Y','通过','M','审核未通过')ysshbz";
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
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		bjjbbm=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		qydmbh=cf.fillNull(rs.getString("zxdm"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		
	}
	rs.close();
	ps.close();
	
	//查询签约店面
	ls_sql="SELECT dwmc from sq_dwxx";
    ls_sql+=" where dwbh='"+qydmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qydm=cf.fillNull(rs.getString("dwmc"));
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
		dqbm=cf.fillHtml(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	
	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc,ssfgs,fwmj";
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
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
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
    <td colspan="8" align="center" class="STYLE2" ><B>精装主材明细&nbsp;LWTC-02</B></td>
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
    <td colspan="6" >签约店面：&nbsp;<%=qydm%></td>
    <td align="left" >材料顾问：&nbsp;</td>
	<td >级别：<%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td colspan="7" >审核人：&nbsp;<%=ysshr%></td>
    <td align="left" >预算审核：&nbsp;<%=ysshbz%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="6%">空间</td>
    <td  width="8%">产品类别</td>
    <td  width="8%">品牌</td>
    <td  width="14%">型号</td>
	<td  width="15%">规格</td>
    <td  width="5%">单位</td>
    <td  width="5%">数量</td>
    <td  width="6%">单价</td>
    <td  width="8%">金额</td>
    <td  width="19%">配套产品说明</td>
    <td  width="6%">类型</td>
  </tr>

	
<%
	int i=0;
	String tccplbbm=null;
	String oldjgwzmc="";
	double allje=0;
	ls_sql="SELECT distinct jgwzbm ";
	ls_sql+=" FROM tc_csrjkhzcqd ";
    ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by jgwzbm ";
//	out.println(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");


		//房间内[标准套餐：产品类别]数量
		int cpxdsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM tc_csrjkhzcqd";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"'";
//		ls_sql+=" and tc_csrjkhzcqd.xdsl!=0";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cpxdsl=rs.getInt(1);
		}
		rs.close();
		ps.close();



		//输出项目明细
		String ppmc=null;
		String xh=null;
		String gg=null;
		String xdjldw=null;
		double xdsl=0;
		double dj=0;
		double je=0;
		String ptcpsm=null;
		String lx=null;

		//套餐主材
		ls_sql="SELECT ppmc,clxlmc,xh,gg,xdjldw,xdsl,dj,ptcpsm,bjjbmc,DECODE(tc_csrjkhzcqd.lx,'1','标配','2','升级','3','独立收费') lx";
		ls_sql+=" FROM tc_csrjkhzcqd,bdm_bjjbbm,jxc_clxlbm";
		ls_sql+=" where tc_csrjkhzcqd.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
		ls_sql+=" and tc_csrjkhzcqd.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and tc_csrjkhzcqd.khbh='"+khbh+"' and tc_csrjkhzcqd.jgwzbm='"+jgwzmc+"'";
//		ls_sql+=" and tc_csrjkhzcqd.xdsl!=0";
		ls_sql+=" order by xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ppmc=rs.getString("ppmc");
			tccplbbm=rs.getString("clxlmc");
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			xdjldw=rs.getString("xdjldw");
			xdsl=rs.getDouble("xdsl");
			dj=rs.getDouble("dj");
			ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
			bjjbmc=rs.getString("bjjbmc");
			lx=cf.fillHtml(rs.getString("lx"));

			je=cf.round(dj*xdsl,2);

			allje+=je;
			allje=cf.round(allje,2);

			row++;

			if (!oldjgwzmc.equals(jgwzmc))//开始新房间
			{
				oldjgwzmc=jgwzmc;

				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=cpxdsl%>"><%=jgwzmc%></td>
					<td><%=tccplbbm%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=xdjldw%></td>
					<td><%=xdsl%></td>
					<td><%=dj%></td>
					<td><%=je%></td>
					<td align="left" ><%=ptcpsm%></td>
					<td><%=lx%></td>
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
					<td><%=xdjldw%></td>
					<td><%=xdsl%></td>
					<td><%=dj%></td>
					<td><%=je%></td>
					<td align="left" ><%=ptcpsm%></td>
					<td><%=lx%></td>
				  </tr>
				<%
			}
		}
		rs.close();
		ps.close();
	}
	rs1.close();
	ps1.close();
%> 
  		
  <tr bgcolor="#FFFFFF" align="center"> 
	<td>小计</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=allje%></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>

</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">客户签字：            </td>
    <td colspan="2" height="42">设计师签字：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">日期：</td>
    <td colspan="2" height="42">日期：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">材料员签字：</td>
    <td colspan="2" height="42">店面经理签字：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">日期：</td>
    <td colspan="2" height="42">日期：</td>
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






