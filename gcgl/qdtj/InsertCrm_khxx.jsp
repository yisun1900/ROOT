<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");



String yhmc=(String)session.getAttribute("yhmc");
String zdyhbz=(String)session.getAttribute("zdyhbz");

String ssfgs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String zxdm="";
String khxm="";
String xb="";
String cqbm="";
String fwdz="";
String lxfs="";
String sjs="";
String xjf="";
String clgw="";

String cxhdbm="";
String nlqjbm="";
String zybm="";
String ysrbm="";
String fjfwbm="";
String xqbm="";
String khlxbm="";
String hxbm="";
String fwmj="";
String fgyqbm="";
String bjjb="";
String ywy="";
String hdbz="";
String cgdz="";
String hdr="";
String jzbz="";
String louhao="";
String shbz="";
String sfyckh="";


double wdzgce=0;
double qye=0;
double glf=0;
double glfbfb=0;
double zqguanlif=0;
double guanlif=0;
double suijinbfb=0;
double zqsuijin=0;
double suijin=0;
double zqhtzcbj=0;
double zhhtzcbj=0;

double zqwjrqyexm=0;
double zhwjrqyexm=0;
String wjrqyexmsm="";


String hth="";
String sfjczjz="";
String cxhdbmxq=null;
String cxhdbmzh=null;
String email=null;
String khjl="";
String xxlysm="";
String xxly="";

String dzbjjc="";//1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]；2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率] ；3：全部人工录入[折扣率、签约额、工程原报价]，不自动计算4：必须做电子报价，[工程原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]

String shdzbjjc="";//1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]；2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率] ；3：全部人工录入[折扣率、签约额、工程原报价]，不自动计算4：必须做电子报价，[工程原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]

double sjjryjbfb=0;
double sjf=0;
double sssjf=0;


String qtsjs="";
String yxtxdz="";
String hyh=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String jiedao=null;

String sjsbh=null;
String ysy=null;
String pdqybm=null;

double zqqyze=0;
double zhqyze=0;
int fkfssl=0;

double hdzsjz=0;
double htjz=0;
double mll=0;
double cbj=0;
double sgcbj=0;
double gcjcbj=0;

double zqsjf=0;
String qtsfsm="";
double zqgczjf=0;
double zhgczjf=0;
double zqqtsf=0;
double zhqtsf=0;

double mle=0;
double yjjzcs=0;
double yjjz=0;
double djjje=0;
double djjbfb=10;

double zkl=10;

double gcfqdzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;

double cdzwjmje=0;
double glfjmje=0;
double sjjmje=0;

double oldzhgczjf=0;
double oldguanlif=0;
double oldsuijin=0;
double oldhtjz=0;

double djfxje=0;//订金返现金额
double zjjmje=0;//直接减免金额

double tcbzjg=0;
double tcmjzjje=0;
double tczcsjcj=0;
double tczccljj=0;
double tcxsfzc=0;
double tczcjm=0;
double tcdpsj=0;
double tcdpdlsf=0;
double tcxpx=0;
double tcwsgzj=0;
double tcwgccljj=0;
double tcwzjzc=0;
double tcsgze=0;
double tcqtsf=0;
double zctcje=0;
double wntcje=0;
double jytcje=0;
double sctcje=0;
double jktcje=0;
double sjhtsjf=0;

String ywybm=null;
String ywyssxz=null;
String dianz=null;
String scbjl=null;
String weny=null;
String cqhtbz=null;
String fjtcbz="";

try {
	conn=cf.getConnection();

	String getjgwzbm =null;
	String getcpbm =null;
	String getcpmc =null;
	int gqsl=0;
	ls_sql="SELECT jgwzbm,cpbm,cpmc";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and ((sfyx='2') OR (sfyx='3' and (yxkssj>TRUNC(SYSDATE) OR yxjzsj<TRUNC(SYSDATE))))";
	ls_sql+=" order by jgwzbm,cpbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getjgwzbm=rs.getString("jgwzbm");
		getcpbm=rs.getString("cpbm");
		getcpmc=rs.getString("cpmc");

		gqsl++;

		out.println("<BR>错误！主材『"+getjgwzbm+"："+getcpmc+"』已过促销期，不能再选择");
	}
	rs.close();
	ps.close();

	if (gqsl>0)
	{
		return;
	}

	//更新其它收费项目，调整收费百分比
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	dzbj.updateSfxm(conn,khbh,"yz");

	//获取电子报价金额
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");

	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();


	String mlspbz="";
	ls_sql="select mlspbz,sfyckh,ysy,pdqybm,sjsbh,sjf,email,cxhdbmxq,cxhdbmzh,dzbjjc,sfjczjz,cxhdbm,shbz,louhao,ysrbm,zxdm,jzbz,ywy,khxm,xb,cqbm,fwdz,lxfs,sjs,nlqjbm,zybm,fjfwbm,xqbm,khlxbm,hxbm,fwmj,fgyqbm,bjjb,hdbz,cgdz,hdr,ssfgs";
	ls_sql+=" ,khjl,xxlysm,yxtxdz,hyh,sgd,sgbz,zjxm,hth,jiedao,xjf,clgw,cqhtbz,weny,sjhtje";
	ls_sql+=" ,crm_zxkhxx.ywybm,crm_zxkhxx.ywyssxz,crm_zxkhxx.dianz,crm_zxkhxx.scbjl";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mlspbz=cf.fillNull(rs.getString("mlspbz"));
		dianz=cf.fillNull(rs.getString("dianz"));
		scbjl=cf.fillNull(rs.getString("scbjl"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		ywybm=cf.fillNull(rs.getString("ywybm"));

		sjhtsjf=rs.getDouble("sjhtje");
		cqhtbz=cf.fillNull(rs.getString("cqhtbz"));
		weny=cf.fillNull(rs.getString("weny"));
		xjf=cf.fillNull(rs.getString("xjf"));
		clgw=cf.fillNull(rs.getString("clgw"));
		sfyckh=cf.fillNull(rs.getString("sfyckh"));
		ysy=cf.fillNull(rs.getString("ysy"));
		pdqybm=cf.fillNull(rs.getString("pdqybm"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		jiedao=cf.fillNull(rs.getString("jiedao"));
		hth=cf.fillNull(rs.getString("hth"));
		hyh=cf.fillNull(rs.getString("hyh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		yxtxdz=cf.fillNull(rs.getString("yxtxdz"));
		khjl=cf.fillNull(rs.getString("khjl"));
		xxlysm=cf.fillNull(rs.getString("xxlysm"));
		sssjf=rs.getDouble("sjf");
		email=cf.fillNull(rs.getString("email"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		shdzbjjc=cf.fillNull(rs.getString("dzbjjc"));//启用电子报价检查

		sfjczjz=cf.fillNull(rs.getString("sfjczjz"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		shbz=cf.fillNull(rs.getString("shbz"));
		louhao=cf.fillNull(rs.getString("louhao"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		ywy=cf.fillNull(rs.getString("ywy"));
		khxm=rs.getString("khxm");
		xb=cf.fillNull(rs.getString("xb"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		fwdz=rs.getString("fwdz");
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fjfwbm=cf.fillNull(rs.getString("fjfwbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		khlxbm=rs.getString("khlxbm");
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=rs.getString("fwmj");
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	if (cqhtbz.equals(""))
	{
		cqhtbz="N";
	}



	ls_sql="SELECT yhmc";
	ls_sql+=" FROM sq_yhxx";
    ls_sql+=" where dwbh='"+zxdm+"' and xzzwbm='店面文员' and sfzszg in('Y','N')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		weny=cf.fillNull(rs.getString("yhmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qtsjs+=rs.getString("sjs")+"、";
	}
	rs.close();
	ps.close();

	ls_sql="select xxlymc ";
	ls_sql+=" from  crm_khxxly,dm_xxlybm";
	ls_sql+=" where  crm_khxxly.xxlybm=dm_xxlybm.xxlybm and crm_khxxly.khbh='"+khbh+"' and crm_khxxly.khlx='2'";
	ls_sql+=" order by crm_khxxly.xxlybm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xxly+=rs.getString("xxlymc")+"、";
	}
	rs.close();
	ps.close();

	ls_sql="SELECT gcfqdzk,glfzk,sjzk,sjfzk";
	ls_sql+=" FROM crm_khzk";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcfqdzk=rs.getDouble("gcfqdzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
	}
	rs.close();
	ps.close();


	ls_sql="SELECT dzbjjc,sjjryjbfb,yjjzcs";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));//启用电子报价检查
		sjjryjbfb=rs.getDouble("sjjryjbfb");//设计客户计入业绩收款比例 
		yjjzcs=rs.getDouble("yjjzcs");
	}
	rs.close();
	ps.close();



	if (yjjzcs==0)
	{
		out.println("错误！未设【业绩净值参数】");
		return;
	}

	if (shbz.equals("Y"))//信息审核标志
	{
		dzbjjc=shdzbjjc;
	}


	//取合同号
	if (hth.equals(""))
	{
		ls_sql="select hth";
		ls_sql+=" from  crm_hthxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			hth=cf.fillNull(rs.getString("hth"));
		}
		rs.close();
		ps.close();

		if (hth.equals(""))
		{
			out.println("<P>提醒！！！！！！！！！！请首选为该客户编号["+khbh+"]申请合同号");
			return;
		}
	}

	//签单前检查＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	qddj.Qddj qddj=new qddj.Qddj();
	String ret="";

	//[客户姓名]检查
	ret=qddj.checkKhxm(khxm,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}
	//[房屋地址]检查
	ret=qddj.checkFwdz(conn,khbh,fwdz,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}

	//对[促销活动]做检查
	ret=qddj.checkCxhd(conn,ssfgs,cxhdbm,cxhdbmxq,cxhdbmzh,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}

	//检查[是否允许签单登记]
	ret=qddj.checkYxQddj(conn,khbh,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}
 
	//检查[电子报价错误]
	ret=qddj.checkDzbj(conn,khbh,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
//		return;
	}
	//签单前检查＝＝＝＝＝＝＝＝＝＝＝＝＝结束



	//取电子报价数据＋＋＋＋＋＋＋＋＋开始

  


	wdzgce=dzbjje.getZqBjje(conn,khbh,"yz");//获取『折前』电子报价金额，直接费＋其它收费
	qye=dzbjje.getZhBjje(conn,khbh,"sxyd");//获取『折后』电子报价金额，直接费＋其它收费

	suijinbfb=dzbjje.getSuijinBfb(conn,khbh,"yz");//税金百分比
	suijin=dzbjje.getZhSuijinJe(conn,khbh,"yz");//获取折后『税金金额』
	zqsuijin=dzbjje.getZqSuijinJe(conn,khbh,"yz");//获取折前『税金金额』

	glfbfb=dzbjje.getGlfBl(conn,khbh,"yz");//管理费百分比
	zqguanlif=dzbjje.getZqGlfJe(conn,khbh,"yz");//『折前』管理费
	guanlif=dzbjje.getZhGlfJe(conn,khbh,"yz");//获取折后『管理费金额』

	zqgczjf=dzbjje.getZqGczjf(conn,khbh,"yz");//工程直接费－折前
	zhgczjf=dzbjje.getZhGczjf(conn,khbh,"yz");//工程直接费－折后

	zqqtsf=dzbjje.getZqJrQtsf(conn,khbh,"yz");//记入业绩其它费－折前，不包括税金、管理费、设计费
	zhqtsf=dzbjje.getZhJrQtsf(conn,khbh,"yz");//记入业绩其它费－折后，不包括税金、管理费、设计费
	qtsfsm=dzbjje.getJrQtsfsm(conn,khbh,"yz");//记入业绩其它费项目，不包括税金、管理费、设计费

	zqwjrqyexm=dzbjje.getZqWjrJe(conn,khbh,"yz");//获取折前『不记入业绩其它费』，不包括税金、管理费、设计费
	zhwjrqyexm=dzbjje.getZhWjrJe(conn,khbh,"yz");//获取折后『不记入业绩其它费』，不包括税金、管理费、设计费
	wjrqyexmsm=dzbjje.getWjrJeMc(conn,khbh,"yz");//获取『其它收费项目名称』，不包括税金、管理费、设计费

	zqsjf=dzbjje.getZqSjf(conn,khbh);//获取折前『设计费』
	sjf=dzbjje.getZhSjf(conn,khbh);//获取折后『设计费』

	zqhtzcbj=dzbjje.getZqZcbj(conn,khbh,"yz");//合同主材报价－折前
	zhhtzcbj=dzbjje.getZhZcbj(conn,khbh,"yz");//合同主材报价－折后

	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		dzbj.Tc tc=new dzbj.Tc();

		tcbzjg=tc.getBzjg(conn,khbh,"yz");//获取:套餐标准价格
		tcmjzjje=tc.getMjzjje(conn,khbh,"yz");//获取:面积增加金额
		tczcsjcj=tc.getZcsjcj(conn,khbh,"yz");//获取:主材升级差价
		tczccljj=tc.getZccljj(conn,khbh,"yz");//获取:主材超量加价
		tcxsfzc=tc.getXsfzc(conn,khbh,"yz");//获取:需收费主材
		tczcjm=tc.getZcjm(conn,khbh,"yz");//获取:主材减免
		tcdpsj=tc.getDpsj(conn,khbh,"yz");//获取:顶配升级
		tcdpdlsf=tc.getDpdlsf(conn,khbh,"yz");//获取:顶配独立收费
		tcxpx=tc.getXpx(conn,khbh,"yz");//获取:选配项
		tcwsgzj=tc.getSgzj(conn,khbh,"yz");//获取:套餐外施工项造价
		tcwgccljj=tc.getGccljj(conn,khbh,"yz");//获取:工程超量加价
		tcwzjzc=tc.getZjzc(conn,khbh,"yz");//获取:套餐外增加主材
		tcsgze=tc.getSgze(conn,khbh,"yz");//获取:施工总额
		tcqtsf=tc.getTcqtsf(conn,khbh,"yz");//获取:套餐－其它收费
		zctcje=tc.getZctcje(conn,khbh,"yz");//获取:主材套餐金额
		wntcje=tc.getWntcje(conn,khbh,"yz");//获取:温暖套餐金额
		jytcje=tc.getJytcje(conn,khbh,"yz");//获取:静音套餐金额
		sctcje=tc.getSctcje(conn,khbh,"yz");//获取:色彩套餐金额
		jktcje=tc.getJktcje(conn,khbh,"yz");//获取:健康套餐金额
	}

	if (wdzgce!=0)
	{
		zkl=cf.round(qye*10/wdzgce,2);
	}
	else{
		zkl=10;
	}


	djfxje=dzbjje.getDjfxje(conn,khbh,"sxyd");//订金返现金额
	zjjmje=dzbjje.getZjjmje(conn,khbh,"yz");//直接减免金额
	hdzsjz=dzbjje.getZsjz(conn,khbh);//活动赠送净值+特权赠送净值


	djjje=dzbjje.getHtDjj(conn,khbh,"yz");//代金券金额
	djjbfb=dzbjje.getDjjbfb(conn,khbh,"yz");//代金券百分比


	htjz=dzbjje.getHtjz(conn,khbh,"yz");//合同净值＝工程费＋记入业绩其它费（包括所有记入项）－赠送净值－赠送代金券

	sgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）
	
	mle=cf.round(htjz-sgcbj,2);//毛利额=合同净值－施工成本价
	mll=cf.round(mle/htjz*100,2);//毛利率＝毛利额÷合同净值

	yjjz=dzbjje.getYjjz(conn,khbh,"yz");//获取业绩净值
	yjjz=cf.round(yjjz*100/yjjzcs,2);//业绩净值=毛利额÷核算净值参数

	cbj=dzbjje.getCbj(conn,khbh,"yz");//成本价＝工程项成本价＋其它项成本（不含：管理费、税金）
	gcjcbj=dzbjje.getGcjcbj(conn,khbh,"yz");//工程基础报价＝工程项工程基础报价＋其它项工程基础报价（不含：管理费、税金）

	oldzhgczjf=zhgczjf;
	oldguanlif=guanlif;
	oldsuijin=suijin;
	oldhtjz=htjz;

	//取电子报价数据===============结束


	// 检查毛利＋＋＋＋＋＋＋＋＋＋＋＋开始
	int spjl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_tzzkjl";
    ls_sql+=" where khbh='"+khbh+"' and clzt in('2','4')";//1：未改折扣；2：直接修改折扣成功；3：需审批；4：审批通过已改折扣；5：审批未通过
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		spjl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (!mlspbz.equals("Y") && spjl==0)
	{
		String kzdzfs="";
		double zdmll=0;
		double zdzkl=0;
		ls_sql="SELECT kzdzfs,zkl,zdmll";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc='"+sjs+"' and zwbm in('23','04') and sfzszg in('Y','N')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kzdzfs=cf.fillNull(rs.getString("kzdzfs"));
			zdzkl=rs.getDouble("zkl");//最低折扣
			zdmll=rs.getDouble("zdmll");//签单最低毛利率
		}
		rs.close();
		ps.close();

		//主材金额计算
		double zcxse=0;
		double zccb=0;
		ls_sql="SELECT sum(hkze+zjhze),sum(cbze+zjxcbze)";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			zcxse=rs.getDouble(1);//主材销售额
			zccb=rs.getInt(2);//主材成本额
		}
		rs.close();
		ps.close();

		double khmll=0;//客户毛利率
		if ((zcxse+htjz)!=0)
		{
			khmll=cf.round((zcxse-zccb+mle)*100/(zcxse+htjz),2);
		}


		if (kzdzfs.equals("1"))//1：控制毛利率；2：控制折扣
		{
			if (khmll<zdmll || khmll>100)
			{
				out.println("错误！您的毛利授权为【"+zdmll+"】，需要审批毛利");
				return;
			}
		}
	}

	
	// 检查毛利＝＝＝＝＝＝＝＝＝＝＝＝结束
}
catch (Exception e) {
	out.print("<P>发生意外: " + e);
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
<body bgcolor="#CCCCFF"  style="FONT-SIZE:14">

<form method="post" action="" name="insertform" target='_blank'>
          
  <div align="center"> 请录入客户信息（<font color="#FF0033">*</font>为必填字段）（客户编号：<%=khbh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">合同号</font></td>
      <td width="29%"> 
      <input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20" onKeyUp="keyGo(smhtbh)" readonly>      </td>
      <td width="21%" align="right">书面合同编号</td>
      <td width="29%"><input type="text" name="smhtbh" value="" size="20" maxlength="20" onKeyUp="keyTo(khlxbm)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">客户姓名</font>      </td>
      <td width="29%"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" >
      <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="50" readonly>      </td>
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font>性别      </td>
      <td width="29%"> 
        <input type="radio" name="xb"  value="M" <% if (xb.equals("M")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        男 
        <input type="radio" name="xb"  value="W" <% if (xb.equals("W")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
      女 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">联系方式</font></td>
      <td colspan="3"> 
        <input type="text" name="lxfs" value="<%=lxfs%>" size="73" maxlength="100" readonly></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000FF">电子邮件</font></td>
      <td width="29%">
      <input type="text" name="email" value="<%=email%>" size="20" maxlength="50">      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>业主身份证号码</td>
      <td width="29%"> 
      <input type="text" name="sfzhm" value="" size="20" maxlength="18" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"> 
        <font color="#FF0033">*</font><font color="#0000FF">房屋地址</font>      </td>
      <td colspan="3"> 
		<input type="hidden" name="cqbm" value="<%=cqbm%>" >
		<input type="hidden" name="jiedao" value="<%=jiedao%>" >
		<input type="hidden" name="xqbm" value="<%=xqbm%>" >
		<input type="hidden" name="louhao" value="<%=louhao%>">
        <input type="text" name="fwdz" value="<%=fwdz%>" size="73" maxlength="100" readonly>      </td>
    </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">有效通信地址</font></td>
      <td colspan="3"><input name="yxtxdz" type="text" value="<%=yxtxdz%>" size="73" maxlength="100" readonly></td>
    </tr>
   <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">参加公司促销活动</font></td>
      <td colspan="3"><A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbm%>" target="_blank"><%=cxhdbm%></A>
          <input type="hidden" name="cxhdbm" value="<%=cxhdbm%>" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">参加小区促销活动</font></td>
      <td colspan="3"><A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmxq%>" target="_blank"><%=cxhdbmxq%></A>
          <input type="hidden" name="cxhdbmxq" value="<%=cxhdbmxq%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">参加展会促销活动</font></td>
      <td colspan="3"><A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmzh%>" target="_blank"><%=cxhdbmzh%></A>
          <input type="hidden" name="cxhdbmzh" value="<%=cxhdbmzh%>"  >
      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">年龄区间</td>
      <td width="29%"> 
        <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(zybm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
      </select>      </td>
      <td width="21%" align="right">职业</td>
      <td width="29%"> 
        <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(ysrbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">月收入</td>
      <td width="29%"> 
        <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fjfwbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%> 
      </select>      </td>
      <td width="21%" align="right">材料顾问</td>
      <td width="29%"> <input type="text" name="clgw" value="<%=clgw%>" size="20" maxlength="20" readonly>         </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">设计师</font></td>
      <td><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly></td>
      <td align="right"><font color="#0000FF">其他设计师</font></td>
      <td><%=qtsjs%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>店长</td>
      <td><input name="dianz" type="text"  value="<%=dianz%>" size="20" maxlength="20" ></td>
      <td align="right">店面文员</td>
      <td><input name="weny" type="text" id="weny" value="<%=weny%>" size="20" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">市场部经理</td>
      <td width="29%"><input name="scbjl" type="text"  value="<%=scbjl%>" size="20" maxlength="20" ></td>
      <td width="21%" align="right"> 
        <font color="#0000FF">业务员</font>      </td>
      <td width="29%"> 
      <input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" readonly>      </td>
    </tr>
		<tr bgcolor="#FFFFFF">
		  <td align="right">&nbsp;</td>
		  <td>&nbsp;</td>
		  <td align="right"><font color="#0000FF">草签合同标志</font></td>
		  <td><%
	cf.radioToken(out,"Y+草签合同&N+否",cqhtbz,true);
%></td>
		</tr>
	
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">客户经理</font></td>
      <td> 
      <input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" readonly></td>
      <td align="right"><font color="#FF0033">*</font>付款方案</td>
      <td><select name="fkfabm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	if (fkfssl==1)
	{
		cf.selectItem(out,"select cw_fkfabm.fkfabm,cw_fkfabm.fkfamc from cw_fkfabm,cw_fgsfkfa where cw_fkfabm.fkfabm=cw_fgsfkfa.fkfabm and cw_fgsfkfa.fgsbh='"+ssfgs+"' order by cw_fkfabm.fkfabm","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select cw_fkfabm.fkfabm,cw_fkfabm.fkfamc from cw_fkfabm,cw_fgsfkfa where cw_fkfabm.fkfabm=cw_fgsfkfa.fkfabm and cw_fgsfkfa.fgsbh='"+ssfgs+"' order by cw_fkfabm.fkfabm","");
	}
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font>房屋面积      </td>
      <td width="29%"> 
        <input type="text" name="fwmj" value="<%=fwmj%>" size="20" maxlength="20"  onChange="calValue(insertform)" onKeyUp="keyGo(bjjb[0])">
      <input type="hidden" name="pmjj" value="" >      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>报价级别</td>
      <td width="29%"><%
	if (bjjb.equals(""))
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","bjjb","");
	}
	else 
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'","bjjb",bjjb);
	}

%></td>
    </tr>
  </TABLE>


<BR>  
<%
	if (dzbjjc.equals("1"))//1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]
	{
		%>
		<%@ include file="dzbjjc1.jsp" %>
		<%
	}
	else if (dzbjjc.equals("2"))//2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率]
	{
		%>
		<%@ include file="dzbjjc2.jsp" %>
		<%
	}
	//6：全部人工录入[折扣率、签约额、合同原报价] ，不自动计算，记录减免
	else if (dzbjjc.equals("3") || dzbjjc.equals("6"))//3：全部人工录入[折扣率、签约额、合同原报价]，不自动计算，不记录减免
	{
		%>
		<%@ include file="dzbjjc3.jsp" %>
		<%
	}
	//4：必须做电子报价，[工程原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改
	//7：必须做电子报价，[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，可修改其它优惠
	else if (dzbjjc.equals("4") || dzbjjc.equals("7"))
	{
		%>
		<%@ include file="dzbjjc4.jsp" %>
		<%
	}
	else if (dzbjjc.equals("5"))//5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
	{
		%>
		<%@ include file="dzbjjc5.jsp" %>
		<%
	}
	else{
		out.println("『启用电子报价检查』错误！"+dzbjjc);
		return;
	}
%> 


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>是否返券</td>
      <td width="29%"> 
        <input type="radio" name="sffj"  value="Y" onKeyUp="keyGo(fjje)">
        是 
        <input type="radio" name="sffj"  value="N" onKeyUp="keyGo(sfyrz[0])" checked>
      否 </td>
      <td width="21%" align="right">返券卡号</td>
      <td width="29%"><input name="fqkh" type="text" id="fqkh" onKeyUp="keyGo(sfyrz[0])" value="" size="20" maxlength="20"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">返券总金额</td>
      <td width="29%"> 
        <input type="text" name="fjje" value="" size="20" maxlength="20" onKeyUp="keyGo(gsfje)">      </td>
      <td width="21%" align="right">公司承担返卷额</td>
      <td width="29%"> 
        <input type="text" name="gsfje" value="" size="20" maxlength="20" onKeyUp="keyGo(sfyrz[0])">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">是否已认证</td>
      <td><input type="radio" name="sfyrz"  value="Y">
是
  <input type="radio" name="sfyrz"  value="N" checked >
否 </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">认证市场</td>
      <td width="29%"><select name="rzsc" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' and cxbz='N' order by dwbh","");
%>
      </select></td>
      <td width="21%" align="right">认证费百分比</td>
      <td width="29%"><input type="text" name="rzfbfb" value="" size="10" maxlength="20"  >
%</td>
    </tr>
  </TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="21%" align="right"><font color="#FF0033">*</font>家装标志</td>
      <td width="29%"><%
	cf.radioToken(out, "jzbz","1+家装&2+公装",jzbz);
%></td>
      <td width="21%" align="right"><font color="#0000CC">信息来源</font></td>
      <td width="29%"><%=xxly%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">信息来源说明</td>
      <td colspan="3"><input name="xxlysm" type="text" value="<%=xxlysm%>" size="73" maxlength="100"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>户型</td>
      <td><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyTo(fgflbm)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%>
      </select></td>
      <td align="right"><font color="#FF0033">*</font>风格</td>
      <td><select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyTo(ysbm)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgyqbm);
%>
      </select></td>
    </tr>
</TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">开工时间</td>
      <td width="29%"> 
        <input type="radio" name="kgsjqd" value="Y" checked>
        已确定 
        <input type="radio" name="kgsjqd" value="N">
      未确定</td>
      <td width="21%" align="right"><font color="#FF0033">*</font>工期天数</td>
      <td width="29%">
      <input type="text" name="gqts" size="20" maxlength="10" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>建议交底日期</td>
      <td width="29%"> 
      <input type="text" name="jyjdrq" value="" size="20" maxlength="10" onKeyUp="keyGo(qyrq)"  ondblclick="JSCalendar(this)">      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>签约日期</td>
      <td width="29%"> 
      <input type="text" name="qyrq" value="<%=cf.today()%>" size="20" maxlength="10" onKeyUp="keyGo(kgrq)"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>合同开工日期</td>
      <td width="29%"> 
      <input type="text" name="kgrq" value="" size="20" maxlength="10" onKeyUp="keyGo(jgrq)"  ondblclick="JSCalendar(this)">      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>合同竣工日期</td>
      <td width="29%"> 
      <input type="text" name="jgrq" size="20" maxlength="10" onKeyUp="keyTo(hdbz)"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>回单标志</td>
      <td width="29%"> 
        <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(bz)">
          <%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm",hdbz);
%> 
      </select>      </td>
      <td width="21%" align="right">回单人</td>
      <td width="29%"> 
      <input type="text" name="hdr" value="<%=hdr%>" size="20" maxlength="20"  >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">回单工地队长</td>
      <td><input type="text" name="hdsgd" value="" size="20" maxlength="20"  ></td>
      <td align="right">回单工地班长</td>
      <td><input type="text" name="hdsgbz" value="" size="20" maxlength="20"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">回单工地</td>
      <td colspan="3"> 
        <input type="text" name="cgdz" value="<%=cgdz%>" size="73" maxlength="100" onKeyUp="keyGo(bz)" >      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">水质分析卡发放</td>
      <td width="29%"> 
        <input type="radio" name="sffk" value="Y">
        发卡 
        <input type="radio" name="sffk" value="N" checked>
      未发卡 </td>
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000CC">关系客户</font></td>
      <td width="29%"><select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyGo(khxm)">
        <%
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm where khlxbm='"+khlxbm+"'",khlxbm);
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">登记卡号</td>
      <td width="29%"> 
      <input type="text" name="djkh" value="" size="20" maxlength="20" >      </td>
      <td width="21%" align="right">发卡日期</td>
      <td width="29%"> 
      <input type="text" name="fkrq" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000CC">签约店面</font></td>
      <td width="29%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'","");
%> 
      </select>      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000CC">所属分公司</font></td>
      <td width="29%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">录入时间</font>      </td>
      <td width="29%"> 
      <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">      </td>
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">信息录入人</font>     </td>
      <td width="29%"> 
      <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        备注      </td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="2" onKeyUp="keyTo(savebutton)"></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)" name="savebutton">
		<input type="button"  value="一次性付款合同打印预览" onClick="f_dyht1(insertform)" name="dyht1" disabled >
		<input type="button"  value="分期付款合同打印预览" onClick="f_dyht2(insertform)" name="dyht2" disabled >
		<input type="button"  value="促销协议打印预览" onClick="f_cxxydy11(insertform)" name="cxxydy11" >
		<input type="button"  value="二期付款打印" onClick="f_dyht3(insertform)" name="dyht3" disabled >
		<input type="button"  value="客户装修须知" onClick="f_zxxzdy(insertform)" name="zxxzdy" >
		<input type="button" onClick="window.open('/dhzx/sjszxone/dybj.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="预览报价">
 		<input name="button" type="button" onClick="window.open('/dhzx/dhzx/ViewCrm_khzsxx.jsp?khbh=<%=khbh%>')" value="赠送信息">   
		
        <input type="hidden" name="sfcjq" value="1" >
        <input type="hidden" name="sffby" value="1" >
        <input type="hidden" name="hyklxbm" value="" >
        <input type="hidden" name="hykh" value="" >
        <input type="hidden" name="yxsjs" value="" >
        <input type="hidden" name="yxsjz" value="" >
        <input type="hidden" name="sjsbh" value="<%=sjsbh%>"  >
        <input type="hidden" name="ywyssxz" value="<%=ywyssxz%>"  >
        <input type="hidden" name="ywybm" value="<%=ywybm%>"  >
        <input type="hidden" name="pdqybm" value="<%=pdqybm%>"  >
        <input type="hidden" name="ysy" value="<%=ysy%>"  >
      <input type="hidden" name="dzbjjc" value="<%=dzbjjc%>">
      <input type="hidden" name="hyh" value="<%=hyh%>">
      <input type="hidden" name="sgd" value="<%=sgd%>">
      <input type="hidden" name="sgbz" value="<%=sgbz%>">
      <input type="hidden" name="zjxm" value="<%=zjxm%>">
      <input type="hidden" name="sfyckh" value="<%=sfyckh%>">
        <input type="hidden" name="cqhtbz" value="<%=cqhtbz%>"  >

      <input type="hidden" name="xjf" value="<%=xjf%>">

	  <input type="hidden" name="glf" value="0" >
      <input type="hidden" name="tcbzjg" value="<%=tcbzjg%>">
      <input type="hidden" name="tcmjzjje" value="<%=tcmjzjje%>">
      <input type="hidden" name="tczcsjcj" value="<%=tczcsjcj%>">
      <input type="hidden" name="tczccljj" value="<%=tczccljj%>">
      <input type="hidden" name="tcxsfzc" value="<%=tcxsfzc%>">
      <input type="hidden" name="tczcjm" value="<%=tczcjm%>">
      <input type="hidden" name="tcdpsj" value="<%=tcdpsj%>">

      <input type="hidden" name="tcdpdlsf" value="<%=tcdpdlsf%>">
      <input type="hidden" name="tcxpx" value="<%=tcxpx%>">
      <input type="hidden" name="tcwsgzj" value="<%=tcwsgzj%>">

      <input type="hidden" name="tcwgccljj" value="<%=tcwgccljj%>">
      <input type="hidden" name="tcwzjzc" value="<%=tcwzjzc%>">
      <input type="hidden" name="tcsgze" value="<%=tcsgze%>">
      <input type="hidden" name="tcqtsf" value="<%=tcqtsf%>">
      <input type="hidden" name="zctcje" value="<%=zctcje%>">
      <input type="hidden" name="wntcje" value="<%=wntcje%>">
      <input type="hidden" name="jytcje" value="<%=jytcje%>">
      <input type="hidden" name="sctcje" value="<%=sctcje%>">
      <input type="hidden" name="jktcje" value="<%=jktcje%>">
      <input type="hidden" name="sjhtsjf" value="<%=sjhtsjf%>">
	  </td>
    </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	<%
	if (dzbjjc.equals("1"))//1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]
	{
		%>
		//工程直接费－折后
		var zhgczjf=FormName.zqgczjf.value/10.0*FormName.gcfqdzk.value-FormName.cdzwjmje.value;
		zhgczjf=round(zhgczjf,2);
		FormName.zhgczjf.value=zhgczjf;

		//设计费－折后
		var sjf=FormName.zqsjf.value/10.0*FormName.sjfzk.value;
		sjf=round(sjf,2);
		FormName.sjf.value=sjf;

		//管理费－折前
		var glfjs=FormName.zqgczjf.value*1.0+FormName.zqqtsf.value*1.0+FormName.zqwjrqyexm.value*1.0+FormName.zqsjf.value*1.0;//管理费基数
		var zqguanlif=glfjs*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  

		//管理费－折后
		var guanlif=FormName.zqguanlif.value*FormName.glfzk.value/10.0-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		//折前税金
		var sjjs=glfjs+FormName.zqguanlif.value*1;//税金基数
		var zqsuijin=sjjs*FormName.suijinbfb.value/100.0 ;
		zqsuijin=round(zqsuijin,2);
		FormName.zqsuijin.value=zqsuijin;     

		//折后税金
		var suijin=FormName.zqsuijin.value*FormName.sjzk.value/10.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		//折前合同总额=折前工程直接费＋折前管理费＋折前税金＋折前记入业绩其它费＋折前不记业绩其它费＋折前设计费
		var wdzgce=FormName.zqgczjf.value*1.0+FormName.zqguanlif.value*1.0+FormName.zqsuijin.value*1.0+FormName.zqqtsf.value*1.0+FormName.zqwjrqyexm.value*1.0+FormName.zqsjf.value*1.0;
		wdzgce=round(wdzgce,2);
		FormName.wdzgce.value=wdzgce;     

		//折后合同总额=折后工程直接费＋折后管理费＋折后税金＋折后记入业绩其它费＋折后不记业绩其它费＋折后设计费
		var qye=FormName.zhgczjf.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0-FormName.djfxje.value*1.0-FormName.zjjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;    

		//综合折扣
		var zkl=0;
		if (FormName.wdzgce.value*1!=0)
		{
			zkl=FormName.qye.value*10.0/FormName.wdzgce.value;
		}
		else{
			zkl=10;
		}
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;    
		
		//合同净值=折后合同总额－税金（折后）-赠送净值-赠送代金券－工程费减免额－管理费减免额－税金减免额
		var htjz=FormName.qye.value*1.0-FormName.suijin.value*1.0-FormName.hdzsjz.value*1.0-FormName.djjje.value*1.0-FormName.cdzwjmje.value*1.0-FormName.glfjmje.value*1.0-FormName.sjjmje.value*1.0;
		htjz=round(htjz,2);
		FormName.htjz.value=htjz;    

		//毛利额=合同净值－施工成本价
		var mle=(FormName.htjz.value*1.0-FormName.sgcbj.value*1.0);
		mle=round(mle,2);
		FormName.mle.value=mle;    

		//毛利率=毛利额÷合同净值
		var mll=FormName.mle.value*1.0/FormName.htjz.value*1.0*100;
		mll=round(mll,2);
		FormName.mll.value=mll;    

		//业绩净值=毛利额÷业绩净值参数
		var yjjz=FormName.mle.value*100/FormName.yjjzcs.value;
		yjjz=round(yjjz,2);
		FormName.yjjz.value=yjjz;    

		<%
	}
	else if (dzbjjc.equals("2"))//2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率]
	{
		%>
		//工程费签单折扣
		var gcfqdzk=FormName.zhgczjf.value*10.0/FormName.zqgczjf.value;
		gcfqdzk=round(gcfqdzk,2);
		FormName.gcfqdzk.value=gcfqdzk;
		if (FormName.zqgczjf.value==0)
		{
			FormName.gcfqdzk.value=10;
		}

		//设计费折扣
		var sjfzk=FormName.sjf.value*10.0/FormName.zqsjf.value;
		sjfzk=round(sjfzk,2);
		FormName.sjfzk.value=sjfzk;
		if (FormName.zqsjf.value==0)
		{
			FormName.sjfzk.value=10;
		}

		//管理费－折前
		var zqglfjs=FormName.zqgczjf.value*1.0+FormName.zqqtsf.value*1.0+FormName.zqwjrqyexm.value*1.0+FormName.zqsjf.value*1.0;//管理费基数
		var zqguanlif=zqglfjs*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  

		//管理费－折后
		var zhglfjs=FormName.zhgczjf.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0;//管理费基数
		var guanlif=zhglfjs*FormName.glfbfb.value/100.0;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		//管理费折扣
		var glfzk=FormName.guanlif.value*10.0/FormName.zqguanlif.value;
		glfzk=round(glfzk,2);
		FormName.glfzk.value=glfzk;
		if (FormName.zqguanlif.value==0)
		{
			FormName.glfzk.value=10;
		}

		//折前税金
		var zqsjjs=zqglfjs+FormName.zqguanlif.value*1;//税金基数
		var zqsuijin=zqsjjs*FormName.suijinbfb.value/100.0 ;
		zqsuijin=round(zqsuijin,2);
		FormName.zqsuijin.value=zqsuijin;     

		//折后税金
		var zhsjjs=zhglfjs+FormName.guanlif.value*1;//税金基数
		var suijin=zhsjjs*FormName.suijinbfb.value/100.0 ;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		//税金折扣
		var sjzk=FormName.suijin.value*10.0/FormName.zqsuijin.value;
		sjzk=round(sjzk,2);
		FormName.sjzk.value=sjzk;
		if (FormName.zqsuijin.value==0)
		{
			FormName.sjzk.value=10;
		}

		//折前合同总额=折前工程直接费＋折前管理费＋折前税金＋折前记入业绩其它费＋折前不记业绩其它费＋折前设计费
		var wdzgce=FormName.zqgczjf.value*1.0+FormName.zqguanlif.value*1.0+FormName.zqsuijin.value*1.0+FormName.zqqtsf.value*1.0+FormName.zqwjrqyexm.value*1.0+FormName.zqsjf.value*1.0;
		wdzgce=round(wdzgce,2);
		FormName.wdzgce.value=wdzgce;     

		//折后合同总额=折后工程直接费＋折后管理费＋折后税金＋折后记入业绩其它费＋折后不记业绩其它费＋折后设计费
		var qye=FormName.zhgczjf.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0-FormName.djfxje.value*1.0-FormName.zjjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;    

		//综合折扣
		var zkl=0;
		if (FormName.wdzgce.value*1!=0)
		{
			zkl=FormName.qye.value*10.0/FormName.wdzgce.value;
		}
		else{
			zkl=10;
		}
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;    
		
		//合同净值=折后合同总额－税金（折后）-赠送净值-赠送代金券－工程费减免额－管理费减免额－税金减免额
		var htjz=FormName.qye.value*1.0-FormName.suijin.value*1.0-FormName.hdzsjz.value*1.0-FormName.djjje.value*1.0-FormName.cdzwjmje.value*1.0-FormName.glfjmje.value*1.0-FormName.sjjmje.value*1.0;
		htjz=round(htjz,2);
		FormName.htjz.value=htjz;    

		//毛利额=合同净值－施工成本价
		var mle=(FormName.htjz.value*1.0-FormName.sgcbj.value*1.0);
		mle=round(mle,2);
		FormName.mle.value=mle;    

		//毛利率=毛利额÷合同净值
		var mll=FormName.mle.value*1.0/FormName.htjz.value*1.0*100;
		mll=round(mll,2);
		FormName.mll.value=mll;    

		//业绩净值=毛利额÷业绩净值参数
		var yjjz=FormName.mle.value*100/FormName.yjjzcs.value;
		yjjz=round(yjjz,2);
		FormName.yjjz.value=yjjz;    

		<%
	}
	else if (dzbjjc.equals("3"))//3：全部人工录入[折扣率、签约额、合同原报价]，不自动计算，不记录减免
	{
	}
	else if (dzbjjc.equals("6"))//6：全部人工录入[折扣率、签约额、合同原报价] ，不自动计算，记录减免
	{
	}
	//4：必须做电子报价，[工程原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改
	//7：必须做电子报价，[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，可修改其它优惠
	else if (dzbjjc.equals("4") || dzbjjc.equals("7"))
	{
		%>
		//工程费减免额
		var zhgczjf=<%=oldzhgczjf%>-FormName.cdzwjmje.value*1.0;
		zhgczjf=round(zhgczjf,2);
		FormName.zhgczjf.value=zhgczjf;

		//管理费减免额
		var guanlif=<%=oldguanlif%>-FormName.glfjmje.value*1.0;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;

		//税金减免额
		var suijin=<%=oldsuijin%>-FormName.sjjmje.value*1.0;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;


		//折后合同总额=折后工程直接费＋折后管理费＋折后税金＋折后记入业绩其它费＋折后不记业绩其它费＋折后设计费
		var qye=FormName.zhgczjf.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0-FormName.djfxje.value*1.0-FormName.zjjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;    

		//综合折扣
		var zkl=0;
		if (FormName.wdzgce.value*1!=0)
		{
			zkl=FormName.qye.value*10.0/FormName.wdzgce.value;
		}
		else{
			zkl=10;
		}
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;    
		
		//合同净值=合同净值－工程费减免额－管理费减免额－税金减免额
		var htjz=<%=oldhtjz%>-FormName.cdzwjmje.value*1.0-FormName.glfjmje.value*1.0-FormName.sjjmje.value*1.0;
		htjz=round(htjz,2);
		FormName.htjz.value=htjz;    

		//毛利额=合同净值－施工成本价
		var mle=(FormName.htjz.value*1.0-FormName.sgcbj.value*1.0);
		mle=round(mle,2);
		FormName.mle.value=mle;    

		//毛利率=毛利额÷合同净值
		var mll=FormName.mle.value*1.0/FormName.htjz.value*1.0*100;
		mll=round(mll,2);
		FormName.mll.value=mll;    

		//业绩净值=毛利额÷业绩净值参数
		var yjjz=FormName.mle.value*100/FormName.yjjzcs.value;
		yjjz=round(yjjz,2);
		FormName.yjjz.value=yjjz;    
		<%
	}
	else if (dzbjjc.equals("5"))//5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
	{
		%>
		//工程直接费－折后
		var zhgczjf=FormName.zqgczjf.value/10.0*FormName.gcfqdzk.value-FormName.cdzwjmje.value;
		zhgczjf=round(zhgczjf,2);
		FormName.zhgczjf.value=zhgczjf;

		//设计费－折后
		var sjf=FormName.zqsjf.value/10.0*FormName.sjfzk.value;
		sjf=round(sjf,2);
		FormName.sjf.value=sjf;

		//管理费－折后
		var guanlif=FormName.zqguanlif.value*FormName.glfzk.value/10.0-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		//折后税金
		var suijin=FormName.zqsuijin.value*FormName.sjzk.value/10.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		//折后合同总额=折后工程直接费＋折后管理费＋折后税金＋折后记入业绩其它费＋折后不记业绩其它费＋折后设计费
		var qye=FormName.zhgczjf.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0-FormName.djfxje.value*1.0-FormName.zjjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;    

		//综合折扣
		var zkl=0;
		if (FormName.wdzgce.value*1!=0)
		{
			zkl=FormName.qye.value*10.0/FormName.wdzgce.value;
		}
		else{
			zkl=10;
		}
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;    
		
		//合同净值=折后合同总额－税金（折后）-赠送净值-赠送代金券－工程费减免额－管理费减免额－税金减免额
		var htjz=FormName.qye.value*1.0-FormName.suijin.value*1.0-FormName.hdzsjz.value*1.0-FormName.djjje.value*1.0-FormName.cdzwjmje.value*1.0-FormName.glfjmje.value*1.0-FormName.sjjmje.value*1.0;
		htjz=round(htjz,2);
		FormName.htjz.value=htjz;    

		//毛利额=合同净值－施工成本价
		var mle=(FormName.htjz.value*1.0-FormName.sgcbj.value*1.0);
		mle=round(mle,2);
		FormName.mle.value=mle;    

		//毛利率=毛利额÷合同净值
		var mll=FormName.mle.value*1.0/FormName.htjz.value*1.0*100;
		mll=round(mll,2);
		FormName.mll.value=mll;    

		//业绩净值=毛利额÷业绩净值参数
		var yjjz=FormName.mle.value*100/FormName.yjjzcs.value;
		yjjz=round(yjjz,2);
		FormName.yjjz.value=yjjz;    
		<%
	}
	%>
	
	
	FormName.pmjj.value=parseInt(FormName.qye.value/FormName.fwmj.value);      
}    


function cf_hdbz(FormName){  
	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单;5：员工回单
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		FormName.cgdz.disabled=false;
		FormName.hdr.disabled=false;
	}
}      

function f_do(FormName)//参数FormName:Form的名称
{
	calValue(FormName);


	if(	javaTrim(FormName.fkfabm)=="") {
		alert("请输入[付款方案]！");
		FormName.fkfabm.focus();
		return false;
	}

	if(	javaTrim(FormName.hth)=="") {
		alert("请输入[合同号]！");
		FormName.hth.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.smhtbh)=="") {
		alert("请输入[书面合同编号]！");
		FormName.smhtbh.focus();
		return false;
	}
*/
	<%
	if (bjjb.equals(""))
	{
		%>
		if(	!radioChecked(FormName.bjjb)) {
			alert("请选择[报价级别]！");
			FormName.bjjb[0].focus();
			return false;
		}
		<%
	}
	else 
	{
		%>
		if(!FormName.bjjb.checked) {
			alert("请输入[报价级别]！");
			FormName.bjjb.focus();
			return false;
		}
		<%
	}
	%>

	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.clgw)=="") {
//		alert("请输入[材料顾问]！");
//		FormName.clgw.focus();
//		return false;
	}
	if(FormName.lxfs.value=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}

	if(!(isEmail(FormName.email, "电子邮件"))) {
		return false;
	}

	if(	javaTrim(FormName.cqbm)=="") {
		alert("请输入[所属区域]！");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("请输入[小区/街道]！");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.louhao)=="") {
		alert("请输入[楼号/门牌号]！");
		FormName.louhao.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
		if(	javaTrim(FormName.sfzhm)=="") {
			alert("请输入[身份证号码]！");
			FormName.sfzhm.focus();
			return false;
		}
		if(!(isSfzhm(FormName.sfzhm, "身份证号码"))) {
			return false;
		}

<%
	if (ssfgs.equals("FBJ00"))
	{
		%>
		if(	!radioChecked(FormName.sffk)) {
			alert("请选择[水质分析卡是否发放]！");
			FormName.sffk[0].focus();
			return false;
		}
		if (FormName.sffk[0].checked)
		{
			if(	javaTrim(FormName.djkh)=="") {
				alert("请输入[登记卡号]！");
				FormName.djkh.focus();
				return false;
			}
			if(	javaTrim(FormName.fkrq)=="") {
				alert("请输入[发卡日期]！");
				FormName.fkrq.focus();
				return false;
			}
			if(!(isDatetime(FormName.fkrq, "发卡日期"))) {
				return false;
			}
		}
		else{
			FormName.djkh.value="";
			FormName.fkrq.value="";
		}
		<%
	}
%>
	
	if(	javaTrim(FormName.dianz)=="") {
		alert("请输入[店长]！");
		FormName.dianz.focus();
		return false;
	}
	if(	javaTrim(FormName.sjs)=="") {
		alert("请输入[设计师]！");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("请选择[关系客户]！");
		FormName.khlxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.hxbm)=="") {
		alert("请输入[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgflbm)=="") {
		alert("请输入[风格分类]！");
		FormName.fgflbm.focus();
		return false;
	}

	if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[面积]！");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "面积"))) {
		return false;
	}
	if (parseInt(FormName.fwmj.value)==0)
	{
		alert("[面积]不能为0！");
		FormName.fwmj.select();
		return false;
	}


	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[合同总额－折前]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "工程原报价"))) {
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)==0)
	{
		alert("[合同总额－折前]不能为0！");
		FormName.wdzgce.select();
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)<parseFloat(FormName.qye.value))
	{
		alert("[合同总额－折前]不能小于[合同总额－折后]！");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[合同总额－折后]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "合同总额－折后"))) {
		return false;
	}
	if (parseFloat(FormName.qye.value)<=0)
	{
		alert("[合同总额－折后]不能小<=0！");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("请输入[综合折扣率]！");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "综合折扣率"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("错误！[综合折扣率]应该在0和10之间！");
		FormName.zkl.select();
		return false;
	}

	if(	javaTrim(FormName.cdzwjmje)=="") {
		alert("请输入[额]！");
		FormName.cdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.cdzwjmje, "工程费减免额"))) {
		return false;
	}
	if (  parseFloat(FormName.cdzwjmje.value)<-100 || parseFloat(FormName.cdzwjmje.value)>100)
	{
		alert("错误！[工程费减免额]应该在-100和100之间！");
		FormName.cdzwjmje.select();
		return false;
	}
	if(	javaTrim(FormName.glfjmje)=="") {
		alert("请输入[管理费减免额]！");
		FormName.glfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.glfjmje, "管理费减免额"))) {
		return false;
	}
	if ( parseFloat(FormName.glfjmje.value)<-100 || parseFloat(FormName.glfjmje.value)>100)
	{
		alert("错误！[管理费减免额]应该在-100和100之间！");
		FormName.glfjmje.select();
		return false;
	}
	if(	javaTrim(FormName.sjjmje)=="") {
		alert("请输入[税金减免额]！");
		FormName.sjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjmje, "税金减免额"))) {
		return false;
	}
	if (  parseFloat(FormName.sjjmje.value)<-100 || parseFloat(FormName.sjjmje.value)>100)
	{
		alert("错误！[税金减免额]应该在-100和100之间！");
		FormName.sjjmje.select();
		return false;
	}



	
	if(	javaTrim(FormName.zqsjf)=="") {
		alert("请输入[设计费－折前]！");
		FormName.zqsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.zqsjf, "设计费－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.sjf)=="") {
		alert("请输入[设计费－折后]！");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "设计费－折后"))) {
		return false;
	}
	if(	javaTrim(FormName.zqhtzcbj)=="") {
		alert("请输入[合同主材报价－折前]！");
		FormName.zqhtzcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqhtzcbj, "合同主材报价－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhhtzcbj)=="") {
		alert("请输入[合同主材报价－折后]！");
		FormName.zhhtzcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhhtzcbj, "合同主材报价－折后"))) {
		return false;
	}
	if(	javaTrim(FormName.djfxje)=="") {
		alert("请输入[订金返现金额]！");
		FormName.djfxje.focus();
		return false;
	}
	if(!(isFloat(FormName.djfxje, "订金返现金额"))) {
		return false;
	}

	
	
	if(	javaTrim(FormName.suijinbfb)=="") {
		alert("请输入[税金百分比]！");
		FormName.suijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.suijinbfb, "税金百分比"))) {
		return false;
	}
	if (FormName.suijinbfb.value<0 || FormName.suijinbfb.value>100)
	{
		alert("错误！[税金百分比]应该在0和100之间！");
		FormName.suijinbfb.select();
		return false;
	}
	if(	javaTrim(FormName.zqsuijin)=="") {
		alert("请输入[折前税金]！");
		FormName.zqsuijin.select();
		return false;
	}
	if(!(isFloat(FormName.zqsuijin, "折前税金"))) {
		return false;
	}
	if(	javaTrim(FormName.suijin)=="") {
		alert("请输入[税金]！");
		FormName.suijin.select();
		return false;
	}
	if(!(isFloat(FormName.suijin, "税金"))) {
		return false;
	}
	if (parseFloat(FormName.suijin.value)<0)
	{
		alert("[税金]不能<0！");
		FormName.suijin.select();
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("请输入[服务费]！");
		FormName.select.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "服务费"))) {
		return false;
	}

	if(	javaTrim(FormName.glfbfb)=="") {
		alert("请输入[管理费百分比]！");
		FormName.glfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.glfbfb, "管理费百分比"))) {
		return false;
	}
	if (FormName.glfbfb.value<0 || FormName.glfbfb.value>100)
	{
		alert("错误！[管理费百分比]应该在0和100之间！");
		FormName.glfbfb.select();
		return false;
	}
	if(	javaTrim(FormName.zqguanlif)=="") {
		alert("请输入[折前管理费]！");
		FormName.zqguanlif.select();
		return false;
	}
	if(!(isFloat(FormName.zqguanlif, "折前管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.guanlif)=="") {
		alert("请输入[折后管理费]！");
		FormName.guanlif.select();
		return false;
	}
	if(!(isFloat(FormName.guanlif, "折后管理费"))) {
		return false;
	}
	if (parseFloat(FormName.guanlif.value)<0)
	{
		alert("[折后管理费]不能<0！");
		FormName.guanlif.select();
		return false;
	}


	if(	javaTrim(FormName.djjbfb)=="") {
		alert("请输入[代金券百分比]！");
		FormName.djjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.djjbfb, "代金券百分比"))) {
		return false;
	}
	if (FormName.djjbfb.value<0 || FormName.djjbfb.value>100)
	{
		alert("错误！[代金券百分比]应该在0和100之间！");
		FormName.djjbfb.select();
		return false;
	}
	if(	javaTrim(FormName.djjje)=="") {
		alert("请输入[赠送代金券]！");
		FormName.djjje.select();
		return false;
	}
	if(!(isFloat(FormName.djjje, "赠送代金券"))) {
		return false;
	}
	if(	javaTrim(FormName.hdzsjz)=="") {
		alert("请输入[赠送净值]！");
		FormName.hdzsjz.select();
		return false;
	}
	if(!(isFloat(FormName.hdzsjz, "赠送净值"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcbj)=="") {
		alert("请输入[施工成本价]！");
		FormName.sgcbj.select();
		return false;
	}
	if(!(isFloat(FormName.sgcbj, "施工成本价"))) {
		return false;
	}
	if(	javaTrim(FormName.gcjcbj)=="") {
		alert("请输入[工程基础报价]！");
		FormName.gcjcbj.select();
		return false;
	}
	if(!(isFloat(FormName.gcjcbj, "工程基础报价"))) {
		return false;
	}
	if(	javaTrim(FormName.htjz)=="") {
		alert("请输入[合同净值]！");
		FormName.htjz.select();
		return false;
	}
	if(!(isFloat(FormName.htjz, "合同净值"))) {
		return false;
	}
	if (parseFloat(FormName.htjz.value)<0)
	{
		alert("[合同净值]不能<0！");
		FormName.htjz.select();
		return false;
	}
	if(	javaTrim(FormName.mll)=="") {
		alert("请输入[毛利率]！");
		FormName.mll.select();
		return false;
	}
	if(!(isFloat(FormName.mll, "毛利率"))) {
		return false;
	}
	if (parseFloat(FormName.mll.value)>100)
	{
		alert("[毛利率]不能>100！");
		FormName.mll.select();
		return false;
	}

	if(	javaTrim(FormName.zqgczjf)=="") {
		alert("请输入[工程直接费－折前]！");
		FormName.zqgczjf.select();
		return false;
	}
	if(!(isFloat(FormName.zqgczjf, "工程直接费－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhgczjf)=="") {
		alert("请输入[工程直接费－折后]！");
		FormName.zhgczjf.select();
		return false;
	}
	if(!(isFloat(FormName.zhgczjf, "工程直接费－折后"))) {
		return false;
	}


	if(	javaTrim(FormName.zqqtsf)=="") {
		alert("请输入[记入业绩其它费－折前]！");
		FormName.zqqtsf.select();
		return false;
	}
	if(!(isFloat(FormName.zqqtsf, "记入业绩其它费－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhqtsf)=="") {
		alert("请输入[记入业绩其它费－折后]！");
		FormName.zhqtsf.select();
		return false;
	}
	if(!(isFloat(FormName.zhqtsf, "记入业绩其它费－折后"))) {
		return false;
	}

	if (FormName.zqqtsf.value!=0)
	{
		if(	javaTrim(FormName.qtsfsm)=="") {
			alert("请输入[记入业绩其它费项目]！");
			FormName.qtsfsm.select();
			return false;
		}
	}

	if(	javaTrim(FormName.zqwjrqyexm)=="") {
		alert("请输入[不记业绩其它费－折前]！");
		FormName.zqwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zqwjrqyexm, "不记业绩其它费－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhwjrqyexm)=="") {
		alert("请输入[不记业绩其它费－折后]！");
		FormName.zhwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zhwjrqyexm, "不记业绩其它费－折后"))) {
		return false;
	}

	if (FormName.zqwjrqyexm.value!=0)
	{
		if(	javaTrim(FormName.wjrqyexmsm)=="") {
			alert("请输入[记业绩其它费项目]！");
			FormName.wjrqyexmsm.select();
			return false;
		}
	}


	if(	javaTrim(FormName.pmjj)=="") {
		alert("请输入[每平米均价]！");
		FormName.pmjj.focus();
		return false;
	}
	if(!(isNumber(FormName.pmjj, "每平米均价"))) {
		return false;
	}






	if(	!radioChecked(FormName.sffj)) {
		alert("请选择[是否返券]！");
		FormName.sffj[0].focus();
		return false;
	}

	if (FormName.sffj[0].checked)
	{
		if(	javaTrim(FormName.fjje)=="") {
			alert("请输入[返卷总金额]！");
			FormName.fjje.focus();
			return false;
		}
		if(!(isFloat(FormName.fjje, "返卷总金额"))) {
			return false;
		}
		if(	javaTrim(FormName.gsfje)=="") {
			alert("请输入[公司承担返卷额]！");
			FormName.gsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.gsfje, "公司承担返卷额"))) {
			return false;
		}
		if (parseFloat(FormName.fjje.value)<parseFloat(FormName.gsfje.value))
		{
			alert("[返卷总金额]不能小于[公司承担返卷额]！");
			FormName.gsfje.select();
			return false;
		}
	}
	else{
		FormName.fjje.value="";
		FormName.gsfje.value="";
	}


	if(	!radioChecked(FormName.sfyrz)) {
		alert("请选择[是否已认证]！");
		FormName.sfyrz[0].focus();
		return false;
	}

	if (FormName.sfyrz[0].checked)
	{
		if(	javaTrim(FormName.rzsc)=="") {
			alert("请输入[认证市场]！");
			FormName.rzsc.focus();
			return false;
		}
		if(	javaTrim(FormName.rzfbfb)=="") {
			alert("请输入[认证费百分比]！");
			FormName.rzfbfb.focus();
			return false;
		}
		if(!(isFloat(FormName.rzfbfb, "认证费百分比"))) {
			return false;
		}
		if (FormName.rzfbfb.value<0 || FormName.rzfbfb.value>100)
		{
			alert("错误！[认证费百分比]应该在0和100之间！");
			FormName.rzfbfb.select();
			return false;
		}
	}
	else{
		FormName.rzsc.value="";
		FormName.rzfbfb.value="";
	}

	if(	javaTrim(FormName.qyrq)=="") {
		alert("请输入[签约日期]！");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if (FormName.qyrq.value>"<%=cf.today()%>")
	{
		alert("[签约日期]不能大于[今天]！");
		FormName.qyrq.select();
		return false;
	}

	if (FormName.kgsjqd[0].checked)
	{
		if(	javaTrim(FormName.jyjdrq)=="") {
			alert("请输入[建议交底日期]！");
			FormName.jyjdrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jyjdrq, "建议交底日期"))) {
			return false;
		}
		if(	javaTrim(FormName.kgrq)=="") {
			alert("请输入[合同开工日期]！");
			FormName.kgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.kgrq, "合同开工日期"))) {
			return false;
		}
		if(	javaTrim(FormName.jgrq)=="") {
			alert("请输入[合同竣工日期]！");
			FormName.jgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jgrq, "合同竣工日期"))) {
			return false;
		}
		if (FormName.qyrq.value>FormName.jyjdrq.value)
		{
			alert("[建议交底日期]应大于[签约日期]！");
			FormName.jyjdrq.select();
			return false;
		}

		if (FormName.jyjdrq.value>FormName.kgrq.value)
		{
			alert("[合同开工日期]应大于[建议交底日期]！");
			FormName.kgrq.select();
			return false;
		}

		if (FormName.kgrq.value>=FormName.jgrq.value)
		{
			alert("[合同竣工日期]应大于[合同开工日期]！");
			FormName.jgrq.select();
			return false;
		}
		var num=days(FormName.jgrq.value,FormName.kgrq.value);
		if (num<45)
		{
			alert("开工日期和竣工日期时间间隔不能小于45天，目前为:"+num);
			FormName.jgrq.select();
			return false;
		}
	}
	else{
		if (FormName.jyjdrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[建议交底日期]！");
			FormName.jyjdrq.select();
			return false;
		}
		if (FormName.kgrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[合同开工日期]！");
			FormName.kgrq.select();
			return false;
		}
		if (FormName.jgrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[合同竣工日期]！");
			FormName.jgrq.select();
			return false;
		}
	}



	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}


	if(	javaTrim(FormName.hdbz)=="") {
		alert("请选择[回单标志]！");
		FormName.hdbz.focus();
		return false;
	}

	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单
		FormName.cgdz.value="";
		FormName.hdr.value="";
		FormName.hdsgd.value="";
		FormName.hdsgbz.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
		FormName.hdsgd.disabled=true;
		FormName.hdsgbz.disabled=true;
	}
	else {
		if(	javaTrim(FormName.cgdz)=="") {
			alert("请输入[回单装修地址]！");
			FormName.cgdz.focus();
			return false;
		}
		if(	javaTrim(FormName.hdr)=="") {
			alert("请输入[回单人]！");
			FormName.hdr.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgd)=="") {
			alert("请输入[回单工地队长]！");
			FormName.hdsgd.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgbz)=="") {
			alert("请输入[回单工地班长]！");
			FormName.hdsgbz.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[信息录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[签约店面]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[所属分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxsjs, "会员有效时间始"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxsjz, "会员有效时间止"))) {
		return false;
	}
	if(	!radioChecked(FormName.jzbz)) {
		alert("请选择[家装标志]！");
		FormName.jzbz[0].focus();
		return false;
	}


	if(	javaTrim(FormName.gqts)=="") {
		alert("请选择[工期天数]！");
		FormName.gqts.focus();
		return false;
	}
	if(!(isNumber(FormName.gqts, "工期天数"))) {
		return false;
	}

	FormName.action="SaveInsertCrm_khxx.jsp";
	FormName.submit();
	FormName.dyht1.disabled=false;
	FormName.dyht2.disabled=false;
	FormName.dyht3.disabled=false;

	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{

	FormName.action="/dzbj/zxbjmx/Bj_khbjmxDyList.jsp";
	FormName.submit();
	return true;
}
function f_lrfkjh(FormName)//参数FormName:Form的名称
{

	FormName.action="/cwgl/fkjh/InsertCw_jzfkjh.jsp";
	FormName.submit();
	FormName.ckfkjh.disabled=false;
	return true;
}

function f_dyht1(FormName)//参数FormName:Form的名称打印合同预览按钮
{

	FormName.action="/dyht/dyht1.jsp";
	FormName.submit();
	FormName.dyht.disabled=false;
	return true;
}
function f_dyht3(FormName)//参数FormName:Form的名称打印合同预览按钮
{

	FormName.action="/dyht/dyht3.jsp";
	FormName.submit();
	FormName.dyht.disabled=false;
	return true;
}
function f_zxxzdy(FormName)//参数FormName:Form的名称打印合同预览按钮
{

	FormName.action="/dyht/zxxzdy.jsp";
	FormName.submit();
	FormName.dyht.disabled=false;
	return true;
}
function f_dyht2(FormName)//参数FormName:Form的名称打印合同预览按钮
{

	if(FormName.bjjb.value=="B"||FormName.bjjb.value=="D"||FormName.bjjb.value=="E"||FormName.bjjb.value=="F")
	{
	FormName.action="/dyht/dyht2_tc.jsp";
	FormName.submit();
	FormName.dyht.disabled=false;
	return true;
	}
    else{
    FormName.action="/dyht/dyht2.jsp";
	FormName.submit();
	FormName.dyht.disabled=false;
	return true;
	}
	
	
}

function f_cxxydy11(FormName)//参数FormName:Form的名称打印合同预览按钮
{
    
    if(FormName.bjjb.value=="B"||FormName.bjjb.value=="D"||FormName.bjjb.value=="E"||FormName.bjjb.value=="F")
	{
		FormName.action="/cxxydy/cxxydy11_tc.jsp";
		FormName.submit();
	}
    else{
		FormName.action="/cxxydy/cxxydy11.jsp";
		FormName.submit();
		return true;
	}
}


//-->
</SCRIPT>
