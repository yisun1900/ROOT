<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"041521")==0) 
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
	String jc_zcdd_jkxz=null;
	String jc_zcdd_jkdd=null;
	String jc_zcdd_ddshbz=null;
	String jc_zcdd_kjxsj=null;
	String jc_zcdd_xclbz=null;
	String jc_zcdd_htshsj=null;
	String jc_zcdd_ycclzt=null;
	String jc_zcdd_clzt=null;
	String jc_zcdd_lrr=null;
	String jc_zcdd_lrsj=null;
	String jc_zcdd_dwbh=null;
	String jc_zcdd_qhtsj=null;
	String jc_zcdd_jhclsj=null;


	String sfjrht=null;
	sfjrht=request.getParameter("sfjrht");
	if (sfjrht!=null)
	{
		sfjrht=cf.GB2Uni(sfjrht);
		if (!(sfjrht.equals("")))	wheresql+=" and  (jc_zcdd.sfjrht='"+sfjrht+"')";
	}

	String ddlx=null;
	ddlx=request.getParameter("ddlx");
	if (ddlx!=null)
	{
		ddlx=cf.GB2Uni(ddlx);
		if (ddlx.equals("99"))
		{
			wheresql+=" and  (jc_zcdd.ddlx in('7','8') OR (jc_zcdd.ddlx='6' and jc_zcdd.zctclx='2'))";
		}
		else if (ddlx.equals("98"))
		{
			wheresql+=" and  (jc_zcdd.ddlx='6' and jc_zcdd.zctclx='1')";
		}
		else if (!(ddlx.equals("")))
		{
			wheresql+=" and  (jc_zcdd.ddlx='"+ddlx+"')";
		}
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

	String wjsj=null;
	wjsj=request.getParameter("wjsj");
	if (wjsj!=null)
	{
		if (!(wjsj.equals("")))	wheresql+="  and (jc_zcdd.wjsj>=TO_DATE('"+wjsj+"','YYYY/MM/DD'))";
	}
	wjsj=request.getParameter("wjsj2");
	if (wjsj!=null)
	{
		if (!(wjsj.equals("")))	wheresql+="  and (jc_zcdd.wjsj<=TO_DATE('"+wjsj+"','YYYY/MM/DD'))";
	}


	String jc_zcdd_jhshsj=null;
	jc_zcdd_jhshsj=request.getParameter("jc_zcdd_jhshsj");
	if (jc_zcdd_jhshsj!=null)
	{
		if (!(jc_zcdd_jhshsj.equals("")))	wheresql+="  and (jc_zcdd.jhshsj>=TO_DATE('"+jc_zcdd_jhshsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_jhshsj=request.getParameter("jc_zcdd_jhshsj2");
	if (jc_zcdd_jhshsj!=null)
	{
		if (!(jc_zcdd_jhshsj.equals("")))	wheresql+="  and (jc_zcdd.jhshsj<=TO_DATE('"+jc_zcdd_jhshsj+"','YYYY/MM/DD'))";
	}
	String jc_zcdd_tzshsj=null;
	jc_zcdd_tzshsj=request.getParameter("jc_zcdd_tzshsj");
	if (jc_zcdd_tzshsj!=null)
	{
		jc_zcdd_tzshsj=jc_zcdd_tzshsj.trim();
		if (!(jc_zcdd_tzshsj.equals("")))	wheresql+="  and (jc_zcdd.tzshsj>=TO_DATE('"+jc_zcdd_tzshsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_tzshsj=request.getParameter("jc_zcdd_tzshsj2");
	if (jc_zcdd_tzshsj!=null)
	{
		jc_zcdd_tzshsj=jc_zcdd_tzshsj.trim();
		if (!(jc_zcdd_tzshsj.equals("")))	wheresql+="  and (jc_zcdd.tzshsj<=TO_DATE('"+jc_zcdd_tzshsj+"','YYYY/MM/DD'))";
	}
	String jc_zcdd_sshsj=null;
	jc_zcdd_sshsj=request.getParameter("jc_zcdd_sshsj");
	if (jc_zcdd_sshsj!=null)
	{
		jc_zcdd_sshsj=jc_zcdd_sshsj.trim();
		if (!(jc_zcdd_sshsj.equals("")))	wheresql+="  and (jc_zcdd.sshsj>=TO_DATE('"+jc_zcdd_sshsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_sshsj=request.getParameter("jc_zcdd_sshsj2");
	if (jc_zcdd_sshsj!=null)
	{
		jc_zcdd_sshsj=jc_zcdd_sshsj.trim();
		if (!(jc_zcdd_sshsj.equals("")))	wheresql+="  and (jc_zcdd.sshsj<=TO_DATE('"+jc_zcdd_sshsj+"','YYYY/MM/DD'))";
	}


	jc_zcdd_ddbh=request.getParameter("jc_zcdd_ddbh");
	if (jc_zcdd_ddbh!=null)
	{
		jc_zcdd_ddbh=cf.GB2Uni(jc_zcdd_ddbh);
		if (!(jc_zcdd_ddbh.equals("")))	wheresql+=" and  (jc_zcdd.ddbh='"+jc_zcdd_ddbh+"')";
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



	jc_zcdd_jkxz=request.getParameter("jc_zcdd_jkxz");
	if (jc_zcdd_jkxz!=null)
	{
		jc_zcdd_jkxz=cf.GB2Uni(jc_zcdd_jkxz);
		if (!(jc_zcdd_jkxz.equals("")))	wheresql+=" and  (jc_zcdd.jkxz='"+jc_zcdd_jkxz+"')";
	}
	jc_zcdd_jkdd=request.getParameter("jc_zcdd_jkdd");
	if (jc_zcdd_jkdd!=null)
	{
		jc_zcdd_jkdd=cf.GB2Uni(jc_zcdd_jkdd);
		if (!(jc_zcdd_jkdd.equals("")))	wheresql+=" and  (jc_zcdd.jkdd='"+jc_zcdd_jkdd+"')";
	}
	jc_zcdd_ddshbz=request.getParameter("jc_zcdd_ddshbz");
	if (jc_zcdd_ddshbz!=null)
	{
		jc_zcdd_ddshbz=cf.GB2Uni(jc_zcdd_ddshbz);
		if (!(jc_zcdd_ddshbz.equals("")))	wheresql+=" and  (jc_zcdd.ddshbz='"+jc_zcdd_ddshbz+"')";
	}
	jc_zcdd_kjxsj=request.getParameter("jc_zcdd_kjxsj");
	if (jc_zcdd_kjxsj!=null)
	{
		jc_zcdd_kjxsj=jc_zcdd_kjxsj.trim();
		if (!(jc_zcdd_kjxsj.equals("")))	wheresql+="  and (jc_zcdd.kjxsj>=TO_DATE('"+jc_zcdd_kjxsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_kjxsj=request.getParameter("jc_zcdd_kjxsj2");
	if (jc_zcdd_kjxsj!=null)
	{
		jc_zcdd_kjxsj=jc_zcdd_kjxsj.trim();
		if (!(jc_zcdd_kjxsj.equals("")))	wheresql+="  and (jc_zcdd.kjxsj<=TO_DATE('"+jc_zcdd_kjxsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_xclbz=request.getParameter("jc_zcdd_xclbz");
	if (jc_zcdd_xclbz!=null)
	{
		jc_zcdd_xclbz=cf.GB2Uni(jc_zcdd_xclbz);
		if (!(jc_zcdd_xclbz.equals("")))	wheresql+=" and  (jc_zcdd.xclbz='"+jc_zcdd_xclbz+"')";
	}
	jc_zcdd_htshsj=request.getParameter("jc_zcdd_htshsj");
	if (jc_zcdd_htshsj!=null)
	{
		jc_zcdd_htshsj=jc_zcdd_htshsj.trim();
		if (!(jc_zcdd_htshsj.equals("")))	wheresql+="  and (jc_zcdd.htshsj>=TO_DATE('"+jc_zcdd_htshsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_htshsj=request.getParameter("jc_zcdd_htshsj2");
	if (jc_zcdd_htshsj!=null)
	{
		jc_zcdd_htshsj=jc_zcdd_htshsj.trim();
		if (!(jc_zcdd_htshsj.equals("")))	wheresql+="  and (jc_zcdd.htshsj<=TO_DATE('"+jc_zcdd_htshsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_ycclzt=request.getParameter("jc_zcdd_ycclzt");
	if (jc_zcdd_ycclzt!=null)
	{
		jc_zcdd_ycclzt=cf.GB2Uni(jc_zcdd_ycclzt);
		if (!(jc_zcdd_ycclzt.equals("")))	wheresql+=" and  (jc_zcdd.ycclzt='"+jc_zcdd_ycclzt+"')";
	}

	jc_zcdd_clzt=request.getParameter("jc_zcdd_clzt");
	if (jc_zcdd_clzt!=null)
	{
		jc_zcdd_clzt=cf.GB2Uni(jc_zcdd_clzt);
		if (!(jc_zcdd_clzt.equals("")))	wheresql+=" and  (jc_zcdd.clzt='"+jc_zcdd_clzt+"')";
	}
	jc_zcdd_lrr=request.getParameter("jc_zcdd_lrr");
	if (jc_zcdd_lrr!=null)
	{
		jc_zcdd_lrr=cf.GB2Uni(jc_zcdd_lrr);
		if (!(jc_zcdd_lrr.equals("")))	wheresql+=" and  (jc_zcdd.lrr='"+jc_zcdd_lrr+"')";
	}
	jc_zcdd_lrsj=request.getParameter("jc_zcdd_lrsj");
	if (jc_zcdd_lrsj!=null)
	{
		jc_zcdd_lrsj=jc_zcdd_lrsj.trim();
		if (!(jc_zcdd_lrsj.equals("")))	wheresql+="  and (jc_zcdd.lrsj>=TO_DATE('"+jc_zcdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_lrsj=request.getParameter("jc_zcdd_lrsj2");
	if (jc_zcdd_lrsj!=null)
	{
		jc_zcdd_lrsj=jc_zcdd_lrsj.trim();
		if (!(jc_zcdd_lrsj.equals("")))	wheresql+="  and (jc_zcdd.lrsj<=TO_DATE('"+jc_zcdd_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	jc_zcdd_dwbh=request.getParameter("jc_zcdd_dwbh");
	if (jc_zcdd_dwbh!=null)
	{
		jc_zcdd_dwbh=cf.GB2Uni(jc_zcdd_dwbh);
		if (!(jc_zcdd_dwbh.equals("")))	wheresql+=" and  (jc_zcdd.dwbh='"+jc_zcdd_dwbh+"')";
	}
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
	jc_zcdd_jhclsj=request.getParameter("jc_zcdd_jhclsj");
	if (jc_zcdd_jhclsj!=null)
	{
		jc_zcdd_jhclsj=jc_zcdd_jhclsj.trim();
		if (!(jc_zcdd_jhclsj.equals("")))	wheresql+="  and (jc_zcdd.jhclsj>=TO_DATE('"+jc_zcdd_jhclsj+"','YYYY/MM/DD'))";
	}
	jc_zcdd_jhclsj=request.getParameter("jc_zcdd_jhclsj2");
	if (jc_zcdd_jhclsj!=null)
	{
		jc_zcdd_jhclsj=jc_zcdd_jhclsj.trim();
		if (!(jc_zcdd_jhclsj.equals("")))	wheresql+="  and (jc_zcdd.jhclsj<=TO_DATE('"+jc_zcdd_jhclsj+"','YYYY/MM/DD'))";
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

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}
	String myxssl=request.getParameter("myxssl");

	if (yhjs.equals("G0"))
	{
		ls_sql="SELECT jc_zcdd.ddbh,clztmc,DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','集成家居主材','A','顶配升级','B','顶配独立收费','C','选配主材','D','套餐外主材'),DECODE(jc_zcdd.sfjrht,'Y','计入','N','不计入') sfjrht,DECODE(jc_zcdd.sfjs,'N','未结算','Y','已结算'),jc_zcdd.jssj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,ysgcjdmc,ppbm,ppmc,gys,zcdlbm,zcxlbm,cxhdbm,crm_khxx.sjs,c.dwmc dm,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,TO_CHAR(jc_zcdd.zczkl) zczkl,jc_zcdd.dzyy,jc_zcdd.zsje,jc_zcdd.zjxzsje,jc_zcdd.zqclf,jc_zcdd.zhclf,jc_zcdd.ycf,jc_zcdd.qtf     ,jc_zcdd.wdzje,jc_zcdd.hkze,jc_zcdd.htcxhdje,jc_zcdd.cbze,DECODE(jc_zcdd.zhclf,0,'',ROUND(100-jc_zcdd.cbze*100/jc_zcdd.zhclf,0)||'%' )     ,jc_zcdd.zqzjxclf,jc_zcdd.zhzjxclf,jc_zcdd.zjxycf,jc_zcdd.zjxqtf       ,jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.zjxcxhdje,jc_zcdd.zjxcbze,DECODE(jc_zcdd.zhzjxclf,0,'',ROUND(100-jc_zcdd.zjxcbze*100/jc_zcdd.zhzjxclf,0)||'%' )     ,jc_zcdd.zqclf+jc_zcdd.zqzjxclf,jc_zcdd.zhclf+jc_zcdd.zhzjxclf,jc_zcdd.ycf+jc_zcdd.zjxycf,jc_zcdd.qtf+jc_zcdd.zjxqtf         ,jc_zcdd.wdzje+jc_zcdd.zqzjhze,jc_zcdd.hkze+jc_zcdd.zjhze,jc_zcdd.htcxhdje+jc_zcdd.zjxcxhdje,jc_zcdd.cbze+jc_zcdd.zjxcbze,DECODE((jc_zcdd.zhclf+jc_zcdd.zhzjxclf),0,'',ROUND(100-(jc_zcdd.cbze+jc_zcdd.zjxcbze)*100/(jc_zcdd.zhclf+jc_zcdd.zhzjxclf),0)||'%' ), DECODE(jc_zcdd.jkxz,'1','未付款','2','全款','3','材料商收余款','4','预付款减出'), DECODE(jc_zcdd.jkdd,'1','材料商现场收余款','2','店面收款','3','公司财务收款'),jc_zcdd.qhtsj,jc_zcdd.ddqrsj,jc_zcdd.htshsj,jc_zcdd.jhshsj,jc_zcdd.tzshsj,jc_zcdd.sshsj,jc_zcdd.wjsj,tzry,shqk, DECODE(jc_zcdd.ddshbz,'1','不需待电','2','待电未通知','3','待电已通知'),DECODE(jc_zcdd.xclbz,'1','非定制','2','定制式产品'),jc_zcdd.lrr,jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.bz,jc_zcdd.khbh";
		ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,sq_dwxx c ,jdm_zcddzt,dm_gcjdbm ";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and jc_zcdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=c.dwbh(+)";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
		ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
		ls_sql+=" and jc_zcdd.clzt>='13' and jc_zcdd.clzt not in('98')";

		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from jxc_ppgysdzb where gysbm='"+ygbh+"' )";
		
		ls_sql+=wheresql;
		ls_sql+=ordersql;
		pageObj.sql=ls_sql;
	//进行对象初始化
		pageObj.initPage("Jc_zcddCxList.jsp","SelectCxJc_zcdd.jsp","","/jcjj/dygl/zcht1.jsp");
		pageObj.setEditStr("打印");
		pageObj.setPageRow(Integer.parseInt(myxssl));
	}
	else{
		ls_sql="SELECT jc_zcdd.ddbh,clztmc,DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','集成家居主材','A','顶配升级','B','顶配独立收费','C','选配主材','D','套餐外主材'),DECODE(jc_zcdd.sfjrht,'Y','计入','N','不计入') sfjrht,DECODE(jc_zcdd.sfjs,'N','未结算','Y','已结算'),jc_zcdd.jssj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,ysgcjdmc,ppbm,ppmc,gys,zcdlbm,zcxlbm,cxhdbm,crm_khxx.sjs,c.dwmc dm,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,TO_CHAR(jc_zcdd.zczkl) zczkl,jc_zcdd.dzyy,jc_zcdd.zsje,jc_zcdd.zjxzsje,jc_zcdd.zqclf,jc_zcdd.zhclf,jc_zcdd.ycf,jc_zcdd.qtf     ,jc_zcdd.wdzje,jc_zcdd.hkze,jc_zcdd.htcxhdje,jc_zcdd.cbze,DECODE(jc_zcdd.zhclf,0,'',ROUND(100-jc_zcdd.cbze*100/jc_zcdd.zhclf,0)||'%' )     ,jc_zcdd.zqzjxclf,jc_zcdd.zhzjxclf,jc_zcdd.zjxycf,jc_zcdd.zjxqtf       ,jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.zjxcxhdje,jc_zcdd.zjxcbze,DECODE(jc_zcdd.zhzjxclf,0,'',ROUND(100-jc_zcdd.zjxcbze*100/jc_zcdd.zhzjxclf,0)||'%' )     ,jc_zcdd.zqclf+jc_zcdd.zqzjxclf,jc_zcdd.zhclf+jc_zcdd.zhzjxclf,jc_zcdd.ycf+jc_zcdd.zjxycf,jc_zcdd.qtf+jc_zcdd.zjxqtf         ,jc_zcdd.wdzje+jc_zcdd.zqzjhze,jc_zcdd.hkze+jc_zcdd.zjhze,jc_zcdd.htcxhdje+jc_zcdd.zjxcxhdje,jc_zcdd.cbze+jc_zcdd.zjxcbze,DECODE((jc_zcdd.zhclf+jc_zcdd.zhzjxclf),0,'',ROUND(100-(jc_zcdd.cbze+jc_zcdd.zjxcbze)*100/(jc_zcdd.zhclf+jc_zcdd.zhzjxclf),0)||'%' ), DECODE(jc_zcdd.jkxz,'1','未付款','2','全款','3','材料商收余款','4','预付款减出'), DECODE(jc_zcdd.jkdd,'1','材料商现场收余款','2','店面收款','3','公司财务收款'),jc_zcdd.qhtsj,jc_zcdd.ddqrsj,jc_zcdd.htshsj,jc_zcdd.jhshsj,jc_zcdd.tzshsj,jc_zcdd.sshsj,jc_zcdd.wjsj,tzry,shqk, DECODE(jc_zcdd.ddshbz,'1','不需待电','2','待电未通知','3','待电已通知'),DECODE(jc_zcdd.xclbz,'1','非定制','2','定制式产品'),jc_zcdd.lrr,jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.bz,jc_zcdd.khbh";
		ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,sq_dwxx c ,jdm_zcddzt,dm_gcjdbm ";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and jc_zcdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=c.dwbh(+)";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
		ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";

		if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

		if (zwbm.equals("08"))//08:家居顾问
		{
			ls_sql+=" and (jc_zcdd.clgw='"+yhmc+"' OR jc_zcdd.ztjjgw='"+yhmc+"' OR jc_zcdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("12"))//12:家居设计师
		{
			ls_sql+=" and (jc_zcdd.jjsjs='"+yhmc+"' OR jc_zcdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("10"))//10:项目专员
		{
			ls_sql+=" and (jc_zcdd.xmzy='"+yhmc+"' OR jc_zcdd.lrr='"+yhmc+"')";
		}
		ls_sql+=wheresql;
		ls_sql+=ordersql;
		pageObj.sql=ls_sql;
	//进行对象初始化
		pageObj.initPage("Jc_zcddCxJeList.jsp","","","");
		pageObj.setPageRow(Integer.parseInt(myxssl));
	}

//	out.println(ls_sql);

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);

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
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<title>查询数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询－全部合同(金额)</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(930);
%>

<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="60px">订单编号</td>
	<td  width="80px">处理状态</td>
	<td  width="80px">订单类型</td>
	<td  width="55px">是否计入家装合同</td>
	<td  width="50px">是否已结算</td>
	<td  width="65px">结算时间</td>
	<td  width="70px">合同号</td>
	<td  width="80px">客户姓名</td>
	<td  width="220px">房屋地址</td>
	<td  width="110px">工程进度</td>
	<td  width="160px">子品牌</td>
	<td  width="120px">品牌</td>
	<td  width="280px">供应商</td>
	<td  width="120px">主材大类</td>
	<td  width="120px">主材小类</td>
	<td  width="220px">参加促销活动</td>
	<td  width="60px">家装设计师</td>
	<td  width="120px">签约店面</td>
	<td  width="60px">驻店家居顾问</td>
	<td  width="60px">展厅家居顾问</td>
	<td  width="60px">项目专员</td>
	<td  width="60px">家居设计师</td>
	<td  width="50px">折扣率</td>
	<td  width="300px">打折原因</td>

	<td  width="90px"><strong>合同赠送额</strong></td>
	<td  width="90px"><strong>增减项赠送额</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>材料费-折前</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>材料费-折后</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>远程费</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>其它费</strong></td>
	
	<td  width="90px" bgcolor="#99FFFF"><strong>合同额-折前</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong><font color="#0000CC">合同额-折后</font></strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>合同计入活动金额</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>合同成本额</strong></td>
	<td  width="50px" bgcolor="#99FFFF"><strong>合同材料毛利</strong></td>

	<td  width="90px"><strong>增减项材料费-折前</strong></td>
	<td  width="90px"><strong>增减项材料费-折后</strong></td>
	<td  width="90px"><strong>增减项远程费</strong></td>
	<td  width="90px"><strong>增减项其它费</strong></td>
	
	<td  width="90px"><strong>增减项-折前</strong></td>
	<td  width="90px"><strong><font color="#0000CC">增减项-折后</font></strong></td>
	<td  width="90px"><strong>增减项计入活动金额</strong></td>
	<td  width="90px"><strong>增减项成本额</strong></td>
	<td  width="60px"><strong>增减项材料毛利</strong></td>

	<td  width="90px" bgcolor="#FFFFCC"><strong>全部材料费-折前</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>全部材料费-折后</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>全部远程费</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>全部其它费</strong></td>

	<td  width="90px" bgcolor="#FFFFCC"><strong>全部总额-折前</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong><font color="#0000CC">全部总额-折后</font></strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>计入活动总额</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>全部成本总额</strong></td>
	<td  width="50px" bgcolor="#FFFFCC"><strong>全部材料毛利</strong></td>
	<td  width="80px">客户交款性质</td>
	<td  width="110px">交款地点</td>
	<td  width="65px">签合同时间</td>
	<td  width="65px">订单确认时间</td>
	<td  width="65px">合同送货时间</td>
	<td  width="65px">计划送货时间</td>
	<td  width="65px">发送货通知时间</td>
	<td  width="65px">实送货时间</td>
	<td  width="65px">完结时间</td>
	<td  width="80px">通知人员</td>
	<td  width="320px">送货情况</td>
	<td  width="80px">等待送货通知</td>
	<td  width="80px">产品类型</td>
	<td  width="45px">录入人</td>
	<td  width="65px">录入时间</td>
	<td  width="110px">录入部门</td>
	<td  width="530px">备注</td>
   	<td  width="60px">客户编号</td>
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