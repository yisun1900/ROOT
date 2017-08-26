<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {	color: #FF0000;
	font-weight: bold;
}
.STYLE3 {color: #0000FF}
.STYLE4 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String bxkh="";
String jjwjbz="";
String gcjdbm="";
String fgsbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;
int fwmj=0;
String hyh=null;
String cxhdbm=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sjkgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;
String zjxxh="";
String khjsbz="";
String hxmc="";
String bjjbmc="";

double sjhtje=0;
double sssjf=0;

double wdzgce=0;
double qye=0;



double zqguanlif=0;
double guanlif=0;
double zqsuijin=0;
double suijin=0;
double glfbfb=0;

double zhzjxje=0;
double zjxsuijin=0;
double zjxguanlif=0;

double cwsfke=0;
double yjzck=0;
double fxjzck=0;
double sfke=0;
double dj=0;

double jsze=0;

double yjwk=0;
double yhje=0;
double fqbl=0;
double fqje=0;
double shfqje=0;


double zqljzjx=0;
double zhljzjx=0;
double zqhj=0;
double zhhj=0;

double djfxje=0;
double yhze=0;
double dyq=0;
double pck=0;
double khbjk=0;


double zqgczjf=0;
double zhgczjf=0;
double zkl=0;

double zjxje=0;
double zqzjxguanlif=0;
double zqzjxsuijin=0;
double zqqtsf=0;
double suijinbfb=0;

double zqqtsfzjx=0;
double zqwjrqyexm=0;
double zqwjrzjx=0;

double zqsjf=0;
double zqsjfzjx=0;
double zqhtzcbj=0;


double zcddjezq=0;
double zcddjezh=0;

double dgzcjezq=0;
double dgzcyh=0;
double zcjsje=0;
double zctcze=0;

String fxgck="";//订金折现
double fxdj=0;
String qtsfsm="";
String wjrqyexmsm="";
String zklmc="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select bxkh,khjsbz,cxhdbm,hyh,fwmj,zjxxh,gdjsjd,khjl,gj,dd,fgsbh,khxm,lxfs,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,wdzgce,qye,zqguanlif,guanlif,glfbfb,zqsuijin,suijin,zhzjxje,zjxsuijin,zjxguanlif,cwsfke,sfke";
	ls_sql+=" ,hxmc,bjjbmc,zqljzjx,zhljzjx,qtsfsm,wjrqyexmsm,crm_khxx.jjwjbz,crm_khxx.gcjdbm ";

	ls_sql+=" ,zqgczjf,zhgczjf,zjxje,zqzjxguanlif,zqzjxsuijin,zqqtsf,suijinbfb,zqqtsfzjx,zqwjrqyexm,zqwjrzjx,zqsjf,zqsjfzjx,zqhtzcbj";
	
	ls_sql+=" from  crm_khxx,sq_dwxx,dm_hxbm,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ls_sql+=" and  crm_khxx.hxbm=dm_hxbm.hxbm(+)";
	ls_sql+=" and  crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bxkh=cf.fillNull(rs.getString("bxkh"));
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		qtsfsm=cf.fillNull(rs.getString("qtsfsm"));
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));
		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		zjxje=rs.getDouble("zjxje");
		zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		zqzjxsuijin=rs.getDouble("zqzjxsuijin");
		zqqtsf=rs.getDouble("zqqtsf");
		suijinbfb=rs.getDouble("suijinbfb");
		zqqtsfzjx=rs.getDouble("zqqtsfzjx");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zqwjrzjx=rs.getDouble("zqwjrzjx");
		zqsjf=rs.getDouble("zqsjf");
		zqsjfzjx=rs.getDouble("zqsjfzjx");
		zqhtzcbj=rs.getDouble("zqhtzcbj");
	
		
		
		
		hxmc=cf.fillNull(rs.getString("hxmc"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));

		khjsbz=cf.fillNull(rs.getString("khjsbz"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");

		zqguanlif=rs.getDouble("zqguanlif");
		guanlif=rs.getDouble("guanlif");
		glfbfb=rs.getDouble("glfbfb");
		zqsuijin=rs.getDouble("zqsuijin");
		suijin=rs.getDouble("suijin");
		zhzjxje=rs.getDouble("zhzjxje");
		zjxsuijin=rs.getDouble("zjxsuijin");
		zjxguanlif=rs.getDouble("zjxguanlif");
		cwsfke=rs.getDouble("cwsfke");
		sfke=rs.getDouble("sfke");

		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		hyh=cf.fillNull(rs.getString("hyh"));
		fwmj=rs.getInt("fwmj");
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (!khjsbz.equals("N"))
	{
		out.println("错误！客户已结算");
		return;
	}

	if (!gcjdbm.equals("5"))//1：未开工；2：工程开工；6：隐蔽工程完成；3：中期验收；4：工程完工；5：工程完结；7：合同异常终止
	{
		out.println("错误！客户工程未完结");
//		return;
	}

	if (!jjwjbz.equals("Y"))//N：未完结；Y：完结
	{
		out.println("错误！客户家居未完结");
//		return;
	}


	String zklx="";
	double zdzk=0;
	double gcfqdzk=0;
	ls_sql="SELECT zklx,zdzk,gcfqdzk";
	ls_sql+=" FROM crm_khzk  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
		zdzk=rs.getDouble("zdzk");
		gcfqdzk=rs.getDouble("gcfqdzk");
	}
	rs.close();
	ps.close();
	
	if (zklx.equals("1"))//1：整单打折；2：单项打折；3：部分费用打折
	{
		zkl=zdzk;

		zklmc="整单折扣:"+zkl;
	}
	else {
		zkl=gcfqdzk;
		zklmc="工程费折扣:"+zkl;
	}

	//订金折现
	ls_sql="SELECT fxgck";
	ls_sql+=" FROM jc_cxhd  ";
	ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxgck=cf.fillNull(rs.getString("fxgck"));//多倍返现工程款
	}
	rs.close();
	ps.close();

	double zdfxdj=0;//最大返现订金
	ls_sql="select jc_cxhddjfxbz.zdfxdj";
	ls_sql+=" from jc_cxhd,jc_cxhddjfxbz";
	ls_sql+=" where jc_cxhd.cxhdbm=jc_cxhddjfxbz.cxhdbm and jc_cxhd.fgsbh='"+fgsbh+"'";
	ls_sql+=" and jc_cxhd.hdlx in('1','2') and jc_cxhd.cxhdmc='"+cxhdbm+"'";
	ls_sql+=" and qd<"+wdzgce+" and "+wdzgce+"<=zd ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdfxdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//客户交返现订金
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl ";
	ls_sql+=" where cw_khfkjl.fkje!=0";
	ls_sql+=" and  cw_khfkjl.scbz='N'";
	ls_sql+=" and  cw_khfkjl.fklxbm in('52')";//51：促销活动订金；52：量房订金；53：设计费
	ls_sql+=" and khbh ='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	if (fxdj>zdfxdj)
	{
		fxdj=zdfxdj;
	}
	

	//合同设计费
	ls_sql="SELECT sjhtje";
	ls_sql+=" FROM crm_zxkhxx  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjhtje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//实收设计费
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm='53'";//53：设计费
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sssjf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//定金转家装款
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm='11'";//11：家装款
	ls_sql+=" and cw_khfkjl.zffs='31'";//31：转换款项
	ls_sql+=" and cw_khfkjl.zckx in('52','51')";//51：促销活动订金,52：量房订金
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	ls_sql="SELECT djjje,zjxdjjje,djjbfb,djfxje";
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fqje=rs.getDouble("djjje");
		fqbl=rs.getDouble("djjbfb");
		shfqje=rs.getDouble("zjxdjjje");
		djfxje=rs.getDouble("djfxje");
	}
	rs.close();
	ps.close();

	//工程合计－折前
	zqhj=cf.round(wdzgce+zqljzjx,2);
	//工程合计－折后
	zhhj=cf.round(qye+zhljzjx,2);

	//结算施工总额＝折后工程合计
	jsze=zqhj;

	yjwk=jsze-cwsfke;//应交装修尾款=结算施工总额-客户已交装修款
	yjwk=cf.round(yjwk,0);

	//折扣优惠
	yhje=(zqhj-zhhj)-djfxje;
	yhje=cf.round(yhje,2);

	//优惠合计金额=折扣优惠+订金折现优惠＋返券优惠＋抵用券
	yhze=yhje+djfxje-shfqje;
	yhze=cf.round(yhze,0);


	//现金交主材款	
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62')";//62：主材预付款
	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.zffs not in('16','31')";//16：纸质材料券,31：转换款项
	ls_sql+=" OR ";
	ls_sql+=" (cw_khfkjl.zffs in('31') and cw_khfkjl.zckx not in('67','55'))";//67：增值储值卡,55：绿色电子礼券卡
	ls_sql+=" ) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjzck=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl,jc_zcdd  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' and cw_khfkjl.ddbh=jc_zcdd.ddbh";
	ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
//	ls_sql+=" and jc_zcdd.ddlx  in('1','3','4','6','7','8','9','B','C')";
	//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材

	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.zffs not in('16','31')";//16：纸质材料券,31：转换款项
	ls_sql+=" OR ";
	ls_sql+=" (cw_khfkjl.zffs in('31') and cw_khfkjl.zckx not in('67','55'))";//67：增值储值卡,55：绿色电子礼券卡
	ls_sql+=" ) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	yjzck=cf.round(yjzck,2);

	//非现金交主材款	
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62')";//23:主材
	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.zffs in('16')";//16：纸质材料券,31：转换款项
	ls_sql+=" OR ";
	ls_sql+=" (cw_khfkjl.zffs in('31') and cw_khfkjl.zckx in('67','55'))";//67：增值储值卡,55：绿色电子礼券卡
	ls_sql+=" ) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxjzck=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('67')";//67：增值储值卡
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('55')";//55：绿色电子礼券卡
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl,jc_zcdd  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' and cw_khfkjl.ddbh=jc_zcdd.ddbh";
	ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
//	ls_sql+=" and jc_zcdd.ddlx  in('1','3','4','6','7','8','9','B','C')";
	//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材
	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.zffs in('16')";//16：纸质材料券,31：转换款项
	ls_sql+=" OR ";
	ls_sql+=" (cw_khfkjl.zffs in('31') and cw_khfkjl.zckx in('67','55'))";//67：增值储值卡,55：绿色电子礼券卡
	ls_sql+=" ) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	fxjzck=cf.round(fxjzck,2);


	//主材套餐
	ls_sql="SELECT sum(wdzje+zqzjhze)";
	ls_sql+=" FROM jc_zcdd  ";
	ls_sql+=" where (jc_zcdd.khbh='"+khbh+"')";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
	ls_sql+=" and ddlx in('6','7','8','B','C')";//1：代销品、B:顶配独立收费、C:选配主材；3：补录合同；4：有库存订单；5：套餐分解订单；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：tcmc代购主材
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zctcze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//机电代销
	double jddxhtzq=0;
	double jddxzjxzq=0;
	double jddxhtzh=0;
	double jddxzjxzh=0;
	ls_sql="SELECT sum(wdzje),sum(hkze),sum(zqzjhze),sum(zjhze)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09：合同已完成
	ls_sql+=" and ddlx in('1','3','4')";//是否计入合同  Y：计入；N：不计入
	//1：代销品；3：补录合同；4：有库存订单；5：套餐分解订单；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：tcmc代购主材
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jddxhtzq=rs.getDouble(1);
		jddxhtzh=rs.getDouble(2);
		jddxzjxzq=rs.getDouble(3);
		jddxzjxzh=rs.getDouble(4);
	}
	rs.close();
	ps.close();

	zcddjezq=cf.round(jddxhtzq+jddxzjxzq,2);
	zcddjezh=cf.round(jddxhtzh+jddxzjxzh,2);


	//代购主材
	ls_sql="SELECT sum(wdzje+zqzjhze),sum((wdzje+zqzjhze)*khfdbl/100)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09：合同已完成
	ls_sql+=" and ddlx='9'";//1：代销品；3：补录合同；4：有库存订单；5：套餐分解订单；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dgzcjezq=rs.getDouble(1);
		dgzcyh=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	dgzcyh+=fxjzck;
	dgzcyh=cf.round(dgzcyh,2);

	//主材结算额
	zcjsje=zcddjezh+zctcze+dgzcjezq-dgzcyh-yjzck;
	zcjsje=cf.round(zcjsje,2);

	//客户补交款
	khbjk=(sjhtje-sssjf)+(yjwk-yhze)+zcjsje-pck;
	khbjk=cf.round(khbjk,0);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jrkhjs.jsp" name="insertform" target="_blank">
<div align="center">个性化客户结算(<font color="#0000FF">客户编号:<%=khbh%></font>)</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">客户姓名</font></td>
    <td width="32%"><%=khxm%></td>
    <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">联系方式</font></td>
    <td width="32%"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td><%=fwdz%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">面积</font></td>
    <td><%=fwmj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">保修卡号</td>
    <td><input name="bxkh" type="text" size="20" maxlength="20" value="<%=bxkh%>"></td>
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">户型</font></td>
    <td><%=hxmc%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">报价级别</font></td>
    <td><%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">合同号</font></td>
    <td><%=hth%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">会员卡号</font></td>
    <td><%=hyh%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">开工日期</font></td>
    <td><%=kgrq%></td>
  </tr>
</table>
  
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center"><span class="STYLE4">设计费情况</span></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">合同设计费</font></td> 
  <td width="32%">
	<input type="text" name="htsjf" value="<%=sjhtje%>" size="20" maxlength="17" readonly></td>
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">实收设计费</font></td> 
  <td width="32%">
	<input type="text" name="sssjf" value="<%=sssjf%>" size="20" maxlength="17" readonly></td>
</tr>
</table>
  
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center"><span class="STYLE4">工程费情况</span></td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td>&nbsp;</td>
  <td><strong>合同</strong></td>
  <td><strong>增减项</strong></td>
  <td><strong>合计</strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>工程直接费</strong></td>
  <td width="32%" align="center"><%=zqgczjf%></td>
  <td align="center" width="25%"><%=zjxje%></td>
  <td width="25%" align="center"><%=cf.formatDouble(zqgczjf+zjxje)%></td>
</tr>
<%
if (zqqtsf+zqqtsfzjx+zqwjrqyexm+zqwjrzjx!=0)
{
	%>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><strong><%=qtsfsm%>、<%=wjrqyexmsm%></strong></td>
	  <td align="center"><%=cf.round(zqqtsf+zqwjrqyexm,2)%></td>
	  <td align="center"><%=cf.round(zqqtsfzjx+zqwjrzjx,2)%></td>
	  <td align="center"><%=cf.round(zqqtsf+zqqtsfzjx+zqwjrqyexm+zqwjrzjx,2)%></td>
	</tr>
	<%
}
%>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>管理费(<%=glfbfb%>%)</strong></td>
  <td width="32%" align="center"><%=zqguanlif%></td>
  <td align="center" width="25%"><%=zqzjxguanlif%></td>
  <td width="25%" align="center"><%=cf.formatDouble(zqguanlif+zqzjxguanlif)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>税金(<%=suijinbfb%>%)</strong></td>
  <td align="center"><%=zqsuijin%></td>
  <td align="center"><%=zqzjxsuijin%></td>
  <td align="center"><%=cf.formatDouble(zqsuijin+zqzjxsuijin)%></td>
</tr>




<tr bgcolor="#FFFFFF">
  <td align="right"><strong>
    小 计</strong></td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce)%>
    <input name="button7" type="button" onClick="window.open('/dhzx/sjszxone/dybj.jsp?khbh=<%=khbh%>')" value="合同报价">
  </strong></td>
  <td align="center"><strong><%=cf.formatDouble(zqljzjx)%>
    <input name="button8" type="button" onClick="window.open('/khxx/ViewZjxxx.jsp?khbh=<%=khbh%>')" value="增减项">
  </strong></td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce+zqljzjx)%>
    <input name="button9" type="button" onClick=window.open("/khxx/ViewZxbj.jsp?khbh=<%=khbh%>") value="合计金额">
  </strong></td>
</tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">客户已交装修款</font></td>
  <td width="32%"><input type="text" name="yjzxk" value="<%=cwsfke%>" size="20" maxlength="17" readonly></td>
  <td colspan="2" bgcolor="#FFFFFF">其中定金转家装款:<%=dj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">应交装修尾款</font></td>
  <td><input type="text" name="yjwk" value="<%=yjwk%>" size="20" maxlength="17" readonly></td>
  <td colspan="2"><strong>
    <input name="button2" type="button" onclick=window.open("/cwgl/jrkhjs/Cw_khfkjlJzCxList.jsp?khbh=<%=khbh%>") value="付款明细">
  </strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">优惠情况</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">促销活动内容</font></td>
  <td colspan="3"><%=cxhdbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">返券优惠</font></td>
  <td><%=fqje%>  </td>
  <td colspan="2">返券比例:<%=fqbl%>％ </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">折扣优惠</font></td>
  <td>
    <input type="text" name="yhje" value="<%=yhje%>" size="20" maxlength="17" readonly>  </td>
  <td colspan="2"><%=zklmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">订金折现优惠</font></td>
  <td>
    <input type="text" name="djfxje" value="<%=djfxje%>" size="20" maxlength="17" readonly>  </td>
  <td colspan="2"><%=fxgck%>倍订金折现，客户交订金:<%=fxdj%>，订金折现优惠=<%=fxdj%>*(<%=fxgck%>-1)倍*<%=zkl%>折</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>抵用券</td>
  <td><input type="text" name="dyq" value="<%=dyq%>" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td colspan="2">    人工录入</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>收回减项返券金额</td>
  <td><input type="text" name="shfqje" value="<%=shfqje%>" size="20" maxlength="17" onChange="calValue(insertform)">  </td>
  <td colspan="2">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000FF">优惠合计金额</font></td>
  <td><input type="text" name="yhze" value="<%=yhze%>" size="20" maxlength="17" readonly>  </td>
  <td colspan="2">优惠金额＝折扣优惠+订金折现优惠＋抵用券-收回减项返券金额</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">主材情况</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000FF">①现金交主材款</font></td>
  <td><input type="text" name="yjzck" value="<%=yjzck%>" size="20" maxlength="17" readonly>    <strong>
    <input type="button" onclick=window.open("/cwgl/jrkhjs/Cw_khfkjlZcCxList.jsp?khbh=<%=khbh%>") value="付款明细">
    </strong></td>
  <td align="right"><font color="#0000FF">非现金交主材款</font></td>
  <td><input type="text" name="fxjzck" value="<%=fxjzck%>" size="20" maxlength="17" readonly>
    <strong>
    <input type="button" onclick=window.open("/cwgl/jrkhjs/Cw_khfkjlFxjZcCxList.jsp?khbh=<%=khbh%>") value="付款明细">
    </strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000FF">②机电代销</font></td>
  <td><font color="#0000FF">
    <input name="zcddjezq" type="text" value="<%=zcddjezh%>" size="20" maxlength="17" readonly>
    <strong>
    <input name="button32" type="button" onClick=window.open("/cwgl/jrkhjs/Jc_zcddJddxCxList.jsp?khbh=<%=khbh%>") value="机电代销">
    </strong></font></td>
  <td align="right"><font color="#0000FF">③主材套餐</font></td>
  <td><font color="#0000FF">
    <input name="zctcze" type="text" value="<%=zctcze%>" size="20" maxlength="17" readonly>
    <strong>
    <input name="button5" type="button" onclick=window.open("/cwgl/jrkhjs/Jc_zcddZctcCxList.jsp?khbh=<%=khbh%>") value="主材套餐">
    </strong></font></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"><font color="#0000FF">④</font>代购主材</span></td>
  <td><input name="dgzcjezq" type="text"  value="<%=dgzcjezq%>" size="20" maxlength="17" readonly>
    <strong>
    <input name="button4" type="button" onClick=window.open("/cwgl/jrkhjs/Jc_zcddDgzcCxList.jsp?khbh=<%=khbh%>") value="代购主材">
    </strong></td>
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"><font color="#0000FF">⑤</font>代购主材优惠</span></td>
  <td bgcolor="#FFFFFF"><font color="#0000FF">
    <input name="dgzcyh" type="text" value="<%=dgzcyh%>" size="20" maxlength="17" readonly>
  </font></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF" class="STYLE3">主材结算额</td>
  <td colspan="3"><span class="STYLE2">
    <input name="zcjsje" type="text"  value="<%=zcjsje%>" size="20" maxlength="17" readonly>
    <font color="#990033"><strong>主材结算额＝②＋③＋（④－⑤）－①</strong></font></span></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>客户赔偿款</td>
  <td><input type="text" name="pck" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE3">客户补交款</span></td>
  <td><input type="text" name="khbjk" value="<%=khbjk%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">结算人</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">结算时间</font></td>
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">录入部门</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea>  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="khbh" value="<%=khbh%>">
	  <input type="hidden" name="wdzgce" value="<%=wdzgce%>">
	  <input type="hidden" name="qye" value="<%=qye%>">
	  <input type="hidden" name="zqljzjx" value="<%=zqljzjx%>">
	  <input type="hidden" name="zhljzjx" value="<%=zhljzjx%>">
	  <input type="hidden" name="zqhj" value="<%=zqhj%>">
	  <input type="hidden" name="zhhj" value="<%=zhhj%>">

	  <input type="hidden" name="jsze" value="<%=jsze%>">
      <input type="hidden" name="dj" value="<%=dj%>"  >

      <input type="hidden" name="fqje" value="<%=fqje%>">
	  <input type="hidden" name="fqbl" value="<%=fqbl%>">

	  <input type="hidden" name="zcddyh" value="0">

	  <input type="button"  value="存盘" onClick="f_do(insertform)">
	  <input name="button6" type="button" onClick="window.open('/cwgl/jrkhjs/ViewGxhCw_jrkhjs.jsp?khbh=<%=khbh%>')"  value="打印">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	//优惠金额
	var yhze=FormName.yhje.value*1.0+FormName.djfxje.value*1.0+FormName.dyq.value*1.0-FormName.shfqje.value*1.0;
	yhze=round(yhze,0);
	FormName.yhze.value=yhze;

	//客户补交款
	var khbjk=(FormName.htsjf.value*1.0-FormName.sssjf.value*1.0)+(FormName.yjwk.value*1.0-FormName.yhze.value*1.0)+FormName.zcjsje.value*1.0-FormName.pck.value*1.0;
	khbjk=round(khbjk,0);
	FormName.khbjk.value=khbjk;
}

function f_do(FormName)//参数FormName:Form的名称
{
	calValue(FormName);

	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.htsjf)=="") {
		alert("请输入[合同设计费]！");
		FormName.htsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.htsjf, "合同设计费"))) {
		return false;
	}
	if(	javaTrim(FormName.sssjf)=="") {
		alert("请输入[实收设计费]！");
		FormName.sssjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sssjf, "实收设计费"))) {
		return false;
	}
	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[签约总额－折前]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "签约总额－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[签约总额－折后]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "签约总额－折后"))) {
		return false;
	}
	if(	javaTrim(FormName.zqljzjx)=="") {
		alert("请输入[增减项总额－折前]！");
		FormName.zqljzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.zqljzjx, "增减项总额－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhljzjx)=="") {
		alert("请输入[增减项总额－折后]！");
		FormName.zhljzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.zhljzjx, "增减项总额－折后"))) {
		return false;
	}
	if(	javaTrim(FormName.zqhj)=="") {
		alert("请输入[工程合计－折前]！");
		FormName.zqhj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqhj, "工程合计－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhhj)=="") {
		alert("请输入[工程合计－折后]！");
		FormName.zhhj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhhj, "工程合计－折后"))) {
		return false;
	}
	if(	javaTrim(FormName.jsze)=="") {
		alert("请输入[结算施工总额]！");
		FormName.jsze.focus();
		return false;
	}
	if(!(isFloat(FormName.jsze, "结算施工总额"))) {
		return false;
	}
	if(	javaTrim(FormName.yjzxk)=="") {
		alert("请输入[已交装修款]！");
		FormName.yjzxk.focus();
		return false;
	}
	if(!(isFloat(FormName.yjzxk, "已交装修款"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[定金转装修款]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "定金转装修款"))) {
		return false;
	}
	if(	javaTrim(FormName.yjwk)=="") {
		alert("请输入[应交尾款]！");
		FormName.yjwk.focus();
		return false;
	}
	if(!(isFloat(FormName.yjwk, "应交尾款"))) {
		return false;
	}
	if(	javaTrim(FormName.yhje)=="") {
		alert("请输入[折扣优惠]！");
		FormName.yhje.focus();
		return false;
	}
	if(!(isFloat(FormName.yhje, "折扣优惠"))) {
		return false;
	}
	if(	javaTrim(FormName.fqbl)=="") {
		alert("请输入[返券比例]！");
		FormName.fqbl.focus();
		return false;
	}
	if(!(isFloat(FormName.fqbl, "返券比例"))) {
		return false;
	}
	if(	javaTrim(FormName.fqje)=="") {
		alert("请输入[返券优惠]！");
		FormName.fqje.focus();
		return false;
	}
	if(!(isFloat(FormName.fqje, "返券优惠"))) {
		return false;
	}
	if(	javaTrim(FormName.djfxje)=="") {
		alert("请输入[订金折现优惠]！");
		FormName.djfxje.focus();
		return false;
	}
	if(!(isFloat(FormName.djfxje, "订金折现优惠"))) {
		return false;
	}
	if(	javaTrim(FormName.dyq)=="") {
		alert("请输入[抵用券]！");
		FormName.dyq.focus();
		return false;
	}
	if(!(isFloat(FormName.dyq, "抵用券"))) {
		return false;
	}
	if(	javaTrim(FormName.yhze)=="") {
		alert("请输入[优惠总额]！");
		FormName.yhze.focus();
		return false;
	}
	if(!(isFloat(FormName.yhze, "优惠总额"))) {
		return false;
	}
	if(	javaTrim(FormName.shfqje)=="") {
		alert("请输入[收回返券金额]！");
		FormName.shfqje.focus();
		return false;
	}
	if(!(isFloat(FormName.shfqje, "收回返券金额"))) {
		return false;
	}
	if(	javaTrim(FormName.yjzck)=="") {
		alert("请输入[现金交主材款]！");
		FormName.yjzck.focus();
		return false;
	}
	if(!(isFloat(FormName.yjzck, "现金交主材款"))) {
		return false;
	}
	if(	javaTrim(FormName.fxjzck)=="") {
		alert("请输入[非现金交主材款]！");
		FormName.fxjzck.focus();
		return false;
	}
	if(!(isFloat(FormName.fxjzck, "非现金交主材款"))) {
		return false;
	}
	if(	javaTrim(FormName.zctcze)=="") {
		alert("请输入[主材套餐]！");
		FormName.zctcze.focus();
		return false;
	}
	if(!(isFloat(FormName.zctcze, "主材套餐"))) {
		return false;
	}
	if(	javaTrim(FormName.zcddjezq)=="") {
		alert("请输入[机电代销]！");
		FormName.zcddjezq.focus();
		return false;
	}
	if(!(isFloat(FormName.zcddjezq, "机电代销"))) {
		return false;
	}
	if(	javaTrim(FormName.zcddyh)=="") {
		alert("请输入[机电代销优惠]！");
		FormName.zcddyh.focus();
		return false;
	}
	if(!(isFloat(FormName.zcddyh, "机电代销优惠"))) {
		return false;
	}

	if(	javaTrim(FormName.dgzcjezq)=="") {
		alert("请输入[代购主材]！");
		FormName.dgzcjezq.focus();
		return false;
	}
	if(!(isFloat(FormName.dgzcjezq, "代购主材"))) {
		return false;
	}

	if(	javaTrim(FormName.dgzcyh)=="") {
		alert("请输入[代购主材优惠]！");
		FormName.dgzcyh.focus();
		return false;
	}
	if(!(isFloat(FormName.dgzcyh, "代购主材优惠"))) {
		return false;
	}
	if(	javaTrim(FormName.zcjsje)=="") {
		alert("请输入[主材结算额]！");
		FormName.zcjsje.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjsje, "主材结算额"))) {
		return false;
	}
	if(	javaTrim(FormName.pck)=="") {
		alert("请输入[赔偿款延期费]！");
		FormName.pck.focus();
		return false;
	}
	if(!(isFloat(FormName.pck, "赔偿款延期费"))) {
		return false;
	}
	if(	javaTrim(FormName.khbjk)=="") {
		alert("请输入[客户补交款]！");
		FormName.khbjk.focus();
		return false;
	}
	if(!(isFloat(FormName.khbjk, "客户补交款"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[结算人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[结算时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "结算时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
