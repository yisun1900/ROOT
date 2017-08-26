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

String ssdqbm=request.getParameter("ssdqbm");
String fgsbh=request.getParameter("fgsbh");
String dwbh=request.getParameter("dwbh");
String jzbz=request.getParameter("jzbz");

String wheresql="";
String wheresql1="";

if (!(ssdqbm.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql1+=" and  (sq_dwxx.ssdqbm='"+ssdqbm+"')";
}

if (!(fgsbh.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgsbh+"')";
	wheresql1+=" and  (sq_dwxx.ssfgs='"+fgsbh+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  sq_dwxx.dwbh='"+dwbh+"'";
}

if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

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
  <B>当月业绩统计</B><BR>
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 
<table border="1" width="210%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="3%" class="STYLE1">排名</td>
  <td  width="7%" class="STYLE1">分公司</td>
  <td  width="10%" class="STYLE1">店面</td>
  <td  width="7%" class="STYLE2">财务收款签约额</td>
  <td  width="7%" class="STYLE2">退单额</td>
  <td  width="7%" class="STYLE2">业绩</td>
  <td  width="4%" class="STYLE2">签约数</td>
  <td  width="4%" class="STYLE2">签约数比例</td>
  <td  width="7%" class="STYLE2">合同金额</td>
  <td  width="4%" class="STYLE2">签约额比例</td>
  <td  width="6%" class="STYLE2">增减项</td>
  <td  width="7%" class="STYLE2">增减后总额 </td>
  <td  width="5%" class="STYLE2">平均单额</td>
  <td  width="5%" class="STYLE2">平米均价</td>
  <td  width="5%" class="STYLE2">设计费</td>
  <td  width="4%" class="STYLE2">折扣率</td>
  <td  width="8%" class="STYLE2">业绩</td>
</tr>
<%
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
	ls_sql="SELECT count(*),sum(wdzgce),sum(qye),sum(NVL(zhzjxje,0)),sum(NVL(zhzjxje,0)+qye),sum(sjf),sum(fwmj)";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.zt in ('2') and crm_khxx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_khxx.yjjzsj is null";//未结转的单，都计算在内
	ls_sql+=" and crm_khxx.cwsfke>=qye*((sq_dwxx.jryjbfb-0.5)/100)";
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

	ls_sql="SELECT TRUNC(max(sum(qye)))";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.zt in ('2') and crm_khxx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_khxx.yjjzsj is null";//未结转的单，都计算在内
	ls_sql+=" and crm_khxx.cwsfke>=qye*((sq_dwxx.jryjbfb-0.5)/100)";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.dwbh";
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

	ls_sql=" SELECT fgsbh,dwbh,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT crm_khxx.fgsbh,crm_khxx.dwbh,count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.zt in ('2') and crm_khxx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_khxx.yjjzsj is null";//未结转的单，都计算在内
	ls_sql+=" and crm_khxx.cwsfke>=qye*((sq_dwxx.jryjbfb-0.5)/100)";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.dwbh";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT ssfgs,dwbh,0 qys,0 qye,0 wdzgce,0 zhzjxje,0 sjf,0 fwmj ";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where  dwlx='F2' and cxbz='N'";
	ls_sql+=wheresql1;
	
	ls_sql+=" )";
	ls_sql+=" group by fgsbh,dwbh";
	ls_sql+=" order by qye desc,fgsbh,dwbh";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
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
		ls_sql="SELECT sum(crm_khxx.qye) cwsgqye ";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and zt='3' ";
		ls_sql+=" and crm_khxx.yjjzsj is not null";
		ls_sql+=" and crm_khxx.tdyjjzsj is null";//未结转的单，都计算在内
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
			<td  class="STYLE3"><A HREF="ViewDyDmcz.jsp?dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank"><%=row%></A></td>
			<td  class="STYLE3"><%=getfgsmc%></td>
			<td  class="STYLE3"><%=getdwmc%></td>
			<td  align="right" class="STYLE4"><A HREF="ViewDyDmcz.jsp?dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank"><%=cf.formatDouble(qye)%></A></td>
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
	<td  align="left">&nbsp;</td>
</tr>
</table>
</DIV>


<BR>
<CENTER >
  <B>分公司产值统计</B><BR>
</CENTER>

<DIV onselectstart="return false" class="STYLE_DIV"> 
<table border="1" cellspacing="0" cellpadding="1" width="180%" style='FONT-SIZE: 14px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="3%" class="STYLE1">排名</td>
  <td  width="10%" class="STYLE1">分公司</td>
  <td  width="8%" class="STYLE2">财务收款签约额</td>
  <td  width="8%" class="STYLE2">退单额</td>
  <td  width="8%" class="STYLE2">业绩</td>
  <td  width="4%" class="STYLE2">签约数</td>
  <td  width="4%" class="STYLE2">签约数比例</td>
  <td  width="8%" class="STYLE2">合同金额</td>
  <td  width="4%" class="STYLE2">签约额比例</td>
  <td  width="7%" class="STYLE2">增减项</td>
  <td  width="8%" class="STYLE2">增减后总额 </td>
  <td  width="5%" class="STYLE2">平均单额</td>
  <td  width="5%" class="STYLE2">平米均价</td>
  <td  width="5%" class="STYLE2">设计费</td>
  <td  width="4%" class="STYLE2">折扣率</td>
  <td  width="9%" class="STYLE2">业绩</td>
</tr>
<%
	//获取最大数
	ls_sql="SELECT max(sum(TRUNC(qye)))";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.zt in ('2') and crm_khxx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_khxx.yjjzsj is null";//未结转的单，都计算在内
	ls_sql+=" and crm_khxx.cwsfke>=qye*((sq_dwxx.jryjbfb-0.5)/100)";
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

	ls_sql=" SELECT fgsbh,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT crm_khxx.fgsbh,count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.zt in ('2') and crm_khxx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_khxx.yjjzsj is null";//未结转的单，都计算在内
	ls_sql+=" and crm_khxx.cwsfke>=qye*((sq_dwxx.jryjbfb-0.5)/100)";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.fgsbh";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwbh,0 qys,0 qye,0 wdzgce,0 zhzjxje,0 sjf,0 fwmj ";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;
	
	ls_sql+=" )";
	ls_sql+=" group by fgsbh";
	ls_sql+=" order by qye desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
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
		ls_sql="SELECT sum(crm_khxx.qye) cwsgqye ";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and zt='3' ";
		ls_sql+=" and crm_khxx.yjjzsj is not null";
		ls_sql+=" and crm_khxx.tdyjjzsj is null";//未结转的单，都计算在内
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
			<td  class="STYLE3"><A HREF="ViewDyFgscz.jsp?dwbh=<%=getfgsbh%>&jzbz=<%=jzbz%>" target="_blank"><%=row%></A></td>
			<td  class="STYLE3"><%=getfgsmc%></td>
			<td  align="right" class="STYLE4"><A HREF="ViewDyFgscz.jsp?dwbh=<%=getfgsbh%>&jzbz=<%=jzbz%>" target="_blank"><%=cf.formatDouble(qye)%></A></td>
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
	<td  align="left" class="STYLE4">&nbsp;</td>
</tr>
</table>

</div>


<BR>
<CENTER >
  <B>大区产值统计</B><BR>
</CENTER>

<DIV onselectstart="return false" class="STYLE_DIV"> 
<table border="1" cellspacing="0" cellpadding="1" width="180%" style='FONT-SIZE: 14px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="3%" class="STYLE1">排名</td>
  <td  width="10%" class="STYLE1">大区</td>
  <td  width="8%" class="STYLE2">财务收款签约额</td>
  <td  width="8%" class="STYLE2">退单额</td>
  <td  width="8%" class="STYLE2">业绩</td>
  <td  width="4%" class="STYLE2">签约数</td>
  <td  width="4%" class="STYLE2">签约数比例</td>
  <td  width="8%" class="STYLE2">合同金额</td>
  <td  width="4%" class="STYLE2">签约额比例</td>
  <td  width="7%" class="STYLE2">增减项</td>
  <td  width="8%" class="STYLE2">增减后总额 </td>
  <td  width="5%" class="STYLE2">平均单额</td>
  <td  width="5%" class="STYLE2">平米均价</td>
  <td  width="5%" class="STYLE2">设计费</td>
  <td  width="4%" class="STYLE2">折扣率</td>
  <td  width="9%" class="STYLE2">业绩</td>
</tr>
<%
	//获取最大数

	row=0;
	alltdje=0;
	allyjje=0;

	ls_sql=" SELECT sq_dwxx.ssdqbm,count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.zt in ('2') and crm_khxx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_khxx.yjjzsj is null";//未结转的单，都计算在内
	ls_sql+=" and crm_khxx.cwsfke>=qye*((sq_dwxx.jryjbfb-0.5)/100)";
	ls_sql+=wheresql;
	ls_sql+=" group by sq_dwxx.ssdqbm";
	ls_sql+=" order by qye desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
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
		ls_sql="SELECT sum(crm_khxx.qye) cwsgqye ";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getfgsbh+"'";
		ls_sql+=" and zt='3' ";
		ls_sql+=" and crm_khxx.yjjzsj is not null";
		ls_sql+=" and crm_khxx.tdyjjzsj is null";//未结转的单，都计算在内
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



