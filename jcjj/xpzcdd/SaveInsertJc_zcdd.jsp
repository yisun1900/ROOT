<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String khbh=null;
String clgw=null;
String xmzy=null;
String ddshbz=null;
double hkze=0;
double htcxhdje=0;
java.sql.Date jhtzshsj=null;
java.sql.Date kjxsj=null;
java.sql.Date htshsj=null;
String lrr=null;
java.sql.Date qhtsj=null;
java.sql.Date lrsj=null;
String dwbh=null;
String bz=null;
String zt=request.getParameter("zt");
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
clgw=cf.GB2Uni(request.getParameter("clgw"));
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
ddshbz=cf.GB2Uni(request.getParameter("ddshbz"));
ls=request.getParameter("hkze");
try{
	if (!(ls.equals("")))  hkze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hkze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同总额]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("htcxhdje");
try{
	if (!(ls.equals("")))  htcxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htcxhdje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计入促销活动金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhtzshsj");
try{
	if (!(ls.equals("")))  jhtzshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhtzshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划通知送货时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kjxsj");
try{
	if (!(ls.equals("")))  kjxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kjxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[可减项截止时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("htshsj");
try{
	if (!(ls.equals("")))  htshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同送货时间]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("qhtsj");
try{
	if (!(ls.equals("")))  qhtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qhtsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签合同时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
String jjsjs=cf.GB2Uni(request.getParameter("jjsjs"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String qddm=cf.GB2Uni(request.getParameter("qddm"));
String jzsjs=cf.GB2Uni(request.getParameter("jzsjs"));
String khjl=cf.GB2Uni(request.getParameter("khjl"));

//String dgkh=cf.GB2Uni(request.getParameter("dgkh"));
String xshth=cf.GB2Uni(request.getParameter("xshth"));


double zczkl=0;
ls=request.getParameter("zczkl");
try{
	if (!(ls.equals("")))  zczkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zczkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订单折扣]类型转换发生意外:"+e);
	return;
}
double jmje=0;
ls=request.getParameter("jmje");
try{
	if (!(ls.equals("")))  jmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[减免金额]类型转换发生意外:"+e);
	return;
}


double zqclf=0;
ls=request.getParameter("zqclf");
try{
	if (!(ls.equals("")))  zqclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqclf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料费]类型转换发生意外:"+e);
	return;
}
double qtf=0;
ls=request.getParameter("qtf");
try{
	if (!(ls.equals("")))  qtf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[安装辅料加工费]类型转换发生意外:"+e);
	return;
}
double ycf=0;
ls=request.getParameter("ycf");
try{
	if (!(ls.equals("")))  ycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ycf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[远程费]类型转换发生意外:"+e);
	return;
}
double zcpclf=0;
ls=request.getParameter("zcpclf");
try{
	if (!(ls.equals("")))  zcpclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcpclf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[正常品-材料费]类型转换发生意外:"+e);
	return;
}
double tjpclf=0;
ls=request.getParameter("tjpclf");
try{
	if (!(ls.equals("")))  tjpclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tjpclf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特价品-材料费]类型转换发生意外:"+e);
	return;
}

double djjzkje=0;
ls=request.getParameter("djjzkje");
try{
	if (!(ls.equals("")))  djjzkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djjzkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材代金券]类型转换发生意外:"+e);
	return;
}

double yfkzkje=0;
ls=request.getParameter("yfkzkje");
try{
	if (!(ls.equals("")))  yfkzkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yfkzkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材预付款类型转换发生意外:"+e);
	return;
}

double zzczkzkje=0;
ls=request.getParameter("zzczkzkje");
try{
	if (!(ls.equals("")))  zzczkzkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zzczkzkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增值储值卡类型转换发生意外:"+e);
	return;
}
String djqmc=cf.GB2Uni(request.getParameter("djqmc"));
double djqje=0;
ls=request.getParameter("djqje");
try{
	if (!(ls.equals("")))  djqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djqje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[使用代金券金额类型转换发生意外:"+e);
	return;
}

String dzyy=cf.GB2Uni(request.getParameter("dzyy"));
String xclbz="1";//1：非定制式产品；2：定制式产品
String sjbh=cf.GB2Uni(request.getParameter("sjbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//检查客户结算＋＋＋＋＋＋＋＋＋＋＋＋开始
	String getkhjsbz="";
	ls_sql=" select khjsbz ";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhjsbz=cf.fillNull(rs.getString("khjsbz"));
	}
	rs.close();
	ps.close();

	if (!getkhjsbz.equals("N") && !getkhjsbz.equals("") && !getkhjsbz.equals("3"))//N：未结算；Y：已结算；2：审批同意；3：审批不同意
	{
		out.println("<font color=\"#FF0000\">错误！客户已结算</font>:"+getkhjsbz);
		return;
	}
	//检查客户结算＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	String ppmc=null;
	String gys=null;
	String sfyyh=null;
	java.sql.Date yhkssj=null;
	java.sql.Date yhjzsj=null;
	String yhnr=null;
	double xpjsbl=0;
	double xpcxjsbl=0;
	double xptcjrbl=0;
	double xptccxjrbl=0;

	double azfjsbl=0;
	double ycfjsbl=0;
	ls_sql="select jxc_ppxx.scsmc,jxc_ppgysdzb.gysmc,sfyyh,yhkssj,yhjzsj,yhnr,jxc_ppgysdzb.xpjsbl,jxc_ppgysdzb.xpcxjsbl,jxc_ppgysdzb.xpkhfdbl,jxc_ppgysdzb.xpkhcxfdbl,jxc_ppgysdzb.xptcjrbl,jxc_ppgysdzb.xptccxjrbl ";
	ls_sql+=" ,jxc_ppgysdzb.azfjsbl,jxc_ppgysdzb.ycfjsbl ";
	ls_sql+=" from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx  ";
	ls_sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
    ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm ";
    ls_sql+=" and jxc_ppxx.pplb='1' ";
    ls_sql+=" and jxc_gysxx.cllx='1' ";
	ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
	ls_sql+=" and jxc_ppgysdzb.ssfgs='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		azfjsbl=rs.getDouble("azfjsbl");
		ycfjsbl=rs.getDouble("ycfjsbl");

		ppmc = rs.getString("scsmc");			    
		gys = rs.getString("gysmc");			    
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=rs.getDate("yhkssj");
		yhjzsj=rs.getDate("yhjzsj");
		yhnr=cf.fillNull(rs.getString("yhnr"));
		xpjsbl=rs.getDouble("xpjsbl");
		xpcxjsbl=rs.getDouble("xpcxjsbl");
		xptcjrbl=rs.getDouble("xptcjrbl");
		xptccxjrbl=rs.getDouble("xptccxjrbl");
	}
	rs.close();
	ps.close();

	if (xpjsbl==0)
	{
		out.println("<BR>！！！错误，未初始化正常品结算比例");
		return;
	}

	if (xpcxjsbl==0)
	{
		out.println("<BR>！！！错误，未初始化特价品结算比例");
		return;
	}

	double xpkhfdbl=0;
	double xpkhcxfdbl=0;
	ls_sql="select jxc_khfdbl.xpkhfdbl,jxc_khfdbl.xpkhcxfdbl ";
	ls_sql+=" from jxc_khfdbl,jxc_ppxx  ";
	ls_sql+=" where jxc_ppxx.ppbm=jxc_khfdbl.ppbm ";
	ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
	ls_sql+=" and jxc_khfdbl.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xpkhfdbl=rs.getDouble("xpkhfdbl");
		xpkhcxfdbl=rs.getDouble("xpkhcxfdbl");
	}
	rs.close();
	ps.close();

	
	if (gys==null)
	{
		out.println("<BR>！！！错误，[品牌]："+ppbm+"无对应的：供应商");
		return;
	}


	//检查金额是否足够＋＋＋＋＋＋＋＋＋＋＋＋开始	
	//主材预付款
	double getzcyfk=0;
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62：主材预付款 
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
	ls_sql+=" and zffs!='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getzcyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62：主材预付款 
	ls_sql+=" and zffs='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getzcyfk+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//主材代金券
	double getzcdjj=0;
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='55'";//55：主材代金券
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
	ls_sql+=" and zffs!='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getzcdjj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='55'";//55：主材代金券
	ls_sql+=" and zffs='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getzcdjj+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (getzcdjj<djjzkje)
	{
		out.println("<BR>错误，【主材代金券】金额不足！转款＝"+djjzkje+"；可用金额＝"+getzcdjj);
		return;
	}

	if (getzcyfk<yfkzkje)
	{
		out.println("<BR>错误，【主材预付款】金额不足！转款＝"+yfkzkje+"；可用金额＝"+getzcyfk);
		return;
	}

	double djqcdbl=0;
	ls_sql="select djqcdbl";
	ls_sql+=" from  cw_djq";
	ls_sql+=" where fgsbh='"+fgsbh+"' ";
	ls_sql+=" and djqmc='"+djqmc+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djqcdbl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	String khxm=null;
	String fwdz=null;
	ls_sql="SELECT khxm,fwdz";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
	}
	rs.close();
	ps.close();

	//检查金额是否足够----------------------结束	

	conn.setAutoCommit(false);

	if (zt.equals("4"))//2:家装客户;4:非家装客户
	{
		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String zxdm=null;
		ls_sql="SELECT zxdm";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zxdm=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (zxdm==null)
		{
			zxdm=dwbh;
		}


		if (count==0)
		{
			//2：家装客户；3：退单客户；4：集成客户；5：设计客户
			ls_sql="insert into crm_khxx ( khbh,hth,sfzhm,khxm,xb,fwdz,lxfs,qtdh,khlxbm,cqbm,csrq,zybm,fj,dwbh,fgsbh,khjl,xxlysm,sjs,sjsgh,lrsj,lrr,bz    ,zt,tsbz,pdclzt,ybjbz   ,sfxhf,kpbz,bxbz,hfdjbz,sjssjfjsbz,htshbz ,sffj,sfyrz,dalqbz,gdjsjd,sjsjsbz,ywyjsbz,gcjdbm,hdbz,xmzy,zjxwcbz,sffk,wtkhbz,khjsbz,sjhtsjf,wdzgce,qye,zjjsbz,jjwjbz,cdzwjmje,glfjmje,sjjmje,zqsuijin,zqzjxsuijin,sjsbh,ywy,ywyssxz,ywybm,clgw,xjf,hxbm,bjjb,fwmj,fjtcbz,zhhtzcbj,zqhtzcbj,suijin,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,zqqtsf,zhqtsf) ";
			ls_sql+=" select               khbh,hth,sfzhm,khxm,xb,fwdz,lxfs,qtdh,khlxbm,cqbm,csrq,zybm,fj,?   ,ssfgs,khjl,xxlysm,sjs,sjsgh,?   ,?  ,bz    ,'4','N','4'   ,'N'     ,'N'  ,'Y' ,'N' ,'0'   ,'0'       ,'Y'    ,'N' ,'N'  ,'1'   ,'0'   ,'0'    ,'0'    ,'0'   ,'1' ,?   ,'1'    ,'N' ,'N'   ,'N'   ,NVL(sjhtje,0) ,0     ,0  ,'0'   ,'N'   ,0       ,0      ,0     ,0       ,0          ,sjsbh,ywy,ywyssxz,ywybm,clgw,xjf,hxbm,bjjb,fwmj,'M'   ,0       ,0,0,0,0,0,0,0,0";
			ls_sql+=" from  crm_zxkhxx";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zxdm);
			ps.setDate(2,lrsj);
			ps.setString(3,lrr);
			ps.setString(4,xmzy);
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_zxkhxx set sfjczjz='1'";//1：是；2：否
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

	}

	double tjpfdbl=xpcxjsbl;
	double tjpkhfdbl=xpkhcxfdbl;
	double tjptcjrbl=xptccxjrbl;
	

	double cbze=zcpclf*xpjsbl/100+tjpclf*tjpfdbl/100;
	double zhclf=zqclf;

	double wdzje=zqclf+qtf+ycf;
	hkze=wdzje;
	zczkl=10;

	//合同业绩记入金额
	double htyjjrje=0;
	htyjjrje=cf.round(zcpclf*xptcjrbl/100,2)+cf.round(tjpclf*tjptcjrbl/100,2);

	ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,jjsjs,khjl,ddshbz,kjxsj,htshsj";
	ls_sql+=" ,qhtsj,jhtzshsj,zcdlbm,zcxlbm,ppbm,gys,ppmc,zczkl,dzyy,xclbz ";
	ls_sql+=" ,wdzje,hkze,cbze,htcxhdje,zjxcxhdje,sfyyh,yhkssj,yhjzsj,yhnr,fgsbh ";
	ls_sql+=" ,qddm,jzsjs,dwbh,lrr,lrsj,bz,jhshsj,jmje ";
	ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf ";
	ls_sql+=" ,zjxcbze,zqzjhze,zjhze,sfjs,clzt,ddlx,sfck,ycksl,yckje,zsje,zjxzsje,sfkgsl,qtycf,sfjrht";
	ls_sql+=" ,xshth,zcpclf,fdbl,khfdbl,tcjrbl,tjpclf,tjpfdbl,tjpkhfdbl,tjptcjrbl,djqmc,djqje,djqcdbl,sjbh,azfjsbl,ycfjsbl,htyjjrje,zjxyjjrje,sskje )";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,SYSDATE,?,?,?    ";
	ls_sql+=" ,?,?,?,?   ,0,0,0,0   ,0,0,0,'N','09','C','1',0,0,0,0,'N',0,'N' ";//C：选配主材主材
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,0) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setString(2,khbh);
	ps.setString(3,clgw);
	ps.setString(4,ztjjgw);
	ps.setString(5,xmzy);
	ps.setString(6,jjsjs);
	ps.setString(7,khjl);
	ps.setString(8,ddshbz);
	ps.setDate(9,kjxsj);
	ps.setDate(10,htshsj);

	ps.setDate(11,qhtsj);
	ps.setDate(12,jhtzshsj);
	ps.setString(13,zcdlbm);
	ps.setString(14,zcxlbm);
	ps.setString(15,ppbm);
	ps.setString(16,gys);
	ps.setString(17,ppmc);
	ps.setDouble(18,zczkl);
	ps.setString(19,dzyy);
	ps.setString(20,xclbz);

	ps.setDouble(21,wdzje);
	ps.setDouble(22,hkze);
	ps.setDouble(23,cbze);
	ps.setDouble(24,htcxhdje);
	ps.setDouble(25,0);
	ps.setString(26,sfyyh);
	ps.setDate(27,yhkssj);
	ps.setDate(28,yhjzsj);
	ps.setString(29,yhnr);
	ps.setString(30,fgsbh);

	ps.setString(31,qddm);
	ps.setString(32,jzsjs);
	ps.setString(33,dwbh);
	ps.setString(34,lrr);
	ps.setString(35,bz);
	ps.setDate(36,htshsj);
	ps.setDouble(37,jmje);
	
	ps.setDouble(38,zqclf);
	ps.setDouble(39,zhclf);
	ps.setDouble(40,ycf);
	ps.setDouble(41,qtf);
	
	ps.setString(42,xshth);
	ps.setDouble(43,zcpclf);
	ps.setDouble(44,xpjsbl);
	ps.setDouble(45,xpkhfdbl);
	ps.setDouble(46,xptcjrbl);
	ps.setDouble(47,tjpclf);
	ps.setDouble(48,tjpfdbl);
	ps.setDouble(49,tjpkhfdbl);
	ps.setDouble(50,tjptcjrbl);
	ps.setString(51,djqmc);
	ps.setDouble(52,djqje);
	ps.setDouble(53,djqcdbl);
	ps.setString(54,sjbh);
	ps.setDouble(55,azfjsbl);
	ps.setDouble(56,ycfjsbl);
	ps.setDouble(57,htyjjrje);

	ps.executeUpdate();
	ps.close();


	//插入付款记录＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String fklxbm="23";//23:主材
	String zkfklxbm="";
	double sfkje=0;

	if (djjzkje>0)//处理：主材代金券
	{
		zkfklxbm="55";//55：主材代金券

		sfkje=djjzkje;

		String fkxh=null;
		int count=0;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		fkxh=khbh+cf.addZero(count+1,3);

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz ) ";
		ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?                ,'N'    ,?,?,?,?,?,?,?,?                                  ,'1','0','0',?,?                  ,'N',?,?,?,?) ";//1：财务收款；2：非财务代收款
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,fkxh);
		ps.setString(3,"");
		ps.setString(4,fklxbm);
		ps.setDouble(5,sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"选配主材主材录入");
		ps.setString(13,"31");//31:转换
		ps.setString(14,zkfklxbm);
		ps.setString(15,dwbh);

		ps.setString(16,ppbm);
		ps.setString(17,ddbh);
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,"");
		ps.setString(23,"");

		ps.setString(24,"");
		ps.setDate(25,null);

		ps.setString(26,"2");//1：财务收款；2：非财务代收款
		ps.setString(27,"N");//N: 未审核；Y: 审核通过；M:审核未通过
		ps.setString(28,khxm);
		ps.setString(29,fwdz);
		ps.executeUpdate();
		ps.close();

		
		//转换付款方式，生成关联记录
		int glxh=0;//关联序号
		count=0;

		//获取关联序号
		ls_sql="select NVL(max(glxh),0)";
		ls_sql+=" from  cw_glfkjl";
		ps=conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			glxh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		glxh++;

		//插入关联记录 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,fkxh);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_khfkjl set glxh=?";
		ls_sql+=" where fkxh='"+fkxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.executeUpdate();
		ps.close();

		//插入关联付款记录 
		String newfkxh=null;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		newfkxh=khbh+cf.addZero(count+1,3);

		//fkxh=newfkxh
		//增加glxh
		//增加gljlbz
		//增加gysbh=zcgysbh
		//fklxbm=zckx
		//fkje=-1*fkje
		//zckx=fklxbm
		//zcgysbh=gysbh
		//fkcs=""
		//yfkbl=""
		//yfkje=""
		//sfkbl=""

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw  ,scbz  ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh   ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?,?    ,'Y',?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,newfkxh);
		ps.setString(3,"");
		ps.setString(4,zkfklxbm);
		ps.setDouble(5,-1*sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"选配主材主材录入");
		ps.setString(13,"31");
		ps.setString(14,fklxbm);
		ps.setString(15,dwbh);

		ps.setString(16,"");
		ps.setString(17,"");
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,ppbm);
		ps.setString(23,ddbh);

		ps.setString(24,"");
		ps.setDate(25,null);
		ps.setInt(26,glxh);

		ps.setString(27,"2");//1：财务收款；2：非财务代收款
		ps.setString(28,"N");//N: 未审核；Y: 审核通过；M:审核未通过
		ps.setString(29,khxm);
		ps.setString(30,fwdz);
		ps.executeUpdate();
		ps.close();


		//插入关联记录 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,newfkxh);
		ps.executeUpdate();
		ps.close();
	}

	if (yfkzkje>0)//处理：主材预付款，需要预付款支付
	{
		zkfklxbm="62";//62：主材预付款

		if (hkze>yfkzkje)//主材预付款不足
		{
			sfkje=yfkzkje;
			yfkzkje=0;//预付款剩余金额
			hkze=hkze-yfkzkje;//订单未付款金额
		}
		else{//主材预付款有剩余
			sfkje=hkze;
			yfkzkje=yfkzkje-hkze;//预付款剩余金额
			hkze=0;//订单未付款金额
		}

		String fkxh=null;
		int count=0;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		fkxh=khbh+cf.addZero(count+1,3);

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz ) ";
		ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?                ,'N'    ,?,?,?,?,?,?,?,?                                  ,'1','0','0',?,?                  ,'N',?,?,?,?) ";//1：财务收款；2：非财务代收款
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,fkxh);
		ps.setString(3,"");
		ps.setString(4,fklxbm);
		ps.setDouble(5,sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"选配主材主材录入");
		ps.setString(13,"31");//31:转换
		ps.setString(14,zkfklxbm);
		ps.setString(15,dwbh);

		ps.setString(16,ppbm);
		ps.setString(17,ddbh);
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,"");
		ps.setString(23,"");

		ps.setString(24,"");
		ps.setDate(25,null);

		ps.setString(26,"2");//1：财务收款；2：非财务代收款
		ps.setString(27,"N");//N: 未审核；Y: 审核通过；M:审核未通过
		ps.setString(28,khxm);
		ps.setString(29,fwdz);
		ps.executeUpdate();
		ps.close();

		
		//转换付款方式，生成关联记录
		int glxh=0;//关联序号
		count=0;

		//获取关联序号
		ls_sql="select NVL(max(glxh),0)";
		ls_sql+=" from  cw_glfkjl";
		ps=conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			glxh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		glxh++;

		//插入关联记录 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,fkxh);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_khfkjl set glxh=?";
		ls_sql+=" where fkxh='"+fkxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.executeUpdate();
		ps.close();

		//插入关联付款记录 
		String newfkxh=null;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		newfkxh=khbh+cf.addZero(count+1,3);

		//fkxh=newfkxh
		//增加glxh
		//增加gljlbz
		//增加gysbh=zcgysbh
		//fklxbm=zckx
		//fkje=-1*fkje
		//zckx=fklxbm
		//zcgysbh=gysbh
		//fkcs=""
		//yfkbl=""
		//yfkje=""
		//sfkbl=""

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw  ,scbz  ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh   ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?,?    ,'Y',?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,newfkxh);
		ps.setString(3,"");
		ps.setString(4,zkfklxbm);
		ps.setDouble(5,-1*sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"选配主材主材录入");
		ps.setString(13,"31");
		ps.setString(14,fklxbm);
		ps.setString(15,dwbh);

		ps.setString(16,"");
		ps.setString(17,"");
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,ppbm);
		ps.setString(23,ddbh);

		ps.setString(24,"");
		ps.setDate(25,null);
		ps.setInt(26,glxh);

		ps.setString(27,"2");//1：财务收款；2：非财务代收款
		ps.setString(28,"N");//N: 未审核；Y: 审核通过；M:审核未通过
		ps.setString(29,khxm);
		ps.setString(30,fwdz);
		ps.executeUpdate();
		ps.close();


		//插入关联记录 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,newfkxh);
		ps.executeUpdate();
		ps.close();
	}


	if (zzczkzkje>0)//处理：主材预付款，需要预付款支付
	{
		zkfklxbm="67";//67：增值储值卡

		sfkje=zzczkzkje;

		String fkxh=null;
		int count=0;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		fkxh=khbh+cf.addZero(count+1,3);

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz ) ";
		ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?                ,'N'    ,?,?,?,?,?,?,?,?                                  ,'1','0','0',?,?                  ,'N',?,?,?,?) ";//1：财务收款；2：非财务代收款
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,fkxh);
		ps.setString(3,"");
		ps.setString(4,fklxbm);
		ps.setDouble(5,sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"选配主材主材录入");
		ps.setString(13,"31");//31:转换
		ps.setString(14,zkfklxbm);
		ps.setString(15,dwbh);

		ps.setString(16,ppbm);
		ps.setString(17,ddbh);
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,"");
		ps.setString(23,"");

		ps.setString(24,"");
		ps.setDate(25,null);

		ps.setString(26,"2");//1：财务收款；2：非财务代收款
		ps.setString(27,"N");//N: 未审核；Y: 审核通过；M:审核未通过
		ps.setString(28,khxm);
		ps.setString(29,fwdz);
		ps.executeUpdate();
		ps.close();

		
		//转换付款方式，生成关联记录
		int glxh=0;//关联序号
		count=0;

		//获取关联序号
		ls_sql="select NVL(max(glxh),0)";
		ls_sql+=" from  cw_glfkjl";
		ps=conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			glxh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		glxh++;

		//插入关联记录 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,fkxh);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_khfkjl set glxh=?";
		ls_sql+=" where fkxh='"+fkxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.executeUpdate();
		ps.close();

		//插入关联付款记录 
		String newfkxh=null;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		newfkxh=khbh+cf.addZero(count+1,3);

		//fkxh=newfkxh
		//增加glxh
		//增加gljlbz
		//增加gysbh=zcgysbh
		//fklxbm=zckx
		//fkje=-1*fkje
		//zckx=fklxbm
		//zcgysbh=gysbh
		//fkcs=""
		//yfkbl=""
		//yfkje=""
		//sfkbl=""

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw  ,scbz  ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh   ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?,?    ,'Y',?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,newfkxh);
		ps.setString(3,"");
		ps.setString(4,zkfklxbm);
		ps.setDouble(5,-1*sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"选配主材主材录入");
		ps.setString(13,"31");
		ps.setString(14,fklxbm);
		ps.setString(15,dwbh);

		ps.setString(16,"");
		ps.setString(17,"");
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,ppbm);
		ps.setString(23,ddbh);

		ps.setString(24,"");
		ps.setDate(25,null);
		ps.setInt(26,glxh);

		ps.setString(27,"2");//1：财务收款；2：非财务代收款
		ps.setString(28,"N");//N: 未审核；Y: 审核通过；M:审核未通过
		ps.setString(29,khxm);
		ps.setString(30,fwdz);
		ps.executeUpdate();
		ps.close();


		//插入关联记录 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,newfkxh);
		ps.executeUpdate();
		ps.close();
	}
	if (djqje>0)//处理：纸质材料券
	{
		String zffs="16";//16：纸质材料券

		sfkje=djqje;

		String fkxh=null;
		int count=0;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		fkxh=khbh+cf.addZero(count+1,3);

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz ) ";
		ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?                ,'N'    ,?,?,?,?,?,?,?,?                                  ,'1','0','0',?,?                  ,'N',?,?,?,?) ";//1：财务收款；2：非财务代收款
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,fkxh);
		ps.setString(3,sjbh);
		ps.setString(4,fklxbm);
		ps.setDouble(5,sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"选配主材主材录入");
		ps.setString(13,zffs);
		ps.setString(14,"");
		ps.setString(15,dwbh);

		ps.setString(16,ppbm);
		ps.setString(17,ddbh);
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,"");
		ps.setString(23,"");

		ps.setString(24,"");
		ps.setDate(25,null);

		ps.setString(26,"2");//1：财务收款；2：非财务代收款
		ps.setString(27,"N");//N: 未审核；Y: 审核通过；M:审核未通过
		ps.setString(28,khxm);
		ps.setString(29,fwdz);
		ps.executeUpdate();
		ps.close();
	}
	//插入付款记录＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	//累计付款＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	double sskje=0;//实收款金额
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and ddbh='"+ddbh+"'";
	ls_sql+=" and zjxbh is null";
	ls_sql+=" and fklxbm='23'";//23:主材
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sskje=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	String getddlx="";
	ls_sql="select ddlx";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getddlx=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	if (!getddlx.equals("E") && !getddlx.equals("5"))
	{
		if (sskje<0)
		{
//			conn.rollback();
//			out.println("错误！该订单累计付款总额不能为负数:"+sskje);
//			return;
		}
	}


	double shsskje=0;//财务审核实收款金额
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and ddbh='"+ddbh+"'";
	ls_sql+=" and zjxbh is null";
	ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
	ls_sql+=" and fklxbm='23'";//23:主材
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shsskje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zcdd set sskje=?,shsskje=? ";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,sskje);
	ps.setDouble(2,shsskje);
	ps.executeUpdate();
	ps.close();

	double gethkze=0;
	java.sql.Date yjjzsj=null;
	ls_sql="select hkze,yjjzsj";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gethkze=rs.getDouble(1);
		yjjzsj=rs.getDate(2);
	}
	rs.close();
	ps.close();


	if (yjjzsj==null)
	{
		if (shsskje>=gethkze)
		{
			yjjzsj=lrsj;

			ls_sql="update jc_zcdd set yjjzsj=?";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,yjjzsj);
			ps.executeUpdate();
			ps.close();
		}
	}
	else{
		if (shsskje<gethkze)
		{
			yjjzsj=null;

			ls_sql="update jc_zcdd set yjjzsj=?";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,yjjzsj);
			ps.executeUpdate();
			ps.close();
		}
	}
	//累计付款＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	//检查：金额不为负数
	double allwdzje=0;
	double allhkze=0;
	double allzqclf=0;
	double allzhclf=0;
	double allzcpclf=0;
	double alltjpclf=0;
	double allycf=0;
	double allqtf=0;
	ls_sql="select sum(wdzje),sum(hkze),sum(zqclf),sum(zhclf),sum(ycf),sum(qtf),sum(zcpclf),sum(tjpclf)";
	ls_sql+=" from jc_zcdd ";
	ls_sql+=" where ppbm='"+ppbm+"'";
	ls_sql+=" and khbh='"+khbh+"'";
	ls_sql+=" and ddlx='C'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		allwdzje=rs.getDouble(1);
		allhkze=rs.getDouble(2);
		allzqclf=rs.getDouble(3);
		allzhclf=rs.getDouble(4);
		allycf=rs.getDouble(5);
		allqtf=rs.getDouble(6);
		allzcpclf=rs.getDouble(7);
		alltjpclf=rs.getDouble(8);

		if (allwdzje<0 )
		{
			conn.rollback();
			out.println("错误！品牌订货总额为负数:"+allwdzje);
			return;
		}
		if ( allhkze<0)
		{
			conn.rollback();
			out.println("错误！品牌订货总额为负数:"+allhkze);
			return;
		}
		if ( allzqclf<0)
		{
			conn.rollback();
			out.println("错误！品牌[折前材料费]为负数:"+allzqclf);
			return;
		}
		if ( allzhclf<0)
		{
			conn.rollback();
			out.println("错误！品牌[折后材料费]为负数:"+allzhclf);
			return;
		}
		if ( allycf<0)
		{
			conn.rollback();
			out.println("错误！品牌[远程费]为负数:"+allycf);
			return;
		}
		if ( allqtf<0)
		{
			conn.rollback();
			out.println("错误！品牌[其它费]为负数:"+allqtf);
			return;
		}
		if ( allzcpclf<0)
		{
			conn.rollback();
			out.println("错误！品牌[正常品材料费]为负数:"+allzcpclf);
			return;
		}
		if ( alltjpclf<0)
		{
			conn.rollback();
			out.println("错误！品牌[特价品材料费]为负数:"+alltjpclf);
			return;
		}

	}
	rs.close();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>