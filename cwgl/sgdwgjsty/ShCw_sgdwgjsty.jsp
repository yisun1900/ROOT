<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>结算审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE4 {color: #0000CC}
.STYLE5 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sgd="";
String sgbz=null;
double htgcf=0;//合同工程额
double gcfzjx=0;//工程费增减项
double htqtsf=0;//合同其它费
double qtsfzjx=0;//其它费增减项
String qtfsm="";//其它费说明
double htsgcb=0;//合同工施工成本
double zjxsgcb=0;//增减项施工成本
double ljclf=0;//累计材料费
double ljrgf=0;//累计人工费
double khqk=0;//客户欠款
double khpck=0;
double yqf=0;
double jsyh=0;


double kyqf=0;
double kkhpck=0;
double kkhqk=0;



String jsjs="";//结算基数
double jsbl=0;//结算比例
double htjsjs=0;//合同结算基数
double zjxjsjs=0;//增减项结算基数
double jsjsxjje=0;

double sdlje=0;//水电路金额
double sdljsje=0;//水电路结算金额

double ljzjxje=0;//累计增减项
double zxje=0;//扣质保金
double jxje=0;//减项金额

double zcje=0;//主材金额
double zcjsje=0;//主材结算金额

double jsjsze=0;//结算基数总额
double jsje=0;//结算总额
double rgfjse=0;//人工费结算额
double flfjse=0;//辅料费结算额

double kzbj=0;//扣质保金

double clf=0;//材料费
double gdyp=0;//工地用品
double yfgf=0;//已付工费

double clfk=0;//辅材罚款
double clyf=0;//材料运费
double zckk=0;//主材扣款
double zcjl=0;//主材奖励
double fkje=0;//罚款金额
double jlje=0;//奖励金额
double qtje=0;//其它金额

double yfje=0;//应付金额


String sdljsfs=null;//水电路结算方式
String sdlqz="";//水电路取值
String sdlqzStr="";//水电路取值
String zjxjffs="";//增减项奖罚方式
double ljzjxxs=0;//累计增减项系数
double zxxs=0;//增项系数
double jxxs=0;//减项系数
String zjxbhfw="";//增减项包含范围
String zjxsjd="";//增减项时间点
String sfkyqpc="";//是否扣延期费赔偿款

String zcsfjs="";//主材是否结算
String zcjehqfs="";//主材金额获取方式
String zcjsblkg="";//主材结算比例可修改
double zcjsbl=0;//主材结算比例

String sfkzbj=null;//是否扣质保金
String kzbjjs=null;//扣质保金基数
double kzbjbl=0;//扣质保金比例
String sfkclk=null;//是否扣材料款
String sfkgdyp=null;//是否扣工地用品
String sfkyfgf=null;//是否扣已付工费
String sfkclfk="";//是否扣辅材罚款
String sfkclyf="";//是否扣材料运费
String sfkzckk="";//是否扣主材扣款
String sfjzcjl="";//是否加主材奖励
String sfkfkje="";//是否扣罚款金额
String sfjjlje="";//是否加奖励金额
String sfjqtje="";//是否加其它金额

double ssk=0;
double sdljsbl=0;

double tzjsbl=0;
String jsrq=null;
String spzt=null;
String spr=null;
String spsj=null;
String spyj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
double zbjce=0;


//客户基本信息
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String khjl=null;
String zjxm=null;
String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String gcjdbm=null;

String dwbh=null;
String dwmc=null;
String zjxxh="";
String gdjsjd=null;
String fgsbh=null;
//财务信息

double qye=0;
double zhljzjx=0;
double cwsfke=0;


double zhgczjf=0;
double guanlif=0;
double suijin=0;
double zhqtsf=0;
double zhwjrqyexm=0;
double sjf=0;

double zhzjxje=0;
double zjxguanlif=0;
double zjxsuijin=0;
double zhqtsfzjx=0;
double zhwjrzjx=0;
double zhsjfzjx=0;


//根据结算参数设置确定行是否显示＋＋＋＋＋＋＋
String sdlStyle="";
String sdlblRead="";
String sdljeRead="";

String zjxfsStyle="";
String zjxStyle="";
String zjxRead="";
String zxStyle="";
String zxRead="";
String jxStyle="";
String jxRead="";

String sfkclkStyle="";
String sfkclkRead="";

String sfkgdypStyle="";
String sfkgdypRead="";

String sfkyfgfStyle="";
String sfkyfgfRead="";

String sfkzbjStyle="";
String sfkzbjRead="";

String sfkyqpcStyle="";
String sfkyqpcRead="";

String zcsfjsStyle="";
String zcjeRead="";
String zcjsblRead="";
String zcjsjeRead="";

String sfkclfkStyle="";
String sfkclfkRead="";

String sfkclyfStyle="";
String sfkclyfRead="";

String sfkzckkStyle="";
String sfkzckkRead="";

String sfjzcjlStyle="";
String sfjzcjlRead="";

String sfkfkjeStyle="";
String sfkfkjeRead="";

String sfjjljeStyle="";
String sfjjljeRead="";

String sfjqtjeStyle="";
String sfjqtjeRead="";
//根据结算参数设置确定行是否显示＝＝＝＝＝＝＝

String yfjeStr="";
String jsjszeStr="结算基数";//结算基数总额计算方式

String jsjlh=request.getParameter("jsjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,sgd,sgbz,htgcf,htqtsf,gcfzjx,qtsfzjx,qtfsm,htsgcb,zjxsgcb,ljclf,ljrgf,ssk,jsyh,khpck,yqf,khqk,jsjs,htjsjs,zjxjsjs,sdljsfs,sdlqz,sdlje,sdljsbl,sdljsje,zjxjffs,zjxbhfw,zjxsjd,ljzjxxs,ljzjxje,zxxs,zxje,jxxs,jxje,sfkyqpc,kyqf,kkhpck,kkhqk,zcsfjs,zcjehqfs,zcjsblkg,zcjsbl,zcje,zcjsje,jsjsze,jsbl,tzjsbl,jsje,rgfjse,flfjse,sfkclk,clf,sfkgdyp,gdyp,sfkyfgf,yfgf,sfkzbj,kzbjjs,kzbjbl,kzbj,sfkclfk,clfk,sfkclyf,clyf,sfkzckk,zckk,sfjzcjl,zcjl,sfkfkje,fkje,sfjjlje,jlje,sfjqtje,qtje,yfje,jsrq,spzt,spr,spsj,spyj,lrr,lrsj,lrbm,bz,jsjsxjje,zbjce ";
	ls_sql+=" from  cw_sgdwgjsty";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		htgcf=rs.getDouble("htgcf");
		htqtsf=rs.getDouble("htqtsf");
		gcfzjx=rs.getDouble("gcfzjx");
		qtsfzjx=rs.getDouble("qtsfzjx");
		qtfsm=cf.fillNull(rs.getString("qtfsm"));
		htsgcb=rs.getDouble("htsgcb");
		zjxsgcb=rs.getDouble("zjxsgcb");
		ljclf=rs.getDouble("ljclf");
		ljrgf=rs.getDouble("ljrgf");
		ssk=rs.getDouble("ssk");
		jsyh=rs.getDouble("jsyh");
		khpck=rs.getDouble("khpck");
		yqf=rs.getDouble("yqf");
		khqk=rs.getDouble("khqk");
		jsjs=cf.fillNull(rs.getString("jsjs"));
		htjsjs=rs.getDouble("htjsjs");
		zjxjsjs=rs.getDouble("zjxjsjs");
		sdljsfs=cf.fillNull(rs.getString("sdljsfs"));
		sdlqz=cf.fillNull(rs.getString("sdlqz"));
		sdlje=rs.getDouble("sdlje");
		sdljsbl=rs.getDouble("sdljsbl");
		sdljsje=rs.getDouble("sdljsje");
		zjxjffs=cf.fillNull(rs.getString("zjxjffs"));
		zjxbhfw=cf.fillNull(rs.getString("zjxbhfw"));
		zjxsjd=cf.fillNull(rs.getString("zjxsjd"));
		ljzjxxs=rs.getDouble("ljzjxxs");
		ljzjxje=rs.getDouble("ljzjxje");
		zxxs=rs.getDouble("zxxs");
		zxje=rs.getDouble("zxje");
		jxxs=rs.getDouble("jxxs");
		jxje=rs.getDouble("jxje");
		sfkyqpc=cf.fillNull(rs.getString("sfkyqpc"));
		kyqf=rs.getDouble("kyqf");
		kkhpck=rs.getDouble("kkhpck");
		kkhqk=rs.getDouble("kkhqk");
		zcsfjs=cf.fillNull(rs.getString("zcsfjs"));
		zcjehqfs=cf.fillNull(rs.getString("zcjehqfs"));
		zcjsblkg=cf.fillNull(rs.getString("zcjsblkg"));
		zcjsbl=rs.getDouble("zcjsbl");
		zcje=rs.getDouble("zcje");
		zcjsje=rs.getDouble("zcjsje");
		jsjsze=rs.getDouble("jsjsze");
		jsbl=rs.getDouble("jsbl");
		tzjsbl=rs.getDouble("tzjsbl");
		jsje=rs.getDouble("jsje");
		rgfjse=rs.getDouble("rgfjse");
		flfjse=rs.getDouble("flfjse");
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		clf=rs.getDouble("clf");
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));
		gdyp=rs.getDouble("gdyp");
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));
		yfgf=rs.getDouble("yfgf");
		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));
		kzbjjs=cf.fillNull(rs.getString("kzbjjs"));
		kzbjbl=rs.getDouble("kzbjbl");
		kzbj=rs.getDouble("kzbj");
		sfkclfk=cf.fillNull(rs.getString("sfkclfk"));
		clfk=rs.getDouble("clfk");
		sfkclyf=cf.fillNull(rs.getString("sfkclyf"));
		clyf=rs.getDouble("clyf");
		sfkzckk=cf.fillNull(rs.getString("sfkzckk"));
		zckk=rs.getDouble("zckk");
		sfjzcjl=cf.fillNull(rs.getString("sfjzcjl"));
		zcjl=rs.getDouble("zcjl");
		sfkfkje=cf.fillNull(rs.getString("sfkfkje"));
		fkje=rs.getDouble("fkje");
		sfjjlje=cf.fillNull(rs.getString("sfjjlje"));
		jlje=rs.getDouble("jlje");
		sfjqtje=cf.fillNull(rs.getString("sfjqtje"));
		qtje=rs.getDouble("qtje");
		yfje=rs.getDouble("yfje");
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		spzt=cf.fillNull(rs.getString("spzt"));
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spyj=cf.fillNull(rs.getString("spyj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		jsjsxjje=rs.getDouble("jsjsxjje");
		zbjce=rs.getDouble("zbjce");
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,hth,sjs,khjl,sgd,sgbz,zjxm,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,sjwjrq,gcjdbm,crm_khxx.dwbh,dwmc,zjxxh,gdjsjd,fgsbh";
	ls_sql+=" ,qye,zhljzjx,cwsfke  ,zhgczjf,guanlif,suijin,zhqtsf,zhwjrqyexm,sjf    ,zhzjxje,zjxguanlif,zjxsuijin,zhqtsfzjx,zhwjrzjx,zhsjfzjx";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khjl=cf.fillNull(rs.getString("khjl"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));

		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));

		qye=rs.getDouble("qye");
		zhljzjx=rs.getDouble("zhljzjx");
		cwsfke=rs.getDouble("cwsfke");

		zhgczjf=rs.getDouble("zhgczjf");
		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");
		zhqtsf=rs.getDouble("zhqtsf");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		sjf=rs.getDouble("sjf");

		zhzjxje=rs.getDouble("zhzjxje");
		zjxguanlif=rs.getDouble("zjxguanlif");
		zjxsuijin=rs.getDouble("zjxsuijin");
		zhqtsfzjx=rs.getDouble("zhqtsfzjx");
		zhwjrzjx=rs.getDouble("zhwjrzjx");
		zhsjfzjx=rs.getDouble("zhsjfzjx");
	}
	rs.close();
	ps.close();


	if (sgd.equals(""))//1:交齐中期结算资料
	{
		out.println("<BR>！！！错误，无施工队");
		return;
	}

	if (!gdjsjd.equals("Y"))//1:交齐中期结算资料
	{
		out.println("<BR>！！！错误，结算进度不正确");
		return;
	}

	//根据结算参数设置确定行是否显示＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
	{
		sdlStyle="none";
		sdlblRead="readonly";
		sdljeRead="readonly";
	}
	else if (sdljsfs.equals("2"))
	{
		sdlStyle="block";
		sdlblRead="readonly";
		sdljeRead="readonly";
	}
	else if (sdljsfs.equals("3"))
	{
		sdlStyle="block";
		sdlblRead="";
		sdljeRead="readonly";
	}
	else if (sdljsfs.equals("4"))
	{
		sdlStyle="block";
		sdlblRead="readonly";
		sdljeRead="";
	}

	if (zjxjffs.equals("1"))//1:不奖罚；2:累计增减项金额；3:累计增减项施工成本；4:增项金额减项金额；5: 增项施工成本减项施工成本；6:增项施工成本减项金额；7: 增项金额减项施工成本
	{
		zjxfsStyle="none";
		zjxStyle="none";
		zjxRead="readonly";
		zxStyle="none";
		zxRead="readonly";
		jxStyle="none";
		jxRead="readonly";
	}
	else if (zjxjffs.equals("2"))
	{
		zjxfsStyle="block";
		zjxStyle="block";
		zjxRead="readonly";
		zxStyle="none";
		zxRead="readonly";
		jxStyle="none";
		jxRead="readonly";
	}
	else if (zjxjffs.equals("3"))
	{
		zjxfsStyle="block";
		zjxStyle="block";
		zjxRead="readonly";
		zxStyle="none";
		zxRead="readonly";
		jxStyle="none";
		jxRead="readonly";
	}
	else if (zjxjffs.equals("4"))
	{
		zjxfsStyle="block";
		zjxStyle="none";
		zjxRead="readonly";
		zxStyle="block";
		zxRead="readonly";
		jxStyle="block";
		jxRead="readonly";
	}
	else if (zjxjffs.equals("5"))
	{
		zjxfsStyle="block";
		zjxStyle="none";
		zjxRead="readonly";
		zxStyle="block";
		zxRead="readonly";
		jxStyle="block";
		jxRead="readonly";
	}
	else if (zjxjffs.equals("6"))
	{
		zjxfsStyle="block";
		zjxStyle="none";
		zjxRead="readonly";
		zxStyle="block";
		zxRead="readonly";
		jxStyle="block";
		jxRead="readonly";
	}
	else if (zjxjffs.equals("7"))
	{
		zjxfsStyle="block";
		zjxStyle="none";
		zjxRead="readonly";
		zxStyle="block";
		zxRead="readonly";
		jxStyle="block";
		jxRead="readonly";
	}

	if (sfkclk.equals("Y"))//Y：是；N：否
	{
		sfkclkStyle="block";
		sfkclkRead="readonly";
	}
	else if (sfkclk.equals("N"))
	{
		sfkclkStyle="none";
		sfkclkRead="readonly";
	}

	if (sfkgdyp.equals("Y"))//Y：是；N：否
	{
		sfkgdypStyle="block";
		sfkgdypRead="readonly";
	}
	else if (sfkgdyp.equals("N"))
	{
		sfkgdypStyle="none";
		sfkgdypRead="readonly";
	}

	if (sfkyfgf.equals("Y"))//Y：是；N：否
	{
		sfkyfgfStyle="block";
		sfkyfgfRead="readonly";
	}
	else if (sfkyfgf.equals("N"))
	{
		sfkyfgfStyle="none";
		sfkyfgfRead="readonly";
	}

	if (sfkzbj.equals("Y"))//Y:扣质保金比例不可改；M:扣质保金比例可改；N:不扣质保金
	{
		sfkzbjStyle="block";
		sfkzbjRead="readonly";
	}
	else if (sfkzbj.equals("M"))
	{
		sfkzbjStyle="block";
		sfkzbjRead="";
	}
	else if (sfkzbj.equals("N"))
	{
		sfkzbjStyle="none";
		sfkzbjRead="readonly";
	}


	if (sfkyqpc.equals("Y"))//Y：自动获取；S：人工录入；N：否
	{
		sfkyqpcStyle="block";
		sfkyqpcRead="readonly";
	}
	else if (sfkyqpc.equals("S"))
	{
		sfkyqpcStyle="block";
		sfkyqpcRead="";
	}
	else if (sfkyqpc.equals("N"))
	{
		sfkyqpcStyle="none";
		sfkyqpcRead="readonly";
	}

	if (zcsfjs.equals("1"))//主材是否结算  1：不结算；2：按比例结算；3：人工录入
	{
		zcsfjsStyle="none";
		zcjeRead="readonly";
		zcjsblRead="readonly";
		zcjsjeRead="readonly";
	}
	else if (zcsfjs.equals("2"))
	{
		zcsfjsStyle="block";
		if (zcjehqfs.equals("2"))//主材金额获取方式  1：自动获取；2：人工录入
		{
			zcjeRead="";
		}
		else{
			zcjeRead="readonly";
		}

		if (zcjehqfs.equals("1"))//主材结算比例可修改  1：可修改；2：不可修改
		{
			zcjsblRead="";
		}
		else{
			zcjsblRead="readonly";
		}

		zcjsjeRead="readonly";
	}
	else if (zcsfjs.equals("3"))
	{
		zcsfjsStyle="block";
		if (zcjehqfs.equals("2"))//主材金额获取方式  1：自动获取；2：人工录入
		{
			zcjeRead="";
		}
		else{
			zcjeRead="readonly";
		}

		zcjsblRead="readonly";
		zcjsjeRead="";
	}


	if (sfkclfk.equals("Y"))//Y：自动获取；S：人工录入；N：否
	{
		sfkclfkStyle="block";
		sfkclfkRead="readonly";
	}
	else if (sfkclfk.equals("S"))
	{
		sfkclfkStyle="block";
		sfkclfkRead="";
	}
	else if (sfkclfk.equals("N"))
	{
		sfkclfkStyle="none";
		sfkclfkRead="readonly";
	}

	if (sfkclyf.equals("Y"))//Y：自动获取；S：人工录入；N：否
	{
		sfkclyfStyle="block";
		sfkclyfRead="readonly";
	}
	else if (sfkclyf.equals("S"))
	{
		sfkclyfStyle="block";
		sfkclyfRead="";
	}
	else if (sfkclyf.equals("N"))
	{
		sfkclyfStyle="none";
		sfkclyfRead="readonly";
	}

	if (sfkzckk.equals("Y"))//Y：自动获取；S：人工录入；N：否
	{
		sfkzckkStyle="block";
		sfkzckkRead="readonly";
	}
	else if (sfkzckk.equals("S"))
	{
		sfkzckkStyle="block";
		sfkzckkRead="";
	}
	else if (sfkzckk.equals("N"))
	{
		sfkzckkStyle="none";
		sfkzckkRead="readonly";
	}

	if (sfjzcjl.equals("Y"))//Y：自动获取；S：人工录入；N：否
	{
		sfjzcjlStyle="block";
		sfjzcjlRead="readonly";
	}
	else if (sfkzckk.equals("S"))
	{
		sfjzcjlStyle="block";
		sfjzcjlRead="";
	}
	else if (sfkzckk.equals("N"))
	{
		sfjzcjlStyle="none";
		sfjzcjlRead="readonly";
	}



	if (sfkfkje.equals("Y"))//Y：自动获取；S：人工录入；N：否
	{
		sfkfkjeStyle="block";
		sfkfkjeRead="readonly";
	}
	else if (sfkfkje.equals("S"))
	{
		sfkfkjeStyle="block";
		sfkfkjeRead="";
	}
	else if (sfkfkje.equals("N"))
	{
		sfkfkjeStyle="none";
		sfkfkjeRead="readonly";
	}

	if (sfjjlje.equals("Y"))//Y：自动获取；S：人工录入；N：否
	{
		sfjjljeStyle="block";
		sfjjljeRead="readonly";
	}
	else if (sfjjlje.equals("S"))
	{
		sfjjljeStyle="block";
		sfjjljeRead="";
	}
	else if (sfjjlje.equals("N"))
	{
		sfjjljeStyle="none";
		sfjjljeRead="readonly";
	}

	if (sfjqtje.equals("Y"))//Y：自动获取；S：人工录入；N：否
	{
		sfjqtjeStyle="block";
		sfjqtjeRead="readonly";
	}
	else if (sfjqtje.equals("S"))
	{
		sfjqtjeStyle="block";
		sfjqtjeRead="";
	}
	else if (sfjqtje.equals("N"))
	{
		sfjqtjeStyle="none";
		sfjqtjeRead="readonly";
	}
	//根据结算参数设置确定行是否显示＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	if (!sdljsfs.equals("1"))//水电路结算方式  1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
	{
		jsjszeStr+="＋水电路结算金额";
	}
	if (!zjxjffs.equals("1"))//增减项奖罚方式  1:不奖罚；2: 累计折后增减项金额；3:累计增减项施工成本；4: 折后增项金额减项金额；5: 增项施工成本减项施工成本；6:增项施工成本折后减项金额；7: 折后增项金额减项施工成本
	{
		jsjszeStr+="＋增减项奖罚";
	}
	if (!sfkyqpc.equals("N"))//是否扣延期费赔偿款  Y：自动获取；S：人工录入；N：否
	{
		jsjszeStr+="－延期费－赔偿款－客户欠款";
	}


	yfjeStr="应付金额＝结算总额";
	if (zcsfjs.equals("2"))//主材是否结算  1：不结算；2：按比例结算；3：人工录入
	{
		yfjeStr+="＋主材结算金额";
	}
	else if (zcsfjs.equals("3"))//主材是否结算  1：不结算；2：按比例结算；3：人工录入
	{
		yfjeStr+="＋主材结算金额";
	}

	if (sfkclk.equals("Y"))//是否扣材料款
	{
		yfjeStr+="－材料款";
	}
	if (sfkgdyp.equals("Y"))//是否扣工地用品
	{
		yfjeStr+="－工地用品";
	}
	if (sfkyfgf.equals("Y"))//是否扣已付工费
	{
		yfjeStr+="－已付工费";
	}
	//扣质保金
	if (!sfkzbj.equals("N"))//是否扣质保金  Y:扣质保金比例不可改；M:扣质保金比例可改；N:不扣质保金
	{
		if (zbjce>0)
		{
			yfjeStr+="－质保金(差额:"+zbjce+")";
		}
		else{
			yfjeStr+="－质保金(质保金已达标)";
		}
	}
	if (!sfkclfk.equals("N"))//是否扣辅材罚款  Y：自动获取；S：人工录入；N：否
	{
		yfjeStr+="－辅材罚款";
	}
	if (!sfkclyf.equals("N"))//是否扣材料运费  Y：自动获取；S：人工录入；N：否
	{
		yfjeStr+="－材料运费";
	}
	if (!sfkzckk.equals("N"))//是否扣主材扣款  Y：自动获取；S：人工录入；N：否
	{
		yfjeStr+="－主材扣款";
	}
	if (!sfjzcjl.equals("N"))//是否加主材奖励  Y：自动获取；S：人工录入；N：否
	{
		yfjeStr+="＋主材奖励";
	}
	if (!sfkfkje.equals("N"))//是否扣罚款金额  Y：自动获取；S：人工录入；N：否
	{
		yfjeStr+="－罚款金额";
	}
	if (!sfjjlje.equals("N"))//是否加奖励金额  Y：自动获取；S：人工录入；N：否
	{
		yfjeStr+="＋奖励金额";
	}
	if (!sfjqtje.equals("N"))//是否加其它金额  Y：自动获取；S：人工录入；N：否
	{
		yfjeStr+="＋其它金额";
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">拨工费记录号</td>
	<td  width="8%">拨工费次数</td>
	<td  width="7%">结算日期</td>
	<td  width="7%">合同金额</td>
	<td  width="6%">增减项金额</td>
	<td  width="8%">结算基数</td>
	<td  width="7%">结算基数总额</td>
	<td  width="4%">结算比例</td>
	<td  width="7%">结算金额</td>
	<td  width="5%">材料费</td>
	<td  width="5%">工地用品</td>
	<td  width="7%">实际拨款</td>
	<td  width="5%">录入人</td>
	<td  width="54%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_sgdbgfty.jsjlh,gdjsjdmc,cw_sgdbgfty.jsrq,TO_CHAR(cw_sgdbgfty.htje),TO_CHAR(cw_sgdbgfty.zjxje), DECODE(cw_sgdbgfty.jsjs,'1','工程费','2','工程费＋其它费','3','实收款总额','4','一期款','5','二期款','6','三期款','7','工程基础报价','8','工程基础报价＋其它费基础报价','9','最新工程施工成本价','A','最新工程施工成本价＋其它费施工成本','D','合同工程施工成本价','E','合同工程施工成本价＋其它费施工成本','B','工程成本价','C','工程成本价＋其它费成本'),TO_CHAR(cw_sgdbgfty.jsjsze),cw_sgdbgfty.jsbl||'%',TO_CHAR(cw_sgdbgfty.jsje),TO_CHAR(cw_sgdbgfty.clf),TO_CHAR(cw_sgdbgfty.gdyp),cw_sgdbgfty.sjbk,cw_sgdbgfty.lrr,cw_sgdbgfty.bz  ";
	ls_sql+=" FROM cw_sgdbgfty,dm_gdjsjd  ";
    ls_sql+=" where cw_sgdbgfty.gdjsjd=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_sgdbgfty.khbh='"+khbh+"'";
    ls_sql+=" order by cw_sgdbgfty.lrsj";
    pageObj.sql=ls_sql;
	pageObj.initPage("Cw_sgdbgftyCxList.jsp","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<form method="post" action="SaveShCw_sgdwgjsty.jsp" name="insertform" >
<div align="center">结算审核（结算记录号：<%=jsjlh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">质检姓名</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">施工队</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">客户经理</span></td>
    <td><%=khjl%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">建议交底日期</font></td>
    <td> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">合同开工日期</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">合同竣工日期</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF">
	<input type="button" onClick="window.open('/dzbj/dybj.jsp?khbh=<%=khbh%>')" value="电子报价">
    <input type="button" onClick="window.open('/khxx/ViewZxsgcbj.jsp?khbh=<%=khbh%>')"  value="最新施工成本价">
    <input type="button" onClick="window.open('/khxx/ViewZxSdl.jsp?khbh=<%=khbh%>')"  value="查看水电路">
        <input type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="验收记录">
        <input type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="付款信息">
        <input type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="领料单"></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">合同工程费</span></td>
  <td><%=htgcf%></td>
  <td align="right"><span class="STYLE4">工程费增减项</span></td>
  <td><%=gcfzjx%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">合同其它费</span></td>
  <td><%=htqtsf%></td>
  <td align="right"><span class="STYLE4">其它费增减项</span></td>
  <td><%=qtsfzjx%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">合同施工成本</span></td>
  <td><%=htsgcb%></td>
  <td align="right"><span class="STYLE4">增减项施工成本</span></td>
  <td><%=zjxsgcb%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">其它费说明</span></td>
  <td colspan="3"><%=qtfsm%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">累计材料费</span></td>
  <td><%=ljclf%></td>
  <td align="right"><span class="STYLE4">累计人工费</span></td>
  <td><%=ljrgf%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">实收款</span></td>
  <td><%=cwsfke%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">最新报价总额</span></td>
  <td><%=cf.round(qye+zhljzjx,2)%></td>
  <td colspan="2">最新报价总额=合同额+累计增减项</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td  align="right"><span class="STYLE4">应收金额</span></td>
  <td><%=cf.round(qye+zhljzjx-cwsfke,2)%></td>
  <td colspan="2">应收金额=最新报价总额-实收款</td>
  </tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">客户结算优惠</span></td>
  <td><input type="text" name="jsyh" value="<%=jsyh%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">客户赔偿款</span></td>
  <td><input type="text" name="khpck" value="<%=khpck%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">延期费</span></td>
  <td><input type="text" name="yqf" value="<%=yqf%>" size="20" maxlength="17" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">客户欠款</span></td>
  <td colspan="3"><input type="text" name="khqk" value="<%=khqk%>" size="20" maxlength="17" readonly>
    客户欠款=最新报价总额-结算优惠-客户赔偿款-延期费-实收款</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td  colspan="4" align="center" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">结算基数</span></td>
  <td colspan="3">
  <select name="jsjs" style="FONT-SIZE:12PX;WIDTH:512PX">
    <%
		cf.selectItem(out,"select jsjsbm,jsjsmc from dm_jsjsbm where jsjsbm='"+jsjs+"'",jsjs);
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>合同结算基数</span></td>
  <td><input type="text" name="htjsjs" value="<%=htjsjs%>" size="20" maxlength="17" readonly>  </td>
  <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>增减项结算基数</span></td>
  <td><input type="text" name="zjxjsjs" value="<%=zjxjsjs%>" size="20" maxlength="17" readonly>    </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sdlStyle%>">
  <td  colspan="4" align="center" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sdlStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">水电路结算方式</span></td>
  <td><%
	cf.radioToken(out, "sdljsfs","1+不独立结算&2+独立比例不可改&3+独立比例可改&4+手工录入结算金额",sdljsfs,true);
%>(<%=sdlqzStr%>)</td>
  <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>水电路结算比例</span></td>
  <td>
  <input type="text" name="sdljsbl" value="<%=sdljsbl%>" size="10" maxlength="9"  <%=sdlblRead%>>%  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sdlStyle%>">
  <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>水电路金额</span></td>
  <td><input type="text" name="sdlje" value="<%=sdlje%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">水电路结算金额</span></td>
  <td><input type="text" name="sdljsje" value="<%=sdljsje%>" size="15" maxlength="17"  <%=sdljeRead%>>
    水电路金额×水电路结算比例</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zjxfsStyle%>">
  <td  colspan="4" align="center" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zjxfsStyle%>">
  <td align="right"><font color="#FF0000">*</font>增减项奖罚方式</td>
  <td><%
	cf.radioToken(out, "zjxjffs","1+不奖罚&2+累计折后增减项金额&3+累计增减项施工成本&4+折后增项金额减项金额&5+增项施工成本减项施工成本&6+增项施工成本折后减项金额&7+折后增项金额减项施工成本",zjxjffs,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zxStyle%>">
  <td align="right">增减项包含范围</td>
  <td><%
	cf.radioToken(out, "zjxbhfw","1+工程&2+其它费&3+工程＋其它费<br>&4+工程(含水电)&5+工程＋其它费(含水电)",zjxbhfw,true);
%></td>
  <td align="right">增减项时间点</td>
  <td><%
	cf.radioToken(out, "zjxsjd","1+全部&2+开工前&3+开工后",zjxsjd,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zxStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">增项系数</span></td>
  <td><input name="zxxs" type="text" value="<%=zxxs%>" size="20" maxlength="17"  <%=zxRead%>></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">增项金额</span></td>
  <td><input type="text" name="zxje" value="<%=zxje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=jxStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">减项系数</span></td>
  <td><input type="text" name="jxxs" value="<%=jxxs%>" size="20" maxlength="17"  <%=jxRead%>></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">减项金额</span></td>
  <td><input type="text" name="jxje" value="<%=jxje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zjxStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">累计增减项系数</span></td>
  <td><input type="text" name="ljzjxxs" value="<%=ljzjxxs%>" size="20" maxlength="17"  <%=zjxRead%>></td>
  <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>累计增减项金额</span></td>
  <td><input type="text" name="ljzjxje" value="<%=ljzjxje%>" size="20" maxlength="17" ></td>
</tr>

<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td align="right">是否扣延期费赔偿款</td>
  <td><%
	cf.radioToken(out, "sfkyqpc","Y+自动获取&S+人工录入&N+否",sfkyqpc,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td align="right"><font color="#FF0000">*</font>扣延期费</td>
  <td><input type="text" name="kyqf" value="<%=yqf%>" size="20" maxlength="17"  <%=sfkyqpcRead%> onChange="jsValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>扣客户赔偿款</td>
  <td><input type="text" name="kkhpck" value="<%=khpck%>" size="20" maxlength="17"  <%=sfkyqpcRead%> onChange="jsValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td align="right"><font color="#FF0000">*</font>扣客户欠款</td>
  <td><input type="text" name="kkhqk" value="<%=khqk%>" size="20" maxlength="17"  <%=sfkyqpcRead%> onChange="jsValue(insertform)"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">结算基数总额</span></td>
  <td colspan="3"><input type="text" name="jsjsze" value="<%=jsjsze%>" size="20" maxlength="17" readonly>
    结算基数总额=<%=jsjszeStr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">结算比例</span></td>
  <td><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" readonly>    
    % </td>
  <td align="right"><font color="#FF0000">*</font>调整结算比例</td>
  <td><input type="text" name="tzjsbl" value="<%=tzjsbl%>" size="10" maxlength="9" onChange="jsValue(insertform)">
% </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">结算总额</span></td>
  <td colspan="3"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" readonly>
    <span class="STYLE5"><span class="STYLE2">结算总额</span>＝<span class="STYLE4">结算基数总额</span>×（<span class="STYLE4">结算比例</span>＋<span class="STYLE4">调整结算比例</span>）</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">人工费结算额</td>
  <td><input type="text" name="rgfjse" value="<%=rgfjse%>" size="20" maxlength="17" readonly></td>
  <td align="right">辅料费结算额</td>
  <td><input type="text" name="flfjse" value="<%=flfjse%>" size="20" maxlength="17" readonly></td>
</tr>

<tr bgcolor="#FFFFFF" style="display:<%=zcsfjsStyle%>">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zcsfjsStyle%>">
  <td align="right">主材是否结算</td>
  <td><%
	cf.radioToken(out, "zcsfjs","1+不结算&2+按比例结算&3+人工录入",zcsfjs,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zcsfjsStyle%>">
  <td align="right"><font color="#FF0000">*</font>主材金额获取方式</td>
  <td><%
	cf.radioToken(out, "zcjehqfs","1+自动获取&2+人工录入",zcjehqfs,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>主材结算比例可修改</td>
  <td><%
	cf.radioToken(out, "zcjsblkg","1+可修改&2+不可修改",zcjsblkg,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zcsfjsStyle%>">
  <td align="right"><font color="#FF0000">*</font>主材金额</td>
  <td><input type="text" name="zcje" value="<%=zcje%>" size="20" maxlength="17"  <%=zcjeRead%> onChange="jsValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>主材结算比例</td>
  <td><input type="text" name="zcjsbl" value="<%=zcjsbl%>" size="20" maxlength="17"  <%=zcjsblRead%> onChange="jsValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zcsfjsStyle%>">
  <td align="right"><font color="#FF0000">*</font>主材结算金额</td>
  <td><input type="text" name="zcjsje" value="<%=zcjsje%>" size="20" maxlength="17"  <%=zcjsjeRead%> onChange="jsValue(insertform)"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkclkStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>是否扣材料款</span></td>
  <td><%
	cf.radioToken(out, "sfkclk","Y+是&N+否",sfkclk,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">材料费</span></td>
  <td><input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17"  <%=sfkclkRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkgdypStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">是否扣工地用品</span></td>
  <td><%
	cf.radioToken(out, "sfkgdyp","Y+是&N+否",sfkgdyp,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">工地用品</span></td>
  <td><input type="text" name="gdyp" value="<%=gdyp%>" size="20" maxlength="17"  <%=sfkgdypRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyfgfStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">是否扣已付工费</span></td>
  <td><%
	cf.radioToken(out, "sfkyfgf","Y+是&N+否",sfkyfgf,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">已付工费</span></td>
  <td><input name="yfgf" type="text" value="<%=yfgf%>" size="20" maxlength="17"  <%=sfkyfgfRead%>></td>
</tr>

<tr bgcolor="#FFFFFF" style="display:<%=sfkzbjStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">是否扣质保金</span></td>
  <td><%
	cf.radioToken(out, "sfkzbj","Y+扣质保金比例不可改&M+扣质保金比例可改&N+不扣质保金",sfkzbj,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">扣质保金</span></td>
  <td><input type="text" name="kzbj" value="<%=kzbj%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkzbjStyle%>">
  <td align="right" width="18%"><font color="#FF0000">*</font>应扣质保金比例</td> 
  <td width="32%"> 
    <input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="9" <%=sfkzbjRead%> onChange="jsValue(insertform)">
    % </td>
  <td align="right" width="18%">扣质保金基数</td> 
  <td width="32%"><%
	cf.radioToken(out, "kzbjjs","1+结算基数&2+结算总额",kzbjjs,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkclfkStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>是否扣辅材罚款</span></td>
  <td><%
	cf.radioToken(out, "sfkclfk","Y+自动获取&S+人工录入&N+否",sfkclfk,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>辅材罚款</td>
  <td><input type="text" name="clfk" value="<%=clfk%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfkclfkRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkclyfStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>是否扣材料运费</span></td>
  <td><%
	cf.radioToken(out, "sfkclyf","Y+自动获取&S+人工录入&N+否",sfkclyf,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>材料运费</td>
  <td><input type="text" name="clyf" value="<%=clyf%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfkclyfRead%> ></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkzckkStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>是否扣主材扣款</span></td>
  <td><%
	cf.radioToken(out, "sfkzckk","Y+自动获取&S+人工录入&N+否",sfkzckk,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>主材扣款</td>
  <td><input type="text" name="zckk" value="<%=zckk%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfkzckkRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfjzcjlStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>是否加主材奖励</span></td>
  <td><%
	cf.radioToken(out, "sfjzcjl","Y+自动获取&S+人工录入&N+否",sfjzcjl,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>主材奖励</td>
  <td><input type="text" name="zcjl" value="<%=zcjl%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfjzcjlRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkfkjeStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>是否扣罚款金额</span></td>
  <td><%
	cf.radioToken(out, "sfkfkje","Y+自动获取&S+人工录入&N+否",sfkfkje,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>罚款金额</td>
  <td><input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfkfkjeRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfjjljeStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>是否加奖励金额</span></td>
  <td><%
	cf.radioToken(out, "sfjjlje","Y+自动获取&S+人工录入&N+否",sfjjlje,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>奖励金额</td>
  <td><input type="text" name="jlje" value="<%=jlje%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfjjljeRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfjqtjeStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>是否加其它金额</span></td>
  <td><%
	cf.radioToken(out, "sfjqtje","Y+自动获取&S+人工录入&N+否",sfjqtje,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>其它金额</td>
  <td><input type="text" name="qtje" value="<%=qtje%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfjqtjeRead%>></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">应付金额</span></td>
  <td colspan="3"><input type="text" name="yfje" value="<%=yfje%>" size="20" maxlength="17" readonly></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td height="29" align="right">&nbsp;</td>
  <td colspan="3"><%=yfjeStr%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">结算日期</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea>  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="button" onClick="window.open('dyjsd.jsp?jsjlh=<%=jsjlh%>')"  value="打印结算单">
	<input type="reset"  value="重输" name="reset">
	<input type="hidden" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>
    <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
    <input type="hidden" name="sgd" value="<%=sgd%>" size="20" maxlength="20" readonly>
    <input type="hidden" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>

    <input type="hidden" name="htgcf" value="<%=htgcf%>" >
    <input type="hidden" name="htqtsf" value="<%=htqtsf%>" >
    <input type="hidden" name="gcfzjx" value="<%=gcfzjx%>" >
    <input type="hidden" name="qtsfzjx" value="<%=qtsfzjx%>" >
    <input type="hidden" name="qtfsm" value="<%=qtfsm%>" >
    <input type="hidden" name="htsgcb" value="<%=htsgcb%>" >
    <input type="hidden" name="zjxsgcb" value="<%=zjxsgcb%>" >
    <input type="hidden" name="ljclf" value="<%=ljclf%>" >
    <input type="hidden" name="ljrgf" value="<%=ljrgf%>" >
    <input type="hidden" name="ssk" value="<%=ssk%>" >	
    <input type="hidden" name="sdlqz" value="<%=sdlqz%>" >	
    <input type="hidden" name="jsjsxjje" value="<%=jsjsxjje%>" >	
    <input type="hidden" name="zbjce" value="<%=zbjce%>" >	
	</td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function jsValue(FormName)//参数FormName:Form的名称
{
	//计算：结算基数总额＋＋＋＋＋＋＋＋＋开始
	var jsjsze=<%=jsjsxjje%>;
	if ("<%=sdljsfs%>"=="2")//水电路结算方式  1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
	{
		jsjsze=round(jsjsze+FormName.sdljsje.value*1.0,2);
	}
	else if ("<%=sdljsfs%>"=="3")//水电路结算方式  1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
	{
		var sdljsje=FormName.sdlje.value/100.0*FormName.sdljsbl.value
		sdljsje=round(sdljsje,2);
		FormName.sdljsje.value=sdljsje;

		jsjsze=round(jsjsze+FormName.sdljsje.value*1.0,2);
	}
	else if ("<%=sdljsfs%>"=="4")//水电路结算方式  1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
	{
		jsjsze=round(jsjsze+FormName.sdljsje.value*1.0,2);
	}

	if ("<%=zjxjffs%>"!="1")//增减项奖罚方式  1:不奖罚；2: 累计折后增减项金额；3:累计增减项施工成本；4: 折后增项金额减项金额；5: 增项施工成本减项施工成本；6:增项施工成本折后减项金额；7: 折后增项金额减项施工成本
	{
		//如果选择不同的计算方式，不需要项金额为0 ，可以三项直接相加
		jsjsze=round(jsjsze + <%=zxje*zxxs+jxje*jxxs+ljzjxxs*ljzjxje%>,2);
	}

	if ("<%=sfkyqpc%>"!="N")//是否扣延期费赔偿款  Y：自动获取；S：人工录入；N：否
	{
		jsjsze=round(jsjsze-FormName.kkhqk.value*1.0-FormName.kkhpck.value*1.0-FormName.kyqf.value*1.0,2);
	}

	jsjsze=round(jsjsze,2);
	FormName.jsjsze.value=jsjsze;
	//计算：结算基数总额＝＝＝＝＝＝＝＝＝＝＝结束

	//结算金额=结算基数总额×（结算比例＋调整结算比例）
	var jsje=FormName.jsjsze.value/100*(FormName.jsbl.value*1.0+FormName.tzjsbl.value*1.0);//结算金额
	jsje=round(jsje,2);
	FormName.jsje.value=jsje;


	//计算：应付金额＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	var yfje=FormName.jsje.value*1.0;//实际拨款

	if ("<%=zcsfjs%>"=="2")//主材是否结算  1：不结算；2：按比例结算；3：人工录入
	{
		var zcjsje=round(FormName.zcje.value/100.0*FormName.zcjsbl.value,2);
		zcjsje=round(zcjsje,2);
		FormName.zcjsje.value=zcjsje;

		yfje=yfje+FormName.zcjsje.value*1.0;
	}
	else if ("<%=zcsfjs%>"=="3")//主材是否结算  1：不结算；2：按比例结算；3：人工录入
	{
		yfje=yfje+FormName.zcjsje.value*1.0;
	}

	
	if ("<%=sfkclk%>"=="Y")//是否扣材料款
	{
		yfje=yfje-FormName.clf.value*1.0;
	}
	if ("<%=sfkgdyp%>"=="Y")//是否扣工地用品
	{
		yfje=yfje-FormName.gdyp.value*1.0;
	}
	if ("<%=sfkyfgf%>"=="Y")//是否扣已付工费
	{
		yfje=yfje-FormName.yfgf.value*1.0;
	}


	//扣质保金
	if ("<%=sfkzbj%>"!="N")//是否扣质保金  Y:扣质保金比例不可改；M:扣质保金比例可改；N:不扣质保金
	{
		var kzbj=0;
		if ("<%=kzbjjs%>"=="1")//扣质保金基数  1：结算基数总额；2：结算总额
		{
			kzbj=round(FormName.jsjsze.value/100.0*FormName.kzbjbl.value,2);//扣质保金
		}
		else{
			kzbj=round(FormName.jsje.value/100.0*FormName.kzbjbl.value,2);//扣质保金
		}

		if (<%=zbjce%> > 0)
		{
			if (kzbj><%=zbjce%>)//质保金达标后不再扣除
			{
				kzbj=<%=zbjce%>;
			}
		}
		else{
			kzbj=0;
		}

		FormName.kzbj.value=kzbj;

		yfje=yfje-kzbj;
	}

	if ("<%=sfkclfk%>"!="N")//是否扣辅材罚款  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje-FormName.clfk.value/1.0;
	}
	if ("<%=sfkclyf%>"!="N")//是否扣材料运费  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje-FormName.clyf.value/1.0;
	}
	if ("<%=sfkzckk%>"!="N")//是否扣主材扣款  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje-FormName.zckk.value/1.0;
	}
	if ("<%=sfjzcjl%>"!="N")//是否加主材奖励  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje+FormName.zcjl.value/1.0;
	}
	if ("<%=sfkfkje%>"!="N")//是否扣罚款金额  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje-FormName.fkje.value/1.0;
	}
	if ("<%=sfjjlje%>"!="N")//是否加奖励金额  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje+FormName.jlje.value/1.0;
	}
	if ("<%=sfjqtje%>"!="N")//是否加其它金额  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje+FormName.qtje.value/1.0;
	}

	yfje=round(yfje,2);
	FormName.yfje.value=yfje;
	//计算：应付金额＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

}

function f_do(FormName)//参数FormName:Form的名称
{
	jsValue(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[结算记录号]！");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请输入[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.htgcf)=="") {
		alert("请输入[合同工程额]！");
		FormName.htgcf.focus();
		return false;
	}
	if(!(isFloat(FormName.htgcf, "合同工程额"))) {
		return false;
	}
	if(	javaTrim(FormName.htqtsf)=="") {
		alert("请输入[合同其它收费]！");
		FormName.htqtsf.focus();
		return false;
	}
	if(!(isFloat(FormName.htqtsf, "合同其它收费"))) {
		return false;
	}
	if(	javaTrim(FormName.gcfzjx)=="") {
		alert("请输入[工程费增减项]！");
		FormName.gcfzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.gcfzjx, "工程费增减项"))) {
		return false;
	}
	if(	javaTrim(FormName.qtsfzjx)=="") {
		alert("请输入[其它费增减项]！");
		FormName.qtsfzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.qtsfzjx, "其它费增减项"))) {
		return false;
	}
	if(	javaTrim(FormName.htsgcb)=="") {
		alert("请输入[合同工施工成本]！");
		FormName.htsgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.htsgcb, "合同工施工成本"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxsgcb)=="") {
		alert("请输入[增减项施工成本]！");
		FormName.zjxsgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxsgcb, "增减项施工成本"))) {
		return false;
	}
	if(	javaTrim(FormName.ljclf)=="") {
		alert("请输入[累计材料费]！");
		FormName.ljclf.focus();
		return false;
	}
	if(!(isFloat(FormName.ljclf, "累计材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.ljrgf)=="") {
		alert("请输入[累计人工费]！");
		FormName.ljrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.ljrgf, "累计人工费"))) {
		return false;
	}
	if(	javaTrim(FormName.ssk)=="") {
		alert("请输入[实收款]！");
		FormName.ssk.focus();
		return false;
	}
	if(!(isFloat(FormName.ssk, "实收款"))) {
		return false;
	}
	if(	javaTrim(FormName.jsyh)=="") {
		alert("请输入[客户结算优惠]！");
		FormName.jsyh.focus();
		return false;
	}
	if(!(isFloat(FormName.jsyh, "客户结算优惠"))) {
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
	if(	javaTrim(FormName.yqf)=="") {
		alert("请输入[延期费]！");
		FormName.yqf.focus();
		return false;
	}
	if(!(isFloat(FormName.yqf, "延期费"))) {
		return false;
	}
	if(	javaTrim(FormName.khqk)=="") {
		alert("请输入[客户欠款]！");
		FormName.khqk.focus();
		return false;
	}
	if(!(isFloat(FormName.khqk, "客户欠款"))) {
		return false;
	}
	if(	javaTrim(FormName.jsjs)=="") {
		alert("请输入[结算基数]！");
		FormName.jsjs.focus();
		return false;
	}
	if(	javaTrim(FormName.htjsjs)=="") {
		alert("请输入[合同结算基数]！");
		FormName.htjsjs.focus();
		return false;
	}
	if(!(isFloat(FormName.htjsjs, "合同结算基数"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxjsjs)=="") {
		alert("请输入[增减项结算基数]！");
		FormName.zjxjsjs.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxjsjs, "增减项结算基数"))) {
		return false;
	}
	if(	javaTrim(FormName.sdljsfs)=="") {
		alert("请输入[水电路结算方式]！");
		FormName.sdljsfs.focus();
		return false;
	}
	if(	javaTrim(FormName.sdlje)=="") {
		alert("请输入[水电路金额]！");
		FormName.sdlje.focus();
		return false;
	}
	if(!(isFloat(FormName.sdlje, "水电路金额"))) {
		return false;
	}
	if(	javaTrim(FormName.sdljsbl)=="") {
		alert("请输入[水电路结算比例]！");
		FormName.sdljsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sdljsbl, "水电路结算比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sdljsje)=="") {
		alert("请输入[水电路结算金额]！");
		FormName.sdljsje.focus();
		return false;
	}
	if(!(isFloat(FormName.sdljsje, "水电路结算金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxjffs)=="") {
		alert("请输入[增减项奖罚方式]！");
		FormName.zjxjffs.focus();
		return false;
	}
	if(	javaTrim(FormName.ljzjxxs)=="") {
		alert("请输入[累计增减项系数]！");
		FormName.ljzjxxs.focus();
		return false;
	}
	if(!(isFloat(FormName.ljzjxxs, "累计增减项系数"))) {
		return false;
	}
	if(	javaTrim(FormName.ljzjxje)=="") {
		alert("请输入[累计增减项]！");
		FormName.ljzjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.ljzjxje, "累计增减项"))) {
		return false;
	}
	if(	javaTrim(FormName.zxxs)=="") {
		alert("请输入[增项系数]！");
		FormName.zxxs.focus();
		return false;
	}
	if(!(isFloat(FormName.zxxs, "增项系数"))) {
		return false;
	}
	if(	javaTrim(FormName.zxje)=="") {
		alert("请输入[增项金额]！");
		FormName.zxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zxje, "增项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jxxs)=="") {
		alert("请输入[减项系数]！");
		FormName.jxxs.focus();
		return false;
	}
	if(!(isFloat(FormName.jxxs, "减项系数"))) {
		return false;
	}
	if(	javaTrim(FormName.jxje)=="") {
		alert("请输入[减项金额]！");
		FormName.jxje.focus();
		return false;
	}
	if(!(isFloat(FormName.jxje, "减项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkyqpc)=="") {
		alert("请输入[是否扣延期费赔偿款]！");
		FormName.sfkyqpc.focus();
		return false;
	}
	if(	javaTrim(FormName.kyqf)=="") {
		alert("请输入[扣延期费]！");
		FormName.kyqf.focus();
		return false;
	}
	if(!(isFloat(FormName.kyqf, "扣延期费"))) {
		return false;
	}
	if(	javaTrim(FormName.kkhpck)=="") {
		alert("请输入[扣客户赔偿款]！");
		FormName.kkhpck.focus();
		return false;
	}
	if(!(isFloat(FormName.kkhpck, "扣客户赔偿款"))) {
		return false;
	}
	if(	javaTrim(FormName.kkhqk)=="") {
		alert("请输入[扣客户欠款]！");
		FormName.kkhqk.focus();
		return false;
	}
	if(!(isFloat(FormName.kkhqk, "扣客户欠款"))) {
		return false;
	}
	if(	javaTrim(FormName.zcsfjs)=="") {
		alert("请输入[主材是否结算]！");
		FormName.zcsfjs.focus();
		return false;
	}
	if(	javaTrim(FormName.zcjsbl)=="") {
		alert("请输入[主材结算比例]！");
		FormName.zcjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjsbl, "主材结算比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zcje)=="") {
		alert("请输入[主材金额]！");
		FormName.zcje.focus();
		return false;
	}
	if(!(isFloat(FormName.zcje, "主材金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zcjsje)=="") {
		alert("请输入[主材结算金额]！");
		FormName.zcjsje.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjsje, "主材结算金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jsjsze)=="") {
		alert("请输入[结算基数总额]！");
		FormName.jsjsze.focus();
		return false;
	}
	if(!(isFloat(FormName.jsjsze, "结算基数总额"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("请输入[结算比例]！");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "结算比例"))) {
		return false;
	}
	if(	javaTrim(FormName.tzjsbl)=="") {
		alert("请输入[调整结算比例]！");
		FormName.tzjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tzjsbl, "调整结算比例"))) {
		return false;
	}


	
	if(	javaTrim(FormName.jsje)=="") {
		alert("请输入[结算总额]！");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "结算总额"))) {
		return false;
	}
	if(	javaTrim(FormName.rgfjse)=="") {
		alert("请输入[人工费结算额]！");
		FormName.rgfjse.focus();
		return false;
	}
	if(!(isFloat(FormName.rgfjse, "人工费结算额"))) {
		return false;
	}
	if(	javaTrim(FormName.flfjse)=="") {
		alert("请输入[辅料费结算额]！");
		FormName.flfjse.focus();
		return false;
	}
	if(!(isFloat(FormName.flfjse, "辅料费结算额"))) {
		return false;
	}

	if(	javaTrim(FormName.sfkclk)=="") {
		alert("请输入[是否扣材料款]！");
		FormName.sfkclk.focus();
		return false;
	}
	if(	javaTrim(FormName.clf)=="") {
		alert("请输入[材料费]！");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkgdyp)=="") {
		alert("请输入[是否扣工地用品]！");
		FormName.sfkgdyp.focus();
		return false;
	}
	if(	javaTrim(FormName.gdyp)=="") {
		alert("请输入[工地用品]！");
		FormName.gdyp.focus();
		return false;
	}
	if(!(isFloat(FormName.gdyp, "工地用品"))) {
		return false;
	}


	
	if(	javaTrim(FormName.sfkyfgf)=="") {
		alert("请输入[是否扣已付工费]！");
		FormName.sfkyfgf.focus();
		return false;
	}
	if(	javaTrim(FormName.yfgf)=="") {
		alert("请输入[已付工费]！");
		FormName.yfgf.focus();
		return false;
	}
	if(!(isFloat(FormName.yfgf, "已付工费"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkzbj)=="") {
		alert("请输入[是否扣质保金]！");
		FormName.sfkzbj.focus();
		return false;
	}
	if(	javaTrim(FormName.kzbjbl)=="") {
		alert("请输入[扣质保金比例]！");
		FormName.kzbjbl.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "扣质保金比例"))) {
		return false;
	}
	if(	javaTrim(FormName.kzbj)=="") {
		alert("请输入[扣质保金]！");
		FormName.kzbj.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbj, "扣质保金"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkclfk)=="") {
		alert("请输入[是否扣辅材罚款]！");
		FormName.sfkclfk.focus();
		return false;
	}
	if(	javaTrim(FormName.clfk)=="") {
		alert("请输入[辅材罚款]！");
		FormName.clfk.focus();
		return false;
	}
	if(!(isFloat(FormName.clfk, "辅材罚款"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkclyf)=="") {
		alert("请输入[是否扣材料运费]！");
		FormName.sfkclyf.focus();
		return false;
	}
	if(	javaTrim(FormName.clyf)=="") {
		alert("请输入[材料运费]！");
		FormName.clyf.focus();
		return false;
	}
	if(!(isFloat(FormName.clyf, "材料运费"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkzckk)=="") {
		alert("请输入[是否扣主材扣款]！");
		FormName.sfkzckk.focus();
		return false;
	}
	if(	javaTrim(FormName.zckk)=="") {
		alert("请输入[主材扣款]！");
		FormName.zckk.focus();
		return false;
	}
	if(!(isFloat(FormName.zckk, "主材扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.sfjzcjl)=="") {
		alert("请输入[是否加主材奖励]！");
		FormName.sfjzcjl.focus();
		return false;
	}
	if(	javaTrim(FormName.zcjl)=="") {
		alert("请输入[主材奖励]！");
		FormName.zcjl.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjl, "主材奖励"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkfkje)=="") {
		alert("请输入[是否扣罚款金额]！");
		FormName.sfkfkje.focus();
		return false;
	}
	if(	javaTrim(FormName.fkje)=="") {
		alert("请输入[罚款金额]！");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "罚款金额"))) {
		return false;
	}
	if(	javaTrim(FormName.sfjjlje)=="") {
		alert("请输入[是否加奖励金额]！");
		FormName.sfjjlje.focus();
		return false;
	}
	if(	javaTrim(FormName.jlje)=="") {
		alert("请输入[奖励金额]！");
		FormName.jlje.focus();
		return false;
	}
	if(!(isFloat(FormName.jlje, "奖励金额"))) {
		return false;
	}
	if(	javaTrim(FormName.sfjqtje)=="") {
		alert("请输入[是否加其它金额]！");
		FormName.sfjqtje.focus();
		return false;
	}
	if(	javaTrim(FormName.qtje)=="") {
		alert("请输入[其它金额]！");
		FormName.qtje.focus();
		return false;
	}
	if(!(isFloat(FormName.qtje, "其它金额"))) {
		return false;
	}
	if(	javaTrim(FormName.yfje)=="") {
		alert("请输入[应付金额]！");
		FormName.yfje.focus();
		return false;
	}
	if(!(isFloat(FormName.yfje, "应付金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jsrq)=="") {
		alert("请输入[结算日期]！");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "结算日期"))) {
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
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
