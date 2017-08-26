<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #0000FF}
.STYLE4 {
	color: #990000;
	font-weight: bold;
}
.STYLE5 {color: #FF0000}
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



	ls_sql="select sfydxpzcyh,sfydgzcyh,sfyjszcyh,sftzk,sfyfq,sfydjfx,sfydyq,sfydxpzc,sfydgzc,sfyzcfk,sfykhpc,sfyjsgcyh,sfyyqf,sfxmbm1,sfxmbm2,sfxmbm3,sfyqtx1,qtx1mc,sfyqtx2,qtx2mc,sfyqtx3,qtx3mc,sfxsp,sfxsq ";
	ls_sql+=" from  dm_khjscsb";
	ls_sql+=" where  (fgsbh='"+fgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfydxpzcyh=cf.fillNull(rs.getString("sfydxpzcyh"));
		sfydgzcyh=cf.fillNull(rs.getString("sfydgzcyh"));
		sfyjszcyh=cf.fillNull(rs.getString("sfyjszcyh"));
		sftzk=cf.fillNull(rs.getString("sftzk"));
		sfyfq=cf.fillNull(rs.getString("sfyfq"));
		sfydjfx=cf.fillNull(rs.getString("sfydjfx"));
		sfydyq=cf.fillNull(rs.getString("sfydyq"));
		sfydxpzc=cf.fillNull(rs.getString("sfydxpzc"));
		sfydgzc=cf.fillNull(rs.getString("sfydgzc"));
		sfyzcfk=cf.fillNull(rs.getString("sfyzcfk"));
		sfykhpc=cf.fillNull(rs.getString("sfykhpc"));
		sfyjsgcyh=cf.fillNull(rs.getString("sfyjsgcyh"));
		sfyyqf=cf.fillNull(rs.getString("sfyyqf"));
		sfxmbm1=cf.fillNull(rs.getString("sfxmbm1"));
		sfxmbm2=cf.fillNull(rs.getString("sfxmbm2"));
		sfxmbm3=cf.fillNull(rs.getString("sfxmbm3"));
		sfyqtx1=cf.fillNull(rs.getString("sfyqtx1"));
		qtx1mc=cf.fillNull(rs.getString("qtx1mc"));
		sfyqtx2=cf.fillNull(rs.getString("sfyqtx2"));
		qtx2mc=cf.fillNull(rs.getString("qtx2mc"));
		sfyqtx3=cf.fillNull(rs.getString("sfyqtx3"));
		qtx3mc=cf.fillNull(rs.getString("qtx3mc"));
		sfxsp=cf.fillNull(rs.getString("sfxsp"));
		sfxsq=cf.fillNull(rs.getString("sfxsq"));
	}
	rs.close();
	ps.close();

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
/*
String sfyqtx1Style=null;
String sfyqtx1Read=null;
String sfyqtx2Style=null;
String sfyqtx2Read=null;
String sfyqtx3Style=null;
String sfyqtx3Read=null;
*/	
	//根据结算参数设置确定行是否显示＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始


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
		htsjf =rs.getDouble(1);
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
		djzgck=rs.getDouble(1);
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

	yjgck=cwsfke;//客户已交工程款

	zxzkl=zkl;//最新客户折扣

	zxzhljzjx=zhljzjx;//最新折后签约总额
	zxqye=qye;//最新折后增减项总额

	//工程合计－折前
	zqgchj=cf.round(wdzgce+zqljzjx,2);
	//工程合计－折后
	zhgchj=cf.round(qye+zhljzjx,2);

	//结算施工总额＝折后工程合计
	gcjsze=zqgchj;

	yjgcwk=gcjsze-cwsfke;//应交装修尾款=结算施工总额-客户已交装修款
	yjgcwk=cf.round(yjgcwk,0);

	//折扣优惠
	gczkyh=(zqgchj-zhgchj)-djfxje;
	gczkyh=cf.round(gczkyh,2);

	//工程优惠总额＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	gcyhze=gczkyh;//工程折扣优惠
	if (sftzk.equals("1"))//1：是；3：否
	{
		gcyhze=gcyhze+tzkxzyh;
	}
	if (!sfyjsgcyh.equals("3"))//允许结算调折扣  1：手工录入；2：自动获取；3：无
	{
		gcyhze=gcyhze+jsgcyh;//调折扣新增优惠
	}

	if (!sfyfq.equals("3"))//是否有返券  1：手工录入；2：自动获取；3：无
	{
		gcyhze=gcyhze+fqje-shfqje;
	}
	if (!sfydjfx.equals("3"))//是否有订金返现  1：手工录入；2：自动获取；3：无
	{
		gcyhze=gcyhze+djfxje;
	}
	if (!sfydyq.equals("3"))//是否有抵用券  1：手工录入；2：自动获取；3：无
	{
		gcyhze=gcyhze+dyq;
	}
	if (!sfyzcfk.equals("3"))//是否有主材返款  1：手工录入；2：自动获取；3：无
	{
		gcyhze=gcyhze+zcfkje;
	}
	if (!sfxmbm1.equals(""))//其它收费项目1
	{
		gcyhze=gcyhze+sfxmbm1je;
	}
	if (!sfxmbm2.equals(""))//其它收费项目2
	{
		gcyhze=gcyhze+sfxmbm2je;
	}
	if (!sfxmbm3.equals(""))//其它收费项目3
	{
		gcyhze=gcyhze+sfxmbm3je;
	}

	gcyhze=cf.round(gcyhze,0);
	//工程优惠总额＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


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
		xjjzck=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl,jc_zcdd  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' and cw_khfkjl.ddbh=jc_zcdd.ddbh";
	ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
//	ls_sql+=" and jc_zcdd.ddlx  in('1','3','4','6','7','8','9','B','C')";
	//1：代销品主材；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材

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
		xjjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	xjjzck=cf.round(xjjzck,2);

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
		fxjjzck=rs.getDouble(1);
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
		fxjjzck+=rs.getDouble(1);
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
		fxjjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl,jc_zcdd  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' and cw_khfkjl.ddbh=jc_zcdd.ddbh";
	ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
//	ls_sql+=" and jc_zcdd.ddlx  in('1','3','4','6','7','8','9','B','C')";
	//1：代销品主材；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材
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
		fxjjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	fxjjzck=cf.round(fxjjzck,2);


	//主材套餐
	ls_sql="SELECT sum(wdzje+zqzjhze)";
	ls_sql+=" FROM jc_zcdd  ";
	ls_sql+=" where (jc_zcdd.khbh='"+khbh+"')";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
	ls_sql+=" and ddlx in('6','7','8','B','C')";//1：代销品主材、B:顶配独立收费、C:选配主材；3：补录合同；4：有库存订单；5：套餐分解订单；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：tcmc代购主材
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zctcze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//代销品主材
	double jddxhtzq=0;
	double jddxzjxzq=0;
	double jddxhtzh=0;
	double jddxzjxzh=0;
	ls_sql="SELECT sum(wdzje),sum(hkze),sum(zqzjhze),sum(zjhze)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09：合同已完成
	ls_sql+=" and ddlx in('1','3','4')";//是否计入合同  Y：计入；N：不计入
	//1：代销品主材；3：补录合同；4：有库存订单；5：套餐分解订单；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：tcmc代购主材
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

	if (sfydxpzcyh.equals("3"))//1：手工录入；2：自动获取；3：无
	{
		dxpzcje=cf.round(jddxhtzh+jddxzjxzh,2);
		dxpzcyh=0;
	}
	else{
		dxpzcje=cf.round(jddxhtzq+jddxzjxzq,2);//代销品主材金额
		dxpzcyh=cf.round(cf.round(jddxhtzq+jddxzjxzq,2)-cf.round(jddxhtzh+jddxzjxzh,2),2);
	}



	//代购主材
	double dgzcjezq=0;
	double dgzcyhje=0;
	ls_sql="SELECT sum(wdzje+zqzjhze),sum((wdzje+zqzjhze)*khfdbl/100)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09：合同已完成
	ls_sql+=" and ddlx='9'";//1：代销品主材；3：补录合同；4：有库存订单；5：套餐分解订单；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dgzcjezq=rs.getDouble(1);
		dgzcyhje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	if (sfydgzcyh.equals("3"))//1：手工录入；2：自动获取；3：无
	{
		dgzcje=cf.round(dgzcjezq-dgzcyhje,2);
		dgzcyh=0;
	}
	else{
		dgzcje=dgzcjezq;
		dgzcyh=dgzcyhje;

		dgzcyh+=fxjjzck;
		dgzcyh=cf.round(dgzcyh,2);
	}


	//主材结算总额＋＋＋＋＋＋＋＋＋＋开始
	zcjsze=0;
	if (!sfydxpzc.equals("3"))//是否有代销品主材  1：手工录入；2：自动获取；3：无
	{
		zcjsze=zcjsze+dxpzcje;
	}
	if (!sfydxpzcyh.equals("3"))//是否有代销品主材优惠  1：手工录入；2：自动获取；3：无
	{
		zcjsze=zcjsze-dxpzcyh;
	}
	if (!sfydgzc.equals("3"))//是否有代购主材   1：手工录入；2：自动获取；3：无
	{
		zcjsze=zcjsze+dgzcje;
	}
	if (!sfydgzcyh.equals("3"))//是否有代购主材优惠  1：手工录入；2：自动获取；3：无
	{
		zcjsze=zcjsze-dgzcyh;
	}
	if (!sfyjszcyh.equals("3"))//是否有结算主材优惠  1：手工录入；2：自动获取；3：无
	{
		zcjsze=zcjsze-jszcyh;
	}

	zcjsze=cf.round(zcjsze,0);

	//应补交主材款
	ybjzck=zcjsze-xjjzck-fxjjzck;
	ybjzck=cf.round(ybjzck,0);
	//主材结算总额＝＝＝＝＝＝＝＝＝＝结束


	//客户补交款＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	khbjk=(htsjf -sssjf)+(yjgcwk-gcyhze)+ybjzck;
	if (!sfykhpc.equals("3"))//是否有客户赔偿款  1：手工录入；2：自动获取；3：无
	{
		khbjk=khbjk-khpck;
	}
	if (!sfyyqf.equals("3"))//是否有延期费  1：手工录入；2：自动获取；3：无
	{
		khbjk=khbjk-yqf;
	}
	if (!sfyqtx1.equals("3"))//是否有其它项1  1：是；3：否
	{
		khbjk=khbjk+qtx1je;
	}
	if (!sfyqtx2.equals("3"))//是否有其它项2  1：是；3：否
	{
		khbjk=khbjk+qtx2je;
	}
	if (!sfyqtx3.equals("3"))//是否有其它项3  1：是；3：否
	{
		khbjk=khbjk+qtx3je;
	}

	khbjk=cf.round(khbjk,0);
	//客户补交款＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
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
<form method="post" action="SaveInsertCw_khjsty.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font></td>
    <td><%=khxm%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">联系方式</font></td>
    <td><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td><%=fwdz%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">面积</font></td>
    <td><%=fwmj%></td>
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
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center"><span class="STYLE4">设计费情况</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>合同设计费</span></td> 
  <td width="32%"><input type="text" name="htsjf" value="<%=htsjf%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>实收设计费</span></td> 
  <td width="32%"><input type="text" name="sssjf" value="<%=sssjf%>" size="20" maxlength="17" readonly></td>
</tr>

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
  <td align="right"><strong>工程直接费</strong></td>
  <td align="center"><%=zqgczjf%></td>
  <td align="center"><%=zjxje%></td>
  <td align="center"><%=cf.formatDouble(zqgczjf+zjxje)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong><%=qtsfsm%>、<%=wjrqyexmsm%></strong></td>
  <td align="center"><%=cf.round(zqqtsf+zqwjrqyexm,2)%></td>
  <td align="center"><%=cf.round(zqqtsfzjx+zqwjrzjx,2)%></td>
  <td align="center"><%=cf.round(zqqtsf+zqqtsfzjx+zqwjrqyexm+zqwjrzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>管理费(<%=glfbfb%>%)</strong></td>
  <td align="center"><%=zqguanlif%></td>
  <td align="center"><%=zqzjxguanlif%></td>
  <td align="center"><%=cf.formatDouble(zqguanlif+zqzjxguanlif)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>税金(<%=suijinbfb%>%)</strong></td>
  <td align="center"><%=zqsuijin%></td>
  <td align="center"><%=zqzjxsuijin%></td>
  <td align="center"><%=cf.formatDouble(zqsuijin+zqzjxsuijin)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong> 小 计</strong></td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce)%>
        <input type="button" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyList.jsp?khbh=<%=khbh%>')" value=" 预算报价">
  </strong></td>
  <td align="center"><strong><%=cf.formatDouble(zqljzjx)%>
        <input type="button" onClick="window.open('/khxx/ViewZjxxx.jsp?khbh=<%=khbh%>')" value="增减项">
  </strong></td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce+zqljzjx)%>
        <input type="button" onClick=window.open("/khxx/ViewZxbj.jsp?khbh=<%=khbh%>") value="结算报价">
  </strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF"><span class="STYLE3"><span class="STYLE5">*</span></span>客户已交装修款</font></td>
  <td><input type="text" name="yjgck" value="<%=yjgck%>" size="20" maxlength="17" readonly></td>
  <td colspan="2" bgcolor="#FFFFFF">其中定金转家装款:<%=djzgck%>
    <input type="hidden" name="djzgck" value="<%=djzgck%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF"><span class="STYLE3"><span class="STYLE5">*</span></span>应交装修尾款</font></td>
  <td><input type="text" name="yjgcwk" value="<%=yjgcwk%>" size="20" maxlength="17" readonly></td>
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
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>客户折扣</span></td> 
  <td width="32%"> 
    <%=zklmc%><input type="hidden" name="zkl" value="<%=zkl%>" size="20" maxlength="9" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>工程折扣优惠</span></td> 
  <td width="32%"><input type="text" name="gczkyh" value="<%=gczkyh%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sftzkStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>允许结算调折扣</span></td>
  <td><%
	cf.radioToken(out, "sftzk","1+是&3+否",sftzk,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sftzkStyle%>">
  <td align="right">最新客户折扣</td>
  <td><input type="text" name="zxzkl" value="<%=zxzkl%>" size="20" maxlength="9" onChange="calValue(insertform)"></td>
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span></span>调折扣新增优惠</td>
  <td><input type="text" name="tzkxzyh" value="<%=tzkxzyh%>" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sftzkStyle%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>最新折后签约总额</span></td> 
  <td width="32%"><input type="text" name="zxqye" value="<%=zxqye%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>最新折后增减项总额</span></td> 
  <td width="32%"> 
    <input type="text" name="zxzhljzjx" value="<%=zxzhljzjx%>" size="20" maxlength="17" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyjsgcyhStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>是否有结算工程优惠</span></td>
  <td><%
	cf.radioToken(out, "sfyjsgcyh","1+手工录入&2+自动获取&3+无",sfyjsgcyh,true);
%></td>
  <td align="right">结算工程优惠</td>
  <td><input type="text" name="jsgcyh" value="<%=jsgcyh%>" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>

<tr bgcolor="#FFFFFF" style="display:<%=sfyfqStyle%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>是否有返券</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyfq","1+手工录入&2+自动获取&3+无",sfyfq,true);
%></td>
  <td align="right" width="18%">返券比例</td> 
  <td width="32%"> 
    <input type="text" name="fqbl" value="<%=fqbl%>" size="20" maxlength="9" onChange="calValue(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyfqStyle%>">
  <td align="right" width="18%">返券优惠</td> 
  <td width="32%"> 
    <input type="text" name="fqje" value="<%=fqje%>" size="20" maxlength="17" onChange="calValue(insertform)">  </td>
  <td align="right" width="18%">收回减项返券金额</td> 
  <td width="32%"> 
    <input type="text" name="shfqje" value="<%=shfqje%>" size="20" maxlength="17" onChange="calValue(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyfqStyle%>">
  <td align="right" width="18%">收回施工返券</td> 
  <td width="32%"> 
    <input type="text" name="shsgfq" value="<%=shsgfq%>" size="20" maxlength="17" onChange="calValue(insertform)">  </td>
  <td align="right" width="18%">收回主材返券</td> 
  <td width="32%"> 
    <input type="text" name="shzcfq" value="<%=shzcfq%>" size="20" maxlength="17" onChange="calValue(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydjfxStyle%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>是否有订金返现</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydjfx","1+手工录入&2+自动获取&3+无",sfydjfx,true);
%></td>
  <td align="right" width="18%">订金返现优惠</td> 
  <td width="32%"> 
    <input type="text" name="djfxje" value="<%=djfxje%>" size="20" maxlength="17"   <%=sfydjfxRead%> onChange="calValue(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydyqStyle%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>是否有抵用券</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydyq","1+手工录入&2+自动获取&3+无",sfydyq,true);
%></td>
  <td align="right" width="18%">抵用券</td> 
  <td width="32%"> 
    <input type="text" name="dyq" value="<%=dyq%>" size="20" maxlength="17"  <%=sfydyqRead%> onChange="calValue(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyzcfkStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>是否有主材返款</span></td>
  <td><%
	cf.radioToken(out, "sfyzcfk","1+手工录入&2+自动获取&3+无",sfyzcfk,true);
%></td>
  <td align="right">主材返款金额</td>
  <td><input type="text" name="zcfkje" value="<%=zcfkje%>" size="20" maxlength="17" <%=sfyzcfkRead%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfxmbm1Style%>">
  <td align="right"><span class="STYLE3">其它收费项目1</span></td>
  <td><select name="sfxmbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where sfxmbm='"+sfxmbm1+"'",sfxmbm1);
%>
  </select></td>
  <td align="right"><span class="STYLE3">其它收费项目1金额</span></td>
  <td><input type="text" name="sfxmbm1je" value="<%=sfxmbm1je%>" size="20" maxlength="17" readonly onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfxmbm2Style%>">
  <td align="right"><span class="STYLE3">其它收费项目2</span></td>
  <td><select name="sfxmbm2" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where sfxmbm='"+sfxmbm2+"'",sfxmbm2);
%>
  </select></td>
  <td align="right"><span class="STYLE3">其它收费项目2金额</span></td>
  <td><input type="text" name="sfxmbm2je" value="<%=sfxmbm2je%>" size="20" maxlength="17" readonly onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfxmbm3Style%>">
  <td align="right"><span class="STYLE3">其它收费项目3</span></td>
  <td><select name="sfxmbm3" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where sfxmbm='"+sfxmbm3+"'",sfxmbm3);
%>
  </select></td>
  <td align="right"><span class="STYLE3">其它收费项目3金额</span></td>
  <td><input type="text" name="sfxmbm3je" value="<%=sfxmbm3je%>" size="20" maxlength="17" readonly onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>工程优惠总额</span></td> 
  <td width="32%"> 
    <input type="text" name="gcyhze" value="<%=gcyhze%>" size="20" maxlength="17" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">主材情况</span></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydxpzcStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>是否有代销品主材</span></td>
  <td><%
	cf.radioToken(out, "sfydxpzc","1+手工录入&2+自动获取&3+无",sfydxpzc,true);
%></td>
  <td align="right"><font color="#0000FF"><strong>
    <input name="button32" type="button" onClick=window.open("/cwgl/jrkhjs/Jc_zcddJddxCxList.jsp?khbh=<%=khbh%>") value="代销品主材">
  </strong></font></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydxpzcStyle%>">
  <td align="right" width="18%">代销品主材金额</td> 
  <td width="32%"> 
    <input type="text" name="dxpzcje" value="<%=dxpzcje%>" size="20" maxlength="17" <%=sfydxpzcRead%> onChange="calValue(insertform)">  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfydxpzcyhStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>是否有代销品主材优惠</span></td>
  <td><%
	cf.radioToken(out, "sfydxpzcyh","1+手工录入&2+自动获取&3+无",sfydxpzcyh,true);
%></td>
  <td align="right">代销品主材优惠</td>
  <td><input type="text" name="dxpzcyh" value="<%=dxpzcyh%>" size="20" maxlength="17" <%=sfydxpzcyhRead%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydgzcStyle%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>是否有代购主材</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydgzc","1+手工录入&2+自动获取&3+无",sfydgzc,true);
%></td>
  <td align="right" width="18%"><strong>
    <input type="button" onClick=window.open("/cwgl/jrkhjs/Jc_zcddDgzcCxList.jsp?khbh=<%=khbh%>") value="代购主材">
  </strong></td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydgzcStyle%>">
  <td align="right">代购主材金额</td>
  <td><input type="text" name="dgzcje" value="<%=dgzcje%>" size="20" maxlength="17"  <%=sfydgzcRead%> onChange="calValue(insertform)"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfydgzcyhStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>是否有代购主材优惠</span></td>
  <td><%
	cf.radioToken(out, "sfydgzcyh","1+手工录入&2+自动获取&3+无",sfydgzcyh,true);
%></td>
  <td align="right">代购主材优惠</td>
  <td><input type="text" name="dgzcyh" value="<%=dgzcyh%>" size="20" maxlength="17" <%=sfydgzcyhRead%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyjszcyhStyle%>">
  <td align="right"><span class="STYLE5">*</span><span class="STYLE3">是否有结算主材优惠</span></td>
  <td><%
	cf.radioToken(out, "sfyjszcyh","1+手工录入&2+自动获取&3+无",sfyjszcyh,true);
%></td>
  <td align="right">结算主材优惠</td>
  <td><input type="text" name="jszcyh" value="<%=jszcyh%>" size="20" maxlength="17" <%=sfyjszcyhRead%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>主材结算总额</span></td> 
  <td width="32%"><input type="text" name="zcjsze" value="<%=zcjsze%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>现金交主材款</span></td> 
  <td width="32%"> 
    <input type="text" name="xjjzck" value="<%=xjjzck%>" size="20" maxlength="17" readonly>
    <strong>
    <input name="button" type="button" onclick=window.open("/cwgl/jrkhjs/Cw_khfkjlZcCxList.jsp?khbh=<%=khbh%>") value="付款明细">
    </strong> </td>
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>非现金交主材款</span></td> 
  <td width="32%"> 
    <input type="text" name="fxjjzck" value="<%=fxjjzck%>" size="20" maxlength="17" readonly>
    <strong>
    <input name="button3" type="button" onclick=window.open("/cwgl/jrkhjs/Cw_khfkjlFxjZcCxList.jsp?khbh=<%=khbh%>") value="付款明细">
    </strong> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>应补交主材款</span></td> 
  <td width="32%"> 
    <input type="text" name="ybjzck" value="<%=ybjzck%>" size="20" maxlength="17" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">其它扣款</span></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfykhpcStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>是否有客户赔偿款</span></td>
  <td><%
	cf.radioToken(out, "sfykhpc","1+手工录入&2+自动获取&3+无",sfykhpc,true);
%></td>
  <td align="right">客户赔偿款</td>
  <td><input type="text" name="khpck" value="<%=khpck%>" size="20" maxlength="17" <%=sfykhpcRead%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfyyqfStyle%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>是否有延期费</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyyqf","1+手工录入&2+自动获取&3+无",sfyyqf,true);
%></td>
  <td align="right" width="18%">延期费</td> 
  <td width="32%"><input type="text" name="yqf" value="<%=yqf%>" size="20" maxlength="17" <%=sfyyqfRead%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfyyqfStyle%>">
  <td align="right" width="18%">施工队承担延期费</td> 
  <td width="32%"><input type="text" name="sgdyqf" value="<%=sgdyqf%>" size="20" maxlength="17" <%=sfyyqfRead%>></td>
  <td align="right" width="18%">设计师承担延期费</td> 
  <td width="32%"><input type="text" name="sjsyqf" value="<%=sjsyqf%>" size="20" maxlength="17" <%=sfyyqfRead%>></td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfyyqfStyle%>">
  <td align="right" width="18%">厂商承担延期费</td> 
  <td width="32%"><input type="text" name="csyqf" value="<%=csyqf%>" size="20" maxlength="17" <%=sfyyqfRead%>></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyqtx1Style%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>是否有其它项1</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyqtx1","1+是&3+否",sfyqtx1,true);
%></td>
  <td align="right" width="18%">其它项1金额</td> 
  <td width="32%"><input type="text" name="qtx1je" value="<%=qtx1je%>" size="20" maxlength="17" <%=sfyqtx1Read%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyqtx1Style%>">
  <td align="right" width="18%">其它项1名称</td> 
  <td colspan="3"><input type="text" name="qtx1mc" value="<%=qtx1mc%>" size="73" maxlength="50" <%=sfyqtx1Read%>></td>
  </tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfyqtx2Style%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>是否有其它项2</span></td>
  <td><%
	cf.radioToken(out, "sfyqtx2","1+是&3+否",sfyqtx2,true);
%></td>
  <td align="right">其它项2金额</td>
  <td><input type="text" name="qtx2je" value="<%=qtx2je%>" size="20" maxlength="17" <%=sfyqtx2Read%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfyqtx2Style%>">
  <td align="right" width="18%">其它项2名称</td> 
  <td colspan="3"> 
    <input type="text" name="qtx2mc" value="<%=qtx2mc%>" size="73" maxlength="50" <%=sfyqtx2Read%>>  </td>
  </tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyqtx3Style%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>是否有其它项3</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyqtx3","1+是&3+否",sfyqtx3,true);
%></td>
  <td align="right" width="18%">其它项3金额</td> 
  <td width="32%"><input type="text" name="qtx3je" value="<%=qtx3je%>" size="20" maxlength="17" <%=sfyqtx3Read%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyqtx3Style%>">
  <td align="right" width="18%">其它项3名称</td> 
  <td colspan="3"><input type="text" name="qtx3mc" value="<%=qtx3mc%>" size="73" maxlength="50" <%=sfyqtx3Read%>></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE5">*</span><span class="STYLE3">客户补交款</span></td>
  <td><input type="text" name="khbjk" value="<%=khbjk%>" size="20" maxlength="17" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
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

	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input name="button6" type="button" onClick="window.open('ViewCw_khjsty.jsp?khbh=<%=khbh%>')"  value="打印">
	<input type="reset"  value="重输" name="reset">
    <input type="hidden" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" >
    <input type="hidden" name="qye" value="<%=qye%>" size="20" maxlength="17" >
    <input type="hidden" name="zqljzjx" value="<%=zqljzjx%>" size="20" maxlength="17" >
    <input type="hidden" name="zhljzjx" value="<%=zhljzjx%>" size="20" maxlength="17" >
    <input type="hidden" name="zqgchj" value="<%=zqgchj%>" size="20" maxlength="17" >
    <input type="hidden" name="zhgchj" value="<%=zhgchj%>" size="20" maxlength="17" >
    <input type="hidden" name="gcjsze" value="<%=gcjsze%>" size="20" maxlength="17" ></td>
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
	//工程优惠总额＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	var gcyhze=FormName.gczkyh.value*1.0;//工程折扣优惠
	if (FormName.sftzk.value=="1")//1：是；3：否
	{
		gcyhze=gcyhze+FormName.tzkxzyh.value*1.0;
	}


	if (FormName.sfyjsgcyh.value!="3")//允许结算调折扣  1：手工录入；2：自动获取；3：无
	{
		gcyhze=gcyhze+FormName.jsgcyh.value*1.0;//调折扣新增优惠
	}

	if (FormName.sfyfq.value!="3")//是否有返券  1：手工录入；2：自动获取；3：无
	{
		gcyhze=gcyhze+FormName.fqje.value*1.0-FormName.shfqje.value*1.0;
	}


	if (FormName.sfydjfx.value!="3")//是否有订金返现  1：手工录入；2：自动获取；3：无
	{
		gcyhze=gcyhze+FormName.djfxje.value*1.0;
	}
	if (FormName.sfydyq.value!="3")//是否有抵用券  1：手工录入；2：自动获取；3：无
	{
		gcyhze=gcyhze+FormName.dyq.value*1.0;
	}
	if (FormName.sfyzcfk.value!="3")//是否有主材返款  1：手工录入；2：自动获取；3：无
	{
		gcyhze=gcyhze+FormName.zcfkje.value*1.0;
	}

	if (FormName.sfxmbm1.value!="")//其它收费项目1
	{
		gcyhze=gcyhze+FormName.sfxmbm1je.value*1.0;
	}
	if (FormName.sfxmbm2.value!="")//其它收费项目2
	{
		gcyhze=gcyhze+FormName.sfxmbm2je.value*1.0;
	}
	if (FormName.sfxmbm3.value!="")//其它收费项目3
	{
		gcyhze=gcyhze+FormName.sfxmbm3je.value*1.0;
	}

	gcyhze=round(gcyhze,0);
	FormName.gcyhze.value=gcyhze;

	//工程优惠总额＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	//主材结算总额＋＋＋＋＋＋＋＋＋＋开始
	var zcjsze=0;
	if (FormName.sfydxpzc.value!="3")//是否有代销品主材  1：手工录入；2：自动获取；3：无
	{
		zcjsze=zcjsze+FormName.dxpzcje.value*1.0;
	}
	if (FormName.sfydxpzcyh.value!="3")//是否有代销品主材优惠  1：手工录入；2：自动获取；3：无
	{
		zcjsze=zcjsze-FormName.dxpzcyh.value*1.0;
	}
	if (FormName.sfydgzc.value!="3")//是否有代购主材   1：手工录入；2：自动获取；3：无
	{
		zcjsze=zcjsze+FormName.dgzcje.value*1.0;
	}
	if (FormName.sfydgzcyh.value!="3")//是否有代购主材优惠  1：手工录入；2：自动获取；3：无
	{
		zcjsze=zcjsze-FormName.dgzcyh.value*1.0;
	}
	if (FormName.sfyjszcyh.value!="3")//是否有结算主材优惠  1：手工录入；2：自动获取；3：无
	{
		zcjsze=zcjsze-FormName.jszcyh.value*1.0;
	}

	zcjsze=round(zcjsze,0);
	FormName.zcjsze.value=zcjsze;

	//应补交主材款
	ybjzck=FormName.zcjsze.value*1.0-FormName.xjjzck.value*1.0-FormName.fxjjzck.value*1.0;
	ybjzck=round(ybjzck,0);
	FormName.ybjzck.value=ybjzck;
	//主材结算总额＝＝＝＝＝＝＝＝＝＝结束

	//客户补交款＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	var khbjk=0;
	khbjk=(FormName.htsjf.value*1.0 -FormName.sssjf.value*1.0)+(FormName.yjgcwk.value*1.0-FormName.gcyhze.value*1.0)+FormName.ybjzck.value*1.0;
	if (FormName.sfykhpc.value!="3")//是否有客户赔偿款  1：手工录入；2：自动获取；3：无
	{
		khbjk=khbjk-FormName.khpck.value*1.0;
	}
	if (FormName.sfyyqf.value!="3")//是否有延期费  1：手工录入；2：自动获取；3：无
	{
		khbjk=khbjk-FormName.yqf.value*1.0;
	}
	if (FormName.sfyqtx1.value!="3")//是否有其它项1  1：是；3：否
	{
		khbjk=khbjk+FormName.qtx1je.value*1.0;
	}
	if (FormName.sfyqtx2.value!="3")//是否有其它项2  1：是；3：否
	{
		khbjk=khbjk+FormName.qtx2je.value*1.0;
	}
	if (FormName.sfyqtx3.value!="3")//是否有其它项3  1：是；3：否
	{
		khbjk=khbjk+FormName.qtx3je.value*1.0;
	}

	khbjk=round(khbjk,0);
	FormName.khbjk.value=khbjk;
	//客户补交款＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
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
		alert("请输入[折前签约总额]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "折前签约总额"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[折后签约总额]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "折后签约总额"))) {
		return false;
	}
	if(	javaTrim(FormName.zqljzjx)=="") {
		alert("请输入[折前增减项总额]！");
		FormName.zqljzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.zqljzjx, "折前增减项总额"))) {
		return false;
	}
	if(	javaTrim(FormName.zhljzjx)=="") {
		alert("请输入[折后增减项总额]！");
		FormName.zhljzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.zhljzjx, "折后增减项总额"))) {
		return false;
	}
	if(	javaTrim(FormName.zqgchj)=="") {
		alert("请输入[折前工程合计]！");
		FormName.zqgchj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqgchj, "折前工程合计"))) {
		return false;
	}
	if(	javaTrim(FormName.zhgchj)=="") {
		alert("请输入[折后工程合计]！");
		FormName.zhgchj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhgchj, "折后工程合计"))) {
		return false;
	}
	if(	javaTrim(FormName.gcjsze)=="") {
		alert("请输入[工程结算总额]！");
		FormName.gcjsze.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjsze, "工程结算总额"))) {
		return false;
	}
	if(	javaTrim(FormName.yjgck)=="") {
		alert("请输入[客户已交工程款]！");
		FormName.yjgck.focus();
		return false;
	}
	if(!(isFloat(FormName.yjgck, "客户已交工程款"))) {
		return false;
	}
	if(	javaTrim(FormName.djzgck)=="") {
		alert("请输入[定金转工程款]！");
		FormName.djzgck.focus();
		return false;
	}
	if(!(isFloat(FormName.djzgck, "定金转工程款"))) {
		return false;
	}
	if(	javaTrim(FormName.yjgcwk)=="") {
		alert("请输入[应交工程尾款]！");
		FormName.yjgcwk.focus();
		return false;
	}
	if(!(isFloat(FormName.yjgcwk, "应交工程尾款"))) {
		return false;
	}
	if(	javaTrim(FormName.sfxmbm1je)=="") {
		alert("请输入[其它收费项目1金额]！");
		FormName.sfxmbm1je.focus();
		return false;
	}
	if(!(isFloat(FormName.sfxmbm1je, "其它收费项目1金额"))) {
		return false;
	}
	if(	javaTrim(FormName.sfxmbm2je)=="") {
		alert("请输入[其它收费项目2金额]！");
		FormName.sfxmbm2je.focus();
		return false;
	}
	if(!(isFloat(FormName.sfxmbm2je, "其它收费项目2金额"))) {
		return false;
	}
	if(	javaTrim(FormName.sfxmbm3je)=="") {
		alert("请输入[其它收费项目3金额]！");
		FormName.sfxmbm3je.focus();
		return false;
	}
	if(!(isFloat(FormName.sfxmbm3je, "其它收费项目3金额"))) {
		return false;
	}

	if(	javaTrim(FormName.sftzk)=="") {
		alert("请输入[允许结算调折扣]！");
		FormName.sftzk.focus();
		return false;
	}


	if(	javaTrim(FormName.zxzkl)=="") {
		alert("请输入[最新客户折扣]！");
		FormName.zxzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zxzkl, "最新客户折扣"))) {
		return false;
	}
	if(	javaTrim(FormName.zxqye)=="") {
		alert("请输入[最新折后签约总额]！");
		FormName.zxqye.focus();
		return false;
	}
	if(!(isFloat(FormName.zxqye, "最新折后签约总额"))) {
		return false;
	}
	if(	javaTrim(FormName.zxzhljzjx)=="") {
		alert("请输入[最新折后增减项总额]！");
		FormName.zxzhljzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.zxzhljzjx, "最新折后增减项总额"))) {
		return false;
	}

	if(	javaTrim(FormName.sfyfq)=="") {
		alert("请输入[是否有返券]！");
		FormName.sfyfq.focus();
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
	if(	javaTrim(FormName.shfqje)=="") {
		alert("请输入[收回减项返券金额]！");
		FormName.shfqje.focus();
		return false;
	}
	if(!(isFloat(FormName.shfqje, "收回减项返券金额"))) {
		return false;
	}
	if(	javaTrim(FormName.shsgfq)=="") {
		alert("请输入[收回施工返券]！");
		FormName.shsgfq.focus();
		return false;
	}
	if(!(isFloat(FormName.shsgfq, "收回施工返券"))) {
		return false;
	}
	if(	javaTrim(FormName.shzcfq)=="") {
		alert("请输入[收回主材返券]！");
		FormName.shzcfq.focus();
		return false;
	}
	if(!(isFloat(FormName.shzcfq, "收回主材返券"))) {
		return false;
	}

	if(	javaTrim(FormName.sfydjfx)=="") {
		alert("请输入[是否有订金折现]！");
		FormName.sfydjfx.focus();
		return false;
	}
	if(	javaTrim(FormName.djfxje)=="") {
		alert("请输入[订金返现优惠]！");
		FormName.djfxje.focus();
		return false;
	}
	if(!(isFloat(FormName.djfxje, "订金返现优惠"))) {
		return false;
	}

	if(	javaTrim(FormName.sfydyq)=="") {
		alert("请输入[是否有抵用券]！");
		FormName.sfydyq.focus();
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
	if(	javaTrim(FormName.gcyhze)=="") {
		alert("请输入[工程优惠总额]！");
		FormName.gcyhze.focus();
		return false;
	}
	if(!(isFloat(FormName.gcyhze, "工程优惠总额"))) {
		return false;
	}

	if(	javaTrim(FormName.sfydxpzc)=="") {
		alert("请输入[是否有代销品主材]！");
		FormName.sfydxpzc.focus();
		return false;
	}
	if(	javaTrim(FormName.dxpzcje)=="") {
		alert("请输入[代销品主材金额]！");
		FormName.dxpzcje.focus();
		return false;
	}
	if(!(isFloat(FormName.dxpzcje, "代销品主材金额"))) {
		return false;
	}
	if(	javaTrim(FormName.dxpzcyh)=="") {
		alert("请输入[代销品主材优惠]！");
		FormName.dxpzcyh.focus();
		return false;
	}
	if(!(isFloat(FormName.dxpzcyh, "代销品主材优惠"))) {
		return false;
	}

	if(	javaTrim(FormName.sfydgzc)=="") {
		alert("请输入[FormName]！");
		FormName.sfydgzc.focus();
		return false;
	}
	if(	javaTrim(FormName.dgzcje)=="") {
		alert("请输入[代购主材金额]！");
		FormName.dgzcje.focus();
		return false;
	}
	if(!(isFloat(FormName.dgzcje, "代购主材金额"))) {
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
	if(	javaTrim(FormName.zcjsze)=="") {
		alert("请输入[主材结算总额]！");
		FormName.zcjsze.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjsze, "主材结算总额"))) {
		return false;
	}
	if(	javaTrim(FormName.xjjzck)=="") {
		alert("请输入[现金交主材款]！");
		FormName.xjjzck.focus();
		return false;
	}
	if(!(isFloat(FormName.xjjzck, "现金交主材款"))) {
		return false;
	}
	if(	javaTrim(FormName.fxjjzck)=="") {
		alert("请输入[非现金交主材款]！");
		FormName.fxjjzck.focus();
		return false;
	}
	if(!(isFloat(FormName.fxjjzck, "非现金交主材款"))) {
		return false;
	}
	if(	javaTrim(FormName.ybjzck)=="") {
		alert("请输入[应补交主材款]！");
		FormName.ybjzck.focus();
		return false;
	}
	if(!(isFloat(FormName.ybjzck, "应补交主材款"))) {
		return false;
	}

	if(	javaTrim(FormName.sfyzcfk)=="") {
		alert("请输入[是否有主材返款]！");
		FormName.sfyzcfk.focus();
		return false;
	}
	if(	javaTrim(FormName.zcfkje)=="") {
		alert("请输入[主材返款金额]！");
		FormName.zcfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.zcfkje, "主材返款金额"))) {
		return false;
	}

	if(	javaTrim(FormName.sfykhpc)=="") {
		alert("请输入[是否有客户赔偿款]！");
		FormName.sfykhpc.focus();
		return false;
	}
	if(	javaTrim(FormName.khpck)=="") {
		alert("请输入[客户赔偿款]！");
		FormName.khpck.focus();
		return false;
	}
	if(!(isFloat(FormName.khpck, "客户赔偿款"))) {
		return false;
	}

	if(	javaTrim(FormName.sfyyqf)=="") {
		alert("请输入[是否有延期费]！");
		FormName.sfyyqf.focus();
		return false;
	}
	if(	javaTrim(FormName.yqf)=="") {
		alert("请输入[延期费]！");
		FormName.yqf.focus();
		return false;
	}
	if(!(isFloat(FormName.yqf, "延期费"))) {
		return false;
	}
	if(!(isFloat(FormName.sgdyqf, "施工队承担延期费"))) {
		return false;
	}
	if(!(isFloat(FormName.sjsyqf, "设计师承担延期费"))) {
		return false;
	}
	if(!(isFloat(FormName.csyqf, "厂商承担延期费"))) {
		return false;
	}

	if(	javaTrim(FormName.sfyqtx1)=="") {
		alert("请输入[是否有其它项1]！");
		FormName.sfyqtx1.focus();
		return false;
	}
	if(	javaTrim(FormName.qtx1je)=="") {
		alert("请输入[其它项1金额]！");
		FormName.qtx1je.focus();
		return false;
	}
	if(!(isFloat(FormName.qtx1je, "其它项1金额"))) {
		return false;
	}

	if(	javaTrim(FormName.sfyqtx2)=="") {
		alert("请输入[是否有其它项2]！");
		FormName.sfyqtx2.focus();
		return false;
	}
	if(	javaTrim(FormName.qtx2je)=="") {
		alert("请输入[其它项2金额]！");
		FormName.qtx2je.focus();
		return false;
	}
	if(!(isFloat(FormName.qtx2je, "其它项2金额"))) {
		return false;
	}

	if(	javaTrim(FormName.sfyqtx3)=="") {
		alert("请输入[是否有其它项3]！");
		FormName.sfyqtx3.focus();
		return false;
	}
	if(	javaTrim(FormName.qtx3je)=="") {
		alert("请输入[其它项3金额]！");
		FormName.qtx3je.focus();
		return false;
	}
	if(!(isFloat(FormName.qtx3je, "其它项3金额"))) {
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
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("请输入[客户折扣]！");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "客户折扣"))) {
		return false;
	}
	if(	javaTrim(FormName.gczkyh)=="") {
		alert("请输入[工程折扣优惠]！");
		FormName.gczkyh.focus();
		return false;
	}
	if(!(isFloat(FormName.gczkyh, "工程折扣优惠"))) {
		return false;
	}
	if(	javaTrim(FormName.tzkxzyh)=="") {
		alert("请输入[调折扣新增优惠]！");
		FormName.tzkxzyh.focus();
		return false;
	}
	if(!(isFloat(FormName.tzkxzyh, "调折扣新增优惠"))) {
		return false;
	}
	if(	javaTrim(FormName.sfyjsgcyh)=="") {
		alert("请输入[是否有结算工程优惠]！");
		FormName.sfyjsgcyh.focus();
		return false;
	}
	if(	javaTrim(FormName.jsgcyh)=="") {
		alert("请输入[结算工程优惠]！");
		FormName.jsgcyh.focus();
		return false;
	}
	if(!(isFloat(FormName.jsgcyh, "结算工程优惠"))) {
		return false;
	}
	if(	javaTrim(FormName.sfydxpzcyh)=="") {
		alert("请输入[是否有代销品主材优惠]！");
		FormName.sfydxpzcyh.focus();
		return false;
	}
	if(	javaTrim(FormName.sfydgzcyh)=="") {
		alert("请输入[是否有代购主材优惠]！");
		FormName.sfydgzcyh.focus();
		return false;
	}
	if(	javaTrim(FormName.sfyjszcyh)=="") {
		alert("请输入[是否有结算主材优惠]！");
		FormName.sfyjszcyh.focus();
		return false;
	}
	if(	javaTrim(FormName.jszcyh)=="") {
		alert("请输入[结算主材优惠]！");
		FormName.jszcyh.focus();
		return false;
	}
	if(!(isFloat(FormName.jszcyh, "结算主材优惠"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
