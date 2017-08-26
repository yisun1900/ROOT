<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />

<%
String yhmc=(String)session.getAttribute("yhmc");

String clbmlist="";
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
String gysddph=null;
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
String yqdhsj=null;
String lrsj=null;
String lrr=null;
String cglb=null;
int ckzsl=0;
String dz=null;
String dwmc=null;
String fhshr=null;
String shrsj=null;
String dh=null;
String shfgs=null;
String sfrksgdw=null;
String sgph=null;
gysddph=cf.GB2Uni(request.getParameter("gysddph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	

	ls_sql="select sfrksgdw,sgph,jxc_gysdd.ssfgs,gysddph,to_char(yqdhsj,'YYYY') nian,to_char(yqdhsj,'MM') yue,to_char(yqdhsj,'DD') ri,gysmc,dqmc dqbm,DECODE(cglb,'J','集团采购','D','地方采购') cglb,lrr,to_char(lrsj,'YYYY-MM-DD') lrsj,to_char(yqdhsj,'YYYY-MM-DD') yqdhsj,dwmc fgsbh,DECODE(psfs,'1','配送','2','自取','3','其他') psfs,jxc_gysdd.bz bz ";
	ls_sql+=" from  jxc_gysdd,sq_dwxx,dm_dqbm ";
	ls_sql+=" where (gysddph='"+gysddph+"') and jxc_gysdd.dqbm=dm_dqbm.dqbm and jxc_gysdd.ssfgs=sq_dwxx.dwbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfrksgdw=cf.fillNull(rs.getString("sfrksgdw"));
		sgph=cf.fillNull(rs.getString("sgph"));
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ri=cf.fillNull(rs.getString("ri"));
		shfgs=cf.fillNull(rs.getString("ssfgs"));

		psfs=cf.fillNull(rs.getString("psfs"));
		gysddph=cf.fillNull(rs.getString("gysddph"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		cglb=cf.fillNull(rs.getString("cglb"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		yqdhsj=cf.fillNull(rs.getString("yqdhsj"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		bz=cf.fillNull(rs.getString("bz"));

	}
	rs.close();
	ps.close();


	
	//查询分公司联系人及地址
	ls_sql="select dwbh,dwmc,dh,cz,jbr,jbrsj,shr,shrsj,fzr,fzrsj,dz,khyh,zh,khrxm,khyh1,zh1,khrxm1,khyh2,zh2,khrxm2,sm1,sm2 ";
	ls_sql+=" from  jxc_fgslxr ";
	ls_sql+=" where (dwbh='"+shfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dz=cf.fillNull(rs.getString("dz"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		fhshr=cf.fillNull(rs.getString("shr"));
		shrsj=cf.fillNull(rs.getString("shrsj"));
		dh=cf.fillNull(rs.getString("dh"));

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
<title>采购订单</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td width="34%" height="32"><span lang=EN-US><img src="tubiao1.jpg" v:shapes="_x0000_i1025" width="200"></span></td>
  <td width="33%" height="32" align="center"><font size="+2"><b>采购订单</b></font></td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="32" colspan="2">供应商：<u><%=gysmc%></u></td>
  <td>订单号：<u><%=gysddph%></u></td>
</tr>
<tr bgcolor="#FFFFFF"  height="32">
  <td>联 络 人：</td>
  <td>税    率:</td>
  <td>订单日期：<u><%=lrsj%></u></td>
</tr>
<tr bgcolor="#FFFFFF"  height="32">
  <td>电话：</td>
  <td>传    真：</td>
  <td>下 单 人：<u><%=lrr%></u></td>
</tr>
<tr bgcolor="#FFFFFF"  height="32">
  <td>收货地址：<u><%=dz%></u></td>
  <td>收 货 人：<u><%=fhshr%></u></td>
  <td>收货人电话：<u><%=shrsj%></u></td>
</tr>
</table>

<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">


<tr bgcolor="#FFFFFF" align="center">
	<td  width="4%">序号</td>
	<td  width="10%">物料编码</td>
	<td  width="14%">产品名称</td>
	<td  width="13%">产品型号</td>
	<td  width="13%">规格尺寸</td>
	<td  width="7%">单价（元）</td>
	<td  width="6%">数量单位</td>
	<td  width="6%">订购数量</td>
	<td  width="9%">金额（元）</td>
	<td  width="7%">交货时间</b></td>
	<td  width="12%">备注</td>
</tr>
<%
int dhxh=0;
int i=0;
String clbm=null;
String clmc=null;
String xh=null;
String gg=null;
String jldwmc=null;
double cbj=0;
double dhsl=0;
double dhje=0;
double sumcbj=0;
double sumdhsl=0;
double sumsjdhsl=0;
double sumckje=0;
try {
	conn=cf.getConnection();
	ls_sql="select dhxh,jxc_gysddmx.clbm clbm,clmc,xh,gg,jldwbm jldwmc,cbj,dhsl,dhje";
	ls_sql+=" from jxc_gysddmx ";
	ls_sql+=" where gysddph='"+gysddph+"'";
	ls_sql+=" order by dhxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		dhxh=rs.getInt("dhxh");
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		cbj=rs.getDouble("cbj");
		dhsl=rs.getDouble("dhsl");
		dhje=rs.getDouble("dhje");

		sumcbj+=cbj;
		sumdhsl+=dhsl;
		sumckje+=dhje;

		%>
		<tr bgcolor="#FFFFFF" align="center">
		<td ><%=dhxh%></td>
		<td ><%=clbm%></td>
		<td ><%=clmc%></td>
		<td ><%=xh%></td>
		<td ><%=gg%></td>
		<td ><%=cbj%></td>
		<td ><%=jldwmc%></td>
		<td ><%=dhsl%></td>
		<td ><%=dhje%></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	%>
		<tr bgcolor="#FFFFFF" align="center">
		<td height="30"  colspan="8" align="left">金额合计（人民币）：<%=cf.NumToRMBStr(sumckje)%></td>

		<td align="center" ><%=cf.formatDouble(sumckje)%></td>
		<td colspan="2" align="center">&nbsp;</td>
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
		<td colspan="11" ><font size="-1">结算方式：□预付100%发货
		&nbsp;&nbsp;&nbsp;&nbsp;□预付30%发货
		&nbsp;&nbsp;&nbsp;&nbsp;□货到付款100%
		&nbsp;&nbsp;&nbsp;&nbsp;□月结30天</font></td>
		</tr>

		<tr bgcolor="#FFFFFF"  height="27">
		<td colspan="11" ><font size="-1">一、品质：其不同型号的产品按具体的图纸和样品执行，同时兼顾合同之约定。</font></td>
		</tr>
		<tr bgcolor="#FFFFFF"  height="27">
          <td colspan="11" ><font size="-1">二、其余条款按合同之约定执行。</font></td>
  </tr>
		<tr bgcolor="#FFFFFF"  height="27">
          <td colspan="11" ><font size="-1">三、供应商收到本公司订单后必须在4小时内确认接受采购事项并回传我司，24小时内未提出异议视作订单默认。</font></td>
  </tr>

		<tr bgcolor="#FFFFFF" height="27">
		<td colspan="4" ><font size="-1">下单\时间： </font></td>
		<td colspan="4" ><font size="-1">审批\时间：</font></td>
		<td colspan="3" >确认回签（印鉴）：</td>
		</tr>
</table>



</body>
</html>
