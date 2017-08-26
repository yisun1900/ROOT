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

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String jzbz=request.getParameter("jzbz");

String wheresql="";
String wheresql1="";
String wheresql2="";//ty

if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  a.dwbh='"+dwbh+"'";
}

if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

wheresql2+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";//ty 咨询录入时间
wheresql2+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

String djyj=request.getParameter("djyj");
String nian=request.getParameter("nian");
String yue=request.getParameter("yue");
String yhdlm=(String)session.getAttribute("yhdlm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

PreparedStatement ps1=null;//ty
ResultSet rs1=null;//ty

try {
	conn=cf.getConnection();

	String xtrzip=request.getRemoteHost();
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String xtrzyhmc=(String)session.getAttribute("yhmc");
	ls_sql="insert into sq_xtrz ( xh,ip,yhdlm,dlsj,bz ) ";
	ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_xtrz),?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xtrzip);
	ps.setString(2,xtrzyhdlm);
	ps.setString(3,xtrzyhmc+"：店面家装业绩："+sjfw+"："+sjfw2+"："+fgs+"："+dwbh+"：");
	ps.executeUpdate();
	ps.close();


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
  <B>店面产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 
<table border="1" width="150%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="3%" class="STYLE1">排名</td>
  <td  width="7%" class="STYLE1">分公司</td>
  <td  width="7%" class="STYLE1">店面</td>
  <td  width="6%" class="STYLE2">签约额</td>
  <td  width="6%" class="STYLE2">财务收款签约额</td>
  <td  width="4%" class="STYLE2">咨询数</td>
  <td  width="4%" class="STYLE2">签约数</td>
  <td  width="5%" class="STYLE2">签约数比例</td>
  <td  width="6%" class="STYLE2">合同金额</td>
  <td  width="6%" class="STYLE2">签约额比例</td>
  <td  width="4%" class="STYLE2">增减项</td>
  <td  width="6%" class="STYLE2">增减后总额 </td>
  <td  width="5%" class="STYLE2">平均单额</td>
  <td  width="5%" class="STYLE2">平米均价</td>
  <td  width="6%" class="STYLE2">主材销售额</td>
  <td  width="6%" class="STYLE2">主材实销额</td>
  <td  width="4%" class="STYLE2">设计费</td>
  <td  width="4%" class="STYLE2">折扣率</td>
  <td  width="6%" class="STYLE2">签约额 </td>
</tr>
<%
	//获取最大数
	double maxqye=0;
	String getfgs=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;
	String fgsbh=null;

	int qys=0;
	int zxs=0;//ty 咨询数
	double zqye=0;
	double wdzgce=0;
	double zjxje=0;
	long fwmj=0;
	double sjf=0;

	double cwskqye=0;//财务收款签约额
	double allcwskqye=0;
	double fgscwskqye=0;//分公司财务收款签约额
	double allfgscwskqye=0;

	int allqys=0;
	int allzxs=0;//ty 全部咨询数
	double allzqye=0;
	double allwdzgce=0;
	double allzjxje=0;
	double allzjhze=0;
	long allfwmj=0;
	double allsjf=0;
	double zkl=0;
	int pjde=0;
	int pmjj=0;

	double qysbfb=0;
	double qyebfb=0;

	int row=0;

	double zcqde=0;//签单额
//	double zcqds=0;
	double zczjx=0;//增减项金额
	double zctde=0;//退单额
	double zcqye=0;//主材签约额
	double allzcqye=0;//主材签约总额
	double zcsxe=0;//主材实销额
	double allzcsxe=0;//主材实销总额
	//家装总客户总签约数
	ls_sql="SELECT count(*),sum(wdzgce),sum(qye),sum(NVL(zjxje,0)),sum(NVL(zjxje,0)+qye),sum(sjf),sum(fwmj)";
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
		allzjxje=rs.getDouble(4);
		allzjhze=rs.getDouble(5);
		allsjf=rs.getDouble(6);
		allfwmj=rs.getLong(7);
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

	ls_sql=" SELECT fgs,dwbh,dm,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT b.dwmc fgs,crm_khxx.dwbh dwbh,a.dwmc dm,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.fgsbh=b.dwbh(+)";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT b.dwmc fgs,a.dwbh dwbh,a.dwmc dm,0 qys,0 zqye,0 wdzgce,0 zjxje,0 sjf,0 fwmj ";
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
		fwmj=rs.getLong("fwmj");
//查出每个店面在该月咨询数 ty 
		ls_sql="SELECT  count(*) zxs";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where zxdm='"+getdwbh+"' ";
		ls_sql+=wheresql2;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zxs=rs1.getInt("zxs");
			allzxs+=zxs;//咨询总数
		}
		rs1.close();
		ps1.close();
//财务收款签约额  客户要求改成收款时间
		ls_sql="SELECT sum(crm_khxx.qye) cwsgqye ";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"' and zt='2'";
		ls_sql+=" and jzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cwskqye=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		allcwskqye+=cwskqye;

//以上		
//主材订单
		ls_sql="SELECT sum(jc_zcdd.hkze) htze ";
		ls_sql+=" FROM crm_khxx,jc_zcdd";
		ls_sql+=" where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.clzt>='09'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zcqde=rs1.getDouble(1);//主材金额
		}
		rs1.close();
		ps1.close();
		//out.println(ls_sql);
//退单
//		ls_sql="SELECT sum(jc_zcdd.hkze) htze,count(distinct jc_zcdd.khbh) zcqys";
		ls_sql="SELECT sum(jc_zcdd.hkze) htze ";
		ls_sql+=" FROM crm_khxx,jc_zcdd";
		ls_sql+=" where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.clzt='99' and jc_zcdd.hkze>0";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zctde=rs1.getDouble(1);//主材金额
		}
		rs1.close();
		ps1.close();

//		out.println(ls_sql);
//增减项
		ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zczjx";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.ddbh=jc_zczjx.ddbh and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
		ls_sql+=" and jc_zczjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.clzt!='00'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zczjx=rs1.getDouble(1);//主材金额
		}
		rs1.close();
		ps1.close();

		zcqye=zcqde-zctde+zczjx;
		allzcqye+=zcqye;//主材销售总额


		ls_sql="SELECT sum(cw_khfkjl.fkje) fkje ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.fklxbm='23'  ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zcsxe=rs1.getDouble(1);//主材实销金额
		}
		rs1.close();
		ps1.close();		
		allzcsxe+=zcsxe;

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
			<td  class="STYLE3"><%=row%></td>
			<td  class="STYLE3"><%=getfgs%></td>
			<td  class="STYLE3"><%=dm%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zqye)%></td>
			<td align="right" class="STYLE4"><A HREF="ViewDmczCwsk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank"><%=cf.formatDouble((int)cwskqye)%></A</td>
			<td  align="right"  class="STYLE4"><%=zxs%></td>
			<td  align="right" class="STYLE4"><%=qys%></td>
			<td  align="right" class="STYLE4"><%=cf.round(qysbfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)wdzgce)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(qyebfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zjxje)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)(zqye+zjxje))%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pjde)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pmjj)%></td>
		    <td  align="right" class="STYLE4"><%=cf.formatDouble(zcqye)%></td>
		    <td  align="right" class="STYLE4"><%=cf.formatDouble(zcsxe)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(sjf)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
			<td  align="left"><A HREF="ViewDmcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=zqye*70/maxqye%>" height="14"></A></td>
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
	<td  class="STYLE3">&nbsp;</td>
	<td  class="STYLE3">总计</td>
	<td  class="STYLE3">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzqye)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allcwskqye)%></td>
	<td  align="right" class="STYLE4"><%=allzxs%></td><!--咨询总数 -->
	<td  align="right" class="STYLE4"><%=allqys%></td>
	<td  class="STYLE4">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  class="STYLE4">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzjxje)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzjhze)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzcqye)%></td><!--主材签约总额 -->
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzcsxe)%></td><!--主材实销总额 -->
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
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
<table border="1" cellspacing="0" cellpadding="1" width="130%" style='FONT-SIZE: 14px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="5%" class="STYLE1">排名</td>
  <td  width="15%" class="STYLE1">分公司</td>
  <td  width="8%" class="STYLE2">签约额</td>
  <td  width="8%" class="STYLE2">财务收款签约额</td>
  <td  width="4%" class="STYLE2">签约数</td>
  <td  width="5%" class="STYLE2">签约数比例</td>
  <td  width="9%" class="STYLE2">未打折金额</td>
  <td  width="5%" class="STYLE2">签约额比例</td>
  <td  width="7%" class="STYLE2">增减项</td>
  <td  width="9%" class="STYLE2">增减后总额 </td>
  <td  width="6%" class="STYLE2">单额平均</td>
  <td  width="4%" class="STYLE2">平米均价</td>
  <td  width="6%" class="STYLE2">设计费</td>
  <td  width="4%" class="STYLE2">折扣率</td>
  <td  width="8%" class="STYLE2">签约额 </td>
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

	ls_sql=" SELECT fgs,fgsbh,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT sq_dwxx.dwmc fgs,sq_dwxx.dwbh fgsbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by sq_dwxx.dwmc,sq_dwxx.dwbh";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwmc fgs,dwbh fgsbh,0 qys,0 zqye,0 wdzgce,0 zjxje,0 sjf,0 fwmj ";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" group by dwmc,dwbh";
	
	ls_sql+=" )";
	ls_sql+=" group by fgs,fgsbh";
	ls_sql+=" order by zqye desc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getfgs=rs.getString("fgs");
		fgsbh=rs.getString("fgsbh");
		qys=rs.getInt("qys");
		zqye=rs.getDouble("zqye");
		wdzgce=rs.getDouble("wdzgce");
		zjxje=rs.getDouble("zjxje");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");

//分公司财务收款签约额
		ls_sql="SELECT sum(crm_khxx.qye) cwsgqye ";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.fgsbh='"+fgsbh+"' and zt='2'";
		ls_sql+=" and jzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			fgscwskqye=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		allfgscwskqye+=fgscwskqye;



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
			<td  class="STYLE3"><%=row%></td>
			<td  class="STYLE3"><%=getfgs%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zqye)%></td>
			<td  align="right" class="STYLE4"><A HREF="ViewDmczFgsCwsk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgsbh=<%=fgsbh%>&jzbz=<%=jzbz%>" target="_blank"><%=cf.formatDouble((int)fgscwskqye)%></A></td>
			<td  align="right"  class="STYLE4"><%=qys%></td>
			<td  align="right" class="STYLE4"><%=cf.round(qysbfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)wdzgce)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(qyebfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zjxje)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble((int)(zqye+zjxje))%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pjde)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(sjf)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
			<td  align="left" class="STYLE4"><img src="/images/ColuGif.gif" width="<%=zqye*70/maxqye%>" height="14"></td>
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
	<td  class="STYLE3">&nbsp;</td>
	<td  class="STYLE3">总计</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzqye)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allfgscwskqye)%></td>
	<td  align="right" class="STYLE4"><%=allqys%></td>
	<td  class="STYLE4">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  class="STYLE4">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzjxje)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzjhze)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
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

