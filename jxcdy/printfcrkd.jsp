<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />

<%
String yhmc=(String)session.getAttribute("yhmc");
String rkph=null;
String dqbm=null;
String ckbh=null;
String hjbh=null;
String rklx=null;
String rkdzt=null;
String ddbh=null;
String fgsbh=null;
String jsr=null;
String rkr=null;
String rksj=null;
String ckzje=null;
String whererkph=null;
String psfs=null;
String sfjz=null;
String sfth=null;
String gysmc=null;
String nian=null;
String yue=null;
String ri=null;
String bz="";
String czxh=null;
String jhshsj=null;
String hth=null;
String lydh=null;
String shr=null;
String zbshr=null;
String xzbshyy=null;
String rkdrklx=null;
int ckzsl=0;
whererkph=cf.GB2Uni(request.getParameter("rkph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select rkph,dqmc dqbm,ckmc ckbh,DECODE(rklx,'D','订单入库','B','报废入库','T','退货入库','R','调拨入库','S','申购入库','P','配送入库','J','代金券入库','C','采购入库') rklx,DECODE(rkdzt,'0','录入未提交',' 1','等待报废审核','2','等待退货审核','3','等待调拨入库','4','报废审核通过','5','退货审核通过','6','报废审核未通过','7','退货审核未通过','8','审核通过','9','入库完成') rkdzt,dwmc fgsbh,rkr,to_char(rksj,'YYYY-MM-DD') rksj,jxc_rkd.bz bz,to_char(rksj,'YYYY') nian,to_char(rksj,'MM') yue,to_char(rksj,'DD') ri,gysmc,lydh,shr,zbshr,xzbshyy,rklx rkdrklx ";
	ls_sql+=" from  jxc_rkd,dm_dqbm,jxc_ckmc,sq_dwxx ";
	ls_sql+=" where jxc_rkd.ckbh=jxc_ckmc.ckbh(+) and jxc_rkd.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and jxc_rkd.rkrssfgs=sq_dwxx.dwbh ";
	ls_sql+=" and  (rkph='"+whererkph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ri=cf.fillNull(rs.getString("ri"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		lydh=cf.fillNull(rs.getString("lydh"));
		xzbshyy=cf.fillNull(rs.getString("xzbshyy"));

		rkph=cf.fillNull(rs.getString("rkph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		rklx=cf.fillNull(rs.getString("rklx"));
		rkdrklx=cf.fillNull(rs.getString("rkdrklx"));
//		rkdzt=cf.fillNull(rs.getString("rkdzt"));
//		ddbh=cf.fillNull(rs.getString("ddbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
//		jsr=cf.fillNull(rs.getString("jsr"));
		rkr=cf.fillNull(rs.getString("rkr"));
		shr=cf.fillNull(rs.getString("shr"));
		zbshr=cf.fillNull(rs.getString("zbshr"));
		rksj=cf.fillNull(rs.getDate("rksj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	if (rklx.equals("申购入库"))//S：申购入库
	{
		gysmc="集团总部";
	}

	ls_sql="select count(*)+1 ";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where rkph='"+rkph+"'";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		ckzsl=rs.getInt(1);
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

<html>
<head>
<title>材料入库单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 松下亿达装饰工程（大连）有限公司---<U>&nbsp;<%=fgsbh%>&nbsp;</U>分公司材料库</div>
<div align="center"><font size="+3"><b>入&nbsp;&nbsp;&nbsp;库&nbsp;&nbsp;&nbsp;单</b></font></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="10%"> 
    入库批号：</td>
  <td width="20%"> 
    <%=rkph%>  </td>
  <td align="right" width="10%"> 
    入库类型：</td>
  <td width="20%"> 
    <%=rklx%>  </td>
	<td align="right" width="10%"> 
    入库仓库：</td>
  <td width="20%"> 
    <%=ckbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    入库日期：</td>
  <td width="20%"> 
    <U>&nbsp;<%=nian%>&nbsp;</U>年<U>&nbsp;<%=yue%>&nbsp;</U>月<U>&nbsp;<%=ri%>&nbsp;</U>日  </td>
  <td align="right" width="10%"> 
    来源单位：</td>
  <td width="20%"> 
   <%=gysmc%>  </td>
  <td align="right" width="10%"> 
    来源单号：</td>
  <td width="20%"> 
    <%=lydh%> </td>
</tr>
</table>
<DIV>&nbsp;</DIV>
	  <table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF" align="center">
	<td width="4%"><b>序号</b></td>
	<td width="9%"><b>内部编码</b></td>
	<td width="19%"><b>材料名称</b></td>
	<td width="14%"><b>材料规格</b></td>
	<td width="7%"><b>计量单位</b></td>
	<td width="8%"><b>单价</b></td>
	<td width="8%"><b>入库数量</b></td>
	<td width="10%"><b>入库金额</b></td>
	<td width="21%"><b>备注</b></td>
</tr>

<%
int rkxh=0;
String clbm=null;
String nbbm=null;
String clmc=null;
String gg=null;
String jldwbm=null;
double rkj=0;
double rksl=0;
double rkje=0;

double xjrksl=0;
double xjrkje=0;

try {
	conn=cf.getConnection();

	ls_sql="select rkxh,clbm,nbbm,clmc,gg,jldwbm,rkj,rksl,rkje";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where jxc_rkmx.rkph='"+rkph+"'";
	ls_sql+=" order by rkxh ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{

		rkxh=rs.getInt("rkxh");
		clbm=cf.fillNull(rs.getString("clbm"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		rkj=rs.getDouble("rkj");
		rksl=rs.getDouble("rksl");
		rkje=rs.getDouble("rkje");


		xjrksl+=rksl;
		xjrkje+=rkje;

		%>
		<tr bgcolor="#FFFFFF" align="center">
			<td><%=rkxh%></td>
			<td><%=nbbm%></td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=rkj%></td>
			<td><%=rksl%></td>
			<td><%=rkje%></td>
			<td>&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	%>
	<tr bgcolor="#FFFFFF" align="center">
		<td colspan="2">合 计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(xjrksl)%></td>
		<td><%=cf.formatDouble(xjrkje)%></td>
		<td>&nbsp;</td>
	</tr>
	<%
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

</table>
</body>
</html>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table width="100%" border="0">
  <tr>
    <td width="33%"><font size="-1"><b>主&nbsp;&nbsp;管：</b></font></td>
    <td width="33%"><font size="-1"><b>库&nbsp;&nbsp;管：</b></font></td>
    <td width="33%"><font size="-1"><b>收货员：</b></font></td>
  </tr>
  <tr>
    <td width="33%"><font size="-1"><b>制表人：<%=yhmc%></b></font></td>
    <td width="33%"><font size="-1"><b>质&nbsp;&nbsp;检：</b></font></td>
    <td width="33%"><font size="-1"><b>送货司机：</b></font></td>
  </tr>
  <tr>
    <td colspan="2"><font size="-1"><b>备注：</b></font></td>
	<td colspan="2" align="right"><font size="-1">打印日期：<%=cf.today("YYYY-MM-DD")%></font></td>
  </tr>
</table>