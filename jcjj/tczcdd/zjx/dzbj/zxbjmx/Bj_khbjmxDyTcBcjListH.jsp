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

try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj";
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
    <td colspan="8" align="center" class="STYLE2" ><B>套餐－顶配主材清单（<%=bjjb%>）&nbsp;LWTC-07</B></td>
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
</table>

<center>顶配升级</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
	<td  width="14%">名称</td>
	<td  width="13%">品牌</td>
	<td  width="10%">空间</td>
	<td  width="13%">型号</td>
	<td  width="6%">计量单位</td>
    <td  width="8%">数量</td>
	<td  width="8%">补差价</td>
	<td  width="9%">总价</td>
    <td  width="52%">备注</td>
  </tr>

	
<%
	int i=0;

	//输出项目明细
	String jgwzbm=null;
	String ppmc=null;
	String cpmc=null;
	String sku=null;
	String jldw=null;
	String xh=null;
	double sl=0;
	double dj=0;
	double je=0;

	double xjje=0;
	double zjje=0;

	String zclx="";
	String zclxmc="";
	String ddcljjfs="";

	ls_sql="SELECT jgwzbm,cpmc,sku,ppmc,xh,jldw,dj,sum(sl) sl,sum(ROUND(dj*sl,2)) je,zclx,decode(zclx,'3','顶配升级','4','独立收费') zclxmc,decode(ddcljjfs,'0','套餐主材','1','顶配升级','2','顶配独立收费','3','套餐选配') ddcljjfs";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and zclx in('3')";//1：套餐内；2：套餐外；3：升级大店；4：大店外
	ls_sql+=" group by jgwzbm,cpmc,sku,ppmc,xh,jldw,dj,zclx,ddcljjfs";
	ls_sql+=" order by ppmc,cpmc,jgwzbm,ddcljjfs,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgwzbm=rs.getString("jgwzbm");
		cpmc=rs.getString("cpmc");
		ppmc=rs.getString("ppmc");
		xh=rs.getString("xh");
		jldw=rs.getString("jldw");
		sku=cf.fillHtml(rs.getString("sku"));

		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
	    je=rs.getDouble("je");

		zclx=rs.getString("zclx");
		zclxmc=rs.getString("zclxmc");
		ddcljjfs=rs.getString("ddcljjfs");

		xjje+=je;
		zjje+=je;
		

		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=cpmc%></td>
			<td><%=ppmc%></td>
			<td><%=jgwzbm%></td>
			<td><%=xh%></td>
			<td><%=jldw%></td>
			<td><%=cf.formatDouble(sl)%></td>
			<td><%=dj%></td>
			<td><%=cf.formatDouble(je)%></td>
			<td >&nbsp;</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

%>
  <tr bgcolor="#FFFFFF" align="center"> 
	<td>小  计</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(xjje)%></td>
	<td >&nbsp;</td>
  </tr>
</table>

<center>顶配独立收费</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
	<td  width="14%">名称</td>
	<td  width="13%">品牌</td>
	<td  width="10%">空间</td>
	<td  width="13%">型号</td>
	<td  width="6%">计量单位</td>
    <td  width="8%">数量</td>
	<td  width="8%">单价</td>
	<td  width="9%">总价</td>
    <td  width="52%">备注</td>
  </tr>

<%
	xjje=0;
	ls_sql="SELECT jgwzbm,cpmc,sku,ppmc,xh,jldw,dj,sum(sl) sl,sum(ROUND(dj*sl,2)) je,zclx,decode(zclx,'3','顶配升级','4','独立收费') zclxmc,decode(ddcljjfs,'0','套餐主材','1','顶配升级','2','顶配独立收费','3','套餐选配') ddcljjfs";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and zclx in('4')";//1：套餐内；2：套餐外；3：升级大店；4：大店外
	ls_sql+=" and ddcljjfs in('1','2')";//0：非大店材料；1：顶配（补差价）；2：顶配（独立计价）；3：套餐选配
	ls_sql+=" group by jgwzbm,cpmc,sku,ppmc,xh,jldw,dj,zclx,ddcljjfs";
	ls_sql+=" order by ppmc,cpmc,jgwzbm,ddcljjfs,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgwzbm=rs.getString("jgwzbm");
		cpmc=rs.getString("cpmc");
		ppmc=rs.getString("ppmc");
		xh=rs.getString("xh");
		jldw=rs.getString("jldw");
		sku=cf.fillHtml(rs.getString("sku"));

		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
	    je=rs.getDouble("je");

		zclx=rs.getString("zclx");
		zclxmc=rs.getString("zclxmc");
		ddcljjfs=rs.getString("ddcljjfs");

		xjje+=je;
		zjje+=je;
	

		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=cpmc%></td>
			<td><%=ppmc%></td>
			<td><%=jgwzbm%></td>
			<td><%=xh%></td>
			<td><%=jldw%></td>
			<td><%=cf.formatDouble(sl)%></td>
			<td><%=dj%></td>
			<td><%=cf.formatDouble(je)%></td>
			<td >&nbsp;</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();
%> 
   <tr bgcolor="#FFFFFF" align="center"> 
	<td>小  计</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(xjje)%></td>
	<td >&nbsp;</td>
  </tr>
</table>
 		

<center>选配项</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
	<td  width="14%">名称</td>
	<td  width="13%">品牌</td>
	<td  width="10%">空间</td>
	<td  width="13%">型号</td>
	<td  width="6%">计量单位</td>
    <td  width="8%">数量</td>
	<td  width="8%">单价</td>
	<td  width="9%">总价</td>
    <td  width="52%">备注</td>
  </tr>

<%
	xjje=0;
	ls_sql="SELECT jgwzbm,cpmc,sku,ppmc,xh,jldw,dj,sum(sl) sl,sum(ROUND(dj*sl,2)) je,zclx,decode(zclx,'3','顶配升级','4','独立收费') zclxmc,decode(ddcljjfs,'0','套餐主材','1','顶配升级','2','顶配独立收费','3','套餐选配') ddcljjfs";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and zclx in('4')";//1：套餐内；2：套餐外；3：升级大店；4：大店外
	ls_sql+=" and ddcljjfs='3'";//0：非大店材料；1：顶配（补差价）；2：顶配（独立计价）；3：套餐选配
	ls_sql+=" group by jgwzbm,cpmc,sku,ppmc,xh,jldw,dj,zclx,ddcljjfs";
	ls_sql+=" order by ppmc,cpmc,jgwzbm,ddcljjfs,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgwzbm=rs.getString("jgwzbm");
		cpmc=rs.getString("cpmc");
		ppmc=rs.getString("ppmc");
		xh=rs.getString("xh");
		jldw=rs.getString("jldw");
		sku=cf.fillHtml(rs.getString("sku"));

		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
	    je=rs.getDouble("je");

		zclx=rs.getString("zclx");
		zclxmc=rs.getString("zclxmc");
		ddcljjfs=rs.getString("ddcljjfs");

		xjje+=je;
		zjje+=je;
	

		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=cpmc%></td>
			<td><%=ppmc%></td>
			<td><%=jgwzbm%></td>
			<td><%=xh%></td>
			<td><%=jldw%></td>
			<td><%=cf.formatDouble(sl)%></td>
			<td><%=dj%></td>
			<td><%=cf.formatDouble(je)%></td>
			<td >&nbsp;</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();
%> 
   <tr bgcolor="#FFFFFF" align="center"> 
	<td>小  计</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(xjje)%></td>
	<td >&nbsp;</td>
  </tr>
 		
  <tr bgcolor="#FFFFFF" align="center"> 
	<td>总  计</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(zjje)%></td>
	<td >&nbsp;</td>
  </tr>

</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">顾客：</td>
    <td colspan="2" height="42">设计师：</td>
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






