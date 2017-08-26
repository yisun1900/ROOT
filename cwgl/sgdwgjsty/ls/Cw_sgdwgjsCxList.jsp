<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
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
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
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
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	


	String cw_sgdwgjsty_jsjlh=null;
	String cw_sgdwgjsty_sgd=null;
	String sq_sgd_sgdmc=null;
	String cw_sgdwgjsty_sgbz=null;
	String cw_sgdwgjsty_htjcbj=null;
	String cw_sgdwgjsty_zjxjcbj=null;
	String cw_sgdwgjsty_ljqyf=null;
	String cw_sgdwgjsty_djazf=null;
	String cw_sgdwgjsty_jsjs=null;
	String cw_sgdwgjsty_jsbl=null;
	String cw_sgdwgjsty_tzjsbl=null;
	String cw_sgdwgjsty_sdlje=null;
	String cw_sgdwgjsty_sdljsbl=null;
	String cw_sgdwgjsty_jsje=null;
	String cw_sgdwgjsty_clf=null;
	String cw_sgdwgjsty_clyf=null;
	String cw_sgdwgjsty_gdyp=null;
	String cw_sgdwgjsty_yfgck=null;
	String cw_sgdwgjsty_kzbjjbl=null;
	String cw_sgdwgjsty_kzbj=null;
	String cw_sgdwgjsty_clfk=null;
	String cw_sgdwgjsty_jfje=null;
	String cw_sgdwgjsty_yfje=null;
	String cw_sgdwgjsty_jsrq=null;
	String cw_sgdwgjsty_clzt=null;
	String cw_sgdwgjsty_lrr=null;
	String cw_sgdwgjsty_lrsj=null;
	String cw_sgdwgjsty_lrbm=null;
	cw_sgdwgjsty_jsjlh=request.getParameter("cw_sgdwgjsty_jsjlh");
	if (cw_sgdwgjsty_jsjlh!=null)
	{
		cw_sgdwgjsty_jsjlh=cf.GB2Uni(cw_sgdwgjsty_jsjlh);
		if (!(cw_sgdwgjsty_jsjlh.equals("")))	wheresql+=" and  (cw_sgdwgjsty.jsjlh='"+cw_sgdwgjsty_jsjlh+"')";
	}
	cw_sgdwgjsty_sgd=request.getParameter("cw_sgdwgjsty_sgd");
	if (cw_sgdwgjsty_sgd!=null)
	{
		cw_sgdwgjsty_sgd=cf.GB2Uni(cw_sgdwgjsty_sgd);
		if (!(cw_sgdwgjsty_sgd.equals("")))	wheresql+=" and  (cw_sgdwgjsty.sgd='"+cw_sgdwgjsty_sgd+"')";
	}
	sq_sgd_sgdmc=request.getParameter("sq_sgd_sgdmc");
	if (sq_sgd_sgdmc!=null)
	{
		sq_sgd_sgdmc=cf.GB2Uni(sq_sgd_sgdmc);
		if (!(sq_sgd_sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sq_sgd_sgdmc+"')";
	}
	cw_sgdwgjsty_sgbz=request.getParameter("cw_sgdwgjsty_sgbz");
	if (cw_sgdwgjsty_sgbz!=null)
	{
		cw_sgdwgjsty_sgbz=cf.GB2Uni(cw_sgdwgjsty_sgbz);
		if (!(cw_sgdwgjsty_sgbz.equals("")))	wheresql+=" and  (cw_sgdwgjsty.sgbz='"+cw_sgdwgjsty_sgbz+"')";
	}
	cw_sgdwgjsty_htjcbj=request.getParameter("cw_sgdwgjsty_htjcbj");
	if (cw_sgdwgjsty_htjcbj!=null)
	{
		cw_sgdwgjsty_htjcbj=cw_sgdwgjsty_htjcbj.trim();
		if (!(cw_sgdwgjsty_htjcbj.equals("")))	wheresql+=" and  (cw_sgdwgjsty.htjcbj="+cw_sgdwgjsty_htjcbj+") ";
	}
	cw_sgdwgjsty_zjxjcbj=request.getParameter("cw_sgdwgjsty_zjxjcbj");
	if (cw_sgdwgjsty_zjxjcbj!=null)
	{
		cw_sgdwgjsty_zjxjcbj=cw_sgdwgjsty_zjxjcbj.trim();
		if (!(cw_sgdwgjsty_zjxjcbj.equals("")))	wheresql+=" and  (cw_sgdwgjsty.zjxjcbj="+cw_sgdwgjsty_zjxjcbj+") ";
	}
	cw_sgdwgjsty_ljqyf=request.getParameter("cw_sgdwgjsty_ljqyf");
	if (cw_sgdwgjsty_ljqyf!=null)
	{
		cw_sgdwgjsty_ljqyf=cw_sgdwgjsty_ljqyf.trim();
		if (!(cw_sgdwgjsty_ljqyf.equals("")))	wheresql+=" and  (cw_sgdwgjsty.ljqyf="+cw_sgdwgjsty_ljqyf+") ";
	}
	cw_sgdwgjsty_djazf=request.getParameter("cw_sgdwgjsty_djazf");
	if (cw_sgdwgjsty_djazf!=null)
	{
		cw_sgdwgjsty_djazf=cw_sgdwgjsty_djazf.trim();
		if (!(cw_sgdwgjsty_djazf.equals("")))	wheresql+=" and  (cw_sgdwgjsty.djazf="+cw_sgdwgjsty_djazf+") ";
	}
	cw_sgdwgjsty_jsjs=request.getParameter("cw_sgdwgjsty_jsjs");
	if (cw_sgdwgjsty_jsjs!=null)
	{
		cw_sgdwgjsty_jsjs=cw_sgdwgjsty_jsjs.trim();
		if (!(cw_sgdwgjsty_jsjs.equals("")))	wheresql+=" and  (cw_sgdwgjsty.jsjs="+cw_sgdwgjsty_jsjs+") ";
	}
	cw_sgdwgjsty_jsbl=request.getParameter("cw_sgdwgjsty_jsbl");
	if (cw_sgdwgjsty_jsbl!=null)
	{
		cw_sgdwgjsty_jsbl=cw_sgdwgjsty_jsbl.trim();
		if (!(cw_sgdwgjsty_jsbl.equals("")))	wheresql+=" and  (cw_sgdwgjsty.jsbl="+cw_sgdwgjsty_jsbl+") ";
	}
	cw_sgdwgjsty_tzjsbl=request.getParameter("cw_sgdwgjsty_tzjsbl");
	if (cw_sgdwgjsty_tzjsbl!=null)
	{
		cw_sgdwgjsty_tzjsbl=cw_sgdwgjsty_tzjsbl.trim();
		if (!(cw_sgdwgjsty_tzjsbl.equals("")))	wheresql+=" and  (cw_sgdwgjsty.tzjsbl="+cw_sgdwgjsty_tzjsbl+") ";
	}
	cw_sgdwgjsty_sdlje=request.getParameter("cw_sgdwgjsty_sdlje");
	if (cw_sgdwgjsty_sdlje!=null)
	{
		cw_sgdwgjsty_sdlje=cw_sgdwgjsty_sdlje.trim();
		if (!(cw_sgdwgjsty_sdlje.equals("")))	wheresql+=" and  (cw_sgdwgjsty.sdlje="+cw_sgdwgjsty_sdlje+") ";
	}
	cw_sgdwgjsty_sdljsbl=request.getParameter("cw_sgdwgjsty_sdljsbl");
	if (cw_sgdwgjsty_sdljsbl!=null)
	{
		cw_sgdwgjsty_sdljsbl=cw_sgdwgjsty_sdljsbl.trim();
		if (!(cw_sgdwgjsty_sdljsbl.equals("")))	wheresql+=" and  (cw_sgdwgjsty.sdljsbl="+cw_sgdwgjsty_sdljsbl+") ";
	}
	cw_sgdwgjsty_jsje=request.getParameter("cw_sgdwgjsty_jsje");
	if (cw_sgdwgjsty_jsje!=null)
	{
		cw_sgdwgjsty_jsje=cw_sgdwgjsty_jsje.trim();
		if (!(cw_sgdwgjsty_jsje.equals("")))	wheresql+=" and  (cw_sgdwgjsty.jsje="+cw_sgdwgjsty_jsje+") ";
	}
	cw_sgdwgjsty_clf=request.getParameter("cw_sgdwgjsty_clf");
	if (cw_sgdwgjsty_clf!=null)
	{
		cw_sgdwgjsty_clf=cw_sgdwgjsty_clf.trim();
		if (!(cw_sgdwgjsty_clf.equals("")))	wheresql+=" and  (cw_sgdwgjsty.clf="+cw_sgdwgjsty_clf+") ";
	}
	cw_sgdwgjsty_clyf=request.getParameter("cw_sgdwgjsty_clyf");
	if (cw_sgdwgjsty_clyf!=null)
	{
		cw_sgdwgjsty_clyf=cw_sgdwgjsty_clyf.trim();
		if (!(cw_sgdwgjsty_clyf.equals("")))	wheresql+=" and  (cw_sgdwgjsty.clyf="+cw_sgdwgjsty_clyf+") ";
	}
	cw_sgdwgjsty_gdyp=request.getParameter("cw_sgdwgjsty_gdyp");
	if (cw_sgdwgjsty_gdyp!=null)
	{
		cw_sgdwgjsty_gdyp=cw_sgdwgjsty_gdyp.trim();
		if (!(cw_sgdwgjsty_gdyp.equals("")))	wheresql+=" and  (cw_sgdwgjsty.gdyp="+cw_sgdwgjsty_gdyp+") ";
	}
	cw_sgdwgjsty_yfgck=request.getParameter("cw_sgdwgjsty_yfgck");
	if (cw_sgdwgjsty_yfgck!=null)
	{
		cw_sgdwgjsty_yfgck=cw_sgdwgjsty_yfgck.trim();
		if (!(cw_sgdwgjsty_yfgck.equals("")))	wheresql+=" and  (cw_sgdwgjsty.yfgck="+cw_sgdwgjsty_yfgck+") ";
	}
	cw_sgdwgjsty_kzbjjbl=request.getParameter("cw_sgdwgjsty_kzbjjbl");
	if (cw_sgdwgjsty_kzbjjbl!=null)
	{
		cw_sgdwgjsty_kzbjjbl=cw_sgdwgjsty_kzbjjbl.trim();
		if (!(cw_sgdwgjsty_kzbjjbl.equals("")))	wheresql+=" and  (cw_sgdwgjsty.kzbjbl="+cw_sgdwgjsty_kzbjjbl+") ";
	}
	cw_sgdwgjsty_kzbj=request.getParameter("cw_sgdwgjsty_kzbj");
	if (cw_sgdwgjsty_kzbj!=null)
	{
		cw_sgdwgjsty_kzbj=cw_sgdwgjsty_kzbj.trim();
		if (!(cw_sgdwgjsty_kzbj.equals("")))	wheresql+=" and  (cw_sgdwgjsty.kzbj="+cw_sgdwgjsty_kzbj+") ";
	}
	cw_sgdwgjsty_clfk=request.getParameter("cw_sgdwgjsty_clfk");
	if (cw_sgdwgjsty_clfk!=null)
	{
		cw_sgdwgjsty_clfk=cw_sgdwgjsty_clfk.trim();
		if (!(cw_sgdwgjsty_clfk.equals("")))	wheresql+=" and  (cw_sgdwgjsty.clfk="+cw_sgdwgjsty_clfk+") ";
	}
	cw_sgdwgjsty_jfje=request.getParameter("cw_sgdwgjsty_jfje");
	if (cw_sgdwgjsty_jfje!=null)
	{
		cw_sgdwgjsty_jfje=cw_sgdwgjsty_jfje.trim();
		if (!(cw_sgdwgjsty_jfje.equals("")))	wheresql+=" and  (cw_sgdwgjsty.jfje="+cw_sgdwgjsty_jfje+") ";
	}
	cw_sgdwgjsty_yfje=request.getParameter("cw_sgdwgjsty_yfje");
	if (cw_sgdwgjsty_yfje!=null)
	{
		cw_sgdwgjsty_yfje=cw_sgdwgjsty_yfje.trim();
		if (!(cw_sgdwgjsty_yfje.equals("")))	wheresql+=" and  (cw_sgdwgjsty.yfje="+cw_sgdwgjsty_yfje+") ";
	}
	cw_sgdwgjsty_jsrq=request.getParameter("cw_sgdwgjsty_jsrq");
	if (cw_sgdwgjsty_jsrq!=null)
	{
		cw_sgdwgjsty_jsrq=cw_sgdwgjsty_jsrq.trim();
		if (!(cw_sgdwgjsty_jsrq.equals("")))	wheresql+="  and (cw_sgdwgjsty.jsrq=TO_DATE('"+cw_sgdwgjsty_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdwgjsty_clzt=request.getParameter("cw_sgdwgjsty_clzt");
	if (cw_sgdwgjsty_clzt!=null)
	{
		cw_sgdwgjsty_clzt=cf.GB2Uni(cw_sgdwgjsty_clzt);
		if (!(cw_sgdwgjsty_clzt.equals("")))	wheresql+=" and  (cw_sgdwgjsty.clzt='"+cw_sgdwgjsty_clzt+"')";
	}
	cw_sgdwgjsty_lrr=request.getParameter("cw_sgdwgjsty_lrr");
	if (cw_sgdwgjsty_lrr!=null)
	{
		cw_sgdwgjsty_lrr=cf.GB2Uni(cw_sgdwgjsty_lrr);
		if (!(cw_sgdwgjsty_lrr.equals("")))	wheresql+=" and  (cw_sgdwgjsty.lrr='"+cw_sgdwgjsty_lrr+"')";
	}
	cw_sgdwgjsty_lrsj=request.getParameter("cw_sgdwgjsty_lrsj");
	if (cw_sgdwgjsty_lrsj!=null)
	{
		cw_sgdwgjsty_lrsj=cw_sgdwgjsty_lrsj.trim();
		if (!(cw_sgdwgjsty_lrsj.equals("")))	wheresql+="  and (cw_sgdwgjsty.lrsj>=TO_DATE('"+cw_sgdwgjsty_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdwgjsty_lrsj=request.getParameter("cw_sgdwgjsty_lrsj2");
	if (cw_sgdwgjsty_lrsj!=null)
	{
		cw_sgdwgjsty_lrsj=cw_sgdwgjsty_lrsj.trim();
		if (!(cw_sgdwgjsty_lrsj.equals("")))	wheresql+="  and (cw_sgdwgjsty.lrsj<=TO_DATE('"+cw_sgdwgjsty_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	
	
	cw_sgdwgjsty_lrbm=request.getParameter("cw_sgdwgjsty_lrbm");
	if (cw_sgdwgjsty_lrbm!=null)
	{
		cw_sgdwgjsty_lrbm=cf.GB2Uni(cw_sgdwgjsty_lrbm);
		if (!(cw_sgdwgjsty_lrbm.equals("")))	wheresql+=" and  (cw_sgdwgjsty.lrbm='"+cw_sgdwgjsty_lrbm+"')";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=null;
	myxssl=request.getParameter("myxssl");

	ls_sql="SELECT cw_sgdwgjsty.jsjlh,DECODE(cw_sgdwgjsty.clzt,'1','未审批','2','审批'),cw_sgdwgjsty.jsrq,cw_sgdwgjsty.khbh,crm_khxx.khxm,sq_sgd.sgdmc,cw_sgdwgjsty.sgbz, DECODE(cw_sgdwgjsty.jsjs,'1','工程费','2','工程费＋其它费','3','实收款总额','4','一期款','5','二期款','6','三期款','7','工程基础报价','8','工程基础报价＋其它费基础报价','9','最新工程施工成本价','A','最新工程施工成本价＋其它费施工成本','D','合同工程施工成本价','E','合同工程施工成本价＋其它费施工成本','B','工程成本价','C','工程成本价＋其它费成本'),cw_sgdwgjsty.jsjsze,cw_sgdwgjsty.jsbl||'%',cw_sgdwgjsty.tzjsbl||'%',DECODE(cw_sgdwgjsty.sdljsfs,'1','统一比例结算','2','独立比例结算','3','手工录入结算金额','9','不结算'),cw_sgdwgjsty.sdlje,cw_sgdwgjsty.sdljsbl||'%',cw_sgdwgjsty.sdljsje,cw_sgdwgjsty.jsje, DECODE(cw_sgdwgjsty.sfkclk,'Y','是','N','否'),cw_sgdwgjsty.clf,cw_sgdwgjsty.clyf,cw_sgdwgjsty.clfk, DECODE(cw_sgdwgjsty.sfkgdyp,'Y','是','N','否'),cw_sgdwgjsty.gdyp, DECODE(cw_sgdwgjsty.sfkyfgf,'Y','是','N','否'),cw_sgdwgjsty.yfgck, DECODE(cw_sgdwgjsty.sfkzbj,'Y','是','N','否'), DECODE(cw_sgdwgjsty.kzbjjs,'1','结算基数','2','结算总额'),cw_sgdwgjsty.kzbjbl||'%',cw_sgdwgjsty.kzbj,cw_sgdwgjsty.fkje,cw_sgdwgjsty.jlje,cw_sgdwgjsty.qtje,cw_sgdwgjsty.yfje,cw_sgdwgjsty.htje,cw_sgdwgjsty.zjxje,cw_sgdwgjsty.qtf,cw_sgdwgjsty.qtfsm,cw_sgdwgjsty.ssk, cw_sgdwgjsty.lrr,cw_sgdwgjsty.lrsj,dwmc,cw_sgdwgjsty.bz  ";
	ls_sql+=" FROM sq_sgd,cw_sgdwgjsty,crm_khxx,sq_dwxx  ";
    ls_sql+=" where cw_sgdwgjsty.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_sgdwgjsty.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_sgdwgjsty.lrbm=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sgdwgjsty.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_sgdwgjstyCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"jsjlh","cw_sgdwgjsty_khbh","sq_sgd_sgdmc","cw_sgdwgjsty_sgbz","cw_sgdwgjsty_htjcbj","cw_sgdwgjsty_zjxjcbj","cw_sgdwgjsty_ljqyf","cw_sgdwgjsty_djazf","cw_sgdwgjsty_jsjs","cw_sgdwgjsty_jsbl","cw_sgdwgjsty_tzjsbl","cw_sgdwgjsty_sdlje","cw_sgdwgjsty_sdljsbl","cw_sgdwgjsty_jsje","cw_sgdwgjsty_clf","cw_sgdwgjsty_clyf","cw_sgdwgjsty_gdyp","cw_sgdwgjsty_yfgck","cw_sgdwgjsty_kzbjjbl","cw_sgdwgjsty_kzbj","cw_sgdwgjsty_clfk","cw_sgdwgjsty_jfje","cw_sgdwgjsty_yfje","cw_sgdwgjsty_jsrq","cw_sgdwgjsty_clzt","cw_sgdwgjsty_lrr","cw_sgdwgjsty_lrsj","cw_sgdwgjsty_lrbm","cw_sgdwgjsty_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_sgdwgjsty.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(380);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">结算记录号</td>
	<td  width="2%">处理状态</td>
	<td  width="3%">结算日期</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="2%">施工队</td>
	<td  width="2%">现场负责人</td>
	<td  width="4%">结算基数</td>
	<td  width="2%">结算基数总额</td>
	<td  width="2%">结算比例</td>
	<td  width="2%">调整结算比例</td>
	<td  width="3%">水电路结算方式</td>
	<td  width="2%">水电路金额</td>
	<td  width="2%">水电路结算比例</td>
	<td  width="2%">水电路结算金额</td>
	<td  width="2%">结算总额</td>
	<td  width="2%">是否扣材料款</td>
	<td  width="2%">材料费</td>
	<td  width="2%">材料运费</td>
	<td  width="2%">材料罚款</td>
	<td  width="2%">是否扣工地用品</td>
	<td  width="2%">工地用品</td>
	<td  width="2%">是否扣已付工费</td>
	<td  width="2%">已付工程款</td>
	<td  width="2%">是否扣质保金</td>
	<td  width="2%">扣质保金基数</td>
	<td  width="2%">应扣质保金比例</td>
	<td  width="2%">扣质保金</td>
	<td  width="2%">罚款金额</td>
	<td  width="2%">奖励金额</td>
	<td  width="2%">其它金额</td>
	<td  width="2%">应付金额</td>
	<td  width="2%">工程合同额</td>
	<td  width="2%">工程增减项</td>
	<td  width="2%">其它费</td>
	<td  width="7%">其它费说明</td>
	<td  width="2%">实收款</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="3%">录入部门</td>
	<td  width="118%">备注</td>
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