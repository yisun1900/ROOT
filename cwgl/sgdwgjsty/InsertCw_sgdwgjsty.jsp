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
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

//客户基本信息
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String khjl=null;
String sgd="";
String sgbz=null;
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

double sgcbj=0;
double zxsgcbj=0;
double zxclf=0;
double zxrgf=0;
double khpck=0;
double yqf=0;
double jsyh=0;

double khqk=0;//客户欠款
double htgcf=0;//合同工程额
double gcfzjx=0;//工程费增减项
double htqtsf=0;//合同其它费
double qtsfzjx=0;//其它费增减项
String qtfsm="";//其它费说明
double htsgcb=0;//合同工施工成本
double zjxsgcb=0;//增减项施工成本

double ljclf=0;//累计材料费
double ljrgf=0;//累计人工费

//结算参数
String bfcs=null;//拨付次数
String bfjs=null;//拨付基数
double bfbl=0;//拨付比例
String sgdjbxg=null;//是否与施工队级别相关

String sdljsfs=null;//水电路结算方式
String sdlqz="";//水电路取值
String sdlqzStr="";//水电路取值
double sdlbfbl=0;//水电路拨付比例
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


/*
*/

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



String yfjeStr="";
String jsjszeStr="结算基数";//结算基数总额计算方式


double yqzbj=0;//要求质保金
double zbj=0;//累计质保金
double zbjce=0;//质保金差额


String jsjlh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

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

	ls_sql="select sfxmmc";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qtfsm+=rs.getString(1)+"、";
	}
	rs.close();
	ps.close();

	ls_sql="select sgcbj,zxsgcbj,zxclf,zxrgf,khpck,yqf,jsyh";
	ls_sql+=" from crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgcbj=rs.getDouble("sgcbj");
		zxsgcbj=rs.getDouble("zxsgcbj");
		zxclf=rs.getDouble("zxclf");
		zxrgf=rs.getDouble("zxrgf");
		khpck=rs.getDouble("khpck");
		yqf=rs.getDouble("yqf");
		jsyh=rs.getDouble("jsyh");
	}
	rs.close();
	ps.close();

	ls_sql="select yqzbj,zbj";
	ls_sql+=" from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yqzbj=rs.getDouble("yqzbj");//要求质保金
		zbj=rs.getDouble("zbj");//累计质保金
	}
	rs.close();
	ps.close();

	if (zbj<yqzbj)
	{
		zbjce=cf.round(yqzbj-zbj,2);//质保金差额
	}


	//客户欠款
	khqk=cf.round(qye+zhljzjx-jsyh-khpck-yqf-cwsfke,2);

	htgcf=zhgczjf;//合同工程额
	gcfzjx=zhzjxje;//工程费增减项

	htqtsf=zhqtsf+zhwjrqyexm+guanlif+suijin+sjf;//合同其它费
	qtsfzjx=zhqtsfzjx+zhwjrzjx+zjxguanlif+zjxsuijin+zhsjfzjx;//其它费增减项

	htsgcb=sgcbj;//合同工施工成本
	zjxsgcb=zxsgcbj;//增减项施工成本

	ljclf=zxclf;//累计材料费
	ljrgf=zxrgf;//累计人工费

	if (sgd.equals(""))//1:交齐中期结算资料
	{
		out.println("<BR>！！！错误，无施工队");
		return;
	}

	if (!gdjsjd.equals("X"))//1:交齐中期结算资料
	{
		out.println("<BR>！！！错误，结算进度不正确");
		return;
	}


	//施工队结算参数表
	ls_sql="select bfcs,bfjs,bfbl,sgdjbxg   ,sdljsfs,sdlqz,DECODE(sdlqz,'1','折前','2','折后','3','施工成本价') sdlqzStr,sdlbfbl,zjxjffs,ljzjxxs,zxxs,jxxs,zjxbhfw,zjxsjd,sfkyqpc,zcsfjs,zcjehqfs,zcjsblkg,zcjsbl";
	ls_sql+="  ,sfkzbj,kzbjjs,kzbjbl,sfkclk,sfkgdyp,sfkyfgf  ,sfkclfk,sfkclyf,sfkzckk,sfjzcjl,sfkfkje,sfjjlje,sfjqtje";
	ls_sql+=" from  dm_sgdjscsb";
	ls_sql+=" where fgsbh='"+fgsbh+"' and sfwgjs='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bfcs=rs.getString("bfcs");//拨付次数
		bfjs=rs.getString("bfjs");//拨付基数
		bfbl=rs.getDouble("bfbl");//拨付比例
		sgdjbxg=cf.fillNull(rs.getString("sgdjbxg"));//是否与施工队级别相关

		sdljsfs=cf.fillNull(rs.getString("sdljsfs"));//水电路结算方式
		sdlqz=cf.fillNull(rs.getString("sdlqz"));//水电路取值
		sdlqzStr=cf.fillNull(rs.getString("sdlqzStr"));//水电路取值
		sdlbfbl=rs.getDouble("sdlbfbl");//水电路拨付比例
		zjxjffs=cf.fillNull(rs.getString("zjxjffs"));//增减项奖罚方式
		ljzjxxs=rs.getDouble("ljzjxxs");//累计增减项系数
		zxxs=rs.getDouble("zxxs");//增项系数
		jxxs=rs.getDouble("jxxs");//减项系数
		zjxbhfw=cf.fillNull(rs.getString("zjxbhfw"));//增减项包含范围
		zjxsjd=cf.fillNull(rs.getString("zjxsjd"));//增减项时间点
		sfkyqpc=cf.fillNull(rs.getString("sfkyqpc"));//是否扣延期费赔偿款
		zcsfjs=cf.fillNull(rs.getString("zcsfjs"));//主材是否结算
		zcjehqfs=cf.fillNull(rs.getString("zcjehqfs"));//主材金额获取方式
		zcjsblkg=cf.fillNull(rs.getString("zcjsblkg"));//主材结算比例可修改
		zcjsbl=rs.getDouble("zcjsbl");//主材结算比例

		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));//是否扣质保金
		kzbjjs=cf.fillNull(rs.getString("kzbjjs"));//扣质保金基数
		kzbjbl=rs.getDouble("kzbjbl");//扣质保金比例
		sfkclk=cf.fillNull(rs.getString("sfkclk"));//是否扣材料款
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));//是否扣工地用品
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));//是否扣已付工费

		sfkclfk=cf.fillNull(rs.getString("sfkclfk"));//是否扣辅材罚款
		sfkclyf=cf.fillNull(rs.getString("sfkclyf"));//是否扣材料运费
		sfkzckk=cf.fillNull(rs.getString("sfkzckk"));//是否扣主材扣款
		sfjzcjl=cf.fillNull(rs.getString("sfjzcjl"));//是否加主材奖励
		sfkfkje=cf.fillNull(rs.getString("sfkfkje"));//是否扣罚款金额
		sfjjlje=cf.fillNull(rs.getString("sfjjlje"));//是否加奖励金额
		sfjqtje=cf.fillNull(rs.getString("sfjqtje"));//是否加其它金额
	}
	rs.close();
	ps.close();

	if (bfjs==null)
	{
		out.println("错误！无【结算参数设置】，不能进行结算");
		return;
	}

	//结算基数
	jsjs=bfjs;
	//结算比例
	jsbl=bfbl;

	if (sgdjbxg.equals("Y"))//Y：是；N：否
	{
		String sgdjbbm=null;
		ls_sql="select sgdjbbm";
		ls_sql+=" from  sq_sgd";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
		}
		rs.close();
		ps.close();

		String zyfw=null;
		double jbjsbl=0;
		ls_sql="select jsbl,zyfw";
		ls_sql+=" from  dm_jbtjsbl";
		ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs="+bfcs+" and sgdjbbm='"+sgdjbbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jbjsbl=rs.getDouble("jsbl");
			zyfw=cf.fillNull(rs.getString("zyfw"));//作用范围  1：全部；2：影响工程直接费；3：影响其它收费

			jsbl=jbjsbl;
		}
		else{
			rs.close();
			ps.close();
			out.println("错误！无【施工队级别调结算比例】，不能进行结算:"+ls_sql);
			return;
		}
		rs.close();
		ps.close();
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



	//材料单
	ls_sql="select sum(pszje)";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where khbh='"+khbh+"' and psdzt in('2','3','5')";
	//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clf=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	//工地用品领用记录
	ls_sql="select sum(je)";
	ls_sql+=" from  cw_gdyplyjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";//0：未结算；1：已结算
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gdyp=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//已付工费
	ls_sql="select sum(sjbk)";
	ls_sql+=" from  cw_sgdbgfty";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfgf=rs.getDouble(1);
	}
	rs.close();
	ps.close();




	//获取：合同结算基数、增减项结算基数＋＋＋＋＋＋＋＋＋＋＋开始	
	double htje=0;
	double zjxje=0;
	
	//1：合同工程费、2：合同工程费＋其它费、J：最新工程费、K：最新工程费＋其它费、3：实收款总额、4：一期款、5：二期款、6：三期款、7：合同工程基础报价、8：合同工程基础报价＋其它费基础报价、L：最新工程基础报价、M：最新工程基础报价＋其它费基础报价、9：最新工程施工成本价、A：最新工程施工成本价＋其它费施工成本、D：合同工程施工成本价、E：合同工程施工成本价＋其它费施工成本、B：合同工程成本价、C：合同工程成本价＋其它费成本、N：最新工程成本价、O：最新工程成本价＋其它费成本、F：合同人工费、G：最新人工费、H：合同材料费、I：最新材料费
	if (bfjs.equals("1"))//1：合同工程费
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();
			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();
			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//结算基数总额
	}
	else if (bfjs.equals("1"))//J：最新工程费
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();
			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();
			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("2"))//2：合同工程费＋其它费
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(sfje)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(sfje)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//结算基数总额
	}
	else if (bfjs.equals("K"))//K：最新工程费＋其它费
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(sfje)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(sfje)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("3"))//3：实收款总额
	{
		htje=0;
		zjxje=0;

		jsjsxjje=cwsfke;//结算基数总额
	}
	else if (bfjs.equals("4"))//4：一期款
	{
		htje=0;
		zjxje=0;

		double fk=0;
		ls_sql="select sum(fkje) ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='11' and fkcs=1";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fk=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		jsjsxjje=fk;//结算基数总额
	}
	else if (bfjs.equals("5"))//5：二期款
	{
		htje=0;
		zjxje=0;

		double fk=0;
		ls_sql="select sum(fkje) ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='11' and fkcs=2";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fk=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		jsjsxjje=fk;//结算基数总额
	}
	else if (bfjs.equals("6"))//6：三期款
	{
		htje=0;
		zjxje=0;

		double fk=0;
		ls_sql="select sum(fkje) ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='11' and fkcs=3";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fk=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		jsjsxjje=fk;//结算基数总额
	}
	else if (bfjs.equals("7"))//7：合同工程基础报价
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//结算基数总额
	}
	else if (bfjs.equals("L"))//L：最新工程基础报价
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("8"))//8：合同工程基础报价＋其它费基础报价
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}



		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//结算基数总额
	}
	else if (bfjs.equals("M"))//M：最新工程基础报价＋其它费基础报价
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}



		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("D"))//D：合同工程施工成本价
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//结算基数总额
	}
	else if (bfjs.equals("9"))//9：最新工程施工成本价
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("E"))//E：合同工程施工成本价＋其它费施工成本
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//结算基数总额
	}
	else if (bfjs.equals("A"))//A：最新工程施工成本价＋其它费施工成本
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("B"))//B：合同工程成本价
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//结算基数总额
	}
	else if (bfjs.equals("N"))//N：最新工程成本价
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("C"))//C：合同工程成本价＋其它费成本
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//结算基数总额
	}
	else if (bfjs.equals("O"))//O：最新工程成本价＋其它费成本
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
			ls_sql+=" and sfxmlx not in('D','E')";//水电
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx not in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("F"))//F：合同人工费
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.rgdj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.rgdj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.rgdj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.rgdj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//结算基数总额
	}
	else if (bfjs.equals("G"))//G：最新人工费
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.rgdj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.rgdj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.rgdj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.rgdj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("H"))//H：合同材料费
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cldj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cldj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cldj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cldj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//结算基数总额
	}
	else if (bfjs.equals("I"))//I：最新材料费
	{
		if (sdljsfs.equals("1"))//1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
		{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cldj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cldj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}
		else{
			//合同工程费施工成本
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cldj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//增减项工程费施工成本
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//最新施工成本
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cldj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//结算基数总额
	}
	else
	{
		out.println("错误！【拨付基数】设置不正确："+bfjs);
		return;
	}

	htjsjs=htje;//合同结算基数
	zjxjsjs=zjxje;//增减项结算基数
	//获取：合同结算基数、增减项结算基数＝＝＝＝＝＝＝＝＝＝＝结束	


	//获取:水电路金额＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	if (sdljsfs.equals("2") || sdljsfs.equals("3"))//水电路结算方式  1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
	{
		if (zjxxh==null || zjxxh.equals(""))
		{
			if (sdlqz.equals("1"))//水电路取值  1：折前；2：折后；3：施工成本价
			{
				ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.zqdj)";
				ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
				ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
				ls_sql+=" and bj_bjxmmx.xmflbm='01'";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//水电路金额，算做工程费
				ls_sql="SELECT sum(zqsfje)";
				ls_sql+=" FROM bj_sfxmmx";
				ls_sql+=" where khbh='"+khbh+"' and sfxmlx in('D','E')";
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；D：水电路；E：水电路预收；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}
			else if (sdlqz.equals("2"))//水电路取值  1：折前；2：折后；3：施工成本价
			{
				ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
				ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
				ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
				ls_sql+=" and bj_bjxmmx.xmflbm='01'";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//水电路金额，算做工程费
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmx";
				ls_sql+=" where khbh='"+khbh+"' and sfxmlx in('D','E')";
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；D：水电路；E：水电路预收；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}
			else{
				//合同工程费施工成本
				ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
				ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
				ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
				ls_sql+=" and bj_bjxmmx.xmflbm='01'";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					sdlje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmx";
				ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmx";
				ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}
		}
		else{//有增减项
			if (sdlqz.equals("1"))//水电路取值  1：折前；2：折后；3：施工成本价
			{
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and bj_bjxmmxh.xmflbm='01'";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//水电路金额，算做工程费
				ls_sql="SELECT sum(zqsfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfxmlx in('D','E')";
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；D：水电路；E：水电路预收；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}
			else if (sdlqz.equals("2"))//水电路取值  1：折前；2：折后；3：施工成本价
			{
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and bj_bjxmmxh.xmflbm='01'";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//水电路金额，算做工程费
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfxmlx in('D','E')";
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；D：水电路；E：水电路预收；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}
			else{
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and bj_bjxmmxh.xmflbm='01'";//01：水电部分
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					sdlje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//其它收费项目明细
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
				ls_sql+=" and sfxmlx in('D','E')";//水电
				//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}
		}//是否有增减项

		sdlje=cf.round(sdlje,2);

		sdljsje=sdlje*sdlbfbl/100;
		sdljsje=cf.round(sdljsje,2);//水电路金额
	}
	//获取:水电路金额＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束



	//计算：增减项＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	ljzjxje=0;//累计增减项
	zxje=0;//增项金额
	jxje=0;//减项金额

	if (!zjxxh.equals(""))//发生增减项
	{
		String getzjxxh="";//开工前最后一次增减项，为空表示没有
		if (!gcjdbm.equals("0"))//1：未开工；2：工程开工；6：隐蔽工程完成；3：中期验收；4：工程完工；5：工程完结；7：合同异常终止
		{
			ls_sql="select zjxxh";
			ls_sql+=" from  crm_zjxdj";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ls_sql+=" and fssj<TO_DATE('"+sjkgrq+"','YYYY-MM-DD')";//开工后
			ls_sql+=" order by zjxxh desc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getzjxxh=cf.fillNull(rs.getString("zjxxh"));
			}
			rs.close();
			ps.close();
		}



		//工程增项，不含水电路＋＋＋＋＋＋＋＋＋＋开始
		double gczxsgcbj=0;//工程增项施工成本价
		double gczxzhje=0;//工程增项折后金额


		String xmbh="";
		double sgcbdj=0;
		double dj=0;
		double sl=0;

		if (zjxsjd.equals("1") || zjxsjd.equals("3"))//增减项时间点  1:全部；2:开工前；3:开工后
		{
			ls_sql="select bj_bjxmmxh.xmbh,bj_bjxmmxh.sgcbj,bj_bjxmmxh.dj,sum(bj_gclmxh.sl) sl";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
			ls_sql+=" group by bj_bjxmmxh.xmbh,bj_bjxmmxh.sgcbj,bj_bjxmmxh.dj";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				xmbh=rs.getString("xmbh");
				sgcbdj=rs.getDouble("sgcbj");
				dj=rs.getDouble("dj");
				sl=rs.getDouble("sl");

				double qsl=0;//开工前数量

				if (zjxsjd.equals("1"))//增减项时间点  1:全部；2:开工前；3:开工后
				{
					//合同信息
					ls_sql="select sum(sl) sl";
					ls_sql+=" from  bj_gclmx";
					ls_sql+=" where  khbh='"+khbh+"'";
					ls_sql+=" and  xmbh='"+xmbh+"'";
				}
				else//增减项时间点 3:开工后
				{
					if (getzjxxh.equals(""))//开工前无增减项，取合同
					{
						//合同信息
						ls_sql="select sum(sl) sl";
						ls_sql+=" from  bj_gclmx";
						ls_sql+=" where  khbh='"+khbh+"'";
						ls_sql+=" and  xmbh='"+xmbh+"'";
					}
					else{//开工前有增减项
						ls_sql="select sum(sl) sl";
						ls_sql+=" from  bj_gclmxh";
						ls_sql+=" where  zjxxh='"+getzjxxh+"'";
						ls_sql+=" and  xmbh='"+xmbh+"'";
					}
				}

				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					qsl=rs1.getDouble("sl");
				}
				rs1.close();
				ps1.close();


				if (sl>qsl)//增项
				{
					gczxsgcbj+=sgcbdj*(sl-qsl);
					gczxsgcbj=cf.round(gczxsgcbj,2);

					gczxzhje+=dj*(sl-qsl);
					gczxzhje=cf.round(gczxzhje,2);
				}
			}
			rs.close();
			ps.close();
		}
		else{//增减项时间点 2:开工前 
			if (!getzjxxh.equals(""))//开工前有增减项
			{
				ls_sql="select bj_bjxmmxh.xmbh,bj_bjxmmxh.sgcbj,bj_bjxmmxh.dj,sum(bj_gclmxh.sl) sl";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+getzjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ls_sql+=" group by bj_bjxmmxh.xmbh,bj_bjxmmxh.sgcbj,bj_bjxmmxh.dj ";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					xmbh=rs.getString("xmbh");
					sgcbdj=rs.getDouble("sgcbj");
					dj=rs.getDouble("dj");
					sl=rs.getDouble("sl");

					double qsl=0;//开工前数量

					//合同信息
					ls_sql="select sum(sl) sl";
					ls_sql+=" from  bj_gclmx";
					ls_sql+=" where  khbh='"+khbh+"'";
					ls_sql+=" and  xmbh='"+xmbh+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						qsl=rs1.getDouble("sl");
					}
					rs1.close();
					ps1.close();


					if (sl>qsl)//增项
					{
						gczxsgcbj+=sgcbdj*(sl-qsl);
						gczxsgcbj=cf.round(gczxsgcbj,2);

						gczxzhje+=dj*(sl-qsl);
						gczxzhje=cf.round(gczxzhje,2);
					}
				}
				rs.close();
				ps.close();
			}//开工前有增减项

		}
		//工程增项，不含水电路＝＝＝＝＝＝＝＝＝＝结束


		//工程减项，不含水电路＋＋＋＋＋＋＋＋＋＋开始
		double gcjxsgcbj=0;//工程减项施工成本价
		double gcjxzhje=0;//工程减项折后金额

		xmbh="";
		sgcbdj=0;
		dj=0;
		sl=0;
		if (zjxsjd.equals("1"))//增减项时间点  1:全部；2:开工前；3:开工后
		{
			//工程项目减项，不含水电路＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="select bj_bjxmmx.xmbh,bj_bjxmmx.sgcbj,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
			ls_sql+=" group by bj_bjxmmx.xmbh,bj_bjxmmx.sgcbj,bj_bjxmmx.dj";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				xmbh=rs.getString("xmbh");
				sgcbdj=rs.getDouble("sgcbj");
				dj=rs.getDouble("dj");
				sl=rs.getDouble("sl");

				//最后增减项
				double hsl=0;
				ls_sql="select sum(sl) sl";
				ls_sql+=" from  bj_gclmxh";
				ls_sql+=" where  zjxxh='"+zjxxh+"'";
				ls_sql+=" and  xmbh='"+xmbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					hsl=rs1.getDouble("sl");
				}
				rs1.close();
				ps1.close();

				if (sl>hsl)//减项
				{
					gcjxsgcbj+=dj*(sl-hsl);
					gcjxsgcbj=cf.round(gcjxsgcbj,2);

					gcjxzhje+=dj*(sl-hsl);
					gcjxzhje=cf.round(gcjxzhje,2);
				}
			}
			rs.close();
			ps.close();
		}
		else if (zjxsjd.equals("3"))//增减项时间点  1:全部；2:开工前；3:开工后
		{
			//工程项目减项，不含水电路＋＋＋＋＋＋＋＋＋＋开始
			if (getzjxxh.equals(""))//开工前无增减项，取合同
			{
				ls_sql="select bj_bjxmmx.xmbh,bj_bjxmmx.sgcbj,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl";
				ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
				ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
				ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
				ls_sql+=" group by bj_bjxmmx.xmbh,bj_bjxmmx.sgcbj,bj_bjxmmx.dj ";
			}
			else{//开工前有增减项
				ls_sql="select bj_bjxmmxh.xmbh,bj_bjxmmxh.sgcbj,bj_bjxmmxh.dj,sum(bj_gclmxh.sl) sl";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+getzjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01：水电部分
				ls_sql+=" group by bj_bjxmmxh.xmbh,bj_bjxmmxh.sgcbj,bj_bjxmmxh.dj ";
			}
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				xmbh=rs.getString("xmbh");
				sgcbdj=rs.getDouble("sgcbj");
				dj=rs.getDouble("dj");
				sl=rs.getDouble("sl");

				//最后增减项
				double hsl=0;
				ls_sql="select sum(sl) sl";
				ls_sql+=" from  bj_gclmxh";
				ls_sql+=" where  zjxxh='"+zjxxh+"'";
				ls_sql+=" and  xmbh='"+xmbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					hsl=rs1.getDouble("sl");
				}
				rs1.close();
				ps1.close();

				if (sl>hsl)//减项
				{
					gcjxsgcbj+=dj*(sl-hsl);
					gcjxsgcbj=cf.round(gcjxsgcbj,2);

					gcjxzhje+=dj*(sl-hsl);
					gcjxzhje=cf.round(gcjxzhje,2);
				}
			}
			rs.close();
			ps.close();
		}
		else{//增减项时间点 2:开工前 
			//工程项目减项，不含水电路＋＋＋＋＋＋＋＋＋＋开始
			if (!getzjxxh.equals(""))//开工前有增减项
			{
				ls_sql="select bj_bjxmmx.xmbh,bj_bjxmmx.sgcbj,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl";
				ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
				ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
				ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01：水电部分
				ls_sql+=" group by bj_bjxmmx.xmbh,bj_bjxmmx.sgcbj,bj_bjxmmx.dj ";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					xmbh=rs.getString("xmbh");
					sgcbdj=rs.getDouble("sgcbj");
					dj=rs.getDouble("dj");
					sl=rs.getDouble("sl");

					//最后增减项
					double hsl=0;
					ls_sql="select sum(sl) sl";
					ls_sql+=" from  bj_gclmxh";
					ls_sql+=" where  zjxxh='"+getzjxxh+"'";
					ls_sql+=" and  xmbh='"+xmbh+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						hsl=rs1.getDouble("sl");
					}
					rs1.close();
					ps1.close();

					if (sl>hsl)//减项
					{
						gcjxsgcbj+=dj*(sl-hsl);
						gcjxsgcbj=cf.round(gcjxsgcbj,2);

						gcjxzhje+=dj*(sl-hsl);
						gcjxzhje=cf.round(gcjxzhje,2);
					}
				}
				rs.close();
				ps.close();
			}//开工前有增减项
		}

		//工程减项，不含水电路＝＝＝＝＝＝＝＝＝＝结束



		//水电路＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

		// 最新水电路
		double sdlsgcb_zx=0;//施工成本
		double sdlzhje_zx=0;//折后金额
		ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj),sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
		ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" and bj_bjxmmxh.xmflbm='01'";//01：水电部分
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sdlsgcb_zx=rs.getDouble(1);
			sdlzhje_zx=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		//水电路金额，算做工程费
		ls_sql="SELECT sum(zqsfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后;3:不记入
		ls_sql+=" and sfxmlx in('D','E')";
		//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；D：水电路；E：水电路预收；9：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sdlsgcb_zx+=rs.getDouble(1);
			sdlzhje_zx+=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT sum(sfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ls_sql+=" and cbjjsfs='2' ";//1:折前;2:折后;3:不记入
		ls_sql+=" and sfxmlx in('D','E')";
		//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sdlsgcb_zx+=rs.getDouble(1);
			sdlzhje_zx+=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		sdlsgcb_zx=cf.round(sdlsgcb_zx,2);
		sdlzhje_zx=cf.round(sdlzhje_zx,2);



		//合同水电路
		double sdlsgcb_ht=0;//施工成本
		double sdlzhje_ht=0;//折后金额
		//合同信息
		ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj),sum(bj_gclmx.sl*bj_bjxmmx.dj)";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" and bj_bjxmmx.xmflbm='01'";//01：水电部分
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sdlsgcb_ht=rs.getDouble(1);
			sdlzhje_ht=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		//其它收费项目明细
		ls_sql="SELECT sum(zqsfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
		ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后;3:不记入
		ls_sql+=" and sfxmlx in('D','E')";
		//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sdlsgcb_ht+=rs.getDouble(1);
			sdlzhje_ht+=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT sum(sfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
		ls_sql+=" and cbjjsfs='2' ";//1:折前;2:折后;3:不记入
		ls_sql+=" and sfxmlx in('D','E')";
		//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sdlsgcb_ht+=rs.getDouble(1);
			sdlzhje_ht+=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		sdlsgcb_ht=cf.round(sdlsgcb_ht,2);
		sdlzhje_ht=cf.round(sdlzhje_ht,2);

		//开工前水电路
		double sdlsgcb_kgq=0;//开工前施工成本
		double sdlzhje_kgq=0;//开工前折后金额
		if (getzjxxh.equals(""))//开工前无增减项，取合同
		{
			sdlsgcb_kgq=sdlsgcb_ht;
			sdlzhje_kgq=sdlzhje_ht;
		}
		else{//开工前有增减项
			ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj),sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmxh.zjxxh='"+getzjxxh+"'";
			ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ls_sql+=" and bj_bjxmmxh.xmflbm='01'";//01：水电部分
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sdlsgcb_kgq=rs.getDouble(1);
				sdlzhje_kgq=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			//水电路金额，算做工程费
			ls_sql="SELECT sum(zqsfje*sgcbjbfb/100),sum(sfje)";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+getzjxxh+"'";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后;3:不记入
			ls_sql+=" and sfxmlx in('D','E')";
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；D：水电路；E：水电路预收；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sdlsgcb_kgq+=rs.getDouble(1);
				sdlzhje_kgq+=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*sgcbjbfb/100),sum(sfje)";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+getzjxxh+"'";
			ls_sql+=" and cbjjsfs='2' ";//1:折前;2:折后;3:不记入
			ls_sql+=" and sfxmlx in('D','E')";
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sdlsgcb_kgq+=rs.getDouble(1);
				sdlzhje_kgq+=rs.getDouble(2);
			}
			rs.close();
			ps.close();
		}

		sdlsgcb_kgq=cf.round(sdlsgcb_kgq,2);
		sdlzhje_kgq=cf.round(sdlzhje_kgq,2);

		double sdlsgcb=0;//水电路增减施工成本
		double sdlzhje=0;//水电路增减金额

		if (zjxsjd.equals("1"))//增减项时间点  1:全部；2:开工前；3:开工后
		{
			sdlsgcb=sdlsgcb_zx-sdlsgcb_ht;
			sdlsgcb=cf.round(sdlsgcb,2);

			sdlzhje=sdlzhje_zx-sdlzhje_ht;
			sdlzhje=cf.round(sdlzhje,2);
		}
		else if (zjxsjd.equals("2"))//增减项时间点  1:全部；2:开工前；3:开工后
		{
			sdlsgcb=sdlsgcb_kgq-sdlsgcb_ht;
			sdlsgcb=cf.round(sdlsgcb,2);

			sdlzhje=sdlzhje_kgq-sdlzhje_ht;
			sdlzhje=cf.round(sdlzhje,2);
		}
		else//增减项时间点 3:开工后
		{
			sdlsgcb=sdlsgcb_zx-sdlsgcb_kgq;
			sdlsgcb=cf.round(sdlsgcb,2);

			sdlzhje=sdlzhje_zx-sdlzhje_kgq;
			sdlzhje=cf.round(sdlzhje,2);
		}

		//水电路＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


		//其它费施工成本，不含水电路＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

		//最新
		double qtfsgcb_zx=0;
		double qtfzhje_zx=0;
		ls_sql="SELECT sum(zqsfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后;3:不记入
		ls_sql+=" and sfxmlx not in('D','E')";
		//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；D：水电路；E：水电路预收；9：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qtfsgcb_zx=rs.getDouble(1);
			qtfzhje_zx=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT sum(sfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='2' ";//1:折前;2:折后;3:不记入
		ls_sql+=" and sfxmlx not in('D','E')";
		//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qtfsgcb_zx+=rs.getDouble(1);
			qtfzhje_zx+=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		qtfsgcb_zx=cf.round(qtfsgcb_zx,2);
		qtfzhje_zx=cf.round(qtfzhje_zx,2);

		//合同
		double qtfsgcb_ht=0;
		double qtfzhje_ht=0;

		//水电路金额，算做工程费
		ls_sql="SELECT sum(zqsfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后;3:不记入
		ls_sql+=" and sfxmlx not in('D','E')";
		//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；D：水电路；E：水电路预收；9：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qtfsgcb_ht=rs.getDouble(1);
			qtfzhje_ht=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT sum(sfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='2' ";//1:折前;2:折后;3:不记入
		ls_sql+=" and sfxmlx not in('D','E')";
		//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qtfsgcb_ht+=rs.getDouble(1);
			qtfzhje_ht+=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		qtfsgcb_ht=cf.round(qtfsgcb_ht,2);
		qtfzhje_ht=cf.round(qtfzhje_ht,2);

		//开工前
		double qtfsgcb_kgq=0;
		double qtfzhje_kgq=0;
		if (getzjxxh.equals(""))//开工前无增减项，取合同
		{
			qtfsgcb_kgq=qtfsgcb_zx;
			qtfzhje_kgq=qtfzhje_zx;
		}
		else{//开工前有增减项
			//水电路金额，算做工程费
			ls_sql="SELECT sum(zqsfje*sgcbjbfb/100),sum(sfje)";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+getzjxxh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后;3:不记入
			ls_sql+=" and sfxmlx not in('D','E')";
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；D：水电路；E：水电路预收；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				qtfsgcb_kgq=rs.getDouble(1);
				qtfzhje_kgq=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*sgcbjbfb/100),sum(sfje)";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+getzjxxh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='2' ";//1:折前;2:折后;3:不记入
			ls_sql+=" and sfxmlx not in('D','E')";
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				qtfsgcb_kgq+=rs.getDouble(1);
				qtfzhje_kgq+=rs.getDouble(2);
			}
			rs.close();
			ps.close();
		}

		qtfsgcb_kgq=cf.round(qtfsgcb_kgq,2);
		qtfzhje_kgq=cf.round(qtfzhje_kgq,2);

		double qtfsgcb=0;//其它收费增减施工成本
		double qtfzhje=0;//其它收费增减金额

		if (zjxsjd.equals("1"))//增减项时间点  1:全部；2:开工前；3:开工后
		{
			qtfsgcb=qtfsgcb_zx-qtfsgcb_ht;
			qtfsgcb=cf.round(qtfsgcb,2);

			qtfzhje=qtfzhje_zx-qtfzhje_ht;
			qtfzhje=cf.round(qtfzhje,2);
		}
		else if (zjxsjd.equals("2"))//增减项时间点  1:全部；2:开工前；3:开工后
		{
			qtfsgcb=qtfsgcb_kgq-qtfsgcb_ht;
			qtfsgcb=cf.round(qtfsgcb,2);

			qtfzhje=qtfzhje_kgq-qtfzhje_ht;
			qtfzhje=cf.round(qtfzhje,2);
		}
		else//增减项时间点 3:开工后
		{
			qtfsgcb=qtfsgcb_zx-qtfsgcb_kgq;
			qtfsgcb=cf.round(qtfsgcb,2);

			qtfzhje=qtfzhje_zx-qtfzhje_kgq;
			qtfzhje=cf.round(qtfzhje,2);
		}

		//其它费施工成本，不含水电路＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

		if (zjxjffs.equals("2"))//1:不奖罚；2: 累计折后增减项金额；3:累计增减项施工成本；4: 折后增项金额减项金额；5: 增项施工成本减项施工成本；6:增项施工成本折后减项金额；7: 折后增项金额减项施工成本
		{
			if (zjxbhfw.equals("1"))//1:工程；2:其它费；3:工程＋其它费；4:工程(含水电)；5:工程＋其它费(含水电)
			{
				ljzjxje=cf.round(gczxzhje-gcjxzhje,2);
			}
			else if (zjxbhfw.equals("2"))
			{
				ljzjxje=qtfzhje;
			}
			else if (zjxbhfw.equals("3"))
			{
				ljzjxje=cf.round(gczxzhje-gcjxzhje+qtfzhje,2);
			}
			else if (zjxbhfw.equals("4"))
			{
				ljzjxje=cf.round(gczxzhje-gcjxzhje+sdlzhje,2);
			}
			else if (zjxbhfw.equals("5"))
			{
				ljzjxje=cf.round(gczxzhje-gcjxzhje+qtfzhje+sdlzhje,2);
			}

			zxje=0;
			jxje=0;
		}
		else if (zjxjffs.equals("3"))//3:累计增减项施工成本；4: 折后增项金额减项金额；5: 增项施工成本减项施工成本；6:增项施工成本折后减项金额；7: 折后增项金额减项施工成本
		{
			if (zjxbhfw.equals("1"))//1:工程；2:其它费；3:工程＋其它费；4:工程(含水电)；5:工程＋其它费(含水电)
			{
				ljzjxje=cf.round(gczxsgcbj-gcjxsgcbj,2);
			}
			else if (zjxbhfw.equals("2"))
			{
				ljzjxje=qtfsgcb;
			}
			else if (zjxbhfw.equals("3"))
			{
				ljzjxje=cf.round(gczxsgcbj-gcjxsgcbj+qtfsgcb,2);
			}
			else if (zjxbhfw.equals("4"))
			{
				ljzjxje=cf.round(gczxsgcbj-gcjxsgcbj+sdlsgcb,2);
			}
			else if (zjxbhfw.equals("5"))
			{
				ljzjxje=cf.round(gczxsgcbj-gcjxsgcbj+qtfsgcb+sdlsgcb,2);
			}

			zxje=0;
			jxje=0;
		}
		else if (zjxjffs.equals("4"))//4: 折后增项金额减项金额；5: 增项施工成本减项施工成本；6:增项施工成本折后减项金额；7: 折后增项金额减项施工成本
		{
			ljzjxje=0;

			if (zjxbhfw.equals("1"))//1:工程；2:其它费；3:工程＋其它费；4:工程(含水电)；5:工程＋其它费(含水电)
			{
				zxje=gczxzhje;
				jxje=gcjxzhje;
			}
			else if (zjxbhfw.equals("2"))
			{
				if (qtfzhje>0)
				{
					zxje=qtfzhje;
					jxje=0;
				}
				else{
					zxje=0;
					jxje=-1*qtfzhje;
				}
			}
			else if (zjxbhfw.equals("3"))
			{
				if (qtfzhje>0)
				{
					zxje=gczxzhje+qtfzhje;
					jxje=gcjxzhje;
				}
				else{
					zxje=gczxzhje;
					jxje=gcjxzhje-qtfzhje;
				}
			}
			else if (zjxbhfw.equals("4"))
			{
				if (sdlzhje>0)
				{
					zxje=gczxzhje+sdlzhje;
					jxje=gcjxzhje;
				}
				else{
					zxje=gczxzhje;
					jxje=gcjxzhje-sdlzhje;
				}
			}
			else if (zjxbhfw.equals("5"))
			{
				if (qtfzhje>0)
				{
					if (sdlzhje>0)
					{
						zxje=gczxzhje+qtfzhje+sdlzhje;
						jxje=gcjxzhje;
					}
					else{
						zxje=gczxzhje+qtfzhje;
						jxje=gcjxzhje-sdlzhje;
					}
				}
				else{
					if (sdlzhje>0)
					{
						zxje=gczxzhje+sdlzhje;
						jxje=gcjxzhje-qtfzhje;
					}
					else{
						zxje=gczxzhje;
						jxje=gcjxzhje-qtfzhje-sdlzhje;
					}
				}
			}
		}
		else if (zjxjffs.equals("5"))//5: 增项施工成本减项施工成本；6:增项施工成本折后减项金额；7: 折后增项金额减项施工成本
		{
			ljzjxje=0;

			if (zjxbhfw.equals("1"))//1:工程；2:其它费；3:工程＋其它费；4:工程(含水电)；5:工程＋其它费(含水电)
			{
				zxje=gczxsgcbj;
				jxje=gcjxsgcbj;
			}
			else if (zjxbhfw.equals("2"))//2:其它费
			{
				if (qtfsgcb>0)
				{
					zxje=qtfsgcb;
					jxje=0;
				}
				else{
					zxje=0;
					jxje=-1*qtfsgcb;
				}
			}
			else if (zjxbhfw.equals("3"))//3:工程＋其它费
			{
				if (qtfsgcb>0)
				{
					zxje=gczxsgcbj+qtfsgcb;
					jxje=gcjxsgcbj;
				}
				else{
					zxje=gczxsgcbj;
					jxje=gcjxsgcbj-qtfsgcb;
				}
			}
			else if (zjxbhfw.equals("4"))//4:工程(含水电)
			{
				if (sdlsgcb>0)
				{
					zxje=gczxsgcbj+sdlsgcb;
					jxje=gcjxsgcbj;
				}
				else{
					zxje=gczxsgcbj;
					jxje=gcjxsgcbj-sdlsgcb;
				}
			}
			else if (zjxbhfw.equals("5"))//5:工程＋其它费(含水电)
			{
				if (qtfsgcb>0)
				{
					if (sdlsgcb>0)
					{
						zxje=gczxsgcbj+qtfsgcb+sdlsgcb;
						jxje=gcjxsgcbj;
					}
					else{
						zxje=gczxsgcbj+qtfsgcb;
						jxje=gcjxsgcbj-sdlsgcb;
					}
				}
				else{
					if (sdlsgcb>0)
					{
						zxje=gczxsgcbj+sdlsgcb;
						jxje=gcjxsgcbj-qtfsgcb;
					}
					else{
						zxje=gczxsgcbj;
						jxje=gcjxsgcbj-qtfsgcb-sdlsgcb;
					}
				}
			}
		}
		else if (zjxjffs.equals("6"))//6:增项施工成本折后减项金额；7: 折后增项金额减项施工成本
		{
			ljzjxje=0;

			if (zjxbhfw.equals("1"))//1:工程；2:其它费；3:工程＋其它费；4:工程(含水电)；5:工程＋其它费(含水电)
			{
				zxje=gczxsgcbj;
				jxje=gcjxzhje;
			}
			else if (zjxbhfw.equals("2"))//2:其它费
			{
				if (qtfzhje>0)
				{
					zxje=qtfsgcb;
					jxje=0;
				}
				else{
					zxje=0;
					jxje=-1*qtfzhje;
				}
			}
			else if (zjxbhfw.equals("3"))//3:工程＋其它费
			{
				if (qtfzhje>0)
				{
					zxje=gczxsgcbj+qtfsgcb;
					jxje=gcjxzhje;
				}
				else{
					zxje=gczxsgcbj;
					jxje=gcjxzhje-qtfzhje;
				}
			}
			else if (zjxbhfw.equals("4"))//4:工程(含水电)
			{
				if (sdlzhje>0)
				{
					zxje=gczxsgcbj+sdlsgcb;
					jxje=gcjxzhje;
				}
				else{
					zxje=gczxsgcbj;
					jxje=gcjxzhje-sdlzhje;
				}
			}
			else if (zjxbhfw.equals("5"))//5:工程＋其它费(含水电)
			{
				if (qtfzhje>0)
				{
					if (sdlzhje>0)
					{
						zxje=gczxsgcbj+qtfsgcb+sdlsgcb;
						jxje=gcjxzhje;
					}
					else{
						zxje=gczxsgcbj+qtfsgcb;
						jxje=gcjxzhje-sdlzhje;
					}
				}
				else{
					if (sdlzhje>0)
					{
						zxje=gczxsgcbj+sdlsgcb;
						jxje=gcjxzhje-qtfzhje;
					}
					else{
						zxje=gczxsgcbj;
						jxje=gcjxzhje-qtfzhje-sdlzhje;
					}
				}
			}
		}
		else if (zjxjffs.equals("7"))//6:增项施工成本折后减项金额；7: 折后增项金额减项施工成本
		{
			ljzjxje=0;

			if (zjxbhfw.equals("1"))//1:工程；2:其它费；3:工程＋其它费；4:工程(含水电)；5:工程＋其它费(含水电)
			{
				zxje=gczxzhje;
				jxje=gcjxsgcbj;
			}
			else if (zjxbhfw.equals("2"))//2:其它费
			{
				if (qtfsgcb>0)
				{
					zxje=qtfzhje;
					jxje=0;
				}
				else{
					zxje=0;
					jxje=-1*qtfsgcb;
				}
			}
			else if (zjxbhfw.equals("3"))//3:工程＋其它费
			{
				if (qtfsgcb>0)
				{
					zxje=gczxzhje+qtfzhje;
					jxje=gcjxsgcbj;
				}
				else{
					zxje=gczxzhje;
					jxje=gcjxsgcbj-qtfsgcb;
				}
			}
			else if (zjxbhfw.equals("4"))//4:工程(含水电)
			{
				if (sdlsgcb>0)
				{
					zxje=gczxzhje+sdlzhje;
					jxje=gcjxsgcbj;
				}
				else{
					zxje=gczxzhje;
					jxje=gcjxsgcbj-sdlsgcb;
				}
			}
			else if (zjxbhfw.equals("5"))//5:工程＋其它费(含水电)
			{
				if (qtfsgcb>0)
				{
					if (sdlsgcb>0)
					{
						zxje=gczxzhje+qtfzhje+sdlzhje;
						jxje=gcjxsgcbj;
					}
					else{
						zxje=gczxzhje+qtfzhje;
						jxje=gcjxsgcbj-sdlsgcb;
					}
				}
				else{
					if (sdlsgcb>0)
					{
						zxje=gczxzhje+sdlzhje;
						jxje=gcjxsgcbj-qtfsgcb;
					}
					else{
						zxje=gczxzhje;
						jxje=gcjxsgcbj-qtfsgcb-sdlsgcb;
					}
				}
			}//增减项包含范围
		}//增减项奖罚方式

		jxje=-1*jxje;

	}//发生增减项


	//计算：增减项＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	//计算：结算基数总额＋＋＋＋＋＋＋＋＋开始
	jsjsze=jsjsxjje;
	if (!sdljsfs.equals("1"))//水电路结算方式  1：不独立结算；2：独立比例不可改；3：独立比例可改；4：手工录入结算金额
	{
		jsjsze=cf.round(jsjsze+sdljsje,2);

		jsjszeStr+="＋水电路结算金额";
	}

	if (!zjxjffs.equals("1"))//增减项奖罚方式  1:不奖罚；2: 累计折后增减项金额；3:累计增减项施工成本；4: 折后增项金额减项金额；5: 增项施工成本减项施工成本；6:增项施工成本折后减项金额；7: 折后增项金额减项施工成本
	{
		//如果选择不同的计算方式，不需要项金额为0 ，可以三项直接相加
		jsjsze=cf.round(jsjsze+zxje*zxxs+jxje*jxxs+ljzjxxs*ljzjxje,2);

		jsjszeStr+="＋增减项奖罚";
	}

	if (!sfkyqpc.equals("N"))//是否扣延期费赔偿款  Y：自动获取；S：人工录入；N：否
	{
		jsjsze=cf.round(jsjsze-khqk-khpck-yqf,2);

		jsjszeStr+="－延期费－赔偿款－客户欠款";
	}
	//计算：结算基数总额＝＝＝＝＝＝＝＝＝＝＝结束
	
	jsje=cf.round(jsjsze*jsbl/100,2);//结算金额=结算基数总额×（结算比例＋调整结算比例）


	//计算：应付金额＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	yfje=jsje;//实际拨款
	yfjeStr="应付金额＝结算总额";

	if (zcsfjs.equals("2"))//主材是否结算  1：不结算；2：按比例结算；3：人工录入
	{
		zcjsje=cf.round(zcje*zcjsbl/100.0,2);

		yfje=yfje+zcjsje;
		yfjeStr+="＋主材结算金额";
	}
	else if (zcsfjs.equals("3"))//主材是否结算  1：不结算；2：按比例结算；3：人工录入
	{
		yfje=yfje+zcjsje;
		yfjeStr+="＋主材结算金额";
	}

	if (sfkclk.equals("Y"))//是否扣材料款
	{
		yfje=yfje-clf;
		yfjeStr+="－材料款";
	}
	if (sfkgdyp.equals("Y"))//是否扣工地用品
	{
		yfje=yfje-gdyp;
		yfjeStr+="－工地用品";
	}
	if (sfkyfgf.equals("Y"))//是否扣已付工费
	{
		yfje=yfje-yfgf;
		yfjeStr+="－已付工费";
	}

	//扣质保金
	if (!sfkzbj.equals("N"))//是否扣质保金  Y:扣质保金比例不可改；M:扣质保金比例可改；N:不扣质保金
	{
		if (kzbjjs.equals("1"))//扣质保金基数  1：结算基数总额；2：结算总额
		{
			kzbj=cf.round(jsjsze*kzbjbl/100,2);//扣质保金
		}
		else{
			kzbj=cf.round(jsje*kzbjbl/100,2);//扣质保金
		}

		if (zbjce>0)
		{
			if (kzbj>zbjce)//质保金达标后不再扣除
			{
				kzbj=zbjce;
			}

			yfje=yfje-kzbj;

			yfjeStr+="－质保金(差额:"+zbjce+")";
		}
		else{
			kzbj=0;
			yfjeStr+="－质保金(质保金已达标)";
		}

	}


	//罚款金额
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_sgdfkjl";
	ls_sql+=" where sgd='"+sgd+"' and scbz='N' and zt='2'";//1：未审核；2：审核；3：结算
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//奖励金额
	ls_sql="select sum(jlje)";
	ls_sql+=" from  cw_sgdjljl";
	ls_sql+=" where sgd='"+sgd+"' and scbz='N' and zt='2'";//1：未审核；2：审核；3：结算
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jlje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (!sfkclfk.equals("N"))//是否扣辅材罚款  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje-clfk;

		yfjeStr+="－辅材罚款";
	}
	if (!sfkclyf.equals("N"))//是否扣材料运费  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje-clyf;

		yfjeStr+="－材料运费";
	}
	if (!sfkzckk.equals("N"))//是否扣主材扣款  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje-zckk;

		yfjeStr+="－主材扣款";
	}
	if (!sfjzcjl.equals("N"))//是否加主材奖励  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje+zcjl;

		yfjeStr+="＋主材奖励";
	}
	if (!sfkfkje.equals("N"))//是否扣罚款金额  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje-fkje;

		yfjeStr+="－罚款金额";
	}
	if (!sfjjlje.equals("N"))//是否加奖励金额  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje+jlje;

		yfjeStr+="＋奖励金额";
	}
	if (!sfjqtje.equals("N"))//是否加其它金额  Y：自动获取；S：人工录入；N：否
	{
		yfje=yfje+qtje;

		yfjeStr+="＋其它金额";
	}

	yfje=cf.round(yfje,2);

	//计算：应付金额＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	rgfjse=yfgf;
	flfjse=cf.round(jsje-rgfjse,2);
	
	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_sgdwgjsty";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh=khbh+cf.addZero(count+1,2);
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

<form method="post" action="SaveInsertCw_sgdwgjsty.jsp" name="insertform" >
<div align="center">施工队完工结算（结算记录号：<%=jsjlh%>）</div>
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
  <input type="text" name="sdljsbl" value="<%=sdlbfbl%>" size="10" maxlength="9"  <%=sdlblRead%>>%  </td>
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
  <td><input type="text" name="tzjsbl" value="0" size="10" maxlength="9" onChange="jsValue(insertform)">
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
  <td><input type="text" name="clfk" value="0" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfkclfkRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkclyfStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>是否扣材料运费</span></td>
  <td><%
	cf.radioToken(out, "sfkclyf","Y+自动获取&S+人工录入&N+否",sfkclyf,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>材料运费</td>
  <td><input type="text" name="clyf" value="0" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfkclyfRead%> ></td>
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
  <td><input type="text" name="qtje" value="0" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfjqtjeRead%>></td>
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
    <input type="hidden" name="ssk" value="<%=cwsfke%>" >	
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
