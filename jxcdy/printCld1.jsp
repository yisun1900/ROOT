<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh="";
String cklxmc=null;
String ckmc=null;
String lydh=null;
String ckr=null;
String cksj=null;
double ckzsl=0;
double ckzje=0;
String psfs=null;
String fgsmc=null;

String jhshsj=null;
String bz=null;

String khxm=null;
String fwdz=null;
String hth=null;
String sgdmc=null;

double sumcksl=0;
double sumckje=0;

String ckph=null;
ckph=cf.GB2Uni(request.getParameter("ckph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String gsmc=null;
try {
	conn=cf.getConnection();

	//检查出库类型
	ls_sql="select khbh,DECODE(cklx,'D','订单出库','B','报废出库','T','退货出库','Q','调拨出库','S','申购出库','P','材料单出库','J','代金券出库','X','销售出库','R','调拨出库') cklxmc ";
	ls_sql+=" ,ckmc,lydh,dwmc,ckr,cksj,ckzsl,ckzje,DECODE(psfs,'0','厂家配送','1','公司送货','2','客户自取') psfs,jhshsj,jxc_ckd.bz ";
	ls_sql+=" from jxc_ckd,jxc_ckmc,sq_dwxx ";
	ls_sql+=" where jxc_ckd.ckbh=jxc_ckmc.ckbh(+) and jxc_ckd.ckph='"+ckph+"'";
	ls_sql+=" and jxc_ckd.fgsbh=sq_dwxx.dwbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		cklxmc=cf.fillNull(rs.getString("cklxmc"));
		ckmc=cf.fillNull(rs.getString("ckmc"));
		lydh=cf.fillNull(rs.getString("lydh"));
		fgsmc=cf.fillNull(rs.getString("dwmc"));

		ckr=cf.fillNull(rs.getString("ckr"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		ckzsl=rs.getDouble("ckzsl");
		ckzje=rs.getDouble("ckzje");
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		bz=cf.fillNull(rs.getString("bz"));

	}
	rs.close();
	ps.close();

	//查询客户姓名
	ls_sql="select khxm,fwdz,hth,sgdmc ";
	ls_sql+=" from crm_khxx,sq_sgd ";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select csz";
	ls_sql+=" from sq_xtcsb ";
	ls_sql+=" where csbm='gsmc'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gsmc=cf.fillNull(rs.getString("csz"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>材料出库单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><%=gsmc%>---<U>&nbsp;<%=fgsmc%>&nbsp;</U>材料库</div>
<div align="center"><font size="+2"><b>出&nbsp;&nbsp;&nbsp;货&nbsp;&nbsp;&nbsp;单</b></font></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td width="31%"><strong>出库批号</strong>：<%=ckph%></td>
  <td width="31%"><strong>出库类型</strong>：<%=cklxmc%></td>
  <td width="38%"><strong>出库仓库</strong>：<%=ckmc%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td><strong>客户姓名</strong>：<%=khxm%></td>
  <td><strong>合 同 号</strong>：<%=hth%></td>
  <td><strong>施 工 队</strong>：<%=sgdmc%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td><strong>出库日期</strong>：<%=cksj%></td>
  <td><strong>来源单号</strong>：<%=lydh%></td>
  <td><strong>房屋地址</strong>：<%=fwdz%></td>
  </tr>
</table>


<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF" align="center">
	<td width="4%"><b>序号</b></td>
	<td width="10%"><b>内部编码</b></td>
	<td width="20%"><b>材料名称</b></td>
	<td width="15%"><b>材料规格</b></td>
	<td width="6%"><b>单位</b></td>
	<td width="7%"><b>单价</b></td>
	<td width="8%"><b>数量</b></td>
	<td width="9%"><b>金额</b></td>
	<td width="21%"><b>备注</b></td>
</tr>
<%
String nbbm=null;
String clmc=null;
String gg=null;
String jldwbm=null;
double ckdj=0;
double cksl=0;
double ckje=0;


	int row=0;

	ls_sql="select nbbm,clmc,gg,jldwbm,ckdj,cksl,ckje ";
	ls_sql+=" from jxc_ckmx ";
	ls_sql+=" where ckph='"+ckph+"' and xsfs!='1'";//不打印代销品
	ls_sql+=" order by nbbm";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row++;

		nbbm=cf.fillNull(rs.getString("nbbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		ckdj=rs.getDouble("ckdj");
		cksl=rs.getDouble("cksl");
		ckje=rs.getDouble("ckje");

		sumcksl+=cksl;
		sumckje+=ckje;

		%>
		<tr bgcolor="#FFFFFF" align="center">
			<td><%=row%></td>
			<td><%=nbbm%></td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=ckdj%></td>
			<td><%=cksl%></td>
			<td><%=ckje%></td>
			<td>&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

<tr bgcolor="#FFFFFF" align="center">
	<td colspan="5">合计</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(sumcksl) %></td>
	<td><%=cf.formatDouble(sumckje) %></td>
	<td>&nbsp;</td>
</tr>
		
</table>


<table width="100%" border="0">
<tr>
    <td width="33%"><font size="-1"><b>主&nbsp;&nbsp;管：</b></font></td>
    <td width="33%"><font size="-1"><b>库&nbsp;&nbsp;管：</b></font></td>
    <td width="33%"><font size="-1"><b>出货员：</b></font></td>
  </tr>
  <tr>
    <td width="33%"><font size="-1"><b>承运人：</b></font></td>
	<td width="33%"><font size="-1"><b>项目经理：</b></font></td>
    <td width="33%"><font size="-1"><b>制&nbsp;&nbsp;表：<%=yhmc%></b></font></td>
  </tr>
  <tr>
    <td colspan="2"><font size="-1"><b>备注：</b></font><%=bz%></td>
	<td colspan="2" align="right"><font size="-1"><b>打印日期：<%=cf.today("YYYY-MM-DD")%></b></font></td>
  </tr>
</table>

</body>
</html>


