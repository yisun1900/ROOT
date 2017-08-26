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
String jzbz=request.getParameter("jzbz");

String wheresql="";

if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}
if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
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

	if (djyj.equals("Y"))
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  cw_yjdjjl";
		ls_sql+=" where  nian='"+nian+"' and yue='"+yue+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			ls_sql="insert into cw_yjdjjl(nian,yue,djr,djsj)";
			ls_sql+=" values(?,?,?,SYSDATE)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,nian);
			ps.setString(2,yue);
			ps.setString(3,yhdlm);
			ps.executeUpdate();
			ps.close();
		}
	}

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>店面返卷统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="4%">排名</td>
  <td  width="11%">分公司</td>
  <td  width="13%">店面</td>
  <td  width="6%">签约数</td>
  <td  width="10%">未打折金额</td>
  <td  width="10%">签约额</td>
  <td  width="6%">其中返卷数</td>
  <td  width="6%">返卷比例</td>
  <td  width="8%">返卷总金额</td>
  <td  width="8%">公司承担返卷额</td>
  <td  width="6%">其中认证数</td>
  <td  width="6%">认证比例</td>
  <td  width="6%">认证客户数</td>
</tr>
<%
	//获取最大数
	double maxqye=0;
	String fgsbh=null;
	String getfgs=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;
	int qys=0;
	double zqye=0;
	double wdzgce=0;
	int sffj=0;
	double fjje=0;
	double gsfje=0;
	int sfyrz=0;
	int cyrzs=0;

	int allqys=0;
	double allzqye=0;
	double allwdzgce=0;
	int allsffj=0;
	double allfjje=0;
	double allgsfje=0;
	int allsfyrz=0;
	int allcyrzs=0;

	double fjbl=0;
	double rzbl=0;


	int row=0;
	//家装总客户总签约数
	ls_sql="SELECT count(*),sum(wdzgce),sum(qye),sum(DECODE(sffj,'Y',1,'N',0)) sffj,sum(fjje) fjje,sum(gsfje) gsfje,sum(DECODE(sfyrz,'Y',1,'N',0)) sfyrz";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where crm_khxx.zt='2'";
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allqys=rs.getInt(1);
		allwdzgce=rs.getDouble(2);
		allzqye=rs.getDouble(3);
		allsffj=rs.getInt(4);
		allfjje=rs.getDouble(5);
		allgsfje=rs.getDouble(6);
		allsfyrz=rs.getInt(7);
	}
	rs.close();
	ps.close();

//	allzjhze=allzqye+allzjxje;

	//当没有客户时，返回。
	if(allqys==0)
	{
		return;
	}
	if(allzqye==0)
	{
		return;
	}

	ls_sql="SELECT TRUNC(max(sum(qye)))";
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


	ls_sql=" SELECT fgs,dwbh,dm,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(sffj) sffj,sum(fjje) fjje,sum(gsfje) gsfje,sum(sfyrz) sfyrz";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT b.dwmc fgs,crm_khxx.dwbh dwbh,a.dwmc dm,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(DECODE(sffj,'Y',1,'N',0)) sffj,sum(fjje) fjje,sum(gsfje) gsfje,sum(DECODE(sfyrz,'Y',1,'N',0)) sfyrz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.fgsbh=b.dwbh(+)";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT b.dwmc fgs,a.dwbh dwbh,a.dwmc dm,0 qys,0 zqye,0 wdzgce,0 sffj,0 fjje,0 gsfje,0 sfyrz ";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
	ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" group by b.dwmc,a.dwbh,a.dwmc ";
	
	ls_sql+=" )";
	ls_sql+=" group by fgs,dwbh,dm";
	ls_sql+=" order by zqye desc,fgs,dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getfgs=rs.getString("fgs");
		getdwbh=rs.getString("dwbh");
		dm=rs.getString("dm");
		qys=rs.getInt("qys");
		zqye=rs.getDouble("zqye");
		wdzgce=rs.getDouble("wdzgce");
		sffj=rs.getInt("sffj");
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sfyrz=rs.getInt("sfyrz");

		if (qys==0)
		{
			fjbl=0;
			rzbl=0;
		}
		else{
			fjbl=sffj*100.0/qys;
			rzbl=sfyrz*100.0/qys;
		}

		row++;

		if (getfgs.equals(oldfgs))
		{
			getfgs="同上";;
		}
		else{
			oldfgs=getfgs;
		}

		cyrzs=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and rzsc='"+getdwbh+"' and sfyrz='Y'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cyrzs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allcyrzs+=cyrzs;

		%>
		<tr align="center">
			<td ><%=row%></td>
			<td ><%=getfgs%></td>
			<td ><A HREF="ViewDmcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank"><%=dm%></A></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
			<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
			<td  align="right"><%=sffj%></td>
			<td  align="right"><%=cf.round(fjbl,1)%>%</td>
			<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
			<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
			<td  align="right"><%=sfyrz%></td>
			<td  align="right"><%=cf.round(rzbl,1)%>%</td>
			<td  align="right"><A HREF="ViewRzkh.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank"><%=cyrzs%></A></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

	if (allqys==0)
	{
		fjbl=0;
		rzbl=0;
	}
	else{
		fjbl=allsffj*100.0/allqys;
		rzbl=allsfyrz*100.0/allqys;
	}


%>
<tr align="center">
	<td >&nbsp;</td>
	<td >总计</td>
	<td >&nbsp;</td>
	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzqye)%></td>
	<td  align="right"><%=allsffj%></td>
	<td  align="right"><%=cf.round(fjbl,1)%>%</td>
	<td  align="right"><%=cf.formatDouble((int)allfjje)%></td>
	<td  align="right"><%=cf.formatDouble((int)allgsfje)%></td>
	<td  align="right"><%=allsfyrz%></td>
	<td  align="right"><%=cf.round(rzbl,1)%>%</td>
	<td  align="right"><%=allcyrzs%></td>
</tr>
</table>


<BR>
<CENTER >
  <B>分公司产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="4%">排名</td>
  <td  width="24%">分公司</td>
  <td  width="6%">签约数</td>
  <td  width="10%">未打折金额</td>
  <td  width="10%">签约额</td>
  <td  width="6%">其中返卷数</td>
  <td  width="6%">返卷比例</td>
  <td  width="8%">返卷总金额</td>
  <td  width="8%">公司承担返卷额</td>
  <td  width="6%">其中认证数</td>
  <td  width="6%">认证比例</td>
  <td  width="6%">认证客户数</td>
</tr>
<%
	//获取最大数
	ls_sql="SELECT max(sum(TRUNC(qye)))";
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


	row=0;

	ls_sql=" SELECT fgsbh,fgs,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(sffj) sffj,sum(fjje) fjje,sum(gsfje) gsfje,sum(sfyrz) sfyrz";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT crm_khxx.fgsbh,sq_dwxx.dwmc fgs,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(DECODE(sffj,'Y',1,'N',0)) sffj,sum(fjje) fjje,sum(gsfje) gsfje,sum(DECODE(sfyrz,'Y',1,'N',0)) sfyrz";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.fgsbh,sq_dwxx.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwbh fgsbh,dwmc fgs,0 qys,0 zqye,0 wdzgce,0 sffj,0 fjje,0 gsfje,0 sfyrz";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" group by dwbh,dwmc";
	
	ls_sql+=" )";
	ls_sql+=" group by fgsbh,fgs";
	ls_sql+=" order by zqye desc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		getfgs=rs.getString("fgs");
		qys=rs.getInt("qys");
		zqye=rs.getDouble("zqye");
		wdzgce=rs.getDouble("wdzgce");
		sffj=rs.getInt("sffj");
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sfyrz=rs.getInt("sfyrz");

		if (qys==0)
		{
			fjbl=0;
			rzbl=0;
		}
		else{
			fjbl=sffj*100.0/qys;
			rzbl=sfyrz*100.0/qys;
		}

		cyrzs=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.rzsc=sq_dwxx.dwbh and crm_khxx.zt='2' and ssfgs='"+fgsbh+"' and sfyrz='Y'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cyrzs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allcyrzs+=cyrzs;

		row++;

		%>
		<tr align="center">
			<td ><%=row%></td>
			<td ><%=getfgs%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
			<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
			<td  align="right"><%=sffj%></td>
			<td  align="right"><%=cf.round(fjbl,1)%></td>
			<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
			<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
			<td  align="right"><%=sfyrz%></td>
			<td  align="right"><%=cf.round(rzbl,1)%></td>
			<td  align="right"><%=cyrzs%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

	if (allqys==0)
	{
		fjbl=0;
		rzbl=0;
	}
	else{
		fjbl=allsffj*100.0/allqys;
		rzbl=allsfyrz*100.0/allqys;
	}

%>
<tr align="center">
	<td >&nbsp;</td>
	<td >总计</td>
	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzqye)%></td>
	<td  align="right"><%=allsffj%></td>
	<td  align="right"><%=cf.round(fjbl,1)%>%</td>
	<td  align="right"><%=cf.formatDouble((int)allfjje)%></td>
	<td  align="right"><%=cf.formatDouble((int)allgsfje)%></td>
	<td  align="right"><%=allsfyrz%></td>
	<td  align="right"><%=cf.round(rzbl,1)%>%</td>
	<td  align="right"><%=allcyrzs%></td>
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

