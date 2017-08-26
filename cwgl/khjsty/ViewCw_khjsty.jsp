<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>客户结算单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

////////////////
double htsjf =0;//合同设计费
double sssjf=0;//实收设计费

double wdzgce=0;//折前签约总额
double qye=0;//折后签约总额

double zqljzjx=0;//折前增减项总额
double zhljzjx=0;//折后增减项总额

double zqgchj=0;//折前工程合计
double zhgchj=0;//折后工程合计

double gcjsze=0;//工程结算总额
double yjgck=0;//客户已交装修款
double yjgcwk=0;//应交工程尾款
double djzgck=0;//定金转工程款

double gczkyh=0;//工程折扣优惠

double zxzkl=0;//最新客户折扣
double tzkxzyh=0;//调折扣新增优惠
double zxqye=0;//最新折后签约总额
double zxzhljzjx=0;//最新折后增减项总额

double jsgcyh=0;//结算工程优惠

double fqbl=0;//返券比例
double fqje=0;//返券优惠
double shfqje=0;//收回减项返券金额
double shsgfq=0;//收回施工返券
double shzcfq=0;//收回主材返券

double djfxje=0;//订金返现优惠

double dyq=0;//抵用券

double zcfkje=0;//主材返款金额

double sfxmbm1je=0;//其它收费项目1金额
double sfxmbm2je=0;//其它收费项目2金额
double sfxmbm3je=0;//其它收费项目3金额

double gcyhze=0;//工程优惠总

double dxpzcje=0;//代销品主材金额
double dxpzcyh=0;//代销品主材优惠
double dgzcje=0;//代购主材金额
double dgzcyh=0;//代购主材优惠

double jszcyh=0;//结算主材优惠
double zcjsze=0;//主材结算总额

double xjjzck=0;//现金交主材款
double fxjjzck=0;//非现金交主材款

double ybjzck=0;//应补交主材款

double khpck=0;//客户赔偿款
double yqf=0;//延期费
double sgdyqf=0;//施工队承担延期费
double sjsyqf=0;//设计师承担延期费
double csyqf=0;//厂商承担延期费

double qtx1je=0;//其它项1金额
double qtx2je=0;//其它项2金额
double qtx3je=0;//其它项3金额

double khbjk=0;//客户补交款
String lrr="";
String lrsj="";
String bz="";


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

double zqguanlif=0;
double guanlif=0;
double zqsuijin=0;
double suijin=0;
double glfbfb=0;

double zhzjxje=0;
double zjxsuijin=0;
double zjxguanlif=0;

double cwsfke=0;

double sfke=0;

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


double zcddjezh=0;

double zctcze=0;

String fxgck="";//订金折现
double fxdj=0;
String qtsfsm="";
String wjrqyexmsm="";
String zklmc="";

//参数设置
String sftzk=null;//允许结算调折扣
String sfyjsgcyh=null;
String sfyfq=null;
String sfydjfx=null;

String sfydyq=null;
String sfyzcfk=null;
String sfxmbm1=null;
String sfxmbm2=null;
String sfxmbm3=null;

String sfydxpzc=null;
String sfydxpzcyh=null;
String sfydgzc=null;
String sfydgzcyh=null;
String sfyjszcyh=null;

String sfykhpc=null;
String sfyyqf=null;

String sfyqtx1=null;
String qtx1mc=null;
String sfyqtx2=null;
String qtx2mc=null;
String sfyqtx3=null;
String qtx3mc=null;
String sfxsp=null;
String sfxsq=null;
///
String sftzkStyle="";

String sfyjsgcyhStyle="";

String sfyfqStyle=null;

String sfydjfxStyle=null;
String sfydjfxRead="";

String sfydyqStyle=null;
String sfydyqRead=null;

String sfyzcfkStyle=null;
String sfyzcfkRead=null;

String sfxmbm1Style=null;
String sfxmbm2Style=null;
String sfxmbm3Style=null;

String sfydxpzcStyle=null;
String sfydxpzcRead=null;
String sfydxpzcyhStyle=null;
String sfydxpzcyhRead=null;

String sfydgzcStyle=null;
String sfydgzcRead=null;
String sfydgzcyhStyle=null;
String sfydgzcyhRead=null;

String sfyjszcyhStyle=null;
String sfyjszcyhRead=null;

String sfykhpcStyle=null;
String sfykhpcRead=null;
String sfyyqfStyle=null;
String sfyyqfRead=null;

String sfyqtx1Style=null;
String sfyqtx1Read=null;
String sfyqtx2Style=null;
String sfyqtx2Read=null;
String sfyqtx3Style=null;
String sfyqtx3Read=null;





Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,htsjf,sssjf,wdzgce,qye,zqljzjx,zhljzjx,zqgchj,zhgchj,gcjsze,yjgck,djzgck,yjgcwk,sfxmbm1,sfxmbm1je,sfxmbm2,sfxmbm2je,sfxmbm3,sfxmbm3je,sftzk,zxzkl,zxqye,zxzhljzjx,sfyfq,fqbl,fqje,shfqje,shsgfq,shzcfq,sfydjfx,djfxje,sfydyq,dyq,gcyhze,sfydxpzc,dxpzcje,dxpzcyh,sfydgzc,dgzcje,dgzcyh,zcjsze,xjjzck,fxjjzck,ybjzck,sfyzcfk,zcfkje,sfykhpc,khpck,sfyyqf,yqf,sgdyqf,sjsyqf,csyqf,sfyqtx1,qtx1mc,qtx1je,sfyqtx2,qtx2mc,qtx2je,sfyqtx3,qtx3mc,qtx3je,khbjk,lrr,lrsj,lrbm,bz,zkl,gczkyh,tzkxzyh,sfyjsgcyh,jsgcyh,sfydxpzcyh,sfydgzcyh,sfyjszcyh,jszcyh ";
	ls_sql+=" from  cw_khjsty";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		htsjf=rs.getDouble("htsjf");
		sssjf=rs.getDouble("sssjf");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");
		zqgchj=rs.getDouble("zqgchj");
		zhgchj=rs.getDouble("zhgchj");
		gcjsze=rs.getDouble("gcjsze");
		yjgck=rs.getDouble("yjgck");
		djzgck=rs.getDouble("djzgck");
		yjgcwk=rs.getDouble("yjgcwk");
		sfxmbm1=cf.fillNull(rs.getString("sfxmbm1"));
		sfxmbm1je=rs.getDouble("sfxmbm1je");
		sfxmbm2=cf.fillNull(rs.getString("sfxmbm2"));
		sfxmbm2je=rs.getDouble("sfxmbm2je");
		sfxmbm3=cf.fillNull(rs.getString("sfxmbm3"));
		sfxmbm3je=rs.getDouble("sfxmbm3je");
		sftzk=cf.fillNull(rs.getString("sftzk"));
		zxzkl=rs.getDouble("zxzkl");
		zxqye=rs.getDouble("zxqye");
		zxzhljzjx=rs.getDouble("zxzhljzjx");
		sfyfq=cf.fillNull(rs.getString("sfyfq"));
		fqbl=rs.getDouble("fqbl");
		fqje=rs.getDouble("fqje");
		shfqje=rs.getDouble("shfqje");
		shsgfq=rs.getDouble("shsgfq");
		shzcfq=rs.getDouble("shzcfq");
		sfydjfx=cf.fillNull(rs.getString("sfydjfx"));
		djfxje=rs.getDouble("djfxje");
		sfydyq=cf.fillNull(rs.getString("sfydyq"));
		dyq=rs.getDouble("dyq");
		gcyhze=rs.getDouble("gcyhze");
		sfydxpzc=cf.fillNull(rs.getString("sfydxpzc"));
		dxpzcje=rs.getDouble("dxpzcje");
		dxpzcyh=rs.getDouble("dxpzcyh");
		sfydgzc=cf.fillNull(rs.getString("sfydgzc"));
		dgzcje=rs.getDouble("dgzcje");
		dgzcyh=rs.getDouble("dgzcyh");
		zcjsze=rs.getDouble("zcjsze");
		xjjzck=rs.getDouble("xjjzck");
		fxjjzck=rs.getDouble("fxjjzck");
		ybjzck=rs.getDouble("ybjzck");
		sfyzcfk=cf.fillNull(rs.getString("sfyzcfk"));
		zcfkje=rs.getDouble("zcfkje");
		sfykhpc=cf.fillNull(rs.getString("sfykhpc"));
		khpck=rs.getDouble("khpck");
		sfyyqf=cf.fillNull(rs.getString("sfyyqf"));
		yqf=rs.getDouble("yqf");
		sgdyqf=rs.getDouble("sgdyqf");
		sjsyqf=rs.getDouble("sjsyqf");
		csyqf=rs.getDouble("csyqf");
		sfyqtx1=cf.fillNull(rs.getString("sfyqtx1"));
		qtx1mc=cf.fillNull(rs.getString("qtx1mc"));
		qtx1je=rs.getDouble("qtx1je");
		sfyqtx2=cf.fillNull(rs.getString("sfyqtx2"));
		qtx2mc=cf.fillNull(rs.getString("qtx2mc"));
		qtx2je=rs.getDouble("qtx2je");
		sfyqtx3=cf.fillNull(rs.getString("sfyqtx3"));
		qtx3mc=cf.fillNull(rs.getString("qtx3mc"));
		qtx3je=rs.getDouble("qtx3je");
		khbjk=rs.getDouble("khbjk");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		zkl=rs.getDouble("zkl");
		gczkyh=rs.getDouble("gczkyh");
		tzkxzyh=rs.getDouble("tzkxzyh");
		sfyjsgcyh=cf.fillNull(rs.getString("sfyjsgcyh"));
		jsgcyh=rs.getDouble("jsgcyh");
		sfydxpzcyh=cf.fillNull(rs.getString("sfydxpzcyh"));
		sfydgzcyh=cf.fillNull(rs.getString("sfydgzcyh"));
		sfyjszcyh=cf.fillNull(rs.getString("sfyjszcyh"));
		jszcyh=rs.getDouble("jszcyh");
	}
	rs.close();
	ps.close();

	
	
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

	if (!khjsbz.equals("Y"))
	{
		out.println("错误！客户未结算");
		return;
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

	//根据结算参数设置确定行是否显示＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	if (sftzk.equals("1"))//1：是；3：否
	{
		sftzkStyle="block";
	}
	else
	{
		sftzkStyle="none";
	}

	if (sfyjsgcyh.equals("1"))//1：手工录入；2：自动获取；3：无
	{
		sfyjsgcyhStyle="block";
	}
	else if (sfyjsgcyh.equals("2"))//1：手工录入；2：自动获取；3：无
	{
		sfyjsgcyhStyle="block";
	}
	else//1：手工录入；2：自动获取；3：无
	{
		sfyjsgcyhStyle="none";
	}

	if (sfyfq.equals("1"))//1：手工录入；2：自动获取；3：无
	{
		sfyfqStyle="block";
	}
	else if (sfyfq.equals("2"))//1：手工录入；2：自动获取；3：无
	{
		sfyfqStyle="block";
	}
	else//1：手工录入；2：自动获取；3：无
	{
		sfyfqStyle="none";
	}

	if (sfydjfx.equals("1"))//1：手工录入；2：自动获取；3：无
	{
		sfydjfxStyle="block";
		sfydjfxRead="";
	}
	else if (sfydjfx.equals("2"))//1：手工录入；2：自动获取；3：无
	{
		sfydjfxStyle="block";
		sfydjfxRead="readonly";
	}
	else//1：手工录入；2：自动获取；3：无
	{
		sfydjfxStyle="none";
		sfydjfxRead="readonly";
	}

	if (sfydyq.equals("1"))//1：手工录入；2：自动获取；3：无
	{
		sfydyqStyle="block";
		sfydyqRead="";
	}
	else if (sfydyq.equals("2"))//1：手工录入；2：自动获取；3：无
	{
		sfydyqStyle="block";
		sfydyqRead="readonly";
	}
	else//1：手工录入；2：自动获取；3：无
	{
		sfydyqStyle="none";
		sfydyqRead="readonly";
	}

	if (sfyzcfk.equals("1"))//1：手工录入；2：自动获取；3：无
	{
		sfyzcfkStyle="block";
		sfyzcfkRead="";
	}
	else if (sfyzcfk.equals("2"))//1：手工录入；2：自动获取；3：无
	{
		sfyzcfkStyle="block";
		sfyzcfkRead="readonly";
	}
	else//1：手工录入；2：自动获取；3：无
	{
		sfyzcfkStyle="none";
		sfyzcfkRead="readonly";
	}

	if (sfxmbm1.equals(""))
	{
		sfxmbm1Style="none";
	}
	else{
		sfxmbm1Style="block";
	}
	if (sfxmbm2.equals(""))
	{
		sfxmbm2Style="none";
	}
	else{
		sfxmbm2Style="block";
	}
	if (sfxmbm3.equals(""))
	{
		sfxmbm3Style="none";
	}
	else{
		sfxmbm3Style="block";
	}

	
	if (sfydxpzc.equals("1"))//1：手工录入；2：自动获取；3：无
	{
		sfydxpzcStyle="block";
		sfydxpzcRead="";

		if (sfydxpzcyh.equals("1"))//1：手工录入；2：自动获取；3：无
		{
			sfydxpzcyhStyle="block";
			sfydxpzcyhRead="";
		}
		else if (sfydxpzcyh.equals("2"))//1：手工录入；2：自动获取；3：无
		{
			sfydxpzcyhStyle="block";
			sfydxpzcyhRead="readonly";
		}
		else{
			sfydxpzcyhStyle="none";
			sfydxpzcyhRead="readonly";
		}
	}
	else if (sfydxpzc.equals("2"))//1：手工录入；2：自动获取；3：无
	{
		sfydxpzcStyle="block";
		sfydxpzcRead="readonly";

		if (sfydxpzcyh.equals("1"))//1：手工录入；2：自动获取；3：无
		{
			sfydxpzcyhStyle="block";
			sfydxpzcyhRead="";
		}
		else if (sfydxpzcyh.equals("2"))//1：手工录入；2：自动获取；3：无
		{
			sfydxpzcyhStyle="block";
			sfydxpzcyhRead="readonly";
		}
		else{
			sfydxpzcyhStyle="none";
			sfydxpzcyhRead="readonly";
		}
	}
	else//1：手工录入；2：自动获取；3：无
	{
		sfydxpzcStyle="none";
		sfydxpzcRead="readonly";
		sfydxpzcyhStyle="none";
		sfydxpzcyhRead="readonly";
	}
	

	
	if (sfydgzc.equals("1"))//1：手工录入；2：自动获取；3：无
	{
		sfydgzcStyle="block";
		sfydgzcRead="";

		if (sfydgzcyh.equals("1"))//1：手工录入；2：自动获取；3：无
		{
			sfydgzcyhStyle="block";
			sfydgzcyhRead="";
		}
		else if (sfydgzcyh.equals("2"))//1：手工录入；2：自动获取；3：无
		{
			sfydgzcyhStyle="block";
			sfydgzcyhRead="readonly";
		}
		else{
			sfydgzcyhStyle="none";
			sfydgzcyhRead="readonly";
		}
	}
	else if (sfydgzc.equals("2"))//1：手工录入；2：自动获取；3：无
	{
		sfydgzcStyle="block";
		sfydgzcRead="readonly";

		if (sfydgzcyh.equals("1"))//1：手工录入；2：自动获取；3：无
		{
			sfydgzcyhStyle="block";
			sfydgzcyhRead="";
		}
		else if (sfydgzcyh.equals("2"))//1：手工录入；2：自动获取；3：无
		{
			sfydgzcyhStyle="block";
			sfydgzcyhRead="readonly";
		}
		else{
			sfydgzcyhStyle="none";
			sfydgzcyhRead="readonly";
		}
	}
	else//1：手工录入；2：自动获取；3：无
	{
		sfydgzcStyle="none";
		sfydgzcRead="readonly";
		sfydgzcyhStyle="none";
		sfydgzcyhRead="readonly";
	}
	
	if (sfyjszcyh.equals("1"))//1：手工录入；2：自动获取；3：无
	{
		sfyjszcyhStyle="block";
		sfyjszcyhRead="";
	}
	else if (sfyjszcyh.equals("2"))//1：手工录入；2：自动获取；3：无
	{
		sfyjszcyhStyle="block";
		sfyjszcyhRead="readonly";
	}
	else//1：手工录入；2：自动获取；3：无
	{
		sfyjszcyhStyle="none";
		sfyjszcyhRead="readonly";
	}


	if (sfykhpc.equals("1"))//1：手工录入；2：自动获取；3：无
	{
		sfykhpcStyle="block";
		sfykhpcRead="";
	}
	else if (sfykhpc.equals("2"))//1：手工录入；2：自动获取；3：无
	{
		sfykhpcStyle="block";
		sfykhpcRead="readonly";
	}
	else//1：手工录入；2：自动获取；3：无
	{
		sfykhpcStyle="none";
		sfykhpcRead="readonly";
	}

	if (sfyyqf.equals("1"))//1：手工录入；2：自动获取；3：无
	{
		sfyyqfStyle="block";
		sfyyqfRead="";
	}
	else if (sfyyqf.equals("2"))//1：手工录入；2：自动获取；3：无
	{
		sfyyqfStyle="block";
		sfyyqfRead="readonly";
	}
	else//1：手工录入；2：自动获取；3：无
	{
		sfyyqfStyle="none";
		sfyyqfRead="readonly";
	}

	if (sfyqtx1.equals("1"))//1：手工录入；2：自动获取；3：无
	{
		sfyqtx1Style="block";
		sfyqtx1Read="";
	}
	else if (sfyqtx1.equals("2"))//1：手工录入；2：自动获取；3：无
	{
		sfyqtx1Style="block";
		sfyqtx1Read="readonly";
	}
	else//1：手工录入；2：自动获取；3：无
	{
		sfyqtx1Style="none";
		sfyqtx1Read="readonly";
	}

	if (sfyqtx2.equals("1"))//1：手工录入；2：自动获取；3：无
	{
		sfyqtx2Style="block";
		sfyqtx2Read="";
	}
	else if (sfyqtx2.equals("2"))//1：手工录入；2：自动获取；3：无
	{
		sfyqtx2Style="block";
		sfyqtx2Read="readonly";
	}
	else//1：手工录入；2：自动获取；3：无
	{
		sfyqtx2Style="none";
		sfyqtx2Read="readonly";
	}

	if (sfyqtx3.equals("1"))//1：手工录入；2：自动获取；3：无
	{
		sfyqtx3Style="block";
		sfyqtx3Read="";
	}
	else if (sfyqtx3.equals("2"))//1：手工录入；2：自动获取；3：无
	{
		sfyqtx3Style="block";
		sfyqtx3Read="readonly";
	}
	else//1：手工录入；2：自动获取；3：无
	{
		sfyqtx3Style="none";
		sfyqtx3Read="readonly";
	}
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
<form method="post" action="SaveEditCw_khjsty.jsp" name="insertform" target="_blank">
<div align="center">客户结算单</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF">
    <td align="right">客户姓名</font></td>
    <td><%=khxm%></td>
    <td align="right" bgcolor="#FFFFFF">联系方式</font></td>
    <td><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">房屋地址</font></td>
    <td><%=fwdz%></td>
    <td align="right" bgcolor="#FFFFFF">面积</font></td>
    <td><%=fwmj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">户型</font></td>
    <td><%=hxmc%></td>
    <td align="right" bgcolor="#FFFFFF">报价级别</font></td>
    <td><%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">合同号</font></td>
    <td><%=hth%></td>
    <td align="right" bgcolor="#FFFFFF">会员卡号</font></td>
    <td><%=hyh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right" bgcolor="#FFFFFF">开工日期</font></td>
    <td><%=kgrq%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center"><span class="STYLE4">设计费情况</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3">合同设计费</span></td> 
  <td width="32%"><%=htsjf%></td><td align="right" width="18%"><span class="STYLE3">实收设计费</span></td> 
    <td width="32%"><%=sssjf%></td></tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center"><span class="STYLE4">工程费情况</span></td>
</tr>
<tr align="center" bgcolor="#FFFFFF">
  <td>&nbsp;</td>
  <td>合同</td>
  <td>增减项</td>
  <td>合计</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">工程直接费</td>
  <td align="center"><%=zqgczjf%></td>
  <td align="center"><%=zjxje%></td>
  <td align="center"><%=cf.formatDouble(zqgczjf+zjxje)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><%=qtsfsm%>、<%=wjrqyexmsm%></td>
  <td align="center"><%=cf.round(zqqtsf+zqwjrqyexm,2)%></td>
  <td align="center"><%=cf.round(zqqtsfzjx+zqwjrzjx,2)%></td>
  <td align="center"><%=cf.round(zqqtsf+zqqtsfzjx+zqwjrqyexm+zqwjrzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">管理费(<%=glfbfb%>%)</td>
  <td align="center"><%=zqguanlif%></td>
  <td align="center"><%=zqzjxguanlif%></td>
  <td align="center"><%=cf.formatDouble(zqguanlif+zqzjxguanlif)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">税金(<%=suijinbfb%>%)</td>
  <td align="center"><%=zqsuijin%></td>
  <td align="center"><%=zqzjxsuijin%></td>
  <td align="center"><%=cf.formatDouble(zqsuijin+zqzjxsuijin)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 小 计</td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce)%></strong></td>
  <td align="center"><strong><%=cf.formatDouble(zqljzjx)%></strong></td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce+zqljzjx)%></strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"></span>客户已交装修款</font></td>
  <td><%=yjgck%></td><td colspan="2" bgcolor="#FFFFFF">其中定金转家装款:<%=djzgck%>
    <input type="hidden" name="djzgck" value="<%=djzgck%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"></span>应交装修尾款</font></td>
  <td><%=yjgcwk%></td><td colspan="2">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">优惠情况</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">促销活动内容</font></td>
  <td colspan="3"><%=cxhdbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3">客户折扣</span></td> 
  <td width="32%"> 
    <%=zklmc%></td>
  <td align="right" width="18%"><span class="STYLE3">工程折扣优惠</span></td> 
  <td width="32%"><%=gczkyh%></td></tr>
<tr bgcolor="#FFFFFF" style="display:<%=sftzkStyle%>">
  <td align="right"><span class="STYLE3">允许结算调折扣</span></td>
  <td><%
	cf.radioToken(out,"1+是&3+否",sftzk,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sftzkStyle%>">
  <td align="right">最新客户折扣</td>
  <td><%=zxzkl%></td><td align="right"><span class="STYLE3"></span>调折扣新增优惠</td>
    <td><%=tzkxzyh%></td></tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyjsgcyhStyle%>">
  <td align="right"><span class="STYLE3">是否有结算工程优惠</span></td>
  <td><%
	cf.radioToken(out,"1+手工录入&2+自动获取&3+无",sfyjsgcyh,true);
%></td>
  <td align="right">结算工程优惠</td>
  <td><%=jsgcyh%></td>
</tr>

<tr bgcolor="#FFFFFF" style="display:<%=sfyfqStyle%>">
  <td align="right" width="18%"><span class="STYLE3">是否有返券</span></td> 
  <td width="32%"><%
	cf.radioToken(out,"1+手工录入&2+自动获取&3+无",sfyfq,true);
%></td>
  <td align="right" width="18%">返券比例</td> 
  <td width="32%"><%=fqbl%> </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyfqStyle%>">
  <td align="right" width="18%">返券优惠</td> 
  <td width="32%"><%=fqje%></td>
  <td align="right" width="18%">收回减项返券金额</td> 
  <td width="32%"><%=shfqje%> </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyfqStyle%>">
  <td align="right" width="18%">收回施工返券</td> 
  <td width="32%"><%=shsgfq%> </td>
  <td align="right" width="18%">收回主材返券</td> 
  <td width="32%"><%=shzcfq%>  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydjfxStyle%>">
  <td align="right" width="18%"><span class="STYLE3">是否有订金返现</span></td> 
  <td width="32%"><%
	cf.radioToken(out,"1+手工录入&2+自动获取&3+无",sfydjfx,true);
%></td>
  <td align="right" width="18%">订金返现优惠</td> 
  <td width="32%"><%=djfxje%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydyqStyle%>">
  <td align="right" width="18%"><span class="STYLE3">是否有抵用券</span></td> 
  <td width="32%"><%
	cf.radioToken(out,"1+手工录入&2+自动获取&3+无",sfydyq,true);
%></td>
  <td align="right" width="18%">抵用券</td> 
  <td width="32%"><%=dyq%> </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyzcfkStyle%>">
  <td align="right"><span class="STYLE3">是否有主材返款</span></td>
  <td><%
	cf.radioToken(out,"1+手工录入&2+自动获取&3+无",sfyzcfk,true);
%></td>
  <td align="right">主材返款金额</td>
  <td><%=zcfkje%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfxmbm1Style%>">
  <td align="right"><span class="STYLE3">其它收费项目1</span></td>
  <td>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where sfxmbm='"+sfxmbm1+"'",sfxmbm1,true);
%>  </td>
  <td align="right"><span class="STYLE3">其它收费项目1金额</span></td>
  <td><%=sfxmbm1je%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfxmbm2Style%>">
  <td align="right"><span class="STYLE3">其它收费项目2</span></td>
  <td>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where sfxmbm='"+sfxmbm2+"'",sfxmbm2,true);
%>  </td>
  <td align="right"><span class="STYLE3">其它收费项目2金额</span></td>
  <td><%=sfxmbm2je%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfxmbm3Style%>">
  <td align="right"><span class="STYLE3">其它收费项目3</span></td>
  <td>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where sfxmbm='"+sfxmbm3+"'",sfxmbm3,true);
%>  </td>
  <td align="right"><span class="STYLE3">其它收费项目3金额</span></td>
  <td><%=sfxmbm3je%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3">工程优惠总额</span></td> 
  <td width="32%"><%=gcyhze%> </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">主材情况</span></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydxpzcStyle%>">
  <td align="right"><span class="STYLE3">是否有代销品主材</span></td>
  <td><%
	cf.radioToken(out,"1+手工录入&2+自动获取&3+无",sfydxpzc,true);
%></td>
  <td align="right"></font></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydxpzcStyle%>">
  <td align="right" width="18%">代销品主材金额</td> 
  <td width="32%"><%=dxpzcje%>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfydxpzcyhStyle%>">
  <td align="right"><span class="STYLE3">是否有代销品主材优惠</span></td>
  <td><%
	cf.radioToken(out,"1+手工录入&2+自动获取&3+无",sfydxpzcyh,true);
%></td>
  <td align="right">代销品主材优惠</td>
  <td><%=dxpzcyh%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydgzcStyle%>">
  <td align="right" width="18%"><span class="STYLE3">是否有代购主材</span></td> 
  <td width="32%"><%
	cf.radioToken(out,"1+手工录入&2+自动获取&3+无",sfydgzc,true);
%></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydgzcStyle%>">
  <td align="right">代购主材金额</td>
  <td><%=dgzcje%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfydgzcyhStyle%>">
  <td align="right"><span class="STYLE3">是否有代购主材优惠</span></td>
  <td><%
	cf.radioToken(out,"1+手工录入&2+自动获取&3+无",sfydgzcyh,true);
%></td>
  <td align="right">代购主材优惠</td>
  <td><%=dgzcyh%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyjszcyhStyle%>">
  <td align="right"><span class="STYLE3">是否有结算主材优惠</span></td>
  <td><%
	cf.radioToken(out,"1+手工录入&2+自动获取&3+无",sfyjszcyh,true);
%></td>
  <td align="right">结算主材优惠</td>
  <td><%=jszcyh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3">主材结算总额</span></td> 
  <td width="32%"><%=zcjsze%></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3">现金交主材款</span></td> 
  <td width="32%"><%=xjjzck%></td>
  <td align="right" width="18%"><span class="STYLE3">非现金交主材款</span></td> 
  <td width="32%"><%=fxjjzck%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3">应补交主材款</span></td> 
  <td width="32%"><%=ybjzck%> </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">其它扣款</span></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfykhpcStyle%>">
  <td align="right"><span class="STYLE3">是否有客户赔偿款</span></td>
  <td><%
	cf.radioToken(out,"1+手工录入&2+自动获取&3+无",sfykhpc,true);
%></td>
  <td align="right">客户赔偿款</td>
  <td><%=khpck%></td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfyyqfStyle%>">
  <td align="right" width="18%"><span class="STYLE3">是否有延期费</span></td> 
  <td width="32%"><%
	cf.radioToken(out,"1+手工录入&2+自动获取&3+无",sfyyqf,true);
%></td>
  <td align="right" width="18%">延期费</td> 
  <td width="32%"><%=yqf%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyqtx1Style%>">
  <td align="right" width="18%"><span class="STYLE3">是否有其它项1</span></td> 
  <td width="32%"><%
	cf.radioToken(out,"1+是&3+否",sfyqtx1,true);
%></td>
  <td align="right" width="18%">其它项1金额</td> 
  <td width="32%"><%=qtx1je%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyqtx1Style%>">
  <td align="right" width="18%">其它项1名称</td> 
  <td colspan="3"><%=qtx1mc%></td>
  </tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfyqtx2Style%>">
  <td align="right"><span class="STYLE3">是否有其它项2</span></td>
  <td><%
	cf.radioToken(out,"1+是&3+否",sfyqtx2,true);
%></td>
  <td align="right">其它项2金额</td>
  <td><%=qtx2je%></td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfyqtx2Style%>">
  <td align="right" width="18%">其它项2名称</td> 
  <td colspan="3"><%=qtx2mc%> </td>
  </tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyqtx3Style%>">
  <td align="right" width="18%"><span class="STYLE3">是否有其它项3</span></td> 
  <td width="32%"><%
	cf.radioToken(out,"1+是&3+否",sfyqtx3,true);
%></td>
  <td align="right" width="18%">其它项3金额</td> 
  <td width="32%"><%=qtx3je%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyqtx3Style%>">
  <td align="right" width="18%">其它项3名称</td> 
  <td colspan="3"><%=qtx3mc%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">客户补交款</span></td>
  <td><%=khbjk%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><%=bz%></td>
</tr>
</table>
</form>
</body>
</html>

