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
  <B>店面产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%">排名</td>
  <td  width="5%">分公司</td>
  <td  width="7%">店面</td>
  <td  width="4%">签约数</td>
  <td  width="3%">签约数比例</td>
  <td  width="5%">未打折金额</td>
  <td  width="5%">签约额</td>
  <td  width="3%">签约额比例</td>
  <td  width="4%">增减项</td>
  <td  width="5%">增减后总额 </td>
  <td  width="3%">单额平均</td>
  <td  width="3%">平米均价</td>
  <td  width="4%">设计费</td>
  <td  width="5%">实收款</td>
  <td  width="4%">返卷总额</td>
  <td  width="4%">公司承担返卷</td>
  <td  width="3%">折扣率</td>
  <td  width="5%">店面业绩</td>
  <td  width="5%">经理业绩</td>
  <td  width="5%">助理业绩</td>
  <td  width="5%">设计师业绩</td>
  <td  width="5%">设计师提成</td>
  <td  width="6%">签约额 </td>
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
	double ssk=0;
	double fjje=0;
	double gsfje=0;

	double dmyjqye=0;
	double dmqye=0;
	double zlqye=0;
	double sjsqye=0;
	double sjstcqye=0;

	int allqys=0;
	double allzqye=0;
	double allwdzgce=0;
	double allzjxje=0;
	double allzjhze=0;
	long allfwmj=0;
	double allsjf=0;
	double allssk=0;
	double allfjje=0;
	double allgsfje=0;
	double zkl=0;
	int pjde=0;
	int pmjj=0;

	double alldmyjqye=0;
	double alldmqye=0;
	double allzlqye=0;
	double allsjsqye=0;
	double allsjstcqye=0;

	double qysbfb=0;
	double qyebfb=0;

	int row=0;
	//家装总客户总签约数
	ls_sql="SELECT count(*),sum(wdzgce),sum(qye),sum(NVL(zjxje,0)),sum(NVL(zjxje,0)+qye),sum(sjf),sum(sfke),sum(fjje),sum(gsfje),sum(fwmj),sum(crm_khxx.wdzgce*jc_cxhd.yjzkl/10) dmyjqye,sum(crm_khxx.wdzgce*jc_cxhd.dmzkl/10) dmqye,sum(crm_khxx.wdzgce*jc_cxhd.zlzkl/10) zlqye,sum(crm_khxx.wdzgce*jc_cxhd.sjszkl/10) sjsqye,sum(crm_khxx.wdzgce*jc_cxhd.sjstczkl/10) sjstcqye";
	ls_sql+=" FROM crm_khxx,jc_cxhd";
	ls_sql+=" where crm_khxx.zt='2'";
    ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and jc_cxhd.hdlx='2'";
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allqys=rs.getInt(1);
		allwdzgce=rs.getDouble(2);
		allzqye=rs.getDouble(3);
		allzjxje=rs.getDouble(4);
		allzjhze=rs.getDouble(5);
		allsjf=rs.getDouble(6);
		allssk=rs.getDouble(7);
		allfjje=rs.getDouble(8);
		allgsfje=rs.getDouble(9);
		allfwmj=rs.getLong(10);
		alldmyjqye=rs.getDouble("dmyjqye");
		alldmqye=rs.getDouble("dmqye");
		allzlqye=rs.getDouble("zlqye");
		allsjsqye=rs.getDouble("sjsqye");
		allsjstcqye=rs.getDouble("sjstcqye");
	}
	rs.close();
	ps.close();

	//无活动
	ls_sql="SELECT count(*),sum(wdzgce),sum(qye),sum(NVL(zjxje,0)),sum(NVL(zjxje,0)+qye),sum(sjf),sum(sfke),sum(fjje),sum(gsfje),sum(fwmj),sum(qye-NVL(gsfje,0)) dmyjqye,sum(qye-NVL(gsfje,0)) dmqye,sum(qye-NVL(gsfje,0)) zlqye,sum(qye-NVL(gsfje,0)) sjsqye,sum(qye-NVL(gsfje,0)) sjstcqye";
	ls_sql+=" FROM crm_khxx,jc_cxhd";
	ls_sql+=" where crm_khxx.zt='2'";
    ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allqys+=rs.getInt(1);
		allwdzgce+=rs.getDouble(2);
		allzqye+=rs.getDouble(3);
		allzjxje+=rs.getDouble(4);
		allzjhze+=rs.getDouble(5);
		allsjf+=rs.getDouble(6);
		allssk+=rs.getDouble(7);
		allfjje+=rs.getDouble(8);
		allgsfje+=rs.getDouble(9);
		allfwmj+=rs.getLong(10);
		alldmyjqye+=rs.getDouble("dmyjqye");
		alldmqye+=rs.getDouble("dmqye");
		allzlqye+=rs.getDouble("zlqye");
		allsjsqye+=rs.getDouble("sjsqye");
		allsjstcqye+=rs.getDouble("sjstcqye");
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


	ls_sql=" SELECT fgs,dwbh,dm,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(sjf) sjf,sum(ssk) ssk,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(dmyjqye) dmyjqye,sum(dmqye) dmqye,sum(zlqye) zlqye,sum(sjsqye) sjsqye,sum(sjstcqye) sjstcqye";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT b.dwmc fgs,crm_khxx.dwbh dwbh,a.dwmc dm,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(sjf) sjf,sum(sfke) ssk,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(crm_khxx.wdzgce*jc_cxhd.yjzkl/10) dmyjqye,sum(crm_khxx.wdzgce*jc_cxhd.dmzkl/10) dmqye,sum(crm_khxx.wdzgce*jc_cxhd.zlzkl/10) zlqye,sum(crm_khxx.wdzgce*jc_cxhd.sjszkl/10) sjsqye,sum(crm_khxx.wdzgce*jc_cxhd.sjstczkl/10) sjstcqye";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,jc_cxhd";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.fgsbh=b.dwbh(+)";
	ls_sql+=" and crm_khxx.zt='2'";
    ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and jc_cxhd.hdlx='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT b.dwmc fgs,crm_khxx.dwbh dwbh,a.dwmc dm,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(sjf) sjf,sum(sfke) ssk,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(qye-NVL(gsfje,0)) dmyjqye,sum(qye-NVL(gsfje,0)) dmqye,sum(qye-NVL(gsfje,0)) zlqye,sum(qye-NVL(gsfje,0)) sjsqye,sum(qye-NVL(gsfje,0)) sjstcqye";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,jc_cxhd";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.fgsbh=b.dwbh(+)";
	ls_sql+=" and crm_khxx.zt='2'";
    ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
	ls_sql+=wheresql;
	ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT b.dwmc fgs,a.dwbh dwbh,a.dwmc dm,0 qys,0 zqye,0 wdzgce,0 zjxje,0 sjf,0 ssk,0 fjje,0 gsfje,0 fwmj,0 dmyjqye,0 dmqye,0 zlqye,0 sjsqye,0 sjstcqye";
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
		zjxje=rs.getDouble("zjxje");
		sjf=rs.getDouble("sjf");
		ssk=rs.getDouble("ssk");
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		fwmj=rs.getLong("fwmj");
		dmyjqye=rs.getDouble("dmyjqye");
		dmqye=rs.getDouble("dmqye");
		zlqye=rs.getDouble("zlqye");
		sjsqye=rs.getDouble("sjsqye");
		sjstcqye=rs.getDouble("sjstcqye");

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
			zkl=zqye*10/wdzgce;
		}

		row++;

		if (getfgs.equals(oldfgs))
		{
			getfgs="同上";;
		}
		else{
			oldfgs=getfgs;
		}

		qysbfb=qys*100.0/allqys;
		qyebfb=zqye*100.0/allzqye;

		%>
		<tr align="center">
			<td ><%=row%></td>
			<td ><%=getfgs%></td>
			<td ><%=dm%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.round(qysbfb,1)%>%</td>
			<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
			<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
			<td  align="right"><%=cf.round(qyebfb,1)%>%</td>
			<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
			<td  align="right"><%=cf.formatDouble((int)(zqye+zjxje))%></td>
			<td  align="right"><%=cf.formatDouble(pjde)%></td>
			<td  align="right"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right"><%=cf.formatDouble(sjf)%></td>
			<td  align="right"><%=cf.formatDouble((int)ssk)%></td>
			<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
			<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
			<td  align="right"><%=cf.round(zkl,1)%></td>
			<td  align="right"><%=cf.formatDouble((int)dmyjqye)%></td>
			<td  align="right"><%=cf.formatDouble((int)dmqye)%></td>
			<td  align="right"><%=cf.formatDouble((int)zlqye)%></td>
			<td  align="right"><%=cf.formatDouble((int)sjsqye)%></td>
			<td  align="right"><%=cf.formatDouble((int)sjstcqye)%></td>
			<td  align="left"><A HREF="ViewDmcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=zqye*90/maxqye%>" height="14"></A></td>
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
		zkl=allzqye*10/allwdzgce;
	}


%>
<tr align="center">
	<td >&nbsp;</td>
	<td >总计</td>
	<td >&nbsp;</td>
	<td  align="right"><%=allqys%></td>
	<td >&nbsp;</td>
	<td  align="right"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzqye)%></td>
	<td >&nbsp;</td>
	<td  align="right"><%=cf.formatDouble((long)allzjxje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzjhze)%></td>
	<td  align="right"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right"><%=cf.formatDouble((long)allssk)%></td>
	<td  align="right"><%=cf.formatDouble((long)allfjje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allgsfje)%></td>
	<td  align="right"><%=cf.round(zkl,1)%></td>
	<td  align="right"><%=cf.formatDouble((int)alldmyjqye)%></td>
	<td  align="right"><%=cf.formatDouble((long)alldmqye)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzlqye)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjsqye)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjstcqye)%></td>
	<td  align="left">&nbsp;</td>
</tr>
</table>


<BR>
<CENTER >
  <B>分公司产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%">排名</td>
  <td  width="12%">分公司</td>
  <td  width="4%">签约数</td>
  <td  width="3%">签约数比例</td>
  <td  width="5%">未打折金额</td>
  <td  width="5%">签约额</td>
  <td  width="3%">签约额比例</td>
  <td  width="4%">增减项</td>
  <td  width="5%">增减后总额 </td>
  <td  width="3%">单额平均</td>
  <td  width="3%">平米均价</td>
  <td  width="4%">设计费</td>
  <td  width="5%">实收款</td>
  <td  width="4%">返卷总额</td>
  <td  width="4%">公司承担返卷</td>
  <td  width="3%">折扣率</td>
  <td  width="5%">店面业绩</td>
  <td  width="5%">经理业绩</td>
  <td  width="5%">助理业绩</td>
  <td  width="5%">设计师业绩</td>
  <td  width="5%">设计师提成</td>
  <td  width="6%">签约额 </td>
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

	ls_sql=" SELECT fgs,sum(qys) qys,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(sjf) sjf,sum(ssk) ssk,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(dmyjqye) dmyjqye,sum(dmqye) dmqye,sum(zlqye) zlqye,sum(sjsqye) sjsqye,sum(sjstcqye) sjstcqye";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT sq_dwxx.dwmc fgs,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(sjf) sjf,sum(sfke) ssk,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(crm_khxx.wdzgce*jc_cxhd.yjzkl/10) dmyjqye,sum(crm_khxx.wdzgce*jc_cxhd.dmzkl/10) dmqye,sum(crm_khxx.wdzgce*jc_cxhd.zlzkl/10) zlqye,sum(crm_khxx.wdzgce*jc_cxhd.sjszkl/10) sjsqye,sum(crm_khxx.wdzgce*jc_cxhd.sjstczkl/10) sjstcqye";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.zt='2'";
    ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and jc_cxhd.hdlx='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by sq_dwxx.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT sq_dwxx.dwmc fgs,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(sjf) sjf,sum(sfke) ssk,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(qye-NVL(gsfje,0)) dmyjqye,sum(qye-NVL(gsfje,0)) dmqye,sum(qye-NVL(gsfje,0)) zlqye,sum(qye-NVL(gsfje,0)) sjsqye,sum(qye-NVL(gsfje,0)) sjstcqye";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.zt='2'";
    ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
	ls_sql+=wheresql;
	ls_sql+=" group by sq_dwxx.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwmc fgs,0 qys,0 zqye,0 wdzgce,0 zjxje,0 sjf,0 ssk,0 fjje,0 gsfje,0 fwmj,0 dmyjqye,0 dmqye,0 zlqye,0 sjsqye,0 sjstcqye";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" group by dwmc";
	
	ls_sql+=" )";
	ls_sql+=" group by fgs";
	ls_sql+=" order by zqye desc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getfgs=rs.getString("fgs");
		qys=rs.getInt("qys");
		zqye=rs.getDouble("zqye");
		wdzgce=rs.getDouble("wdzgce");
		zjxje=rs.getDouble("zjxje");
		sjf=rs.getDouble("sjf");
		ssk=rs.getDouble("ssk");
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		fwmj=rs.getLong("fwmj");
		dmyjqye=rs.getDouble("dmyjqye");
		dmqye=rs.getDouble("dmqye");
		zlqye=rs.getDouble("zlqye");
		sjsqye=rs.getDouble("sjsqye");
		sjstcqye=rs.getDouble("sjstcqye");

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
			zkl=zqye*10/wdzgce;
		}

		qysbfb=qys*100.0/allqys;
		qyebfb=zqye*100.0/allzqye;

		row++;

		%>
		<tr align="center">
			<td ><%=row%></td>
			<td ><%=getfgs%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.round(qysbfb,1)%>%</td>
			<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
			<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
			<td  align="right"><%=cf.round(qyebfb,1)%>%</td>
			<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
			<td  align="right"><%=cf.formatDouble((int)(zqye+zjxje))%></td>
			<td  align="right"><%=cf.formatDouble(pjde)%></td>
			<td  align="right"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right"><%=cf.formatDouble(sjf)%></td>
			<td  align="right"><%=cf.formatDouble((int)ssk)%></td>
			<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
			<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
			<td  align="right"><%=cf.round(zkl,1)%></td>
			<td  align="right"><%=cf.formatDouble((int)dmyjqye)%></td>
			<td  align="right"><%=cf.formatDouble((int)dmqye)%></td>
			<td  align="right"><%=cf.formatDouble((int)zlqye)%></td>
			<td  align="right"><%=cf.formatDouble((int)sjsqye)%></td>
			<td  align="right"><%=cf.formatDouble((int)sjstcqye)%></td>
			<td  align="left"><A HREF="ViewDmcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=zqye*90/maxqye%>" height="14"></A></td>
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
		zkl=allzqye*10/allwdzgce;
	}


%>
<tr align="center">
	<td >&nbsp;</td>
	<td >总计</td>
	<td  align="right"><%=allqys%></td>
	<td >&nbsp;</td>
	<td  align="right"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzqye)%></td>
	<td >&nbsp;</td>
	<td  align="right"><%=cf.formatDouble((long)allzjxje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzjhze)%></td>
	<td  align="right"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right"><%=cf.formatDouble((long)allssk)%></td>
	<td  align="right"><%=cf.formatDouble((long)allfjje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allgsfje)%></td>
	<td  align="right"><%=cf.round(zkl,1)%></td>
	<td  align="right"><%=cf.formatDouble((int)alldmyjqye)%></td>
	<td  align="right"><%=cf.formatDouble((long)alldmqye)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzlqye)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjsqye)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjstcqye)%></td>
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

