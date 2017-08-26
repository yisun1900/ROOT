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
    <td colspan="8" align="center" class="STYLE2" ><B>快捷家装工长主材购物清单（<%=bjjb%>）&nbsp; LWTC-08</B></td>
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

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td  width="20%" align="center">产品名称</td>
    <td  width="10%" align="center">SKU号</td>
    <td  width="15%" align="center">品牌</td>
    <td  width="8%" align="center">单位</td>
    <td  width="8%" align="center">数量</td>
	<td  width="8%" align="center">单价</td>
	<td  width="8%" align="center">总价</td>
    <td  width="52%" align="center">备注</td>
  </tr>

	
<%
	int i=0;

	//输出项目明细
	String ppmc=null;
	String cpmc=null;
	String sku=null;
	String jldw=null;
	double sl=0;
	double jsj=0;
	double je=0;
	double xjje=0;
	ls_sql="SELECT cpmc,sku,ppmc,jldw,sum(sl) sl,jsj";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.sfcscp='Y'";
	ls_sql+=" group by cpmc,sku,ppmc,jldw,jsj";
	ls_sql+=" order by sku";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cpmc=rs.getString("cpmc");
		sku=cf.fillHtml(rs.getString("sku"));
		ppmc=rs.getString("ppmc");
		jldw=rs.getString("jldw");
		sl=rs.getDouble("sl");
	    jsj=rs.getDouble("jsj");

		je=sl*jsj;
		je=cf.round(je,2);
		xjje+=je;
		

		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td align="center"><%=cpmc%></td>
			<td align="center"><%=sku%></td>
			<td align="center"><%=ppmc%></td>
			<td align="center"><%=jldw%></td>
			<td align="center"><%=cf.formatDouble(sl)%></td>
			<td align="center"><%=jsj%></td>
			<td align="center"><%=cf.formatDouble(je)%></td>
			<td >&nbsp;</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

%> 
  		
  <tr bgcolor="#FFFFFF"> 
	<td align="center">合  计</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center"><%=cf.formatDouble(xjje)%></td>
	<td >&nbsp;</td>
  </tr>

</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">顾客：</td>
    <td colspan="2" height="42">设计师：</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" >日期：</td>
    <td colspan="2" >日期：</td>
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






