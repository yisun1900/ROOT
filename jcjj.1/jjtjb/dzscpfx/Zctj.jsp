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
	double allqye=0;
	double qye=0;
	String bgcolor="#FFFFFF";
%>
	<CENTER >
	<br>
	<b>各店面主材实收款占家装签约额比例排行榜<br>(签约时间：<%=sjfw%>--<%=sjfw2%>)</B> </b></CENTER >
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
	<tr bgcolor="#CCCCCC"  align="center">
	  <td  width="8%">排名</td>
	  <td  width="8%">店面</td>
	  <td  width="6%">实收款</td>
	 <td  width="6%">合同金额</td>
	  <td  width="7%">占有率</td>
	</tr>
<%
	 double maxqye=0;
	 double htze=0;
     int row=0;
	ls_sql="SELECT dwmc,sum(cw_khfkjl.fkje) htze,sum(crm_khxx.qye) qye";
	ls_sql+=" FROM crm_khxx,sq_dwxx,cw_khfkjl";
	ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh and cw_khfkjl.dwbh=sq_dwxx.dwbh(+) and fklxbm='23' and scbz='N'";
	ls_sql+=" and sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	//ls_sql+=" and crm_khxx.zt='2'";//是否全部定义为家装客户类型
	ls_sql+=wheresql;
	ls_sql+=" group by dwmc";
	ls_sql+=" order by sum(cw_khfkjl.fkje)/sum(crm_khxx.qye) desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while(rs.next())
	{
		dwmc=rs.getString("dwmc");
		htze=rs.getDouble("htze");
		qye=rs.getDouble("qye");
		row++;
		allqds+=htze;
		allqye+=qye;
		
%>
<tr   align="center">
<td  width="8%" ><%=row%></td>
  <td  width="8%" ><%=dwmc%></td>
  <td  width="6%" ><%=htze%></td>
   <td  width="6%" ><%=qye%></td>
  <td  width="7%" align="left"><img src="/images/ColuGif.gif" width="<%=cf.formatDouble(htze*100/qye)%>" height="14"><%=cf.formatDouble(htze*100/qye)%>%</td>
</tr>
<%
	}
	rs.close();
	ps.close();
%>
 <tr   align="center">
  <td  width="8%">总计</td>
  
  <td  width="7%">&nbsp;</td>
  <td  width="6%"><%=cf.formatDouble(allqds)%></td>
  <td  width="8%"><%=cf.formatDouble(allqye)%></td>
 

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
