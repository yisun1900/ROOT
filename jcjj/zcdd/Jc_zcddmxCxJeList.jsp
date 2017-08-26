<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"041522")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String zwbm=(String)session.getAttribute("zwbm");//08:家居顾问;10:项目专员;12:家居设计师;18:木门测量师
String ssfgs=(String)session.getAttribute("ssfgs");
String xmzyglbz=cf.fillNull(cf.executeQuery("select xmzyglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//项目专员过滤
String jjgwglbz=cf.fillNull(cf.executeQuery("select jjgwglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//家居顾问过滤
String jjsjsglbz=cf.fillNull(cf.executeQuery("select jjsjsglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//家居设计师过滤

if (zwbm.equals("10"))//10:项目专员
{
	if (xmzyglbz.equals("N"))//过滤标志
	{
		zwbm="";
	}
}
else if (zwbm.equals("08"))//08:家居顾问
{
	if (jjgwglbz.equals("N"))//过滤标志
	{
		zwbm="";
	}
}
else if (zwbm.equals("12"))//12:家居设计师
{
	if (jjsjsglbz.equals("N"))//过滤标志
	{
		zwbm="";
	}
}

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jc_zcdd_ddbh=null;
	String jc_zcdd_clzt=null;

	String bjjb=null;
	bjjb=request.getParameter("bjjb");
	if (bjjb!=null)
	{
		if (!(bjjb.equals("")))	wheresql+=" and  (crm_khxx.bjjb='"+bjjb+"')";
	}


	String jc_zcdd_sfwj=null;
	jc_zcdd_sfwj=request.getParameter("jc_zcdd_sfwj");
	if (jc_zcdd_sfwj!=null)
	{
		if (jc_zcdd_sfwj.equals("Y"))
		{
			wheresql+=" and  (jc_zcdd.clzt='30')";
		}
		else{
			wheresql+=" and  jc_zcdd.clzt not in('00','02','03','05','07','30','98','99')";
		}
	}

	String jc_zcddmx_sftjcp=null;
	jc_zcddmx_sftjcp=request.getParameter("jc_zcddmx_sftjcp");
	if (jc_zcddmx_sftjcp!=null)
	{
		if (!(jc_zcddmx_sftjcp.equals("")))	wheresql+=" and  (jc_zcddmx.sftjcp='"+jc_zcddmx_sftjcp+"')";
	}

	String jc_zcdd_wjsj=null;
	jc_zcdd_wjsj=request.getParameter("jc_zcdd_wjsj");
	if (jc_zcdd_wjsj!=null)
	{
		if (!(jc_zcdd_wjsj.equals("")))	wheresql+="  and (jc_zcdd.wjsj>=TO_DATE('"+jc_zcdd_wjsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_wjsj=request.getParameter("jc_zcdd_wjsj2");
	if (jc_zcdd_wjsj!=null)
	{
		if (!(jc_zcdd_wjsj.equals("")))	wheresql+="  and (jc_zcdd.wjsj<=TO_DATE('"+jc_zcdd_wjsj+"','YYYY/MM/DD'))";
	}




	String crm_khxx_qye=null;
	crm_khxx_qye=request.getParameter("crm_khxx_qye");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye>="+crm_khxx_qye+") ";
	}
	crm_khxx_qye=request.getParameter("crm_khxx_qye2");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye<="+crm_khxx_qye+") ";
	}
	String crm_khxx_qyrq=null;
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}

	String ztjjgw=null;
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_zcdd.ztjjgw='"+ztjjgw+"')";
	}
	String ztjjgw2=null;
	ztjjgw2=request.getParameter("ztjjgw2");
	if (ztjjgw2!=null)
	{
		ztjjgw2=cf.GB2Uni(ztjjgw2);
		if (!(ztjjgw2.equals("")))	wheresql+=" and  (jc_zcdd.ztjjgw='"+ztjjgw2+"')";
	}
	String clgw=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_zcdd.clgw='"+clgw+"')";
	}
	String clgw2=null;
	clgw2=request.getParameter("clgw2");
	if (clgw2!=null)
	{
		clgw2=cf.GB2Uni(clgw2);
		if (!(clgw2.equals("")))	wheresql+=" and  (jc_zcdd.clgw='"+clgw2+"')";
	}

	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_zcdd.xmzy='"+xmzy+"')";
	}
	String xmzy2=null;
	xmzy2=request.getParameter("xmzy2");
	if (xmzy2!=null)
	{
		xmzy2=cf.GB2Uni(xmzy2);
		if (!(xmzy2.equals("")))	wheresql+=" and  (jc_zcdd.xmzy='"+xmzy2+"')";
	}
	String jjsjs=null;
	jjsjs=request.getParameter("jjsjs");
	if (jjsjs!=null)
	{
		jjsjs=cf.GB2Uni(jjsjs);
		if (!(jjsjs.equals("")))	wheresql+=" and  (jc_zcdd.jjsjs='"+jjsjs+"')";
	}
	String jjsjs2=null;
	jjsjs2=request.getParameter("jjsjs2");
	if (jjsjs2!=null)
	{
		jjsjs2=cf.GB2Uni(jjsjs2);
		if (!(jjsjs2.equals("")))	wheresql+=" and  (jc_zcdd.jjsjs='"+jjsjs2+"')";
	}


	String zcdlbm=null;
	zcdlbm=request.getParameter("zcdlbm");
	if (zcdlbm!=null)
	{
		zcdlbm=cf.GB2Uni(zcdlbm);
		if (!(zcdlbm.equals("")))	wheresql+=" and  (jc_zcdd.zcdlbm='"+zcdlbm+"')";
	}
	String zcxlbm=null;
	zcxlbm=request.getParameter("zcxlbm");
	if (zcxlbm!=null)
	{
		zcxlbm=cf.GB2Uni(zcxlbm);
		if (!(zcxlbm.equals("")))	wheresql+=" and  (jc_zcdd.zcxlbm='"+zcxlbm+"')";
	}
	String ppbm=null;
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=cf.GB2Uni(ppbm);
		if (!(ppbm.equals("")))	wheresql+=" and  (jc_zcdd.ppbm='"+ppbm+"')";
	}
	String ppbm2=null;
	ppbm2=request.getParameter("ppbm2");
	if (ppbm2!=null)
	{
		ppbm2=cf.GB2Uni(ppbm2);
		if (!(ppbm2.equals("")))	wheresql+=" and  (jc_zcdd.ppbm like '%"+ppbm2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_zcdd.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_zcdd.ppmc like '%"+ppmc2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (jc_zcdd.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (jc_zcdd.gys like '%"+gys2+"%')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";


	String crm_khxx_wjbz=null;
	crm_khxx_wjbz=request.getParameter("crm_khxx_wjbz");
	if (crm_khxx_wjbz!=null)
	{
		if (crm_khxx_wjbz.equals("1"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4'))";
		}
		else if (crm_khxx_wjbz.equals("2"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('5'))";
		}
	}




	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}




	String crm_khxx_sjs=null;
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	String crm_khxx_sgd=null;
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	String crm_khxx_zjxm=null;
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}



	jc_zcdd_ddbh=request.getParameter("jc_zcdd_ddbh");
	if (jc_zcdd_ddbh!=null)
	{
		jc_zcdd_ddbh=cf.GB2Uni(jc_zcdd_ddbh);
		if (!(jc_zcdd_ddbh.equals("")))	wheresql+=" and  (jc_zcdd.ddbh='"+jc_zcdd_ddbh+"')";
	}
	jc_zcdd_clzt=request.getParameter("jc_zcdd_clzt");
	if (jc_zcdd_clzt!=null)
	{
		jc_zcdd_clzt=cf.GB2Uni(jc_zcdd_clzt);
		if (!(jc_zcdd_clzt.equals("")))	wheresql+=" and  (jc_zcdd.clzt='"+jc_zcdd_clzt+"')";
	}
	
	String jc_zcdd_qhtsj=null;
	jc_zcdd_qhtsj=request.getParameter("jc_zcdd_qhtsj");
	if (jc_zcdd_qhtsj!=null)
	{
		jc_zcdd_qhtsj=jc_zcdd_qhtsj.trim();
		if (!(jc_zcdd_qhtsj.equals("")))	wheresql+="  and (jc_zcdd.qhtsj>=TO_DATE('"+jc_zcdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_qhtsj=request.getParameter("jc_zcdd_qhtsj2");
	if (jc_zcdd_qhtsj!=null)
	{
		jc_zcdd_qhtsj=jc_zcdd_qhtsj.trim();
		if (!(jc_zcdd_qhtsj.equals("")))	wheresql+="  and (jc_zcdd.qhtsj<=TO_DATE('"+jc_zcdd_qhtsj+"','YYYY/MM/DD'))";
	}

	String sfjs=null;
	sfjs=request.getParameter("sfjs");
	if (sfjs!=null)
	{
		sfjs=cf.GB2Uni(sfjs);
		if (!(sfjs.equals("")))	wheresql+=" and  (jc_zcdd.sfjs='"+sfjs+"')";
	}
	String jssj=null;
	jssj=request.getParameter("jssj");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jc_zcdd.jssj>=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jssj=request.getParameter("jssj2");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jc_zcdd.jssj<=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	
	
	
	
	
	
	
	String jc_zcddmx_zcbm=null;
	String jc_zcddmx_zcmc=null;
	String jc_zcddmx_zclbbm=null;
	String jc_zcddmx_xinghao=null;
	String jc_zcddmx_gg=null;
	String jc_zcddmx_zcysbm=null;
	String jc_zcddmx_zcpzwzbm=null;
	String jc_zcddmx_sfycx=null;
	String jc_zcddmx_cxkssj=null;
	String jc_zcddmx_cxjzsj=null;
	String jc_zcddmx_xzjg=null;
	String jc_zcddmx_dj=null;

	jc_zcddmx_zcbm=request.getParameter("jc_zcddmx_zcbm");
	if (jc_zcddmx_zcbm!=null)
	{
		jc_zcddmx_zcbm=cf.GB2Uni(jc_zcddmx_zcbm);
		if (!(jc_zcddmx_zcbm.equals("")))	wheresql+=" and  (jc_zcddmx.zcbm='"+jc_zcddmx_zcbm+"')";
	}
	jc_zcddmx_zcmc=request.getParameter("jc_zcddmx_zcmc");
	if (jc_zcddmx_zcmc!=null)
	{
		jc_zcddmx_zcmc=cf.GB2Uni(jc_zcddmx_zcmc);
		if (!(jc_zcddmx_zcmc.equals("")))	wheresql+=" and  (jc_zcddmx.zcmc='"+jc_zcddmx_zcmc+"')";
	}
	jc_zcddmx_zclbbm=request.getParameter("jc_zcddmx_zclbbm");
	if (jc_zcddmx_zclbbm!=null)
	{
		jc_zcddmx_zclbbm=cf.GB2Uni(jc_zcddmx_zclbbm);
		if (!(jc_zcddmx_zclbbm.equals("")))	wheresql+=" and  (jc_zcddmx.zclbbm='"+jc_zcddmx_zclbbm+"')";
	}
	jc_zcddmx_xinghao=request.getParameter("jc_zcddmx_xinghao");
	if (jc_zcddmx_xinghao!=null)
	{
		jc_zcddmx_xinghao=cf.GB2Uni(jc_zcddmx_xinghao);
		if (!(jc_zcddmx_xinghao.equals("")))	wheresql+=" and  (jc_zcddmx.xinghao='"+jc_zcddmx_xinghao+"')";
	}
	jc_zcddmx_gg=request.getParameter("jc_zcddmx_gg");
	if (jc_zcddmx_gg!=null)
	{
		jc_zcddmx_gg=cf.GB2Uni(jc_zcddmx_gg);
		if (!(jc_zcddmx_gg.equals("")))	wheresql+=" and  (jc_zcddmx.gg='"+jc_zcddmx_gg+"')";
	}
	jc_zcddmx_zcysbm=request.getParameter("jc_zcddmx_zcysbm");
	if (jc_zcddmx_zcysbm!=null)
	{
		jc_zcddmx_zcysbm=cf.GB2Uni(jc_zcddmx_zcysbm);
		if (!(jc_zcddmx_zcysbm.equals("")))	wheresql+=" and  (jc_zcddmx.zcysbm='"+jc_zcddmx_zcysbm+"')";
	}
	jc_zcddmx_zcpzwzbm=request.getParameter("jc_zcddmx_zcpzwzbm");
	if (jc_zcddmx_zcpzwzbm!=null)
	{
		jc_zcddmx_zcpzwzbm=cf.GB2Uni(jc_zcddmx_zcpzwzbm);
		if (!(jc_zcddmx_zcpzwzbm.equals("")))	wheresql+=" and  (jc_zcddmx.zcpzwzbm='"+jc_zcddmx_zcpzwzbm+"')";
	}
	jc_zcddmx_sfycx=request.getParameter("jc_zcddmx_sfycx");
	if (jc_zcddmx_sfycx!=null)
	{
		jc_zcddmx_sfycx=cf.GB2Uni(jc_zcddmx_sfycx);
		if (!(jc_zcddmx_sfycx.equals("")))	wheresql+=" and  (jc_zcddmx.sfycx='"+jc_zcddmx_sfycx+"')";
	}
	jc_zcddmx_cxkssj=request.getParameter("jc_zcddmx_cxkssj");
	if (jc_zcddmx_cxkssj!=null)
	{
		jc_zcddmx_cxkssj=jc_zcddmx_cxkssj.trim();
		if (!(jc_zcddmx_cxkssj.equals("")))	wheresql+="  and (jc_zcddmx.cxkssj>=TO_DATE('"+jc_zcddmx_cxkssj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_cxkssj=request.getParameter("jc_zcddmx_cxkssj2");
	if (jc_zcddmx_cxkssj!=null)
	{
		jc_zcddmx_cxkssj=jc_zcddmx_cxkssj.trim();
		if (!(jc_zcddmx_cxkssj.equals("")))	wheresql+="  and (jc_zcddmx.cxkssj<=TO_DATE('"+jc_zcddmx_cxkssj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_cxjzsj=request.getParameter("jc_zcddmx_cxjzsj");
	if (jc_zcddmx_cxjzsj!=null)
	{
		jc_zcddmx_cxjzsj=jc_zcddmx_cxjzsj.trim();
		if (!(jc_zcddmx_cxjzsj.equals("")))	wheresql+="  and (jc_zcddmx.cxjzsj>=TO_DATE('"+jc_zcddmx_cxjzsj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_cxjzsj=request.getParameter("jc_zcddmx_cxjzsj2");
	if (jc_zcddmx_cxjzsj!=null)
	{
		jc_zcddmx_cxjzsj=jc_zcddmx_cxjzsj.trim();
		if (!(jc_zcddmx_cxjzsj.equals("")))	wheresql+="  and (jc_zcddmx.cxjzsj<=TO_DATE('"+jc_zcddmx_cxjzsj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_xzjg=request.getParameter("jc_zcddmx_xzjg");
	if (jc_zcddmx_xzjg!=null)
	{
		jc_zcddmx_xzjg=cf.GB2Uni(jc_zcddmx_xzjg);
		if (!(jc_zcddmx_xzjg.equals("")))	wheresql+=" and  (jc_zcddmx.xzjg='"+jc_zcddmx_xzjg+"')";
	}
	jc_zcddmx_dj=request.getParameter("jc_zcddmx_dj");
	if (jc_zcddmx_dj!=null)
	{
		jc_zcddmx_dj=jc_zcddmx_dj.trim();
		if (!(jc_zcddmx_dj.equals("")))	wheresql+=" and  (jc_zcddmx.dj="+jc_zcddmx_dj+") ";
	}



	String jc_zcddmx_sl=null;
	String jc_zcddmx_je=null;
	String jc_zcddmx_zjhsl=null;
	String jc_zcddmx_zjhje=null;
	jc_zcddmx_sl=request.getParameter("jc_zcddmx_sl");
	if (jc_zcddmx_sl!=null)
	{
		jc_zcddmx_sl=jc_zcddmx_sl.trim();
		if (!(jc_zcddmx_sl.equals("")))	wheresql+=" and  (jc_zcddmx.sl>="+jc_zcddmx_sl+") ";
	}
	jc_zcddmx_sl=request.getParameter("jc_zcddmx_sl2");
	if (jc_zcddmx_sl!=null)
	{
		jc_zcddmx_sl=jc_zcddmx_sl.trim();
		if (!(jc_zcddmx_sl.equals("")))	wheresql+=" and  (jc_zcddmx.sl<="+jc_zcddmx_sl+") ";
	}
	jc_zcddmx_je=request.getParameter("jc_zcddmx_je");
	if (jc_zcddmx_je!=null)
	{
		jc_zcddmx_je=jc_zcddmx_je.trim();
		if (!(jc_zcddmx_je.equals("")))	wheresql+=" and  (jc_zcddmx.je>="+jc_zcddmx_je+") ";
	}
	jc_zcddmx_je=request.getParameter("jc_zcddmx_je2");
	if (jc_zcddmx_je!=null)
	{
		jc_zcddmx_je=jc_zcddmx_je.trim();
		if (!(jc_zcddmx_je.equals("")))	wheresql+=" and  (jc_zcddmx.je<="+jc_zcddmx_je+") ";
	}
	jc_zcddmx_zjhsl=request.getParameter("jc_zcddmx_zjhsl");
	if (jc_zcddmx_zjhsl!=null)
	{
		jc_zcddmx_zjhsl=jc_zcddmx_zjhsl.trim();
		if (!(jc_zcddmx_zjhsl.equals("")))	wheresql+=" and  (jc_zcddmx.zjhsl>="+jc_zcddmx_zjhsl+") ";
	}
	jc_zcddmx_zjhsl=request.getParameter("jc_zcddmx_zjhsl2");
	if (jc_zcddmx_zjhsl!=null)
	{
		jc_zcddmx_zjhsl=jc_zcddmx_zjhsl.trim();
		if (!(jc_zcddmx_zjhsl.equals("")))	wheresql+=" and  (jc_zcddmx.zjhsl<="+jc_zcddmx_zjhsl+") ";
	}
	jc_zcddmx_zjhje=request.getParameter("jc_zcddmx_zjhje");
	if (jc_zcddmx_zjhje!=null)
	{
		jc_zcddmx_zjhje=jc_zcddmx_zjhje.trim();
		if (!(jc_zcddmx_zjhje.equals("")))	wheresql+=" and  (jc_zcddmx.zjhje>="+jc_zcddmx_zjhje+") ";
	}
	jc_zcddmx_zjhje=request.getParameter("jc_zcddmx_zjhje2");
	if (jc_zcddmx_zjhje!=null)
	{
		jc_zcddmx_zjhje=jc_zcddmx_zjhje.trim();
		if (!(jc_zcddmx_zjhje.equals("")))	wheresql+=" and  (jc_zcddmx.zjhje<="+jc_zcddmx_zjhje+") ";
	}


	String jc_zcddmx_cxhdbz=null;
	String jc_zcddmx_cxhdbl=null;
	String jc_zcddmx_cxhdje=null;
	String jc_zcddmx_lx=null;
	String jc_zcddmx_lrr=null;
	String jc_zcddmx_lrsj=null;
	String jc_zcddmx_sxbz=null;



	jc_zcddmx_cxhdbz=request.getParameter("jc_zcddmx_cxhdbz");
	if (jc_zcddmx_cxhdbz!=null)
	{
		jc_zcddmx_cxhdbz=cf.GB2Uni(jc_zcddmx_cxhdbz);
		if (!(jc_zcddmx_cxhdbz.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdbz='"+jc_zcddmx_cxhdbz+"')";
	}
	jc_zcddmx_cxhdbl=request.getParameter("jc_zcddmx_cxhdbl");
	if (jc_zcddmx_cxhdbl!=null)
	{
		jc_zcddmx_cxhdbl=jc_zcddmx_cxhdbl.trim();
		if (!(jc_zcddmx_cxhdbl.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdbl>="+jc_zcddmx_cxhdbl+") ";
	}
	jc_zcddmx_cxhdbl=request.getParameter("jc_zcddmx_cxhdbl2");
	if (jc_zcddmx_cxhdbl!=null)
	{
		jc_zcddmx_cxhdbl=jc_zcddmx_cxhdbl.trim();
		if (!(jc_zcddmx_cxhdbl.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdbl<="+jc_zcddmx_cxhdbl+") ";
	}
	jc_zcddmx_cxhdje=request.getParameter("jc_zcddmx_cxhdje");
	if (jc_zcddmx_cxhdje!=null)
	{
		jc_zcddmx_cxhdje=jc_zcddmx_cxhdje.trim();
		if (!(jc_zcddmx_cxhdje.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdje>="+jc_zcddmx_cxhdje+") ";
	}
	jc_zcddmx_cxhdje=request.getParameter("jc_zcddmx_cxhdje2");
	if (jc_zcddmx_cxhdje!=null)
	{
		jc_zcddmx_cxhdje=jc_zcddmx_cxhdje.trim();
		if (!(jc_zcddmx_cxhdje.equals("")))	wheresql+=" and  (jc_zcddmx.cxhdje<="+jc_zcddmx_cxhdje+") ";
	}
	jc_zcddmx_lx=request.getParameter("jc_zcddmx_lx");
	if (jc_zcddmx_lx!=null)
	{
		jc_zcddmx_lx=cf.GB2Uni(jc_zcddmx_lx);
		if (!(jc_zcddmx_lx.equals("")))	wheresql+=" and  (jc_zcddmx.lx='"+jc_zcddmx_lx+"')";
	}
	jc_zcddmx_lrr=request.getParameter("jc_zcddmx_lrr");
	if (jc_zcddmx_lrr!=null)
	{
		jc_zcddmx_lrr=cf.GB2Uni(jc_zcddmx_lrr);
		if (!(jc_zcddmx_lrr.equals("")))	wheresql+=" and  (jc_zcddmx.lrr='"+jc_zcddmx_lrr+"')";
	}
	jc_zcddmx_lrsj=request.getParameter("jc_zcddmx_lrsj");
	if (jc_zcddmx_lrsj!=null)
	{
		jc_zcddmx_lrsj=jc_zcddmx_lrsj.trim();
		if (!(jc_zcddmx_lrsj.equals("")))	wheresql+="  and (jc_zcddmx.lrsj>=TO_DATE('"+jc_zcddmx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_lrsj=request.getParameter("jc_zcddmx_lrsj2");
	if (jc_zcddmx_lrsj!=null)
	{
		jc_zcddmx_lrsj=jc_zcddmx_lrsj.trim();
		if (!(jc_zcddmx_lrsj.equals("")))	wheresql+="  and (jc_zcddmx.lrsj<=TO_DATE('"+jc_zcddmx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_zcddmx_sxbz=request.getParameter("jc_zcddmx_sxbz");
	if (jc_zcddmx_sxbz!=null)
	{
		jc_zcddmx_sxbz=cf.GB2Uni(jc_zcddmx_sxbz);
		if (!(jc_zcddmx_sxbz.equals("")))	wheresql+=" and  (jc_zcddmx.sxbz='"+jc_zcddmx_sxbz+"')";
	}

	String sxhtyy=null;
	sxhtyy=request.getParameter("sxhtyy");
	if (sxhtyy!=null)
	{
		sxhtyy=cf.GB2Uni(sxhtyy);
		if (!(sxhtyy.equals("")))	wheresql+=" and  (jc_zcddmx.sxhtyy='"+sxhtyy+"')";
	}
	String sxhtyy2=null;
	sxhtyy2=request.getParameter("sxhtyy2");
	if (sxhtyy2!=null)
	{
		sxhtyy2=cf.GB2Uni(sxhtyy2);
		if (!(sxhtyy2.equals("")))	wheresql+=" and  (jc_zcddmx.sxhtyy='"+sxhtyy2+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String jgpx4=cf.GB2Uni(request.getParameter("jgpx4"));
	String jgpx5=cf.GB2Uni(request.getParameter("jgpx5"));
	String jgpx6=cf.GB2Uni(request.getParameter("jgpx6"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}
	if (!jgpx4.equals(""))
	{
		ordersql+=","+jgpx4;
	}
	if (!jgpx5.equals(""))
	{
		ordersql+=","+jgpx5;
	}
	if (!jgpx6.equals(""))
	{
		ordersql+=","+jgpx6;
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT DECODE(jc_zcddmx.sftjcp,'Y','推荐','N','否'),jc_zcddmx.khbh,crm_khxx.hth,crm_khxx.khxm,bjjbmc,jc_zcddmx.jzsjs,jc_zcdd.clgw,jc_zcdd.xmzy,jc_zcddmx.ddbh,clztmc,jc_zcdd.wjsj,DECODE(jc_zcddmx.lx,'1','合同项','2','增项'),DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写'),jc_zcddmx.zcbm,jc_zcddmx.zcmc,jc_zcddmx.zcdlbm,jc_zcddmx.zcxlbm,jc_zcddmx.dwbh,jc_zcddmx.gys,jc_zcddmx.xinghao,jc_zcddmx.gg,jc_zcddmx.zcysbm,jc_zcddmx.zcpzwzbm,jc_zcddmx.jldwbm, DECODE(jc_zcddmx.xzjg,'0','手写','1','销售限价','2','促销价','3','市场标价'),TO_CHAR(jc_zcddmx.dj),jc_zcddmx.jsbl||'%',TO_CHAR(jc_zcddmx.cbj), DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加'),jc_zcddmx.cxhdbl||'%',jc_zcddmx.sl,jc_zcddmx.je,jc_zcddmx.ycf, DECODE(jc_zcddmx.qtfy,'1','安装费','2','加工费','3','其它收费'),jc_zcddmx.qtfyje,NVL(jc_zcddmx.je,0)+NVL(jc_zcddmx.ycf,0)+NVL(jc_zcddmx.qtfyje,0) htfy,ROUND(jc_zcddmx.cbj*jc_zcddmx.sl,2) htcj,DECODE(jc_zcddmx.je,0,'',ROUND(100-ROUND(jc_zcddmx.cbj*jc_zcddmx.sl,2)*100/jc_zcddmx.je,2)||'%'),jc_zcddmx.cxhdje,jc_zcddmx.zjhsl,jc_zcddmx.zjhje,jc_zcddmx.zjhycf,jc_zcddmx.zjhqtfy,NVL(jc_zcddmx.zjhje,0)+NVL(jc_zcddmx.zjhycf,0)+NVL(jc_zcddmx.zjhqtfy,0) zfy,ROUND(jc_zcddmx.cbj*jc_zcddmx.zjhsl,2) zcb,DECODE(jc_zcddmx.zjhje,0,'',ROUND(100-ROUND(jc_zcddmx.cbj*jc_zcddmx.zjhsl,2)*100/jc_zcddmx.zjhje,2)||'%'),jc_zcddmx.zjhcxhdje, jc_zcddmx.sxhtyy,b.dwmc qddm,jc_zcddmx.bz  ";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm,jc_zcdd,jdm_zcddzt,jc_zcddmx,sq_dwxx b  ";
    ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh and jc_zcdd.khbh=crm_khxx.khbh ";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98')";
    ls_sql+=" and jc_zcddmx.qddm=b.dwbh(+) ";
    ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;

//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Jc_zcddmxCxJeList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"khxm","jc_zcddmx_ddbh","jc_zcddmx_zcmc","jc_zcddmx_zcdlbm","jc_zcddmx_zcxlbm","jc_zcddmx_dwbh","jc_zcddmx_zclbbm","jc_zcddmx_xinghao","jc_zcddmx_gg","jc_zcddmx_zcysbm","jc_zcddmx_jldwbm","jc_zcddmx_lsj","jc_zcddmx_yhj","jc_zcddmx_sfycx","jc_zcddmx_cxj","jc_zcddmx_cxkssj","jc_zcddmx_cxjzsj","jc_zcddmx_xzjg","jc_zcddmx_dj","jc_zcddmx_sl","jc_zcddmx_je","jc_zcddmx_ycf","jc_zcddmx_qtfy","jc_zcddmx_qtfyje","jc_zcddmx_zjhsl","jc_zcddmx_zjhje","jc_zcddmx_zjhycf","jc_zcddmx_zjhqtfy","jc_zcddmx_zcpzwzbm","jc_zcddmx_cxhdbz","jc_zcddmx_cxhdbl","jc_zcddmx_cxhdje","jc_zcddmx_lx","jc_zcddmx_lrr","jc_zcddmx_lrsj","jc_zcddmx_sxbz","jc_zcddmx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
/*
	String[] keyName={};
	pageObj.setKey(keyName);
*/
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
    
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJeJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	if (!yhjs.equals("G0"))
	{
		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
		coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	}
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询－订单明细(金额)</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(610);
%>

<tr bgcolor="#CCCCCC"  align="center">
  <td width="50px" rowspan="2">是否推荐产品</td>
  <td width="50px" rowspan="2">客户编号</td>
  <td width="70px" rowspan="2">合同号</td>
  <td width="50px" rowspan="2">客户姓名</td>
  <td width="50px" rowspan="2">报价级别</td>
  <td width="50px" rowspan="2">设计师</td>
  <td width="50px" rowspan="2">家居顾问</td>
  <td width="50px" rowspan="2">项目专员</td>
  <td width="60px" rowspan="2">订单编号</td>
  <td width="60px" rowspan="2">订单状态</td>
  <td width="60px" rowspan="2">单项完结时间</td>
  <td width="50px" rowspan="2">类型</td>
  <td width="50px" rowspan="2">手写标志</td>
  <td width="60px" rowspan="2">主材编码</td>
  <td width="140px" rowspan="2">主材名称</td>
  <td width="110px" rowspan="2">主材大类</td>
  <td width="130px" rowspan="2">主材小类</td>
  <td width="150px" rowspan="2">子品牌</td>
  <td width="200px" rowspan="2">供应商</td>
  <td width="110px" rowspan="2">型号</td>
  <td width="110px" rowspan="2">规格</td>
  <td width="60px" rowspan="2">主材颜色</td>
  <td width="70px" rowspan="2">主材铺装位置</td>
  <td width="50px" rowspan="2">计量单位</td>

  <td colspan="6"><B>实销单价</B></td>
  <td colspan="9"><B>合同情况</B></td>
  <td colspan="8"><B>合同情况＋增减项</B></td>
  <td width="150px" rowspan="2">手写合同原因</td>
  <td width="110px" rowspan="2">签单店面</td>
  <td width="340px" rowspan="2">备注</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="60px">选择价格</td>
	<td  width="70px">实销单价</td>
	<td  width="60px">结算比例</td>
	<td  width="70px">结算单价</td>
	<td  width="50px">是否参加促销活动</td>
	<td  width="50px">计入促销活动比率</td>

	<td  width="60px">合同数量</td>
	<td  width="80px">合同材料费</td>
	<td  width="70px">合同远程费</td>
	<td  width="70px">其它费用</td>
	<td  width="70px">合同其它费金额</td>
	<td  width="80px">合同费用合计</td>
	<td  width="80px">合同成本额</td>
	<td  width="80px">材料毛利</td>
	<td  width="80px">合同计入促销活动金额</td>

	<td  width="60px">数量</td>
	<td  width="80px">材料费</td>
	<td  width="70px">远程费</td>
	<td  width="70px">其它费用</td>
	<td  width="80px">费用合计</td>
	<td  width="80px">成本额</td>
	<td  width="80px">材料毛利</td>
	<td  width="80px">计入促销活动金额</td>
  </tr>

<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>