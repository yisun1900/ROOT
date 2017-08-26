<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=request.getParameter("dwbh");
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String dwmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql =" select dwmc";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=rs.getString("dwmc");
	}
	rs.close();
	ps.close();

%>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">店面主材签单明细（<%=dwmc%>）
  <BR>(统计时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="11%">房屋地址</td>
	<td  width="4%">家装设计师</td>
	<td  width="4%">家居顾问</td>
	<td  width="4%">客户经理</td>
	<td  width="4%">业务员</td>

	<td  width="4%">报价级别</td>
	<td  width="3%">退单标志</td>
	<td  width="4%">签单记入业绩时间</td>
	<td  width="4%">退单记入业绩时间</td>


	<td  width="5%" >主材成本总额</td>
	<td  width="5%" >返券金额</td>
	<td  width="5%">折前合同总额</td>
	<td  width="3%">折扣率</td>
	<td  width="5%">折后合同总额</td>
	<td  width="5%">财务实收款</td>

	<td  width="6%">签约店面</td>
	<td  width="4%">签约日期</td>
	<td  width="4%">退单时间</td>
	<td  width="7%">领取礼品</td>


</tr>

<%
	String khbh=null;
	String khxm=null;
	String fwdz=null;
	String sjs=null;
	String clgw=null;
	String khjl=null;
	String ywy=null;

	String bjjbmc=null;
	String zt=null;
	String yjjzsj=null;
	String tdyjjzsj=null;

	double wdzgce=0;
	double zkl=0;
	double qye=0;
	double cwsfke=0;

//	String dwmc=null;
	String qyrq=null;
	String tdsj=null;


	double allwdzgce=0;
	double allqye=0;
	double allcwsfke=0;
	double allcbze=0;
	double allfqje=0;


	int row=0;
	ls_sql =" SELECT khbh,khxm,fwdz,sjs,clgw,khjl,ywy";
	ls_sql+=" ,bjjbmc,DECODE(crm_khxx.zt,'2','签单','3','退单客户','5','设计') zt,crm_khxx.yjjzsj,crm_khxx.tdyjjzsj";
	ls_sql+=" ,crm_khxx.wdzgce,crm_khxx.zkl,crm_khxx.qye,cwsfke";
	ls_sql+=" ,dwmc,crm_khxx.qyrq,crm_khxx.tdsj";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,bdm_bjjbbm";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and bdm_bjjbbm.lx='2'";//1：个性化；2：套餐
	ls_sql+=" and crm_khxx.zt in('2')";
	ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


	ls_sql+=" order by sjs,yjjzsj,hth";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillHtml(rs.getString("khbh"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		clgw=cf.fillHtml(rs.getString("clgw"));
		khjl=cf.fillHtml(rs.getString("khjl"));
		ywy=cf.fillHtml(rs.getString("ywy"));

		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		zt=cf.fillHtml(rs.getString("zt"));
		yjjzsj=cf.fillHtml(rs.getDate("yjjzsj"));
		tdyjjzsj=cf.fillHtml(rs.getDate("tdyjjzsj"));

		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		qye=rs.getDouble("qye");
		cwsfke=rs.getDouble("cwsfke");
		
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		tdsj=cf.fillHtml(rs.getDate("tdsj"));

		allwdzgce+=wdzgce;
		allwdzgce=cf.round(allwdzgce,2);
		allqye+=qye;
		allqye=cf.round(allqye,2);
		allcwsfke+=cwsfke;
		allcwsfke=cf.round(allcwsfke,2);



		row++;

		double cbze=0;
		ls_sql =" select sum(ROUND(bj_khzcxm.jsj*bj_khzcxm.xdsl,2)) cbze";
		ls_sql+=" from bj_khzcxm";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cbze=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		allcbze+=cbze;
		allcbze=cf.round(allcbze,2);

		double fqje=0;
		ls_sql =" select sum(fqje)";
		ls_sql+=" from cw_khfqdj";
		ls_sql+=" where cw_khfqdj.scbz='N' ";
		ls_sql+=" and cw_khfqdj.khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fqje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		allfqje+=fqje;
		allfqje=cf.round(allfqje,2);

		String lpmc="&nbsp;";
		ls_sql =" select lpmc";
		ls_sql+=" from yx_lqlpdj";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			lpmc+=rs1.getString(1)+"、";
		}
		rs1.close();
		ps1.close();


		%>
		<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td><%=row%></td>
		  <td ><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khbh%></A></td>
		  <td ><%=khxm%></td>
		  <td ><%=fwdz%></td>
		  <td ><%=sjs%></td>
		  <td ><%=clgw%></td>
		  <td ><%=khjl%></td>
		  <td ><%=ywy%></td>

		  <td ><%=bjjbmc%></td>
		  <td ><%=zt%></td>
		  <td ><%=yjjzsj%></td>
		  <td ><%=tdyjjzsj%></td>

		  <td ><%=cbze%></td>
		  <td ><%=fqje%></td>
		  <td ><%=wdzgce%></td>
		  <td ><%=zkl%></td>
		  <td ><%=qye%></td>
		  <td ><%=cwsfke%></td>

		  <td ><%=dwmc%></td>
		  <td ><%=qyrq%></td>
		  <td ><%=tdsj%></td>
		  <td ><%=lpmc%></td>

		</tr> 
		<%
	}
	rs.close();
	ps.close();


%> 

<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
  <td colspan="2">小 计</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>

  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>

  <td ><%=allcbze%></td>
  <td ><%=allfqje%></td>
  <td ><%=allwdzgce%></td>
  <td >&nbsp;</td>
  <td ><%=allqye%></td>
  <td ><%=allcwsfke%></td>

  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>

</tr> 

</table>
</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
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

<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 