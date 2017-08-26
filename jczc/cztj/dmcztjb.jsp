<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='090401'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[店面产值统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[店面产值统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String ssdqbm=cf.fillNull(request.getParameter("ssdqbm"));
String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));
String jzbz=request.getParameter("jzbz");
String tjsj=request.getParameter("tjsj");
String sfjms=request.getParameter("sfjms");

String wheresql="";
String wheresql1="";

if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
{
	wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}

if (!(ssdqbm.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql1+=" and  (a.ssdqbm='"+ssdqbm+"')";
}

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

if (tjsj.equals("1"))
{
	wheresql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("2"))
{
	wheresql+=" and crm_khxx.jzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and crm_khxx.jzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("3"))
{
	wheresql+=" and crm_khxx.cwjzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and crm_khxx.cwjzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("4"))
{
	wheresql+=" and crm_khxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and crm_khxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}


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
  <B>店面产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>



<DIV onselectstart="return false" style="BORDER-RIGHT: #808080 2px solid; BORDER-TOP: #808080 2px solid; DISPLAY: inline; OVERFLOW: auto; BORDER-LEFT: #808080 2px solid; WIDTH: 100%; CURSOR: default; BORDER-BOTTOM: #808080 2px solid; HEIGHT:95%"> 


<TABLE style="DISPLAY: inline; BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=2 border=0 width="420%" style='FONT-SIZE: 13px'>

<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>

  <td colspan="4" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">合同总额</td>
  
  <td colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">收款客户数</td>
  <td colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#0000FF">实收款</font></td>
  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">累计增减项</td>
  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">增减后总额</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>

  
  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">合同.工程费</td>
  
  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">合同.税金</td>
  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">合同.管理费</td>

  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">合同.记入业绩其它费</td>

  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">合同.不记业绩其它费</td>

  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">合同.设计费</td>


  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">增减项.工程费</td>
  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">增减项.税金</td>
  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">增减项.管理费</td>

  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">增减项.记入业绩其它费</td>

  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">增减项.不记业绩其它费</td>

  <td  colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">增减项.设计费</td>

</tr>
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
  <td  width="1%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">排名</td>
  <td  width="3%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">分公司</td>
  <td  width="5%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">店面</td>

  <td  width="1%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签约数</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折前</td>
  <td  width="1%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">综合折扣</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后</td>

  <td  width="1%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">未审核</td>
  <td  width="1%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">已审核</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#0000FF">家装实收款</font></td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#0000FF">所有收款</font></td>

  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后</td>

  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后</td>

  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">单额平均</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">平米均价</td>
  
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后</td>

  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后</td>

  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后</td>

  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后</td>

  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后</td>


  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">折后</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">折后</td>

  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">折后</td>

  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">折后</td>

  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">折后</td>

  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">折前</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #FFFFCC">折后</td>
</tr>
<%
	//获取最大数
	String getfgs=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;
	String getdwmc=null;

	int qys=0;
	double wdzgce=0;
	double qye=0;

	double zqgczjf=0;
	double zhgczjf=0;

	double zqguanlif=0;
	double guanlif=0;

	double zqsuijin=0;
	double suijin=0;

	double zqqtsf=0;
	double zhqtsf=0;

	double zqwjrqyexm=0;
	double zhwjrqyexm=0;

	double zqsjf=0;
	double sjf=0;

	double zqljzjx=0;
	double zhljzjx=0;

	double zjxje=0;
	double zhzjxje=0;

	double zqzjxsuijin=0;
	double zjxsuijin=0;

	double zqzjxguanlif=0;
	double zjxguanlif=0;

	double zqqtsfzjx=0;
	double zhqtsfzjx=0;

	double zqwjrzjx=0;
	double zhwjrzjx=0;

	double zqzjxsjf=0;
	double zhzjxsjf=0;

	long fwmj=0;

	double suijinze=0;


	int ALLqys=0;
	double ALLwdzgce=0;
	double ALLqye=0;

	double ALLzqgczjf=0;
	double ALLzhgczjf=0;

	double ALLzqguanlif=0;
	double ALLguanlif=0;

	double ALLzqsuijin=0;
	double ALLsuijin=0;

	double ALLzqqtsf=0;
	double ALLzhqtsf=0;

	double ALLzqwjrqyexm=0;
	double ALLzhwjrqyexm=0;

	double ALLzqsjf=0;
	double ALLsjf=0;

	double ALLzqljzjx=0;
	double ALLzhljzjx=0;

	double ALLzjxje=0;
	double ALLzhzjxje=0;

	double ALLzqzjxsuijin=0;
	double ALLzjxsuijin=0;

	double ALLzqzjxguanlif=0;
	double ALLzjxguanlif=0;

	double ALLzqqtsfzjx=0;
	double ALLzhqtsfzjx=0;

	double ALLzqwjrzjx=0;
	double ALLzhwjrzjx=0;

	double ALLzqzjxsjf=0;
	double ALLzhzjxsjf=0;

	long ALLfwmj=0;

	double ALLsuijinze=0;



	double zkl=0;
	int pjde=0;
	int pmjj=0;


	int gsskqys=0;
	int cwskqys=0;
	double jzssk=0;
	double khssk=0;

	int ALLgsskqys=0;
	int ALLcwskqys=0;
	double ALLjzssk=0;
	double ALLkhssk=0;

	int row=0;
	//家装总客户总签约数
	ls_sql="SELECT count(*) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zqgczjf) zqgczjf,sum(zhgczjf) zhgczjf,sum(NVL(zqsuijin,0)) zqsuijin,sum(NVL(suijin,0)) suijin,sum(NVL(zqguanlif,0)) zqguanlif,sum(NVL(guanlif,0)) guanlif  ,sum(NVL(zqqtsf,0)) zqqtsf,sum(NVL(zhqtsf,0)) zhqtsf ,sum(NVL(zqwjrqyexm,0)) zqwjrqyexm,sum(NVL(zhwjrqyexm,0)) zhwjrqyexm ,sum(NVL(zqsjf,0)) zqsjf,sum(NVL(sjf,0)) sjf    ,sum(NVL(zqljzjx,0)) zqljzjx,sum(NVL(zhljzjx,0)) zhljzjx,sum(NVL(zjxje,0)) zjxje,sum(NVL(zhzjxje,0)) zhzjxje,sum(NVL(zqzjxsuijin,0)) zqzjxsuijin,sum(NVL(zjxsuijin,0)) zjxsuijin,sum(NVL(zqzjxguanlif,0)) zqzjxguanlif,sum(NVL(zjxguanlif,0)) zjxguanlif,sum(NVL(zqqtsfzjx,0)) zqqtsfzjx,sum(NVL(zhqtsfzjx,0)) zhqtsfzjx,sum(NVL(zqwjrzjx,0)) zqwjrzjx,sum(NVL(zhwjrzjx,0)) zhwjrzjx,sum(NVL(zqzjxsjf,0)) zqzjxsjf,sum(NVL(zhzjxsjf,0)) zhzjxsjf ,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh and crm_khxx.zt in('2','5') and sq_dwxx.sfjms='"+sfjms+"'";//N：否；Y：是
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ALLqys=rs.getInt("qys");
		ALLwdzgce=rs.getDouble("wdzgce");
		ALLqye=rs.getDouble("qye");

		ALLzqgczjf=rs.getDouble("zqgczjf");
		ALLzhgczjf=rs.getDouble("zhgczjf");

		ALLzqsuijin=rs.getDouble("zqsuijin");
		ALLsuijin=rs.getDouble("suijin");

		ALLzqguanlif=rs.getDouble("zqguanlif");
		ALLguanlif=rs.getDouble("guanlif");

		ALLzqqtsf=rs.getDouble("zqqtsf");
		ALLzhqtsf=rs.getDouble("zhqtsf");

		ALLzqwjrqyexm=rs.getDouble("zqwjrqyexm");
		ALLzhwjrqyexm=rs.getDouble("zhwjrqyexm");

		ALLzqsjf=rs.getDouble("zqsjf");
		ALLsjf=rs.getDouble("sjf");


		ALLzqljzjx=rs.getDouble("zqljzjx");
		ALLzhljzjx=rs.getDouble("zhljzjx");

		ALLzjxje=rs.getDouble("zjxje");
		ALLzhzjxje=rs.getDouble("zhzjxje");

		ALLzqzjxsuijin=rs.getDouble("zqzjxsuijin");
		ALLzjxsuijin=rs.getDouble("zjxsuijin");

		ALLzqzjxguanlif=rs.getDouble("zqzjxguanlif");
		ALLzjxguanlif=rs.getDouble("zjxguanlif");

		ALLzqqtsfzjx=rs.getDouble("zqqtsfzjx");
		ALLzhqtsfzjx=rs.getDouble("zhqtsfzjx");

		ALLzqwjrzjx=rs.getDouble("zqwjrzjx");
		ALLzhwjrzjx=rs.getDouble("zhwjrzjx");

		ALLzqzjxsjf=rs.getDouble("zqzjxsjf");
		ALLzhzjxsjf=rs.getDouble("zhzjxsjf");

		ALLfwmj=rs.getLong("fwmj");
	}
	rs.close();
	ps.close();


	ls_sql=" SELECT fgs,dwbh,dm,sum(qys) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zqgczjf) zqgczjf,sum(zhgczjf) zhgczjf,sum(NVL(zqsuijin,0)) zqsuijin,sum(NVL(suijin,0)) suijin,sum(NVL(zqguanlif,0)) zqguanlif,sum(NVL(guanlif,0)) guanlif  ,sum(NVL(zqqtsf,0)) zqqtsf,sum(NVL(zhqtsf,0)) zhqtsf ,sum(NVL(zqwjrqyexm,0)) zqwjrqyexm,sum(NVL(zhwjrqyexm,0)) zhwjrqyexm ,sum(NVL(zqsjf,0)) zqsjf,sum(NVL(sjf,0)) sjf    ,sum(NVL(zqljzjx,0)) zqljzjx,sum(NVL(zhljzjx,0)) zhljzjx,sum(NVL(zjxje,0)) zjxje,sum(NVL(zhzjxje,0)) zhzjxje,sum(NVL(zqzjxsuijin,0)) zqzjxsuijin,sum(NVL(zjxsuijin,0)) zjxsuijin,sum(NVL(zqzjxguanlif,0)) zqzjxguanlif,sum(NVL(zjxguanlif,0)) zjxguanlif,sum(NVL(zqqtsfzjx,0)) zqqtsfzjx,sum(NVL(zhqtsfzjx,0)) zhqtsfzjx,sum(NVL(zqwjrzjx,0)) zqwjrzjx,sum(NVL(zhwjrzjx,0)) zhwjrzjx,sum(NVL(zqzjxsjf,0)) zqzjxsjf,sum(NVL(zhzjxsjf,0)) zhzjxsjf ,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT b.dwmc fgs,crm_khxx.dwbh dwbh,a.dwmc dm,count(*) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zqgczjf) zqgczjf,sum(zhgczjf) zhgczjf,sum(NVL(zqsuijin,0)) zqsuijin,sum(NVL(suijin,0)) suijin,sum(NVL(zqguanlif,0)) zqguanlif,sum(NVL(guanlif,0)) guanlif  ,sum(NVL(zqqtsf,0)) zqqtsf,sum(NVL(zhqtsf,0)) zhqtsf ,sum(NVL(zqwjrqyexm,0)) zqwjrqyexm,sum(NVL(zhwjrqyexm,0)) zhwjrqyexm ,sum(NVL(zqsjf,0)) zqsjf,sum(NVL(sjf,0)) sjf    ,sum(NVL(zqljzjx,0)) zqljzjx,sum(NVL(zhljzjx,0)) zhljzjx,sum(NVL(zjxje,0)) zjxje,sum(NVL(zhzjxje,0)) zhzjxje,sum(NVL(zqzjxsuijin,0)) zqzjxsuijin,sum(NVL(zjxsuijin,0)) zjxsuijin,sum(NVL(zqzjxguanlif,0)) zqzjxguanlif,sum(NVL(zjxguanlif,0)) zjxguanlif,sum(NVL(zqqtsfzjx,0)) zqqtsfzjx,sum(NVL(zhqtsfzjx,0)) zhqtsfzjx,sum(NVL(zqwjrzjx,0)) zqwjrzjx,sum(NVL(zhwjrzjx,0)) zhwjrzjx,sum(NVL(zqzjxsjf,0)) zqzjxsjf,sum(NVL(zhzjxsjf,0)) zhzjxsjf ,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.fgsbh=b.dwbh(+)";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=" and b.sfjms='"+sfjms+"'";//N：否；Y：是
	ls_sql+=wheresql;
	ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT b.dwmc fgs,a.dwbh dwbh,a.dwmc dm,0 qys,0 wdzgce,0 qye,0 zqgczjf,0 zhgczjf,0 zqsuijin,0 suijin,0 zqguanlif,0 guanlif  ,0 zqqtsf,0 zhqtsf ,0 zqwjrqyexm,0 zhwjrqyexm ,0 zqsjf,0 sjf    ,0 zqljzjx,0 zhljzjx,0 zjxje,0 zhzjxje,0 zqzjxsuijin,0 zjxsuijin,0 zqzjxguanlif,0 zjxguanlif,0 zqqtsfzjx,0 zhqtsfzjx,0 zqwjrzjx,0 zhwjrzjx,0 zqzjxsjf,0 zhzjxsjf ,0 fwmj";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
	ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N'";
	ls_sql+=" and b.sfjms='"+sfjms+"'";//N：否；Y：是
	ls_sql+=wheresql1;
	ls_sql+=" group by b.dwmc,a.dwbh,a.dwmc ";
	
	ls_sql+=" )";
	ls_sql+=" group by fgs,dwbh,dm";
	ls_sql+=" order by qye desc,fgs,dwbh";

//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgs=rs.getString("fgs");
		getdwbh=rs.getString("dwbh");
		dm=rs.getString("dm");

		qys=rs.getInt("qys");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");

		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");

		zqsuijin=rs.getDouble("zqsuijin");
		suijin=rs.getDouble("suijin");

		zqguanlif=rs.getDouble("zqguanlif");
		guanlif=rs.getDouble("guanlif");

		zqqtsf=rs.getDouble("zqqtsf");
		zhqtsf=rs.getDouble("zhqtsf");

		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");

		zqsjf=rs.getDouble("zqsjf");
		sjf=rs.getDouble("sjf");


		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");

		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");

		zqzjxsuijin=rs.getDouble("zqzjxsuijin");
		zjxsuijin=rs.getDouble("zjxsuijin");

		zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		zjxguanlif=rs.getDouble("zjxguanlif");

		zqqtsfzjx=rs.getDouble("zqqtsfzjx");
		zhqtsfzjx=rs.getDouble("zhqtsfzjx");

		zqwjrzjx=rs.getDouble("zqwjrzjx");
		zhwjrzjx=rs.getDouble("zhwjrzjx");

		zqzjxsjf=rs.getDouble("zqzjxsjf");
		zhzjxsjf=rs.getDouble("zhzjxsjf");

		fwmj=rs.getLong("fwmj");

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
			if (!kdsj.equals(""))
			{
				getdwmc=getdwmc+"(开店:"+kdsj+")";
			}
		}
	
		ls_sql=" SELECT count(*) qys";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and jzkscsj is not null and cwjzkscsj is null";//首次付家装款时间
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gsskqys=rs1.getInt("qys");
		}
		rs1.close();
		ps1.close();

		ALLgsskqys+=gsskqys;
	
		ls_sql=" SELECT count(*) qys";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and cwjzkscsj is not null";//财务首次收家装款时间
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cwskqys=rs1.getInt("qys");
		}
		rs1.close();
		ps1.close();
		
		ALLcwskqys+=cwskqys;
	
		//96：管理费;54：税金;11：家装款
		ls_sql=" SELECT sum(fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and cw_khfkjl.scbz='N' ";
		ls_sql+=" and cw_khfkjl.fklxbm='11' ";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jzssk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ALLjzssk+=jzssk;
	
		//96：管理费;54：税金;11：家装款
		ls_sql=" SELECT sum(fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and cw_khfkjl.scbz='N' ";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khssk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ALLkhssk+=khssk;
		
	
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


		row++;

		if (getfgs.equals(oldfgs))
		{
			getfgs="同上";;
		}
		else{
			oldfgs=getfgs;
		}



		%>
		<tr align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=row%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=getfgs%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
			<A HREF="ViewDmcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank">
			<%=getdwmc%>
			</A>
			</td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qys%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)wdzgce)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.round(zkl,1)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)qye)%></td>

			
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=gsskqys%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cwskqys%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)jzssk)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)khssk)%></td>


			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)zqljzjx)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)zhljzjx)%></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(cf.round(wdzgce+zqljzjx,0))%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(cf.round(qye+zhljzjx,0))%></td>
			
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(pjde)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(pmjj)%></td>


			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)zqgczjf)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)zhgczjf)%></td>
			
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zqsuijin)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(suijin)%></td>
			
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zqguanlif)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(guanlif)%></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zqqtsf)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zhqtsf)%></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zqwjrqyexm)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zhwjrqyexm)%></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zqsjf)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(sjf)%></td>

			

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)zjxje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)zhzjxje)%></td>
			
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zqzjxsuijin)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zjxsuijin)%></td>
			
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zqzjxguanlif)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zjxguanlif)%></td>
			
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zqqtsfzjx)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zhqtsfzjx)%></td>
			
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zqwjrzjx)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zhwjrzjx)%></td>
			
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zqzjxsjf)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zhzjxsjf)%></td>
			
		</tr>
		<%	
	}
	rs.close();
	ps.close();

	if (ALLqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(ALLqye/ALLqys);
	}
	if (ALLfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(ALLqye/ALLfwmj);
	}

	if (ALLwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=ALLqye*10/ALLwdzgce;
	}
%>

<tr align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">&nbsp;</td>
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><font color="#ff0000">总计</td>
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">&nbsp;</td>
	
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ALLqys%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLwdzgce)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.round(zkl,1)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLqye)%></td>

	
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ALLgsskqys%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ALLcwskqys%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLjzssk)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLkhssk)%></td>


	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLzqljzjx)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLzhljzjx)%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(cf.round(ALLwdzgce+ALLzqljzjx,0))%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(cf.round(ALLqye+ALLzhljzjx,0))%></td>
	
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(pjde)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(pmjj)%></td>


	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLzqgczjf)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLzhgczjf)%></td>
	
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzqsuijin)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLsuijin)%></td>
	
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzqguanlif)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLguanlif)%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzqqtsf)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzhqtsf)%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzqwjrqyexm)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzhwjrqyexm)%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzqsjf)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLsjf)%></td>

	

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLzjxje)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLzhzjxje)%></td>
	
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzqzjxsuijin)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzjxsuijin)%></td>
	
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzqzjxguanlif)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzjxguanlif)%></td>
	
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzqqtsfzjx)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzhqtsfzjx)%></td>
	
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzqwjrzjx)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzhwjrzjx)%></td>
	
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzqzjxsjf)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzhzjxsjf)%></td>
</tr>

	
</table>

</DIV>

</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
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

<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 