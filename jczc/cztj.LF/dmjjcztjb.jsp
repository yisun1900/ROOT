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

String wheresql="";

if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}
String wheresql1="";

if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql1+=" and  a.dwbh='"+dwbh+"'";
}
wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


String djyj=request.getParameter("djyj");
String nian=request.getParameter("nian");
String yue=request.getParameter("yue");
String yhdlm=(String)session.getAttribute("yhdlm");

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
  <B>店面家居产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%">分公司</td>
  <td  width="2%">序号</td>
  <td  width="10%">店面</td>
  <td  width="7%">家居签约数</td>
  <td  width="7%">占家装签约数比例</td>
  <td  width="7%">占家居签约数比例</td>
  <td  width="7%">家居签约额</td>
  <td  width="7%">占家装签约额比例</td>
  <td  width="7%">占家居签约额比例</td>
</tr>
<%
	//获取最大数
	double maxqye=0;
	String getfgs=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;
	int qys=0;
	double zqye=0;
	double wdzgce=0;
	double zjxje=0;
	
	long fwmj=0;
	double sjf=0;
	int allqys=0;
	double allzqye=0;
	double allwdzgce=0;
	long allfwmj=0;
	double allsjf=0;
	double zkl=0;
	int pjde=0;
	int pmjj=0;
	double Xzqys=0;
	double zjxze=0;
	double htje=0;
	int khsl=0;
	int row=0;
	int maxkhsl=0;
	double maxhtje=0;
	//家装总客户总签约数
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where crm_khxx.zt='2'";
	ls_sql+=wheresql;
	//out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		Xzqys=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//当没有客户时，返回。
	if(Xzqys==0)
	{
		return;
	}

	//家装客户总签约额=(总签约额+增减项总额)
	ls_sql="SELECT TRUNC(sum(qye+zjxje))";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where crm_khxx.zt='2'";
	ls_sql+=wheresql;

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxqye=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (maxqye==0)
	{
		return;
	}

	ls_sql=" select count(distinct(khbh)) khsl,sum(htje) htje from";
	ls_sql+="(";
	ls_sql+=" SELECT jc_mmydd.khbh,jc_mmydd.zjhze htje from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh ";
	ls_sql+=wheresql;
	ls_sql+=" union all ";
	ls_sql+=" SELECT jc_cgdd.khbh,jc_cgdd.zjhze htje from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh ";
	ls_sql+=wheresql;
	ls_sql+=" union all";
	ls_sql+=" SELECT jc_jjdd.khbh,jc_jjdd.zjhze htje from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh ";
	ls_sql+=wheresql;
	ls_sql+="union all ";
	ls_sql+="SELECT jc_zcdd.khbh,(hkze+zjhze) htje from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh ";
	ls_sql+=wheresql;
	ls_sql+=") ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxkhsl=rs.getInt(1);
		maxhtje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	if (maxkhsl==0 || maxhtje==0)
	{
		return;
	}
	%>
	
<%
	

	
//	out.println(maxqye);

	ls_sql=" SELECT b.dwmc fgs,a.dwbh dwbh,a.dwmc dm";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
	ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N' order by b.dwmc, a.dwmc";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{	
		String khbh1="";
		getfgs=rs.getString("fgs");
		getdwbh=rs.getString("dwbh");
		dm=rs.getString("dm");
		row++;
		htje=0;
		khsl=0;//清零
		ls_sql=" select count(distinct(khbh)) khsl,sum(htje) htje from";
		ls_sql+="(";
		ls_sql+=" SELECT jc_mmydd.khbh,jc_mmydd.htje htje from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" union all ";
		ls_sql+=" SELECT jc_cgdd.khbh,jc_cgdd.zjhze htje from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" union all";
		ls_sql+=" SELECT jc_jjdd.khbh,jc_jjdd.zjhze htje from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=wheresql;
		ls_sql+="union all ";
		ls_sql+="SELECT jc_zcdd.khbh,(hkze+zjhze) htje from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=wheresql;
		ls_sql+=") ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
				khsl=rs1.getInt(1);
				htje=rs1.getDouble(2);

		}
		rs1.close();
		ps1.close();
		
		allqys+=khsl;
		allzqye+=htje;

		if (getfgs.equals(oldfgs))
		{
			getfgs="同上";
		}
		else{
			oldfgs=getfgs;
		}
		
		%>
		<tr align="center">
			<td ><%=getfgs%></td>
			<td ><%=row%></td>
			<td ><%=dm%></td>
			<td  align="right"><%=khsl%></td>
			<td  align="right"><%=cf.formatDouble(khsl*100/Xzqys)%>%</td>
			<td  align="right"><%=cf.formatDouble(khsl*100/maxkhsl)%>%</td>
			<td  align="right"><%=cf.formatDouble(htje)%></td>
			<td  align="right"><%=cf.formatDouble((htje)*100/maxqye)%>%</td>
			<td  align="right"><%=cf.formatDouble((htje)*100/maxhtje)%>%</td>
	
			
		</tr>
		<%	
	}
	rs.close();
	ps.close();

%>
<tr align="center">
	<td >总计</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td  align="right"><%=allqys%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td  align="right"><%=cf.formatDouble(allzqye)%></td>
	<td >&nbsp;</td>
	
<!-- 	<td  align="right"><%=cf.formatDouble(pjde)%></td>
	<td  align="right"><%=cf.formatDouble(pmjj)%></td>
	<td  align="right"><%=cf.formatDouble(allsjf)%></td>
	<td  align="right"><%=cf.formatDouble(zkl)%>%</td> -->
	
</tr>
</table>
<br>
<CENTER >
  <B>公司家居产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%">分公司</td>
  <td  width="2%">序号</td>

  <td  width="7%">家居签约数</td>
  <td  width="7%">占家装签约数比例</td>
  <td  width="7%">占家居签约数比例</td>
  <td  width="7%">家居签约额</td>
  <td  width="7%">占家装签约额比例</td>
  <td  width="7%">占家居签约额比例</td>
</tr>
	<%
	row=0;
	allqys=0;
	allzqye=0;
	getfgs="";
	getdwbh="";

	ls_sql=" select dwmc,dwbh,sum(htze) htje,count(distinct(khbhx)) khsl from";
	ls_sql+="(";
	ls_sql+=" SELECT a.dwmc dwmc,a.dwbh dwbh,sum(jc_mmydd.htje) htze,crm_khxx.khbh khbhx from jc_mmydd,crm_khxx,sq_dwxx a where crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.fgsbh=a.dwbh ";
	ls_sql+=wheresql;
	ls_sql+=" group by a.dwmc,a.dwbh,crm_khxx.khbh ";

	ls_sql+=" union all ";

	ls_sql+=" SELECT a.dwmc dwmc,a.dwbh dwbh,sum(jc_cgdd.zjhze) htze,crm_khxx.khbh khbhx from jc_cgdd,sq_dwxx a,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.fgsbh=a.dwbh ";
	ls_sql+=wheresql;
	ls_sql+=" group by a.dwmc,a.dwbh,crm_khxx.khbh ";

	ls_sql+=" union all";
	ls_sql+=" SELECT a.dwmc dwmc,a.dwbh dwbh,sum(jc_jjdd.zjhze) htze,crm_khxx.khbh khbhx from jc_jjdd,sq_dwxx a,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.fgsbh=a.dwbh ";
	ls_sql+=wheresql;
	ls_sql+=" group by a.dwmc,a.dwbh,crm_khxx.khbh ";

	ls_sql+="union all ";

	ls_sql+="SELECT a.dwmc dwmc,a.dwbh dwbh,sum(jc_zcdd.hkze+jc_zcdd.zjhze) htze,crm_khxx.khbh khbhx from jc_zcdd,sq_dwxx a,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.fgsbh=a.dwbh ";
	ls_sql+=wheresql;
	ls_sql+=" group by a.dwmc,a.dwbh,crm_khxx.khbh ";

	ls_sql+=") ";
	ls_sql+=" group by dwmc,dwbh ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{	
		htje=0;
		khsl=0;//清零
		
		String khbh1="";
		getfgs=rs.getString("dwmc");
		getdwbh=rs.getString("dwbh");
		khsl=rs.getInt(4);
		htje=rs.getDouble(3);

		row++;
		
		allqys+=khsl;
		allzqye+=htje;

		if (getfgs.equals(oldfgs))
		{
			getfgs="同上";
		}
		else{
			oldfgs=getfgs;
		}
		
		%>
		<tr align="center">
			<td ><%=getfgs%></td>
			<td ><%=row%></td>
			
			<td  align="right"><%=khsl%></td>
			<td  align="right"><%=cf.formatDouble(khsl*100/Xzqys)%>%</td>
			<td  align="right"><%=cf.formatDouble(khsl*100/maxkhsl)%>%</td>
			<td  align="right"><%=cf.formatDouble(htje)%></td>
			<td  align="right"><%=cf.formatDouble((htje)*100/maxqye)%>%</td>
			<td  align="right"><%=cf.formatDouble((htje)*100/maxhtje)%>%</td>
	
			
		</tr>
		<%	
	}
	rs.close();
	ps.close();

%>
<tr align="center">
	<td >总计</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td  align="right"><%=allqys%></td>
	<td >&nbsp;</td>

	<td  align="right"><%=cf.formatDouble(allzqye)%></td>
	<td >&nbsp;</td>
	
<!-- 	<td  align="right"><%=cf.formatDouble(pjde)%></td>
	<td  align="right"><%=cf.formatDouble(pmjj)%></td>
	<td  align="right"><%=cf.formatDouble(allsjf)%></td>
	<td  align="right"><%=cf.formatDouble(zkl)%>%</td> -->
	
</tr>
</table>
<br>
注：家装签单数：<%=Xzqys%> 签单额:<%=maxqye%>&nbsp;&nbsp;总签约额=(签约额+增减项总额))
  &nbsp;&nbsp;家居签约数比例=(家居签单数/家装签单数)
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

