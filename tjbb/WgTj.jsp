<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>完工工程明细表<BR>
  (完工时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="3%">序号</td>
  <td  width="7%">工长 </td>
  <td  width="10%">合同号 </td>
  <td  width="10%">客户姓名</td>
  <td  width="9%">合同金额</td>
  <td  width="9%">增减金额</td>
  <td  width="7%">增减率</td>
  <td  width="13%">店面</td>
  <td  width="7%">设计师</td>
  <td  width="25%">增减项原因</td>
</tr>
<%
String all=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String khbh=null;
String sgd=null;
String sgdmc=null;
String hth=null;
String khxm=null;
double qye=0;
double zjje=0;
double zjl=0;
double allqye=0;
double allzjje=0;
double allzjl=0;
String dm=null;
String sjs=null;
String ys=null;
String zjxyymc=null;
try {
	conn=cf.getConnection();

	int row=0;
	ls_sql=" SELECT khbh,crm_khxx.sgd sgd,sgdmc,hth,khxm,qye,a.dwmc dm,sjs,''";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" order by crm_khxx.sgd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		qye=rs.getDouble("qye");
		dm=cf.fillHtml(rs.getString("dm"));
		sjs=cf.fillHtml(rs.getString("sjs"));

		allqye+=qye;

		row++;

		zjje=0;
		zjl=0;
		ls_sql =" select sum(zjje)";
		ls_sql+=" from crm_zjxdj";
		ls_sql+=" where khbh='"+khbh+"'";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			zjje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		allzjje+=zjje;

		int zjs=(int)(zjje/qye*10000);
		zjl=zjs/100.0;


		zjxyymc="";
		ls_sql =" select zjxyymc";
		ls_sql+=" from crm_zjxyydj,dm_zjxyybm";
		ls_sql+=" where crm_zjxyydj.zjxyybm=dm_zjxyybm.zjxyybm and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			zjxyymc+=rs1.getString(1)+"；";
		}
		rs1.close();
		ps1.close();

		if (row%2==0)
		{
			ys="#E8E8FF";
		}
		else{
			ys="#FFFFFF";
		}
		if (zjxyymc.equals(""))
		{
			zjxyymc="&nbsp;";
		}
%>
<tr bgcolor="<%=ys%>"  align="center">
  <td ><%=row%></td>
  <td ><%=sgdmc%></td>
  <td ><%=hth%></td>
  <td ><%=khxm%></td>
  <td ><%=qye%></td>
  <td ><%=zjje%></td>
  <td ><%=zjl%>%</td>
  <td ><%=dm%></td>
  <td ><%=sjs%></td>
  <td align="left"><%=zjxyymc%></td>
</tr>

<%
	}
	rs.close();
	ps.close();

	int zjs=(int)(allzjje/allqye*10000);
	allzjl=zjs/100.0;
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
<tr bgcolor="<%=ys%>"  align="center">
  <td >合计</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td ><%=(int)(allqye*100)/100.0%></td>
  <td ><%=allzjje%></td>
  <td ><%=allzjl%>%</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
</tr>
</table>


</body>
</html>