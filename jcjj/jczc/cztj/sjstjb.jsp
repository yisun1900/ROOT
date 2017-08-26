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

String tjsjlx=request.getParameter("tjsjlx");
String jzsj=request.getParameter("jzsj");
String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String sjsbh=request.getParameter("sjsbh");

String wheresql="";

if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}
if (sjsbh!=null)
{
	if (!(sjsbh.equals("")))	wheresql+=" and  crm_khxx.sjsbh='"+sjsbh+"'";
}
if (tjsjlx.equals("qyrq"))
{
	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else{
	wheresql+=" and lrsj>=TO_DATE('"+sjfw+" "+jzsj+":00:00','YYYY-MM-DD HH24:MI:SS')";
	wheresql+=" and lrsj<=TO_DATE('"+sjfw2+" "+jzsj+":00:00','YYYY-MM-DD HH24:MI:SS')";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>设计室产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="9%">分公司</td>
  <td  width="5%">排名</td>
  <td  width="12%">店面</td>
  <td  width="12%">设计室</td>
  <td  width="7%">签约数</td>
  <td  width="11%">工程签约额</td>
  <td  width="8%">单额平均</td>
  <td  width="8%">平米均价</td>
  <td  width="9%">设计费</td>
  <td  width="7%">折扣率</td>
  <td  width="20%">总额 </td>
</tr>
<%
	//获取最大数
	double maxqye=0;
	String getfgs=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;
	String getsjsbh=null;
	int qys=0;
	double zqye=0;
	double wdzgce=0;
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

	int row=0;
	ls_sql="SELECT max(sum(qye))";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by dwbh";
//	out.println(ls_sql);
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


	ls_sql=" SELECT b.dwmc fgs,crm_khxx.sjsbh dwbh,a.dwmc dm,c.dwmc sjsbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_dwxx c";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and a.ssdw=b.dwbh(+) and crm_khxx.sjsbh=c.dwbh";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by b.dwmc,crm_khxx.sjsbh,a.dwmc,c.dwmc";
	ls_sql+=" order by sum(qye) desc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getfgs=rs.getString("fgs");
		getdwbh=rs.getString("dwbh");
		getsjsbh=rs.getString("sjsbh");
		dm=rs.getString("dm");
		qys=rs.getInt("qys");
		zqye=rs.getDouble("zqye");
		wdzgce=rs.getDouble("wdzgce");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");

		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(zqye/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(zqye/fwmj);
		}
		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=zqye*100/wdzgce;
		}

		allqys+=qys;
		allzqye+=zqye;
		allwdzgce+=wdzgce;
		allfwmj+=fwmj;
		allsjf+=sjf;
		row++;

		if (getfgs.equals(oldfgs))
		{
			getfgs="&nbsp;";;
		}
		else{
			oldfgs=getfgs;
		}

		%>
		<tr align="center">
			<td ><%=getfgs%></td>
			<td ><%=row%></td>
			<td ><%=dm%></td>
			<td ><%=getsjsbh%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.formatDouble(zqye)%></td>
			<td  align="right"><%=cf.formatDouble(pjde)%></td>
			<td  align="right"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right"><%=cf.formatDouble(sjf)%></td>
			<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
			<td  align="left"><A HREF="ViewSjs.jsp?tjsjlx=<%=tjsjlx%>&jzsj=<%=jzsj%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=zqye*140/maxqye%>" height="14"></A></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

	if (allqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(allzqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allzqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allzqye*100/allwdzgce;
	}


%>
<tr align="center">
	<td >总计</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble(allzqye)%></td>
	<td  align="right"><%=cf.formatDouble(pjde)%></td>
	<td  align="right"><%=cf.formatDouble(pmjj)%></td>
	<td  align="right"><%=cf.formatDouble(allsjf)%></td>
	<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
	<td  align="left">&nbsp;</td>
</tr>
</table>


<BR>
<CENTER >
  <B>分公司产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="14%">分公司</td>
  <td  width="6%">排名</td>
  <td  width="7%">签约数</td>
  <td  width="14%">工程签约额</td>
  <td  width="9%">单额平均</td>
  <td  width="9%">平米均价</td>
  <td  width="12%">设计费</td>
  <td  width="8%">折扣率</td>
  <td  width="23%">总额 </td>
</tr>
<%
	//获取最大数
	ls_sql="SELECT max(sum(qye))";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and a.ssdw=b.dwbh(+) ";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by b.dwmc";
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



	allqys=0;
	allzqye=0;
	allwdzgce=0;
	allfwmj=0;
	allsjf=0;
	row=0;

	ls_sql=" SELECT b.dwmc fgs,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and a.ssdw=b.dwbh(+)";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by b.dwmc";
	ls_sql+=" order by sum(qye) desc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getfgs=rs.getString("fgs");
		qys=rs.getInt("qys");
		zqye=rs.getDouble("zqye");
		wdzgce=rs.getDouble("wdzgce");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");

		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(zqye/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(zqye/fwmj);
		}
		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=zqye*100/wdzgce;
		}

		allqys+=qys;
		allzqye+=zqye;
		allwdzgce+=wdzgce;
		allfwmj+=fwmj;
		allsjf+=sjf;
		row++;

		%>
		<tr align="center">
			<td ><%=getfgs%></td>
			<td ><%=row%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.formatDouble(zqye)%></td>
			<td  align="right"><%=cf.formatDouble(pjde)%></td>
			<td  align="right"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right"><%=cf.formatDouble(sjf)%></td>
			<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=zqye*140/maxqye%>" height="14"></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

	if (allqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(allzqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allzqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allzqye*100/allwdzgce;
	}


%>
<tr align="center">
	<td >总计</td>
	<td >&nbsp;</td>
	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble(allzqye)%></td>
	<td  align="right"><%=cf.formatDouble(pjde)%></td>
	<td  align="right"><%=cf.formatDouble(pmjj)%></td>
	<td  align="right"><%=cf.formatDouble(allsjf)%></td>
	<td  align="right"><%=cf.formatDouble(zkl)%>%</td>
	<td  align="left">&nbsp;</td>
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
