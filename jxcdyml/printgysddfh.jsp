<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />

<%
String yhmc=(String)session.getAttribute("yhmc");
String gysddph=null;
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
String wheregysddph=null;
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
String xdrq=null;
String xdr=null;
String cglb=null;
int ckzsl=0;
String dz=null;
String dwmc=null;
String fhshr=null;
String shrsj=null;
String dh=null;
String shfgs=null;
String fhjlh=cf.GB2Uni(request.getParameter("fhjlh"));
String gysbm=cf.GB2Uni(request.getParameter("gysbm"));
//String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select gysddph ";
	ls_sql+=" from  jxc_gysfhjl ";
	ls_sql+=" where (fhjlh='"+fhjlh+"') and (gysbm='"+gysbm+"') ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wheregysddph=cf.fillNull(rs.getString("gysddph"));


	}
	rs.close();
	ps.close();
	

	ls_sql="select gysddph,to_char(yqdhsj,'YYYY') nian,to_char(yqdhsj,'MM') yue,to_char(yqdhsj,'DD') ri,gysmc,dqmc dqbm,DECODE(cglb,'J','集团采购','D','地方采购') cglb,xdr,to_char(xdrq,'YYYY-MM-DD') xdrq,to_char(yqdhsj,'YYYY-MM-DD') yqdhsj,dwmc fgsbh,DECODE(psfs,'1','配送','2','自取','3','其他') psfs,jxc_gysdd.bz bz,shfgs ";
	ls_sql+=" from  jxc_gysdd,sq_dwxx,dm_dqbm ";
	ls_sql+=" where (gysddph='"+wheregysddph+"') and jxc_gysdd.dqbm=dm_dqbm.dqbm and jxc_gysdd.ssfgs=sq_dwxx.dwbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ri=cf.fillNull(rs.getString("ri"));
		shfgs=cf.fillNull(rs.getString("shfgs"));

		psfs=cf.fillNull(rs.getString("psfs"));
		gysddph=cf.fillNull(rs.getString("gysddph"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		cglb=cf.fillNull(rs.getString("cglb"));
		xdr=cf.fillNull(rs.getString("xdr"));
		xdrq=cf.fillNull(rs.getString("xdrq"));
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

//	ls_sql="select count(*)+1 ";
//	ls_sql+=" from jxc_rkmx ";
//	ls_sql+=" where gysddph='"+gysddph+"'";
////	out.print(ls_sql);
//	ps= conn.prepareStatement(ls_sql);
//	rs =ps.executeQuery(ls_sql);
//	while (rs.next())
//	{
//		ckzsl=rs.getInt(1);
//	}
//	rs.close();
//	ps.close();
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
<title>材料发货单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> <U>&nbsp;<%=gysmc%>&nbsp;</U>材料发货单</div>
<div align="center"><font size="+3"><b>发&nbsp;&nbsp;&nbsp;货&nbsp;&nbsp;&nbsp;单</b></font></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    供&nbsp;应&nbsp;商：</td>
  <td colspan="5"> 
   <%=gysmc%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="10%"> 
    订单批号：</td>
  <td width="20%"> 
    <%=gysddph%>  </td>
		<td align="right" width="10%"> 
    配送方式：</td>
  <td width="20%"> 
    <%=psfs%>  </td>
  <td align="right" width="10%">要求到货日期：</td>
  <td width="25%"> <U>&nbsp;<%=nian%>&nbsp;</U>年<U>&nbsp;<%=yue%>&nbsp;</U>月<U>&nbsp;<%=ri%>&nbsp;</U>日 </td>
</tr>
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    收货地址：</td>
  <td colspan="5"> 
   <%=dz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="10%"> 
    收货单位：</td>
  <td width="20%"> 
    <%=dwmc%>  </td>
		<td align="right" width="10%"> 
    收&nbsp;货&nbsp;人：</td>
  <td width="20%"> 
    <%=fhshr%>（<%=shrsj%>）  </td>
  <td align="right" width="10%">联系方式：</td>
  <td width="25%"> <%=dh%> </td>
</tr>

</table>
<DIV>&nbsp;</DIV>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
	<td align="center" width="5%"><b>序号</b></td>
	<td align="center" width="10%"><b>内部编码</b></td>
	<td align="center" width="20%"><b>材料名称</b></td>
	<td align="center" width="15%"><b>型号</b></td>
	<td align="center" width="15%"><b>材料规格</b></td>
	<td align="center" width="5%"><b>发货数量</b></td>
	<td align="center" width="8%"><b>计量单位</b></td>
</tr>
<%
int lsxh=0;
int i=0;
String xh=null;
String clbm=null;
String clmc=null;
String gg=null;
String jldwmc=null;
String fhsj=null;
double pssl=0;
double sumpssl=0;
try {
	conn=cf.getConnection();
	ls_sql="select lsxh,jxc_clbm.nbbm clbm,jxc_clbm.xh xh,jxc_clbm.clmc clmc,jxc_clbm.gg gg,jldwbm jldwmc,jxc_gysfhjlmx.pssl pssl,to_char(fhsj,'YYYY-MM-DD') fhsj ";
	ls_sql+=" from jxc_gysfhjlmx,jxc_clbm ";
	ls_sql+=" where fhjlh='"+fhjlh+"' and gysbm='"+gysbm+"' and jxc_clbm.clbm=jxc_gysfhjlmx.clbm ";
//	ls_sql+=" order by 1 ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		lsxh=rs.getInt("lsxh");
		clbm=cf.fillNull(rs.getString("clbm"));
		xh=cf.fillNull(rs.getString("xh"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		fhsj=cf.fillNull(rs.getString("fhsj"));
		pssl=rs.getDouble("pssl");
		sumpssl+=pssl;
		%>
		<tr bgcolor="#FFFFFF">
		<td align="center"><%=lsxh%></td>
		<td align="center"><%=clbm%></td>
		<td align="center"><%=clmc%></td>
		<td align="center"><%=xh%></td>
		<td align="center"><%=gg%></td>
		<td align="center"><%=pssl%></td>
		<td align="center"><%=jldwmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
	%>
		<tr bgcolor="#FFFFFF">
		<td align="center" colspan="5">合计</td>
		<td align="center"><%=cf.formatDouble(sumpssl) %></td>
		<td align="center">&nbsp;</td>
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

&nbsp;<br>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table width="100%" border="0">
<!--   <tr>
    <td width="33%"><font size="-1"><b>主&nbsp;&nbsp;管：</b></font></td>
    <td width="33%"><font size="-1"><b>库&nbsp;&nbsp;管：</b></font></td>
    <td width="33%"><font size="-1"><b>收货员：</b></font></td>
  </tr> -->
  <tr>
    <td width="33%"><font size="-1"><b>制表人：<%=yhmc%></b></font></td>
    <td width="33%"><font size="-1"><b>发货人：<%=yhmc%></b></font></td>
    <td width="33%"><font size="-1"><b>发货日期：<u><%=fhsj%></b></font></td>
  </tr>
  <tr>
    <td width="33%"><font size="-1"><b>收货人：&nbsp;&nbsp;&nbsp;&nbsp;</b></font></td>
    <td width="33%"><font size="-1"><b>&nbsp;</b></font></td>
    <td width="33%"><font size="-1"><b>&nbsp;</b></font></td>
  </tr>
  <tr>
    <td colspan="2"><font size="-1"><b>备注：</b></font></td>
	<td colspan="2" align="right"><font size="-1">打印日期：<%=cf.today("YYYY-MM-DD")%></font></td>
  </tr>
</table>