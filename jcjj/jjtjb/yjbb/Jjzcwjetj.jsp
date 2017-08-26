<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String zgsmc=(String)session.getAttribute("zgsmc");
String cxrq=request.getParameter("cxrq");
String cxrq2=request.getParameter("cxrq2");
%>
<html>
<head>
<title>统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

 <body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<center><B>家居顾问外主材完结额实收款<br>(统计时间：<%=cxrq%>--<%=cxrq2%>)</B></center><BR>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ztjjgw=null;
	ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
	String wheresql="";
	if(ztjjgw!=null)
	{
		if(!(ztjjgw.equals("")))
		{
				wheresql=" and jc_zcdd.clgw='"+ztjjgw+"'";
		}
	}
	String ddrq=null;
	String khbh1=null;
	double allfkje=0;
	Connection conn  = null;
	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	PreparedStatement ps2=null;
	ResultSet rs2=null;
	String ls_sql=null;
	ResultSet rs=null;
	String yhmc=null;
	String mmsl=null;
	
	double htje5=0;
%>
<table  width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:12">
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">序号</td>
		<td  width="4%">家居顾问</td>
		<td  width="6%">实收款额</td>
		<td  width="6%">所占比例</td>

	</tr>
<%

try {
		double fkje1=0;
		int row=0;
		conn=cf.getConnection();

		//主材完结总额
		ls_sql="select sum(jc_zcdd.hkze+jc_zcdd.zjhze) from crm_KHXX,jc_zcdd where  CRM_khxx.khbh=jc_zcdd.khbh  and jc_zcdd.clzt='20' ";
		ls_sql+="and jc_zcdd.wjsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_zcdd.wjsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD') ";
		ls_sql+=wheresql;
		ps2= conn.prepareStatement(ls_sql);
		rs2=ps2.executeQuery(ls_sql);
		if(rs2.next())
		{
			fkje1=rs2.getDouble(1);
		}
		
		rs2.close();
		ps2.close();

		if(fkje1==0)
		{
			return;
		}
		
		//按家居顾问进行统计
		ls_sql="select clgw,sum(jc_zcdd.hkze+jc_zcdd.zjhze) from crm_KHXX,jc_zcdd where  CRM_khxx.khbh=jc_zcdd.khbh  and jc_zcdd.clzt='20' ";
		ls_sql+="and jc_zcdd.wjsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_zcdd.wjsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD') ";
		ls_sql+=wheresql;
		ls_sql+="group by clgw";
		ls_sql+=" order by sum(jc_zcdd.hkze+jc_zcdd.zjhze) desc ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			double fkje=0;
			row++;
			yhmc=rs.getString("clgw");
			fkje=rs.getDouble(2);
			allfkje+=fkje;

%>

		<tr align="center">
			<td  width="4%"><%=row%></td>
			<td  width="4%"><%=yhmc%></td>
			<td  width="4%"><%=cf.formatDouble(fkje)%></td>
			<td  width="6%" align="left"><img src="/images/ColuGif.gif" width="<%=cf.formatDouble(fkje*100/fkje1)%>" height="14"><%=cf.formatDouble(fkje*100/fkje1)%>%</td>
		</tr>		
<%
	}
	rs.close();
	ps.close();

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>
		<tr  align="center">
			<td  width="4%"><font color="red"><b>合计(元)</b></td>
			<td  width="6%">  &nbsp;&nbsp;&nbsp; </td>
			<td  width="4%"><%=cf.formatDouble(allfkje)%></td>
			<td  width="6%"> &nbsp;&nbsp;&nbsp;</td>
		</tr>
</table>

<table  width="100%" border="0" cellpadding="1" cellspacing="0" style="FONT-SIZE:16">
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right"><%=zgsmc%>家居管理中心</td><td>&nbsp;&nbsp;</td></tr>
</table></body>
</html>