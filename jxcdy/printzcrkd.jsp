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
int ckzsl=0;
double yf=0;
double qtfy=0;
whererkph=cf.GB2Uni(request.getParameter("rkph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select yf,qtfy,rkph,dqmc dqbm,ckmc ckbh,DECODE(rklx,'D','订单入库','B','报废入库','T','退货入库','Q','调拨入库','S','申购入库','P','配送入库','J','代金券入库','C','采购入库') rklx,DECODE(rkdzt,'0','录入未提交',' 1','等待报废审核','2','等待退货审核','3','等待调拨入库','4','报废审核通过','5','退货审核通过','6','报废审核未通过','7','退货审核未通过','8','审核通过','9','入库完成') rkdzt,dwmc fgsbh,rkr,to_char(rksj,'YYYY-MM-DD') rksj,jxc_rkd.bz bz,to_char(rksj,'YYYY') nian,to_char(rksj,'MM') yue,to_char(rksj,'DD') ri,gysmc,lydh,shr,zbshr,xzbshyy ";
	ls_sql+=" from  jxc_rkd,dm_dqbm,jxc_ckmc,sq_dwxx ";
	ls_sql+=" where jxc_rkd.ckbh=jxc_ckmc.ckbh and jxc_rkd.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and jxc_rkd.rkrssfgs=sq_dwxx.dwbh ";
	ls_sql+=" and  (rkph='"+whererkph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yf=rs.getDouble("yf");
		qtfy=rs.getDouble("qtfy");
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td height="32"><span lang=EN-US><img src="tubiao1.jpg" v:shapes="_x0000_i1025" width="200"></span></td>
  <td height="32" align="center"><font size="+2"><b>入&nbsp;库&nbsp;单</b></font></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="32" colspan="2">供应商名称：<u><%=gysmc%></u></td>
  <td>入库单号：<u><%=rkph%></u></td>
</tr>
<tr bgcolor="#FFFFFF"  height="32">
  <td width="34%">收货仓库：<u><%=ckbh%></u></td>
  <td width="33%">入库时间：<u>&nbsp;<%=nian%>&nbsp;</u>年<u>&nbsp;<%=yue%>&nbsp;</u>月<u>&nbsp;<%=ri%>&nbsp;</u>日 </td>
	<td width="33%">经办人：<u><%=rkr%></u></td>
</tr>
</table>

<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">


<tr bgcolor="#FFFFFF" align="center">
	<td  width="4%"><b>编号</b></td>
	<td  width="16%"><b>产品名称</b></td>
	<td  width="15%"><b>产品型号</b></td>
	<td  width="10%"><b>生产批号</b></td>
	<td  width="15%"><b>规格尺寸</b></td>
	<td  width="7%"><b>单价（元）</b></td>
	<td  width="6%"><b>数量单位</b></td>
	<td  width="6%"><b>数量</b></td>
	<td  width="9%"><b>金额（元）</b></td>
	<td  width="12%"><b>备注</b></td>
</tr>
<%
int rkxh=0;
int i=0;
String clbm=null;
String clmc=null;
String xh=null;
String gg=null;
String jldwmc=null;
String scph=null;
double rkj=0;
double rksl=0;
double rkje=0;
double sumrkj=0;
double sumrksl=0;
double sumsjrksl=0;
double sumckje=0;
try {
	conn=cf.getConnection();
	ls_sql="select rkxh,jxc_rkmx.clbm clbm,clmc,xh,gg,scph,jldwbm jldwmc,rkj,rksl,rkje";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where rkph='"+rkph+"'";
	ls_sql+=" order by rkxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		rkxh=rs.getInt("rkxh");
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		scph=cf.fillHtml(rs.getString("scph"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		rkj=rs.getDouble("rkj");
		rksl=rs.getDouble("rksl");
		rkje=rs.getDouble("rkje");

		sumrkj+=rkj;
		sumrksl+=rksl;
		sumckje+=rkje;

		%>
		<tr bgcolor="#FFFFFF" align="center">
		<td ><%=rkxh%></td>
		<td ><%=clmc%></td>
		<td ><%=xh%></td>
		<td ><%=scph%></td>
		<td ><%=gg%></td>
		<td ><%=rkj%></td>
		<td ><%=jldwmc%></td>
		<td ><%=rksl%></td>
		<td ><%=rkje%></td>
		<td >&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	%>
		<tr bgcolor="#FFFFFF" align="center">
		<td height="30"  colspan="8">入库金额合计：<%=cf.NumToRMBStr(sumckje)%></td>

		<td ><%=cf.formatDouble(sumckje)%></td>
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

		<tr bgcolor="#FFFFFF" height="27">
		<td colspan="3" ><font size="-1"><b>运费（小写）：<%=yf%></b></font></td>
		<td colspan="3" ><font size="-1"><b>其他费用（小写）：<%=qtfy%></b></font></td>
		<td colspan="4" ><font size="-1"><b>费用合计(运费+其它费用)：<%=cf.round(yf+qtfy,2)%></b></font></td>
		</tr>

		<tr bgcolor="#FFFFFF" align="center" height="27">
		<td colspan="10" ><font size="-1"><b>此入库单一试四联，第一联存根、第二联为财务联、第三联为供应商留存、第四联为库管留存</b></font></td>
		</tr>

		<tr bgcolor="#FFFFFF" height="27">
		<td colspan="4" ><font size="-1"><b>材料管理人/时间： </b></font></td>
		<td colspan="6" ><font size="-1"><b>审核/时间：</b></font></td>
		</tr>

</table>



</body>
</html>
