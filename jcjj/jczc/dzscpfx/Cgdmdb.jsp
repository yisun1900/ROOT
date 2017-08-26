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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<%
	//获取最大数


	String dwmc=null;
	String dwbh=null;


	
	int alllxsl=0;
	int allqds=0;
	int allsl=0;

	double jjqye=0;
	double mmqye=0;
	double cgqye=0;
	double jzqye=0;

	
	String bgcolor="#FFFFFF";
%>

<CENTER >
<br>
<b>橱柜店面对比表<br>(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> </b></CENTER >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="8%">店面</td>
  <td  width="6%">总定单</td>
  <td  width="7%">类型</td>
  
  <td  width="8%">数量</td>
 
  <td  width="7%">比例分析</td>
</tr>
<%
	 //内单和外单的总数
	ls_sql=" SELECT  count(*) from jc_cgdd,crm_khxx,sq_dwxx where jc_cgdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt in ('2','4')";//2：家装客户；3：家装已退单 ；4：非家装客户
	ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery(ls_sql);
	//out.print(ls_sql);
	if(rs1.next())
	{
			allsl=rs1.getInt(1);
	}
	ps1.close();
	rs1.close();
	if(allsl==0)
	{
		return;
	}



	ls_sql="SELECT dwmc,crm_khxx.dwbh,count(*)";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	
	ls_sql+="group by dwmc,crm_khxx.dwbh";
	//ls_sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	
	while(rs.next())
	{
		 int cgsl1=0;
		 int cgsl=0;
		 int allcgsl=0;
		dwmc=rs.getString("dwmc");
		dwbh=rs.getString("dwbh");
		
		
		ls_sql=" SELECT  count(*) from jc_cgdd,crm_khxx,sq_dwxx where jc_cgdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.dwbh='"+dwbh+"'";
		ls_sql+=" and crm_khxx.zt='2'";//2：家装客户；3：家装已退单 ；4：非家装客户
		ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		//out.print(ls_sql);
		while(rs1.next())
		{
			
			cgsl+=rs1.getInt(1);
			
			
		}
		ps1.close();
		rs1.close();

		ls_sql=" SELECT  count(*) from jc_cgdd,crm_khxx,sq_dwxx where jc_cgdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.dwbh='"+dwbh+"'";
		ls_sql+=" and crm_khxx.zt='4'";//2：家装客户；3：家装已退单 ；4：非家装客户
		ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		//out.print(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		
		while(rs1.next())
		{
			cgsl1+=rs1.getInt(1);	
		}
		ps1.close();
		rs1.close();
		allcgsl=cgsl+cgsl1;
		allqds+=allcgsl;
		
		
	%>
<tr   align="center">
  <td  width="8%" rowspan="2"><%=dwmc%></td>
  <td  width="6%" rowspan="2"><%=allcgsl%></td>
  <td  width="6%">外单</td>
  <td  width="7%"><%=cgsl1%></td>
  <td  width="7%" align="left"><img src="/images/ColuGif.gif" width="<%=cgsl1*100/allsl%>" height="14"><%=cgsl1*100/allsl%>%</td>
</tr>
<tr  align="center">
  
 
  
  <td  width="6%">内单</td>

  <td  width="8%"><%=cgsl%></td>
  <td  width="7%" align="left"><img src="/images/ColuGif.gif" width="<%=cgsl*100/allsl%>" height="14"><%=cgsl*100/allsl%>%</td>
  
</tr>

	<%
	}
	rs.close();
	ps.close();
%>
 <tr   align="center">
  <td  width="8%">总计</td>
  <td  width="6%"><%=allqds%></td>
  <td  width="7%">&nbsp;</td>
  
  <td  width="8%"><%=alllxsl%></td>
 
  <td  width="7%">&nbsp;</td>
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
