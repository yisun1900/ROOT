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
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String OneMonth=cf.addYear(sjfw2,-1);
OneMonth=cf.addMonth(OneMonth,11);
String TwoMonth=cf.addYear(sjfw2,-1);
TwoMonth=cf.addMonth(TwoMonth,10);
String ThreeMonth=cf.addYear(sjfw2,-1);
ThreeMonth=cf.addMonth(ThreeMonth,9);

String fgs=request.getParameter("fgs");
//String dwbh=request.getParameter("dwbh");

String wheresql="";
String wheresql1="";
String wheresql2="";
String wheresql3="";
String wheresql4="";
String wheresql5="";
String wheresql6="";
String wheresql7="";

if (!(fgs.equals("")))
{
	wheresql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";
	wheresql1+=" and  (sq_dwxx.dwbh='"+fgs+"')";
	wheresql2+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql7+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
wheresql2+=" and crm_khxx.jzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql2+=" and crm_khxx.jzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

wheresql3+=" and crm_khxx.jzkscsj>=TO_DATE('"+OneMonth+"','YYYY-MM-DD')";
wheresql3+=" and crm_khxx.jzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

wheresql4+=" and crm_khxx.jzkscsj>=TO_DATE('"+TwoMonth+"','YYYY-MM-DD')";
wheresql4+=" and crm_khxx.jzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

wheresql5+=" and crm_khxx.jzkscsj>=TO_DATE('"+ThreeMonth+"','YYYY-MM-DD')";
wheresql5+=" and crm_khxx.jzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

wheresql6+=" and crm_khxx.jzkscsj<=TO_DATE('"+ThreeMonth+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

//if (!(dwbh.equals("")))
//{
//	wheresql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
//}

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
<CENTER >
  <B>设计师未签单统计（<%=sjfw%>至<%=sjfw2%>）</B><BR>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' >
<tr bgcolor="#CCCCCC"  align="center" >
  <td  width="12%">设计师总人数</td>
  <td  width="17%">当月未签单人数</td>
  <td  width="5%">占比</td>
  <td  width="17%">连续两个月未签单人数</td>
  <td  width="5%">占比</td>
  <td  width="17%">连续三个月未签单人数</td>
  <td  width="5%">占比</td>
  <td  width="17%">三个月以上未签单人数</td>
  <td  width="5%">占比</td>
</tr>
<%
	int ygzs=0;//员工总数

	String dwbh=null;
	String dwmc=null;
	String yhmc=null;
	double sjsqye=0;//设计师签约额
	int OneM=0;
	int TwoM=0;
	int ThreeM=0;
	int BthreeM=0;

	double bfb1=0;
	double bfb2=0;
	double bfb3=0;
	double bfb4=0;

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and sfzszg in ('Y','N') and zwbm='04'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ygzs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if(ygzs==0)
	{
		return;
	}
	ls_sql="SELECT yhmc";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and sfzszg in ('Y','N') and zwbm='04'  ";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		yhmc=rs.getString(1);
//仨月以上未签单
		ls_sql="SELECT sum(qye)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and crm_khxx.sjs='"+yhmc+"'";
		ls_sql+=wheresql6;
		ls_sql+=wheresql7;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsqye=rs1.getDouble(1);
			if(sjsqye==0)
			{
			BthreeM++;
			continue;
			}
		}
		rs1.close();
		ps1.close();

//仨月未签单
		ls_sql="SELECT sum(qye)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and crm_khxx.sjs='"+yhmc+"'";
		ls_sql+=wheresql5;
		ls_sql+=wheresql7;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsqye=rs1.getDouble(1);
			if(sjsqye==0)
			{
			ThreeM++;
			continue;
			}
		}
		rs1.close();
		ps1.close();

//俩月未签单
		ls_sql="SELECT sum(qye)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and crm_khxx.sjs='"+yhmc+"'";
		ls_sql+=wheresql4;
		ls_sql+=wheresql7;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsqye=rs1.getDouble(1);
			if(sjsqye==0)
			{
			TwoM++;
			continue;
			}
		}
		rs1.close();
		ps1.close();

//当月未签单
		ls_sql="SELECT sum(qye)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and crm_khxx.sjs='"+yhmc+"'";
		ls_sql+=wheresql3;
		ls_sql+=wheresql7;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsqye=rs1.getDouble(1);
			if(sjsqye==0)
			{
			OneM++;
			}
		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();

		bfb1=OneM*100.0/ygzs;
		bfb2=TwoM*100.0/ygzs;
		bfb3=ThreeM*100.0/ygzs;
		bfb4=BthreeM*100.0/ygzs;

		%>
		<tr align="center">
			<td ><%=ygzs%></td>
			<td ><%=OneM%></td>
			<td  align="right" ><%=cf.round(bfb1,1)%>%</td>
			<td ><%=TwoM%></td>
			<td  align="right" ><%=cf.round(bfb2,1)%>%</td>
			<td ><%=ThreeM%></td>
			<td  align="right" ><%=cf.round(bfb3,1)%>%</td>
			<td ><%=BthreeM%></td>
			<td  align="right" ><%=cf.round(bfb4,1)%>%</td>
		</tr>
</table>
时间基数按后一时间为准。
</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " +e+"!"+ls_sql);
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