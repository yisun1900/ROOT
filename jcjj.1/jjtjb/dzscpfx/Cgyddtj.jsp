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

String ls_sql=null;
try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<%
	//获取最大数


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
<b>各店面橱柜预定单占家装签约单比例排行榜<br>(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> </b></CENTER >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="8%">排名</td>
  <td  width="8%">店面</td>
  <td  width="6%">合同金额</td>
 
  <td  width="7%">占有率</td>
</tr>
<%
	 double maxqye=0;
	 double htze=0;
     int row=0;

	ls_sql="SELECT max(sum(qye))";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.zt='2'";
	
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxqye=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	//out.println(ls_sql);

	ls_sql="SELECT dwmc,sum(jc_cgdd.htze) htze";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cgdd";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	//ls_sql+=" and crm_khxx.zt='2'";//是否全部定义为家装客户类型
	ls_sql+=wheresql;
	ls_sql+=" group by dwmc";
	ls_sql+=" order by sum(jc_cgdd.htze) desc";
	//out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	while(rs.next())
	{
	
		dwmc=rs.getString("dwmc");
		htze=rs.getDouble("htze");
		row++;
		allqds+=htze;
		
		
		
	%>
<tr   align="center">
<td  width="8%" ><%=row%></td>
  <td  width="8%" ><%=dwmc%></td>
  <td  width="6%" ><%=htze%></td>
  <td  width="7%" align="left"><img src="/images/ColuGif.gif" width="<%=htze*100/maxqye%>" height="14"><%=cf.formatDouble(htze*100/maxqye)%>%</td>
</tr>
<%
	}
	rs.close();
	ps.close();
%>
 <tr   align="center">
  <td  width="8%">总计</td>
  
  <td  width="7%">&nbsp;</td>
  <td  width="6%"><%=allqds%></td>
  <td  width="8%">&nbsp;</td>
 

</tr> 
</table> 

<CENTER >
<br>
<b>各店面木门预定单占家装签约单比例排行榜<br>(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> </b></CENTER >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="8%">排名</td>
  <td  width="8%">店面</td>
  <td  width="6%">合同金额</td>
 
  <td  width="7%">占有率</td>
</tr>
<%
	
	 double htze1=0;
	  double allqds1=0;
     int row1=0;
	 String dwmc1="";
	ls_sql="SELECT dwmc,sum(jc_mmydd.htje) htze";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_mmydd";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	//ls_sql+=" and crm_khxx.zt='2'";//是否全部定义为家装客户类型
	ls_sql+=wheresql;
	ls_sql+=" group by dwmc";
	ls_sql+=" order by sum(jc_mmydd.htje) desc";
	//out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	while(rs.next())
	{
		
		dwmc1=rs.getString("dwmc");
		htze1=rs.getDouble("htze");
		row1++;
		allqds1+=htze1;
		
		
		
	%>
<tr   align="center">
<td  width="8%" ><%=row1%></td>
  <td  width="8%" ><%=dwmc1%></td>
  <td  width="6%" ><%=htze1%></td>
  <td  width="7%" align="left"><img src="/images/ColuGif.gif" width="<%=htze1*1000/maxqye%>" height="14"><%=cf.formatDouble(htze1*100/maxqye)%>%</td>
</tr>
<%
	}
	rs.close();
	ps.close();
%>
 <tr   align="center">
  <td  width="8%">总计</td>
 
  <td  width="7%">&nbsp;</td>
   <td  width="6%"><%=allqds1%></td>
  <td  width="8%">&nbsp;</td>
 

</tr> 
</table> 


<CENTER >
<br>
<b>各店面家具预定单占家装签约单比例排行榜<br>(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> </b></CENTER >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="8%">排名</td>
  <td  width="8%">店面</td>
  <td  width="6%">合同金额</td>
 
  <td  width="7%">占有率</td>
</tr>
<%
	
	 double htze2=0;
     int row2=0;
	 String dwmc2="";
	 double allqds2=0;
	ls_sql="SELECT dwmc,sum(jc_jjdd.htze) htze";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_jjdd";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	//ls_sql+=" and crm_khxx.zt='2'";//是否全部定义为家装客户类型
	ls_sql+=wheresql;
	ls_sql+=" group by dwmc";
	ls_sql+=" order by sum(jc_jjdd.htze) desc";
	//out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	while(rs.next())
	{
		
		dwmc2=rs.getString("dwmc");
		htze2=rs.getDouble("htze");
		row2++;
		allqds2+=htze2;
		
		
		
	%>
<tr   align="center">
<td  width="8%" ><%=row2%></td>
  <td  width="8%" ><%=dwmc2%></td>
  <td  width="6%" ><%=htze2%></td>
  <td  width="7%" align="left"><img src="/images/ColuGif.gif" width="<%=htze2*1000/maxqye%>" height="14"><%=cf.formatDouble(htze2*100/maxqye)%>%</td>
</tr>
<%
	}
	rs.close();
	ps.close();
%>
 <tr   align="center">
  <td  width="8%">总计</td> 
  <td  width="7%">&nbsp;</td>
  <td  width="6%"><%=allqds2%></td>
 
  
  <td  width="8%">&nbsp;</td>
 

</tr> 
</table> 
</body>
</html>

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
