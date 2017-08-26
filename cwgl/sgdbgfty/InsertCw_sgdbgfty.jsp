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
.STYLE3 {
	color: #CC0033;
	font-weight: bold;
}
.STYLE5 {color: #CC0033; font-weight: bold; }
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String zjxwcbz="";
String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

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
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;
String zjxxh="";
double cwsfke=0;

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
double lkhjbfb=0;//最大领款合计百分比

String sjbkStr="";

double htjsjs=0;//合同结算基数
double zjxjsjs=0;//增减项结算基数
double jsjsxjje=0;

double jsjsze=0;
double jsbl=15;
double jsje=0;
double sjbk=0;

double clf=0;
double gdyp=0;
double yfgf=0;


String nextzt="";//下一个结算进度编码
int bfcs=0;//拨付次数

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select cwsfke,zjxwcbz,zjxxh,gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cwsfke=rs.getDouble("cwsfke");
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
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
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
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



	int ztjc=0;
	ls_sql="select count(*)";
	ls_sql+=" from dm_gdjsjd";
	ls_sql+=" where gdjsjd='"+gdjsjd+"' and ztlx='2'";//1：授权；2：拨工费；3：审核
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ztjc=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (ztjc==0)
	{
		out.println("错误！状态不正确");
		return;
	}

	ls_sql="select nextzt,bfcs";
	ls_sql+=" from dm_gdjsjd";
	ls_sql+=" where gdjsjd='"+gdjsjd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nextzt=cf.fillNull(rs.getString("nextzt"));//下一个结算进度编码
		bfcs=rs.getInt("bfcs");//拨付次数
	}
	rs.close();
	ps.close();


	//施工队结算参数表
	ls_sql="select bfjs,bfbl,sgdjbxg   ,sdljsfs,sdlqz,DECODE(sdlqz,'1','折前','2','折后','3','施工成本价') sdlqzStr,sdlbfbl,zjxjffs,ljzjxxs,zxxs,jxxs,zjxbhfw,zjxsjd,sfkyqpc,zcsfjs,zcjehqfs,zcjsblkg,zcjsbl";
	ls_sql+="  ,sfkzbj,kzbjjs,kzbjbl,sfkclk,sfkgdyp,sfkyfgf  ,sfkclfk,sfkclyf,sfkzckk,sfjzcjl,sfkfkje,sfjjlje,sfjqtje,lkhjbfb";
	ls_sql+=" from  dm_sgdjscsb";
	ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs="+bfcs;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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

		lkhjbfb=rs.getDouble("lkhjbfb");//最大领款合计百分比
	}
	rs.close();
	ps.close();


	if (bfjs==null)
	{
		out.println("错误！无【结算参数设置】，不能进行拨付");
		return;
	}


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
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and jsbz='0'";//0：未结算；1：已结算
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

	jsjsze=jsjsxjje;
	jsbl=bfbl;
	jsje=cf.round(jsjsze*jsbl/100,2);//结算金额

	sjbk=jsje;//实际拨款
	sjbkStr="实际拨款＝拨付金额";

	if (sfkclk.equals("Y"))//是否扣材料款
	{
		sjbk=sjbk-clf;
		sjbkStr+="－材料款";
	}
	if (sfkgdyp.equals("Y"))//是否扣工地用品
	{
		sjbk=sjbk-gdyp;
		sjbkStr+="－工地用品";
	}
	if (sfkyfgf.equals("Y"))//是否扣已付工费
	{
		sjbk=sjbk-yfgf;
		sjbkStr+="－已付工费";
	}

	sjbk=cf.round(sjbk,0);

	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_sgdbgfty";
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

<form method="post" action="SaveInsertCw_sgdbgfty.jsp" name="insertform" target="_blank">
<div align="center">施工队拨工费</div>
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
    <td align="right"><span class="STYLE2">管家</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">调度</span></td>
    <td><%=dd%></td>
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
    <td><%=jyjdrq%> </td>
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
      <input type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="验收记录">
      <input type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="付款信息">
      <input type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="领料单"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000CC">拨工费记录号</font></span></td>
    <td><input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">客户编号</font></span></td>
    <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">施工队</font></span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>    </td>
    <td align="right"><span class="STYLE2"><font color="#0000CC">现场负责人</font></span></td>
    <td><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">拨付基数</span></td>
    <td colspan="3"><select name="jsjs" style="FONT-SIZE:12PX;WIDTH:512PX">
      <%
		cf.selectItem(out,"select jsjsbm,jsjsmc from dm_jsjsbm where jsjsbm='"+bfjs+"'",bfjs);
%>
    </select></td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">合同拨付基数</span></td>
    <td><input type="text" name="htje" value="<%=htjsjs%>" size="20" maxlength="17" readonly></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">增减项拨付基数</span></td>
    <td><input type="text" name="zjxje" value="<%=zjxjsjs%>" size="20" maxlength="17" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">拨工费次数</span></td>
    <td><select name="gdjsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd='"+nextzt+"'","");
%>
    </select></td>
    <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>最大领款合计百分比</span></td>
    <td><input type="text" name="lkhjbfb" value="<%=lkhjbfb%>" size="10" maxlength="17" readonly>
%</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">家装实收款</span></td>
    <td><input type="text" name="jzssk" value="<%=cwsfke%>" size="20" maxlength="17" readonly></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
  
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="right">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">拨付基数总额</span></td> 
  <td width="32%"><input type="text" name="jsjsze" value="<%=jsjsze%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>拨付比例</td> 
  <td width="32%"><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">拨付金额</span></td>
  <td colspan="3"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" readonly>
    <span class="STYLE5">拨付金额=拨付基数总额×拨付比例</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">是否扣材料款</span></td>
  <td><%
	cf.radioToken(out, "sfkclk","Y+是&N+否",sfkclk,true);
%>
  </td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">已领材料费</span></td>
  <td><input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">是否扣工地用品</span></td>
  <td><%
	cf.radioToken(out, "sfkgdyp","Y+是&N+否",sfkgdyp,true);
%></td>
  <td align="right"><font color="#FF0000">*<span class="STYLE2">已领</span></font><span class="STYLE2">工地用品</span></td>
  <td><input type="text" name="gdyp" value="<%=gdyp%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">是否扣已付工费</span></td>
  <td><%
	cf.radioToken(out, "sfkyfgf","Y+是&N+否",sfkyfgf,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">已领取工费</span></td>
  <td><input type="text" name="yfgf" value="<%=yfgf%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">实际拨款</span></td> 
  <td colspan="3"><input type="text" name="sjbk" value="<%=sjbk%>" size="20" maxlength="17" readonly>
    <span class="STYLE3"><%=sjbkStr%></span></td>
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
  <td align="right"><span class="STYLE1">*</span>拨付日期</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input name="dy" type="button" onClick="window.open('dybkd.jsp?jsjlh=<%=jsjlh%>')"  value="打印拨款单" disabled>
	<input type="button" onClick="window.open('SaveZjxbz.jsp?khbh=<%=khbh%>');this.disabled=true;"  value="不许录入增减项" <%if (zjxwcbz.equals("3")) out.print("disabled");%>></td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsje(FormName)//参数FormName:Form的名称
{
	var jsje=FormName.jsjsze.value*1.0*FormName.jsbl.value/100.0;
	jsje=round(jsje,2);
	FormName.jsje.value=jsje;

	var sjbk=FormName.jsje.value*1.0;

	if ("<%=sfkclk%>"=="Y")//是否扣材料款
	{
		sjbk=sjbk-FormName.clf.value*1.0;
	}
	if ("<%=sfkgdyp%>"=="Y")//是否扣工地用品
	{
		sjbk=sjbk-FormName.gdyp.value*1.0;
	}
	if ("<%=sfkyfgf%>"=="Y")//是否扣已付工费
	{
		sjbk=sjbk-FormName.yfgf.value*1.0;
	}

	sjbk=sjbk-sjbk%100;

	sjbk=round(sjbk,0);

	FormName.sjbk.value=sjbk;
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsje(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[拨工费记录号]！");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.gdjsjd)=="") {
		alert("请输入[拨工费次数]！");
		FormName.gdjsjd.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrq)=="") {
		alert("请输入[拨付日期]！");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "拨付日期"))) {
		return false;
	}
	if(	javaTrim(FormName.htje)=="") {
		alert("请输入[合同金额]！");
		FormName.htje.focus();
		return false;
	}
	if(!(isFloat(FormName.htje, "合同金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("请输入[增减项金额]！");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "增减项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jzssk)=="") {
		alert("请输入[家装实收款]！");
		FormName.jzssk.focus();
		return false;
	}
	if(!(isFloat(FormName.jzssk, "家装实收款"))) {
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
	if(	javaTrim(FormName.gdyp)=="") {
		alert("请输入[工地用品]！");
		FormName.gdyp.focus();
		return false;
	}
	if(!(isFloat(FormName.gdyp, "工地用品"))) {
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


	if(	javaTrim(FormName.jsjsze)=="") {
		alert("请输入[结算基数总额]！");
		FormName.jsjsze.focus();
		return false;
	}
	if(!(isFloat(FormName.jsjsze, "结算基数总额"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("请输入[拨付比例]！");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "拨付比例"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("请输入[拨付金额]！");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "拨付金额"))) {
		return false;
	}
	if(	javaTrim(FormName.sjbk)=="") {
		alert("请输入[实际拨款]！");
		FormName.sjbk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjbk, "实际拨款"))) {
		return false;
	}
	if(	javaTrim(FormName.lkhjbfb)=="") {
		alert("请输入[最大领款合计百分比]！");
		FormName.lkhjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.lkhjbfb, "最大领款合计百分比"))) {
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

	FormName.submit();
	FormName.dy.disabled=false;;
	return true;
}
//-->
</SCRIPT>
