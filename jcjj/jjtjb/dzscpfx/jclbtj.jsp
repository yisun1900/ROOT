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
String dwbh1=request.getParameter("dwbh");
String wheresql="";
if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh1!=null)
	{
		if (!(dwbh1.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh1+"'";
	}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String dwbh2="";

String ls_sql=null;
try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<%
	String dwmc=null;
	String dwbh=null;
	int alllxsl=0;
	int allqds=0;
	double jjqye=0;
	double mmqye=0;
	double cgqye=0;
	double jzqye=0;
	String bgcolor="#FFFFFF";
%>

	<CENTER >
	<br>
	<b>各店面橱订制式产品加权平均比例排行榜<br>(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> </b></CENTER >
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
	<tr bgcolor="#CCCCCC"  align="center">
	  <td  width="8%">排名</td>
	  <td  width="8%">店面</td>
	 <td  width="8%">订制式产品数量</td>
	  <td  width="7%">加权平均比例</td>
	</tr>
<%
	int alldzscp=0;
    int row=0;
	ls_sql="SELECT dwmc,crm_khxx.dwbh,count((crm_khxx.khbh)) ";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";//是否全部定义为家装客户类型?
	ls_sql+=wheresql;
	ls_sql+=" group by dwmc,crm_khxx.dwbh";
	ls_sql+=" order by count((crm_khxx.khbh)) desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);	
	while(rs.next())
	{
		double cgsl=0;
		double mmsl=0;
		double jjsl=0;
		double jzddl=0;
		double jqz=0;
		double dzscp=0;

		dwbh2=rs.getString("dwbh");
		dwmc=rs.getString("dwmc");
		jzddl=rs.getInt(3);//家装定单数
		row++;
		//木门定单数
		ls_sql=" SELECT COUNT(*) from jc_mmydd,crm_khxx where jc_mmydd.khbh=crm_khxx.khbh ";
		ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.dwbh='"+dwbh2+"'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		//out.print(ls_sql);
		if (rs1.next())
		{
			jjsl=(rs1.getInt(1)+0.0);
		}
		ps1.close();
		rs1.close();
		//家具定单数
		ls_sql=" SELECT COUNT(*)  from jc_jjdd,crm_khxx where jc_jjdd.khbh=crm_khxx.khbh and jc_jjdd.clzt='99'";
		ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.dwbh='"+dwbh2+"'";
		ls_sql+=wheresql;
		
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		
		if (rs1.next())
		{
			mmsl=(rs1.getInt(1)+0.0);
		}
		ps1.close();
		rs1.close();
		//橱柜定单数
		ls_sql="SELECT COUNT(*) from jc_cgdd,crm_khxx where jc_cgdd.khbh=crm_khxx.khbh  ";
		ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.dwbh='"+dwbh2+"'";
		ls_sql+=wheresql;	
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			cgsl=(rs1.getInt(1)+0.0);
		}
		ps1.close();
		rs1.close();
		if((jjsl+mmsl+cgsl)>0)
		{
			jqz=((cgsl*cgsl)/jzddl+(mmsl*mmsl)/jzddl+(jjsl*jjsl)/jzddl)*100/(jjsl+mmsl+cgsl);//平均加权值
		}
		else
		{
			
		}
		dzscp=jjsl+mmsl+cgsl;
		alldzscp+=dzscp;

	%>
	<tr   align="center">
		<td  width="8%" ><%=row%></td>
		<td  width="8%" ><%=dwmc%></td>
		<td  width="8%" ><%=dzscp%></td>
		<td  width="6%" align="left"><img src="/images/ColuGif.gif" width="<%=jqz%>" height="14"><%=cf.formatDouble(jqz)%>%</td>
	</tr>
<%
	}
	rs.close();
	ps.close();
%>
 <tr   align="center">
	  <td  width="8%">总计</td>
	  <td  width="7%">&nbsp;</td>
	  <td  width="6%"><%=alldzscp%></td>
	  <td  width="8%">&nbsp;</td>
</tr> 
</table> 
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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
