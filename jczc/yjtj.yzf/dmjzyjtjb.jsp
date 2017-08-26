<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");

if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String ssdqbm=request.getParameter("ssdqbm");
String fgsbh=request.getParameter("fgsbh");
String dwbh=request.getParameter("dwbh");
String jzbz=request.getParameter("jzbz");

String wheresql="";
String wheresql1="";

if (!(ssdqbm.equals("")))
{
	wheresql+=" and  (cw_qmjzmx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql1+=" and  (sq_dwxx.ssdqbm='"+ssdqbm+"')";
}

if (!(fgsbh.equals("")))
{
	wheresql+=" and  (cw_qmjzmx.fgsbh='"+fgsbh+"')";
	wheresql1+=" and  (sq_dwxx.ssfgs='"+fgsbh+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  cw_qmjzmx.dwbh='"+dwbh+"'";
	wheresql1+=" and  sq_dwxx.dwbh='"+dwbh+"'";
}

if (!jzbz.equals("0"))
{
	wheresql+=" and  cw_qmjzmx.jzbz='"+jzbz+"'";
}

wheresql+=" and cw_qmjzmx.jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and cw_qmjzmx.jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;//ty
ResultSet rs1=null;//ty
String ls_sql=null;


try {
	conn=cf.getConnection();

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<style type="text/css">
<!--
.STYLE1 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE2 {
	BORDER-LEFT: #000000 1px solid;
	BORDER-BOTTOM: #000000 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE3 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft);
	POSITION: relative;
	BACKGROUND-COLOR: #efe1ff;
}
.STYLE4 {
	BORDER-RIGHT: #000 1px solid;
	BORDER-BOTTOM: #000 1px solid;
}
.STYLE_TR {
	FONT-WEIGHT: bold;
	Z-INDEX: 5; 
	POSITION: relative;
	TOP: expression(this.offsetParent.scrollTop)
}
.STYLE_TAB {
	DISPLAY: inline;
	BORDER-COLLAPSE: collapse;
}
.STYLE_DIV {
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: #808080 2px solid;
	DISPLAY: inline;
	OVERFLOW: auto;
	BORDER-LEFT: #808080 2px solid;
	WIDTH: 100%;
	CURSOR: default;
	BORDER-BOTTOM: #808080 2px solid;
	HEIGHT:95%;
}
-->
</style>

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>店面结转业绩统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 
<table border="1" width="310%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="2%" class="STYLE1">排名</td>
  <td  width="5%" class="STYLE1">分公司</td>
  <td  width="8%" class="STYLE1">店面</td>
  <td  width="5%" class="STYLE2">财务收款签约额</td>
  <td  width="5%" class="STYLE2">退单额</td>
  <td  width="5%" class="STYLE2">业绩</td>
  <td  width="3%" class="STYLE2">签约数</td>
  <td  width="3%" class="STYLE2">签约数比例</td>
  <td  width="5%" class="STYLE2">合同金额</td>
  <td  width="3%" class="STYLE2">签约额比例</td>
  <td  width="4%" class="STYLE2">增减项</td>
  <td  width="5%" class="STYLE2">增减后总额 </td>
  <td  width="3%" class="STYLE2">平均单额</td>
  <td  width="3%" class="STYLE2">平米均价</td>
  <td  width="4%" class="STYLE2">设计费</td>
  <td  width="3%" class="STYLE2">折扣率</td>
  <td  width="3%" class="STYLE2">折前业绩</td>
  <td  width="3%" class="STYLE2">折后业绩</td>
  <td  width="3%" class="STYLE2">工程原报价</td>
  <td  width="3%" class="STYLE2">工程签约额</td>
  <td  width="2%" class="STYLE2">减免额</td>
  <td  width="2%" class="STYLE2">折前(管理费)</td>
  <td  width="2%" class="STYLE2">折后(管理费)</td>
  <td  width="2%" class="STYLE2">减免额(管理费)</td>
  <td  width="2%" class="STYLE2">税金</td>
  <td  width="2%" class="STYLE2">减免额(税金)</td>
  <td  width="8%" class="STYLE2">业绩</td>
</tr>
<%
	//店面 折前业绩 折后业绩 工程原报价 工程签约额 减免额 折前 折后 减免额 税金 减免额 
	double dmzqyj=0;
	double dmzhyj=0;
	double dmgcybj=0;
	double dmgcqye=0;
	double dmgcjme=0;
	double dmzqglf=0;
	double dmzhglf=0;
	double dmjmeglf=0;
	double dmsj=0;
	double dmsjjme=0;
	double sumdmzqyj=0;
	double sumdmzhyj=0;
	double sumdmgcybj=0;
	double sumdmgcqye=0;
	double sumdmgcjme=0;
	double sumdmzqglf=0;
	double sumdmzhglf=0;
	double sumdmjmeglf=0;
	double sumdmsj=0;
	double sumdmsjjme=0;
	//分公司 折前业绩 折后业绩 工程原报价 工程签约额 减免额 折前 折后 减免额 税金 减免额 
	double fgszqyj=0;
	double fgszhyj=0;
	double fgsgcybj=0;
	double fgsgcqye=0;
	double fgsgcjme=0;
	double fgszqglf=0;
	double fgszhglf=0;
	double fgsjmeglf=0;
	double fgssj=0;
	double fgssjjme=0;
	double sumfgszqyj=0;
	double sumfgszhyj=0;
	double sumfgsgcybj=0;
	double sumfgsgcqye=0;
	double sumfgsgcjme=0;
	double sumfgszqglf=0;
	double sumfgszhglf=0;
	double sumfgsjmeglf=0;
	double sumfgssj=0;
	double sumfgssjjme=0;
	//大区 折前业绩 折后业绩 工程原报价 工程签约额 减免额 折前 折后 减免额 税金 减免额 
	double dqzqyj=0;
	double dqzhyj=0;
	double dqgcybj=0;
	double dqgcqye=0;
	double dqgcjme=0;
	double dqzqglf=0;
	double dqzhglf=0;
	double dqjmeglf=0;
	double dqsj=0;
	double dqsjjme=0;
	double sumdqzqyj=0;
	double sumdqzhyj=0;
	double sumdqgcybj=0;
	double sumdqgcqye=0;
	double sumdqgcjme=0;
	double sumdqzqglf=0;
	double sumdqzhglf=0;
	double sumdqjmeglf=0;
	double sumdqsj=0;
	double sumdqsjjme=0;


	int allqys=0;
	double allwdzgce=0;
	double allqye=0;
	double allzhzjxje=0;
	double allzjhze=0;
	double allsjf=0;
	long allfwmj=0;

	double maxqye=0;

	String getfgsbh=null;
	String getfgsmc=null;
	String getdwbh=null;
	String getdwmc=null;
	String oldfgsmc="";

	int qys=0;
	double qye=0;
	double wdzgce=0;
	double zhzjxje=0;
	long fwmj=0;
	double sjf=0;

	int pjde=0;
	int pmjj=0;
	double zkl=0;
	double qysbfb=0;
	double qyebfb=0;

	double tdje=0;//退单额
	double alltdje=0;

	double yjje=0;//业绩
	double allyjje=0;

	int row=0;


	//家装总客户总签约数
	ls_sql="SELECT count(*),sum(wdzgce+NVL(zqguanlif,0)+NVL(suijin,0)),sum(qye+NVL(guanlif,0)+NVL(suijin,0)),sum(NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)),sum(NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)+qye+NVL(guanlif,0)+NVL(suijin,0)),sum(sjf),sum(fwmj)";
	ls_sql+=" FROM cw_qmjzmx";
	ls_sql+=" where cw_qmjzmx.zt in ('2')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allqys=rs.getInt(1);
		allwdzgce=rs.getDouble(2);
		allqye=rs.getDouble(3);
		allzhzjxje=rs.getDouble(4);
		allzjhze=rs.getDouble(5);
		allsjf=rs.getDouble(6);
		allfwmj=rs.getLong(7);
	}
	rs.close();
	ps.close();


	//当没有客户时，返回。
	if(allqys==0)
	{
		return;
	}
	if(allqye==0)
	{
		return;
	}

	ls_sql="SELECT TRUNC(max(sum(qye+NVL(guanlif,0)+NVL(suijin,0))))";
	ls_sql+=" FROM cw_qmjzmx";
	ls_sql+=" where cw_qmjzmx.zt='2'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权??：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" group by dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
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

	ls_sql=" SELECT fgsbh,dwbh,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj,sum(dmzqyj) dmzqyj,sum(dmzhyj) dmzhyj,sum(dmgcybj) dmgcybj,sum(dmgcqye) dmgcqye,sum(dmgcjme) dmgcjme,sum(dmzqglf) dmzqglf,sum(dmzhglf) dmzhglf,sum(dmjmeglf) dmjmeglf,sum(dmsj) dmsj,sum(dmsjjme) dmsjjme";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT cw_qmjzmx.fgsbh,cw_qmjzmx.dwbh,count(*) qys,sum(qye+NVL(guanlif,0)+NVL(suijin,0)) qye,sum(wdzgce+NVL(zqguanlif,0)+NVL(suijin,0)) wdzgce,sum(NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj,";

	ls_sql+=" sum(wdzgce+NVL(zqguanlif,0)+NVL(suijin,0)) dmzqyj,";
	ls_sql+=" sum(qye+NVL(guanlif,0)+NVL(suijin,0)) dmzhyj,";
	ls_sql+=" sum(wdzgce) dmgcybj,";
	ls_sql+=" sum(qye) dmgcqye,";
	ls_sql+=" sum(NVL(cdzwjmje,0)) dmgcjme,";
	ls_sql+=" sum(NVL(zqguanlif,0)) dmzqglf,";
	ls_sql+=" sum(NVL(guanlif,0)) dmzhglf,";
	ls_sql+=" sum(NVL(glfjmje,0)) dmjmeglf,";
	ls_sql+=" sum(NVL(suijin,0)) dmsj,";
	ls_sql+=" sum(NVL(sjjmje,0)) dmsjjme";

	ls_sql+=" FROM cw_qmjzmx";
	ls_sql+=" where cw_qmjzmx.zt in ('2')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" group by cw_qmjzmx.fgsbh,cw_qmjzmx.dwbh";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT ssfgs,dwbh,0 qys,0 qye,0 wdzgce,0 zhzjxje,0 sjf,0 fwmj,0 dmzqyj,0 dmzhyj,0 dmgcybj,0 dmgcqye,0 dmgcjme,0 dmzqglf,0 dmzhglf,0 dmjmeglf,0 dmsj,0 dmsjjme ";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where  dwlx='F2' and cxbz='N'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql1;
	
	ls_sql+=" )";
	ls_sql+=" group by fgsbh,dwbh";
	ls_sql+=" order by qye desc,fgsbh,dwbh";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{

		dmzqyj=rs.getDouble("dmzqyj");
		dmzhyj=rs.getDouble("dmzhyj");
		dmgcybj=rs.getDouble("dmgcybj");
		dmgcqye=rs.getDouble("dmgcqye");
		dmgcjme=rs.getDouble("dmgcjme");
		dmzqglf=rs.getDouble("dmzqglf");
		dmzhglf=rs.getDouble("dmzhglf");
		dmjmeglf=rs.getDouble("dmjmeglf");
		dmsj=rs.getDouble("dmsj");
		dmsjjme=rs.getDouble("dmsjjme");

		sumdmzqyj+=dmzqyj;
		sumdmzhyj+=dmzhyj;
		sumdmgcybj+=dmgcybj;
		sumdmgcqye+=dmgcqye;
		sumdmgcjme+=dmgcjme;
		sumdmzqglf+=dmzqglf;
		sumdmzhglf+=dmzhglf;
		sumdmjmeglf+=dmjmeglf;
		sumdmsj+=dmsj;
		sumdmsjjme+=dmsjjme;

		getfgsbh=rs.getString("fgsbh");
		getdwbh=rs.getString("dwbh");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");
		zhzjxje=rs.getDouble("zhzjxje");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");

		ls_sql="SELECT dwmc";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getfgsmc=rs1.getString("dwmc");
		}
		rs1.close();
		ps1.close();

		String cxbz="";
		String kdsj="";
		String gdsj="";
		ls_sql="SELECT dwmc,kdsj,gdsj,cxbz";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getdwbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getdwmc=rs1.getString("dwmc");
			cxbz=rs1.getString("cxbz");
			kdsj=cf.fillNull(rs1.getDate("kdsj"));
			gdsj=cf.fillNull(rs1.getDate("gdsj"));
		}
		rs1.close();
		ps1.close();

		if (cxbz.equals("Y"))//Y：已撤销；N：未撤销
		{
			getdwmc="<font color=\"#FF0033\">"+getdwmc+"("+kdsj+"至"+gdsj+")</font>";
		}
		else{
			getdwmc=getdwmc+"(开店:"+kdsj+")";
		}

		//退单
		ls_sql="SELECT sum(cw_qmjzmx.qye+NVL(cw_qmjzmx.guanlif,0)+NVL(cw_qmjzmx.suijin,0) + (crm_tddj.stje-crm_tddj.ytje) ) cwsgqye ";
		ls_sql+=" FROM cw_qmjzmx,crm_khxx,crm_tddj";
		ls_sql+=" where cw_qmjzmx.dwbh='"+getdwbh+"'";
		ls_sql+=" and cw_qmjzmx.zt='3' ";
		ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_khxx.tdxh=crm_tddj.tdxh";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			tdje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		alltdje+=tdje;

		yjje=qye-tdje;
		allyjje+=yjje;



		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(qye/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(qye/fwmj);
		}

		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=qye*10/wdzgce;
		}


		qysbfb=qys*100.0/allqys;
		qyebfb=qye*100.0/allqye;

		
		row++;

		if (getfgsmc.equals(oldfgsmc))
		{
			getfgsmc="同上";;
		}
		else{
			oldfgsmc=getfgsmc;
		}



		%>
		<tr align="center">
			<td  class="STYLE3"><A HREF="ViewDmcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank"><%=row%></A></td>
			<td  class="STYLE3"><%=getfgsmc%></td>
			<td  class="STYLE3"><%=getdwmc%></td>
			<td  align="right" class="STYLE4"><A HREF="ViewDmcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank"><%=cf.formatDouble(qye)%></A></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(tdje)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(yjje)%></td>
			<td  align="right" class="STYLE4"><%=qys%></td>
			<td  align="right" class="STYLE4"><%=cf.round(qysbfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(wdzgce)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(qyebfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zhzjxje)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)(qye+zhzjxje))%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pjde)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(sjf)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dmzqyj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dmzhyj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dmgcybj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dmgcqye)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dmgcjme)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dmzqglf)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dmzhglf)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dmjmeglf)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dmsj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dmsjjme)%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=yjje*70/maxqye%>" height="14"></td>
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
		pjde=(int)(allqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allqye*10/allwdzgce;
	}


%>
<tr align="center">
	<td  class="STYLE3">&nbsp;</td>
	<td  class="STYLE3">总计</td>
	<td  class="STYLE3">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allqye)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(alltdje)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allyjje)%></td>
	<td  align="right" class="STYLE4"><%=allqys%></td>
	<td  class="STYLE4">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allwdzgce)%></td>
	<td  class="STYLE4">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzhzjxje)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzjhze)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdmzqyj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdmzhyj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdmgcybj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdmgcqye)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdmgcjme)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdmzqglf)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdmzhglf)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdmjmeglf)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdmsj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdmsjjme)%></td>
	<td  align="left">&nbsp;</td>
</tr>
</table>
</DIV>


<BR>
<CENTER >
  <B>分公司产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>

<DIV onselectstart="return false" class="STYLE_DIV"> 
<table border="1" cellspacing="0" cellpadding="1" width="300%" style='FONT-SIZE: 14px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="2%" class="STYLE1">排名</td>
  <td  width="7%" class="STYLE1">分公司</td>
  <td  width="5%" class="STYLE2">财务收款签约额</td>
  <td  width="5%" class="STYLE2">退单额</td>
  <td  width="5%" class="STYLE2">业绩</td>
  <td  width="3%" class="STYLE2">签约数</td>
  <td  width="3%" class="STYLE2">签约数比例</td>
  <td  width="5%" class="STYLE2">合同金额</td>
  <td  width="3%" class="STYLE2">签约额比例</td>
  <td  width="4%" class="STYLE2">增减项</td>
  <td  width="5%" class="STYLE2">增减后总额 </td>
  <td  width="4%" class="STYLE2">平均单额</td>
  <td  width="4%" class="STYLE2">平米均价</td>
  <td  width="4%" class="STYLE2">设计费</td>
  <td  width="3%" class="STYLE2">折扣率</td>
  <td  width="3%" class="STYLE2">折前业绩</td>
  <td  width="3%" class="STYLE2">折后业绩</td>
  <td  width="3%" class="STYLE2">工程原报价</td>
  <td  width="3%" class="STYLE2">工程签约额</td>
  <td  width="2%" class="STYLE2">减免额</td>
  <td  width="2%" class="STYLE2">折前(管理费)</td>
  <td  width="2%" class="STYLE2">折后(管理费)</td>
  <td  width="2%" class="STYLE2">减免额(管理费)</td>
  <td  width="2%" class="STYLE2">税金</td>
  <td  width="2%" class="STYLE2">减免额(税金)</td>
  <td  width="8%" class="STYLE2">业绩</td>
</tr>
<%
	//获取最大数
	ls_sql="SELECT TRUNC(max(sum(qye+NVL(guanlif,0)+NVL(suijin,0))))";
	ls_sql+=" FROM cw_qmjzmx";
	ls_sql+=" where cw_qmjzmx.zt='2'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" group by fgsbh";
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
	alltdje=0;
	allyjje=0;

	ls_sql=" SELECT fgsbh,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj,sum(fgszqyj) fgszqyj,sum(fgszhyj) fgszhyj,sum(fgsgcybj) fgsgcybj,sum(fgsgcqye) fgsgcqye,sum(fgsgcjme) fgsgcjme,sum(fgszqglf) fgszqglf,sum(fgszhglf) fgszhglf,sum(fgsjmeglf) fgsjmeglf,sum(fgssj) fgssj,sum(fgssjjme) fgssjjme";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT cw_qmjzmx.fgsbh,count(*) qys,sum(qye+NVL(guanlif,0)+NVL(suijin,0)) qye,sum(wdzgce+NVL(zqguanlif,0)+NVL(suijin,0)) wdzgce,sum(NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj,";
	ls_sql+=" sum(wdzgce+NVL(zqguanlif,0)+NVL(suijin,0)) fgszqyj,";
	ls_sql+=" sum(qye+NVL(guanlif,0)+NVL(suijin,0)) fgszhyj,";
	ls_sql+=" sum(wdzgce) fgsgcybj,";
	ls_sql+=" sum(qye) fgsgcqye,";
	ls_sql+=" sum(NVL(cdzwjmje,0)) fgsgcjme,";
	ls_sql+=" sum(NVL(zqguanlif,0)) fgszqglf,";
	ls_sql+=" sum(NVL(guanlif,0)) fgszhglf,";
	ls_sql+=" sum(NVL(glfjmje,0)) fgsjmeglf,";
	ls_sql+=" sum(NVL(suijin,0)) fgssj,";
	ls_sql+=" sum(NVL(sjjmje,0)) fgssjjme";
	ls_sql+=" FROM cw_qmjzmx";
	ls_sql+=" where cw_qmjzmx.zt in ('2')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" group by cw_qmjzmx.fgsbh";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwbh,0 qys,0 qye,0 wdzgce,0 zhzjxje,0 sjf,0 fwmj,0 fgszqyj,0 fgszhyj,0 fgsgcybj,0 fgsgcqye,0 fgsgcjme,0 fgszqglf,0 fgszhglf,0 fgsjmeglf,0 fgssj,0 fgssjjme ";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql1;
	
	ls_sql+=" )";
	ls_sql+=" group by fgsbh";
	ls_sql+=" order by qye desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fgszqyj=rs.getDouble("fgszqyj");
		fgszhyj=rs.getDouble("fgszhyj");
		fgsgcybj=rs.getDouble("fgsgcybj");
		fgsgcqye=rs.getDouble("fgsgcqye");
		fgsgcjme=rs.getDouble("fgsgcjme");
		fgszqglf=rs.getDouble("fgszqglf");
		fgszhglf=rs.getDouble("fgszhglf");
		fgsjmeglf=rs.getDouble("fgsjmeglf");
		fgssj=rs.getDouble("fgssj");
		fgssjjme=rs.getDouble("fgssjjme");

		sumfgszqyj+=fgszqyj;
		sumfgszhyj+=fgszhyj;
		sumfgsgcybj+=fgsgcybj;
		sumfgsgcqye+=fgsgcqye;
		sumfgsgcjme+=fgsgcjme;
		sumfgszqglf+=fgszqglf;
		sumfgszhglf+=fgszhglf;
		sumfgsjmeglf+=fgsjmeglf;
		sumfgssj+=fgssj;
		sumfgssjjme+=fgssjjme;

		getfgsbh=rs.getString("fgsbh");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");
		zhzjxje=rs.getDouble("zhzjxje");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");


		ls_sql="SELECT dwmc";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getfgsmc=rs1.getString("dwmc");
		}
		rs1.close();
		ps1.close();

		//退单
		ls_sql="SELECT sum(qye+NVL(guanlif,0)+NVL(suijin,0)) cwsgqye ";
		ls_sql+=" FROM cw_qmjzmx";
		ls_sql+=" where cw_qmjzmx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and zt='3' ";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			tdje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		alltdje+=tdje;

		yjje=qye-tdje;
		allyjje+=yjje;

		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(qye/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(qye/fwmj);
		}
		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=qye*10/wdzgce;
		}

		qysbfb=qys*100.0/allqys;
		qyebfb=qye*100.0/allqye;

		row++;

		%>
		<tr align="center">
			<td  class="STYLE3">
			<%
			if (yhjs.equals("F2"))
		{out.print(row);}
		else
		{
			out.print("<A HREF=\"ViewFgscz.jsp?sjfw="+sjfw+"&sjfw2="+sjfw2+"&dwbh="+getfgsbh+"&jzbz="+jzbz+"\" target=\"_blank\">"+row+"</A>");
		}%>
			<!-- <A HREF="ViewFgscz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getfgsbh%>&jzbz=<%=jzbz%>" target="_blank"><%=row%></A> -->
			</td>
			<td  class="STYLE3"><%=getfgsmc%></td>
			<td  align="right" class="STYLE4">
			<%
			if (yhjs.equals("F2"))
		{out.print(cf.formatDouble(qye));}
		else
		{
			out.print("<A HREF=\"ViewFgscz.jsp?sjfw="+sjfw+"&sjfw2="+sjfw2+"&dwbh="+getfgsbh+"&jzbz="+jzbz+"\" target=\"_blank\">"+cf.formatDouble(qye)+"</A>");
		}%>
			<!-- <A HREF="ViewFgscz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getfgsbh%>&jzbz=<%=jzbz%>" target="_blank"><%=cf.formatDouble(qye)%></A> -->
			</td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(tdje)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(yjje)%></td>
			<td  align="right"  class="STYLE4"><%=qys%></td>
			<td  align="right" class="STYLE4"><%=cf.round(qysbfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(wdzgce)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(qyebfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zhzjxje)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)(qye+zhzjxje))%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pjde)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(sjf)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(fgszqyj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(fgszhyj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(fgsgcybj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(fgsgcqye)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(fgsgcjme)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(fgszqglf)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(fgszhglf)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(fgsjmeglf)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(fgssj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(fgssjjme)%></td>
			<td  align="left" class="STYLE4"><img src="/images/ColuGif.gif" width="<%=yjje*70/maxqye%>" height="14"></td>
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
		pjde=(int)(allqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allqye*10/allwdzgce;
	}


%>
<tr align="center">
	<td  class="STYLE3">&nbsp;</td>
	<td  class="STYLE3">总计</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allqye)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(alltdje)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allyjje)%></td>
	<td  align="right" class="STYLE4"><%=allqys%></td>
	<td  class="STYLE4">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allwdzgce)%></td>
	<td  class="STYLE4">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzhzjxje)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzjhze)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumfgszqyj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumfgszhyj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumfgsgcybj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumfgsgcqye)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumfgsgcjme)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumfgszqglf)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumfgszhglf)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumfgsjmeglf)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumfgssj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumfgssjjme)%></td>
	<td  align="left" class="STYLE4">&nbsp;</td>
</tr>
</table>

</div>


<BR>
<CENTER >
  <B>大区产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>

<DIV onselectstart="return false" class="STYLE_DIV"> 
<table border="1" cellspacing="0" cellpadding="1" width="300%" style='FONT-SIZE: 14px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="2%" class="STYLE1">排名</td>
  <td  width="5%" class="STYLE1">大区</td>
  <td  width="5%" class="STYLE2">财务收款签约额</td>
  <td  width="5%" class="STYLE2">退单额</td>
  <td  width="5%" class="STYLE2">业绩</td>
  <td  width="3%" class="STYLE2">签约数</td>
  <td  width="3%" class="STYLE2">签约数比例</td>
  <td  width="5%" class="STYLE2">合同金额</td>
  <td  width="3%" class="STYLE2">签约额比例</td>
  <td  width="4%" class="STYLE2">增减项</td>
  <td  width="5%" class="STYLE2">增减后总额 </td>
  <td  width="3%" class="STYLE2">平均单额</td>
  <td  width="3%" class="STYLE2">平米均价</td>
  <td  width="3%" class="STYLE2">设计费</td>
  <td  width="3%" class="STYLE2">折扣率</td>
  <td  width="3%" class="STYLE2">折前业绩</td>
  <td  width="3%" class="STYLE2">折后业绩</td>
  <td  width="3%" class="STYLE2">工程原报价</td>
  <td  width="3%" class="STYLE2">工程签约额</td>
  <td  width="2%" class="STYLE2">减免额</td>
  <td  width="2%" class="STYLE2">折前(管理费)</td>
  <td  width="2%" class="STYLE2">折后(管理费)</td>
  <td  width="2%" class="STYLE2">减免额(管理费)</td>
  <td  width="2%" class="STYLE2">税金</td>
  <td  width="2%" class="STYLE2">减免额(税金)</td>
  <td  width="9%" class="STYLE2">业绩</td>
</tr>
<%
	//获取最大数

	row=0;
	alltdje=0;
	allyjje=0;

	ls_sql=" SELECT sq_dwxx.ssdqbm,count(*) qys,sum(qye+NVL(guanlif,0)+NVL(suijin,0)) qye,sum(wdzgce+NVL(zqguanlif,0)+NVL(suijin,0)) wdzgce,sum(NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj,";
	ls_sql+=" sum(wdzgce+NVL(zqguanlif,0)+NVL(suijin,0)) dqzqyj,";
	ls_sql+=" sum(qye+NVL(guanlif,0)+NVL(suijin,0)) dqzhyj,";
	ls_sql+=" sum(wdzgce) dqgcybj,";
	ls_sql+=" sum(qye) dqgcqye,";
	ls_sql+=" sum(NVL(cdzwjmje,0)) dqgcjme,";
	ls_sql+=" sum(NVL(zqguanlif,0)) dqzqglf,";
	ls_sql+=" sum(NVL(guanlif,0)) dqzhglf,";
	ls_sql+=" sum(NVL(glfjmje,0)) dqjmeglf,";
	ls_sql+=" sum(NVL(suijin,0)) dqsj,";
	ls_sql+=" sum(NVL(sjjmje,0)) dqsjjme";
	ls_sql+=" FROM cw_qmjzmx,sq_dwxx";
	ls_sql+=" where cw_qmjzmx.zt in ('2') and cw_qmjzmx.fgsbh=sq_dwxx.dwbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" group by sq_dwxx.ssdqbm";
	ls_sql+=" order by qye desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dqzqyj=rs.getDouble("dqzqyj");
		dqzhyj=rs.getDouble("dqzhyj");
		dqgcybj=rs.getDouble("dqgcybj");
		dqgcqye=rs.getDouble("dqgcqye");
		dqgcjme=rs.getDouble("dqgcjme");
		dqzqglf=rs.getDouble("dqzqglf");
		dqzhglf=rs.getDouble("dqzhglf");
		dqjmeglf=rs.getDouble("dqjmeglf");
		dqsj=rs.getDouble("dqsj");
		dqsjjme=rs.getDouble("dqsjjme");


		sumdqzqyj+=dqzqyj;
		sumdqzhyj+=dqzhyj;
		sumdqgcybj+=dqgcybj;
		sumdqgcqye+=dqgcqye;
		sumdqgcjme+=dqgcjme;
		sumdqzqglf+=dqzqglf;
		sumdqzhglf+=dqzhglf;
		sumdqjmeglf+=dqjmeglf;
		sumdqsj+=dqsj;
		sumdqsjjme+=dqsjjme;

		getfgsbh=rs.getString("ssdqbm");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");
		zhzjxje=rs.getDouble("zhzjxje");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");


		ls_sql="SELECT ssdqmc";
		ls_sql+=" FROM sq_ssdqbm";
		ls_sql+=" where ssdqbm='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getfgsmc=rs1.getString("ssdqmc");
		}
		rs1.close();
		ps1.close();

		//退单
		ls_sql="SELECT sum(qye+NVL(guanlif,0)+NVL(suijin,0)) cwsgqye ";
		ls_sql+=" FROM cw_qmjzmx,sq_dwxx";
		ls_sql+=" where cw_qmjzmx.fgsbh=sq_dwxx.dwbh";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getfgsbh+"'";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			ls_sql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=" and zt='3' ";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			tdje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		alltdje+=tdje;

		yjje=qye-tdje;
		allyjje+=yjje;

		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(qye/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(qye/fwmj);
		}
		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=qye*10/wdzgce;
		}

		qysbfb=qys*100.0/allqys;
		qyebfb=qye*100.0/allqye;

		row++;

		%>
		<tr align="center">
			<td  class="STYLE3"><%=row%></td>
			<td  class="STYLE3"><%=getfgsmc%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(qye)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(tdje)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(yjje)%></td>
			<td  align="right"  class="STYLE4"><%=qys%></td>
			<td  align="right" class="STYLE4"><%=cf.round(qysbfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(wdzgce)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(qyebfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zhzjxje)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)(qye+zhzjxje))%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pjde)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(sjf)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dqzqyj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dqzhyj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dqgcybj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dqgcqye)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dqgcjme)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dqzqglf)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dqzhglf)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dqjmeglf)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dqsj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(dqsjjme)%></td>
			<td  align="left" class="STYLE4"><img src="/images/ColuGif.gif" width="<%=yjje*50/maxqye%>" height="14"></td>
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
		pjde=(int)(allqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allqye*10/allwdzgce;
	}


%>
<tr align="center">
	<td  class="STYLE3">&nbsp;</td>
	<td  class="STYLE3">总计</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allqye)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(alltdje)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allyjje)%></td>
	<td  align="right" class="STYLE4"><%=allqys%></td>
	<td  class="STYLE4">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allwdzgce)%></td>
	<td  class="STYLE4">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzhzjxje)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzjhze)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdqzqyj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdqzhyj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdqgcybj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdqgcqye)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdqgcjme)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdqzqglf)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdqzhglf)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdqjmeglf)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdqsj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(sumdqsjjme)%></td>
	<td  align="left" class="STYLE4">&nbsp;</td>
</tr>
</table>

</div>

</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
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



