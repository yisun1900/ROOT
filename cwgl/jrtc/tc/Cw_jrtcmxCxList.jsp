<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cw_jrtcmx_khzq=null;
	String cw_jrtcmx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String cw_jrtcmx_hdbz=null;
	String cw_jrtcmx_tckh=null;
	String cw_jrtcmx_dianz=null;
	String cw_jrtcmx_weny=null;
	String cw_jrtcmx_khjl=null;
	String cw_jrtcmx_sjs=null;
	String cw_jrtcmx_cly=null;
	String cw_jrtcmx_zjxm=null;
	String cw_jrtcmx_xqzg=null;
	String cw_jrtcmx_xqzz=null;
	String cw_jrtcmx_xqzy=null;
	String cw_jrtcmx_wlyxzg=null;
	String cw_jrtcmx_yxzy=null;
	String cw_jrtcmx_wzch=null;
	String cw_jrtcmx_wysj=null;
	String cw_jrtcmx_wzcxy=null;
	String cw_jrtcmx_dhzy=null;
	String cw_jrtcmx_wztgy=null;
	String cw_jrtcmx_siji=null;
	String cw_jrtcmx_lx=null;
	String cw_jrtcmx_lrr=null;
	String cw_jrtcmx_lrsj=null;
	cw_jrtcmx_khzq=request.getParameter("cw_jrtcmx_khzq");
	if (cw_jrtcmx_khzq!=null)
	{
		cw_jrtcmx_khzq=cf.GB2Uni(cw_jrtcmx_khzq);
		if (!(cw_jrtcmx_khzq.equals("")))	wheresql+=" and  (cw_jrtcmx.khzq='"+cw_jrtcmx_khzq+"')";
	}
	cw_jrtcmx_khbh=request.getParameter("cw_jrtcmx_khbh");
	if (cw_jrtcmx_khbh!=null)
	{
		cw_jrtcmx_khbh=cf.GB2Uni(cw_jrtcmx_khbh);
		if (!(cw_jrtcmx_khbh.equals("")))	wheresql+=" and  (cw_jrtcmx.khbh='"+cw_jrtcmx_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	cw_jrtcmx_hdbz=request.getParameter("cw_jrtcmx_hdbz");
	if (cw_jrtcmx_hdbz!=null)
	{
		cw_jrtcmx_hdbz=cf.GB2Uni(cw_jrtcmx_hdbz);
		if (!(cw_jrtcmx_hdbz.equals("")))	wheresql+=" and  (cw_jrtcmx.hdbz='"+cw_jrtcmx_hdbz+"')";
	}
	cw_jrtcmx_tckh=request.getParameter("cw_jrtcmx_tckh");
	if (cw_jrtcmx_tckh!=null)
	{
		cw_jrtcmx_tckh=cf.GB2Uni(cw_jrtcmx_tckh);
		if (!(cw_jrtcmx_tckh.equals("")))	wheresql+=" and  (cw_jrtcmx.tckh='"+cw_jrtcmx_tckh+"')";
	}
	cw_jrtcmx_dianz=request.getParameter("cw_jrtcmx_dianz");
	if (cw_jrtcmx_dianz!=null)
	{
		cw_jrtcmx_dianz=cf.GB2Uni(cw_jrtcmx_dianz);
		if (!(cw_jrtcmx_dianz.equals("")))	wheresql+=" and  (cw_jrtcmx.dianz='"+cw_jrtcmx_dianz+"')";
	}
	cw_jrtcmx_weny=request.getParameter("cw_jrtcmx_weny");
	if (cw_jrtcmx_weny!=null)
	{
		cw_jrtcmx_weny=cf.GB2Uni(cw_jrtcmx_weny);
		if (!(cw_jrtcmx_weny.equals("")))	wheresql+=" and  (cw_jrtcmx.weny='"+cw_jrtcmx_weny+"')";
	}
	cw_jrtcmx_khjl=request.getParameter("cw_jrtcmx_khjl");
	if (cw_jrtcmx_khjl!=null)
	{
		cw_jrtcmx_khjl=cf.GB2Uni(cw_jrtcmx_khjl);
		if (!(cw_jrtcmx_khjl.equals("")))	wheresql+=" and  (cw_jrtcmx.khjl='"+cw_jrtcmx_khjl+"')";
	}
	cw_jrtcmx_sjs=request.getParameter("cw_jrtcmx_sjs");
	if (cw_jrtcmx_sjs!=null)
	{
		cw_jrtcmx_sjs=cf.GB2Uni(cw_jrtcmx_sjs);
		if (!(cw_jrtcmx_sjs.equals("")))	wheresql+=" and  (cw_jrtcmx.sjs='"+cw_jrtcmx_sjs+"')";
	}
	cw_jrtcmx_cly=request.getParameter("cw_jrtcmx_cly");
	if (cw_jrtcmx_cly!=null)
	{
		cw_jrtcmx_cly=cf.GB2Uni(cw_jrtcmx_cly);
		if (!(cw_jrtcmx_cly.equals("")))	wheresql+=" and  (cw_jrtcmx.cly='"+cw_jrtcmx_cly+"')";
	}
	cw_jrtcmx_zjxm=request.getParameter("cw_jrtcmx_zjxm");
	if (cw_jrtcmx_zjxm!=null)
	{
		cw_jrtcmx_zjxm=cf.GB2Uni(cw_jrtcmx_zjxm);
		if (!(cw_jrtcmx_zjxm.equals("")))	wheresql+=" and  (cw_jrtcmx.zjxm='"+cw_jrtcmx_zjxm+"')";
	}
	cw_jrtcmx_xqzg=request.getParameter("cw_jrtcmx_xqzg");
	if (cw_jrtcmx_xqzg!=null)
	{
		cw_jrtcmx_xqzg=cf.GB2Uni(cw_jrtcmx_xqzg);
		if (!(cw_jrtcmx_xqzg.equals("")))	wheresql+=" and  (cw_jrtcmx.xqzg='"+cw_jrtcmx_xqzg+"')";
	}
	cw_jrtcmx_xqzz=request.getParameter("cw_jrtcmx_xqzz");
	if (cw_jrtcmx_xqzz!=null)
	{
		cw_jrtcmx_xqzz=cf.GB2Uni(cw_jrtcmx_xqzz);
		if (!(cw_jrtcmx_xqzz.equals("")))	wheresql+=" and  (cw_jrtcmx.xqzz='"+cw_jrtcmx_xqzz+"')";
	}
	cw_jrtcmx_xqzy=request.getParameter("cw_jrtcmx_xqzy");
	if (cw_jrtcmx_xqzy!=null)
	{
		cw_jrtcmx_xqzy=cf.GB2Uni(cw_jrtcmx_xqzy);
		if (!(cw_jrtcmx_xqzy.equals("")))	wheresql+=" and  (cw_jrtcmx.xqzy='"+cw_jrtcmx_xqzy+"')";
	}
	cw_jrtcmx_wlyxzg=request.getParameter("cw_jrtcmx_wlyxzg");
	if (cw_jrtcmx_wlyxzg!=null)
	{
		cw_jrtcmx_wlyxzg=cf.GB2Uni(cw_jrtcmx_wlyxzg);
		if (!(cw_jrtcmx_wlyxzg.equals("")))	wheresql+=" and  (cw_jrtcmx.wlyxzg='"+cw_jrtcmx_wlyxzg+"')";
	}
	cw_jrtcmx_yxzy=request.getParameter("cw_jrtcmx_yxzy");
	if (cw_jrtcmx_yxzy!=null)
	{
		cw_jrtcmx_yxzy=cf.GB2Uni(cw_jrtcmx_yxzy);
		if (!(cw_jrtcmx_yxzy.equals("")))	wheresql+=" and  (cw_jrtcmx.yxzy='"+cw_jrtcmx_yxzy+"')";
	}
	cw_jrtcmx_wzch=request.getParameter("cw_jrtcmx_wzch");
	if (cw_jrtcmx_wzch!=null)
	{
		cw_jrtcmx_wzch=cf.GB2Uni(cw_jrtcmx_wzch);
		if (!(cw_jrtcmx_wzch.equals("")))	wheresql+=" and  (cw_jrtcmx.wzch='"+cw_jrtcmx_wzch+"')";
	}
	cw_jrtcmx_wysj=request.getParameter("cw_jrtcmx_wysj");
	if (cw_jrtcmx_wysj!=null)
	{
		cw_jrtcmx_wysj=cf.GB2Uni(cw_jrtcmx_wysj);
		if (!(cw_jrtcmx_wysj.equals("")))	wheresql+=" and  (cw_jrtcmx.wysj='"+cw_jrtcmx_wysj+"')";
	}
	cw_jrtcmx_wzcxy=request.getParameter("cw_jrtcmx_wzcxy");
	if (cw_jrtcmx_wzcxy!=null)
	{
		cw_jrtcmx_wzcxy=cf.GB2Uni(cw_jrtcmx_wzcxy);
		if (!(cw_jrtcmx_wzcxy.equals("")))	wheresql+=" and  (cw_jrtcmx.wzcxy='"+cw_jrtcmx_wzcxy+"')";
	}
	cw_jrtcmx_dhzy=request.getParameter("cw_jrtcmx_dhzy");
	if (cw_jrtcmx_dhzy!=null)
	{
		cw_jrtcmx_dhzy=cf.GB2Uni(cw_jrtcmx_dhzy);
		if (!(cw_jrtcmx_dhzy.equals("")))	wheresql+=" and  (cw_jrtcmx.dhzy='"+cw_jrtcmx_dhzy+"')";
	}
	cw_jrtcmx_wztgy=request.getParameter("cw_jrtcmx_wztgy");
	if (cw_jrtcmx_wztgy!=null)
	{
		cw_jrtcmx_wztgy=cf.GB2Uni(cw_jrtcmx_wztgy);
		if (!(cw_jrtcmx_wztgy.equals("")))	wheresql+=" and  (cw_jrtcmx.wztgy='"+cw_jrtcmx_wztgy+"')";
	}
	cw_jrtcmx_siji=request.getParameter("cw_jrtcmx_siji");
	if (cw_jrtcmx_siji!=null)
	{
		cw_jrtcmx_siji=cf.GB2Uni(cw_jrtcmx_siji);
		if (!(cw_jrtcmx_siji.equals("")))	wheresql+=" and  (cw_jrtcmx.siji='"+cw_jrtcmx_siji+"')";
	}
	cw_jrtcmx_lx=request.getParameter("cw_jrtcmx_lx");
	if (cw_jrtcmx_lx!=null)
	{
		cw_jrtcmx_lx=cf.GB2Uni(cw_jrtcmx_lx);
		if (!(cw_jrtcmx_lx.equals("")))	wheresql+=" and  (cw_jrtcmx.lx='"+cw_jrtcmx_lx+"')";
	}
	cw_jrtcmx_lrr=request.getParameter("cw_jrtcmx_lrr");
	if (cw_jrtcmx_lrr!=null)
	{
		cw_jrtcmx_lrr=cf.GB2Uni(cw_jrtcmx_lrr);
		if (!(cw_jrtcmx_lrr.equals("")))	wheresql+=" and  (cw_jrtcmx.lrr='"+cw_jrtcmx_lrr+"')";
	}
	cw_jrtcmx_lrsj=request.getParameter("cw_jrtcmx_lrsj");
	if (cw_jrtcmx_lrsj!=null)
	{
		cw_jrtcmx_lrsj=cw_jrtcmx_lrsj.trim();
		if (!(cw_jrtcmx_lrsj.equals("")))	wheresql+="  and (cw_jrtcmx.lrsj>=TO_DATE('"+cw_jrtcmx_lrsj+"','YYYY/MM/DD'))";
	}
	cw_jrtcmx_lrsj=request.getParameter("cw_jrtcmx_lrsj2");
	if (cw_jrtcmx_lrsj!=null)
	{
		cw_jrtcmx_lrsj=cw_jrtcmx_lrsj.trim();
		if (!(cw_jrtcmx_lrsj.equals("")))	wheresql+="  and (cw_jrtcmx.lrsj<=TO_DATE('"+cw_jrtcmx_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_jrtcmx.khzq,cw_jrtcmx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,cw_jrtcmx.hdbz, DECODE(cw_jrtcmx.tckh,'1','����','2','�ײ�'),cw_jrtcmx.dianz,cw_jrtcmx.weny,cw_jrtcmx.khjl,cw_jrtcmx.sjs,cw_jrtcmx.cly,cw_jrtcmx.zjxm,cw_jrtcmx.xqzg,cw_jrtcmx.xqzz,cw_jrtcmx.xqzy,cw_jrtcmx.wlyxzg,cw_jrtcmx.yxzy,cw_jrtcmx.wzch,cw_jrtcmx.wysj,cw_jrtcmx.wzcxy,cw_jrtcmx.dhzy,cw_jrtcmx.wztgy,cw_jrtcmx.siji,cw_jrtcmx.fwmj,cw_jrtcmx.sjf,cw_jrtcmx.ycf,cw_jrtcmx.zqje,cw_jrtcmx.zk,cw_jrtcmx.suijin,cw_jrtcmx.zhjtjs,cw_jrtcmx.zjxje,cw_jrtcmx.zjxbl,cw_jrtcmx.tcwzczx,cw_jrtcmx.dzsjftcbl,cw_jrtcmx.dzqysjftc,cw_jrtcmx.dzjssjftc,cw_jrtcmx.dzzxftcbl,cw_jrtcmx.dzqyzxtc,cw_jrtcmx.dzjszxtc,cw_jrtcmx.dztcxj,cw_jrtcmx.dzkhbl,cw_jrtcmx.dztcze,cw_jrtcmx.wyzxftcbl,cw_jrtcmx.wyqyzxtc,cw_jrtcmx.wyjszxtc,cw_jrtcmx.khjlsjftcbl,cw_jrtcmx.khjlqysjftc,cw_jrtcmx.khjljssjftc,cw_jrtcmx.khjlzxftcbl,cw_jrtcmx.khjlqyzxtc,cw_jrtcmx.khjljszxtc,cw_jrtcmx.khjltcxj,cw_jrtcmx.khjlkhbl,cw_jrtcmx.khjltcze,cw_jrtcmx.sjssjftcbl,cw_jrtcmx.sjsqysjftc,cw_jrtcmx.sjsjssjftc,cw_jrtcmx.sjszxftcbl,cw_jrtcmx.sjsqyzxtc,cw_jrtcmx.sjsjszxtc,cw_jrtcmx.sjsycftcbl,cw_jrtcmx.sjsycftc,cw_jrtcmx.sjstchj,cw_jrtcmx.zjzxftcbl,cw_jrtcmx.zjqyzxtc,cw_jrtcmx.zjjszxtc,cw_jrtcmx.zjycftcbl,cw_jrtcmx.zjycftc,cw_jrtcmx.zjtcxj,cw_jrtcmx.zjkhbl,cw_jrtcmx.zjtchj,cw_jrtcmx.clyzxftcbl,cw_jrtcmx.clyqyzxtc,cw_jrtcmx.clyjszxtc,cw_jrtcmx.clykhbl,cw_jrtcmx.clytc,cw_jrtcmx.xqzgzxftcbl,cw_jrtcmx.xqzgqyzxtc,cw_jrtcmx.xqzgjszxtc,cw_jrtcmx.xqzgkhbl,cw_jrtcmx.xqzgtc,cw_jrtcmx.xqzzzxftcbl,cw_jrtcmx.xqzzqyzxtc,cw_jrtcmx.xqzzjszxtc,cw_jrtcmx.xqzzkhbl,cw_jrtcmx.xqzztc,cw_jrtcmx.xqzyzxftcbl,cw_jrtcmx.xqzyqyzxtc,cw_jrtcmx.xqzyjszxtc,cw_jrtcmx.xqzykhbl,cw_jrtcmx.xqzytc,cw_jrtcmx.wlyxzgzxftcbl,cw_jrtcmx.wlyxzgqyzxtc,cw_jrtcmx.wlyxzgjszxtc,cw_jrtcmx.wlyxzgkhbl,cw_jrtcmx.wlyxzgtc,cw_jrtcmx.yxzyzxftcbl,cw_jrtcmx.yxzyqyzxtc,cw_jrtcmx.wzchzxftcbl,cw_jrtcmx.wzchqyzxtc,cw_jrtcmx.wysjzxftcbl,cw_jrtcmx.wysjqyzxtc,cw_jrtcmx.wzcxyzxftcbl,cw_jrtcmx.wzcxyqyzxtc,cw_jrtcmx.dhzyzxftcbl,cw_jrtcmx.dhzyqyzxtc,cw_jrtcmx.wztgyzxftcbl,cw_jrtcmx.wztgyqyzxtc,cw_jrtcmx.wztgyjszxtc,cw_jrtcmx.wztgykhbl,cw_jrtcmx.wztgytc,cw_jrtcmx.sjzxftcbl,cw_jrtcmx.sjqyzxtc,cw_jrtcmx.jjze, DECODE(cw_jrtcmx.lx,'1','ǩ�����','2','�������'),cw_jrtcmx.lrr,cw_jrtcmx.lrsj,cw_jrtcmx.bz  ";
	ls_sql+=" FROM crm_khxx,cw_jrtcmx  ";
    ls_sql+=" where cw_jrtcmx.khbh=crm_khxx.khbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrtcmx.khzq,cw_jrtcmx.xuhao";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jrtcmxCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khzq","khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","cw_jrtcmx_hdbz","cw_jrtcmx_tckh","cw_jrtcmx_dianz","cw_jrtcmx_weny","cw_jrtcmx_khjl","cw_jrtcmx_sjs","cw_jrtcmx_cly","cw_jrtcmx_zjxm","cw_jrtcmx_xqzg","cw_jrtcmx_xqzz","cw_jrtcmx_xqzy","cw_jrtcmx_wlyxzg","cw_jrtcmx_yxzy","cw_jrtcmx_wzch","cw_jrtcmx_wysj","cw_jrtcmx_wzcxy","cw_jrtcmx_dhzy","cw_jrtcmx_wztgy","cw_jrtcmx_siji","cw_jrtcmx_fwmj","cw_jrtcmx_sjf","cw_jrtcmx_ycf","cw_jrtcmx_zqje","cw_jrtcmx_zk","cw_jrtcmx_suijin","cw_jrtcmx_zhjtjs","cw_jrtcmx_zjxje","cw_jrtcmx_zjxbl","cw_jrtcmx_tcwzczx","cw_jrtcmx_dzsjftcbl","cw_jrtcmx_dzqysjftc","cw_jrtcmx_dzjssjftc","cw_jrtcmx_dzzxftcbl","cw_jrtcmx_dzqyzxtc","cw_jrtcmx_dzjszxtc","cw_jrtcmx_dztcxj","cw_jrtcmx_dzkhbl","cw_jrtcmx_dztcze","cw_jrtcmx_wyzxftcbl","cw_jrtcmx_wyqyzxtc","cw_jrtcmx_wyjszxtc","cw_jrtcmx_khjlsjftcbl","cw_jrtcmx_khjlqysjftc","cw_jrtcmx_khjljssjftc","cw_jrtcmx_khjlzxftcbl","cw_jrtcmx_khjlqyzxtc","cw_jrtcmx_khjljszxtc","cw_jrtcmx_khjltcxj","cw_jrtcmx_khjlkhbl","cw_jrtcmx_khjltcze","cw_jrtcmx_sjssjftcbl","cw_jrtcmx_sjsqysjftc","cw_jrtcmx_sjsjssjftc","cw_jrtcmx_sjszxftcbl","cw_jrtcmx_sjsqyzxtc","cw_jrtcmx_sjsjszxtc","cw_jrtcmx_sjsycftcbl","cw_jrtcmx_sjsycftc","cw_jrtcmx_sjstchj","cw_jrtcmx_zjzxftcbl","cw_jrtcmx_zjqyzxtc","cw_jrtcmx_zjjszxtc","cw_jrtcmx_zjycftcbl","cw_jrtcmx_zjycftc","cw_jrtcmx_zjtcxj","cw_jrtcmx_zjkhbl","cw_jrtcmx_zjtchj","cw_jrtcmx_clyzxftcbl","cw_jrtcmx_clyqyzxtc","cw_jrtcmx_clyjszxtc","cw_jrtcmx_clykhbl","cw_jrtcmx_clytc","cw_jrtcmx_xqzgzxftcbl","cw_jrtcmx_xqzgqyzxtc","cw_jrtcmx_xqzgjszxtc","cw_jrtcmx_xqzgkhbl","cw_jrtcmx_xqzgtc","cw_jrtcmx_xqzzzxftcbl","cw_jrtcmx_xqzzqyzxtc","cw_jrtcmx_xqzzjszxtc","cw_jrtcmx_xqzzkhbl","cw_jrtcmx_xqzztc","cw_jrtcmx_xqzyzxftcbl","cw_jrtcmx_xqzyqyzxtc","cw_jrtcmx_xqzyjszxtc","cw_jrtcmx_xqzykhbl","cw_jrtcmx_xqzytc","cw_jrtcmx_wlyxzgzxftcbl","cw_jrtcmx_wlyxzgqyzxtc","cw_jrtcmx_wlyxzgjszxtc","cw_jrtcmx_wlyxzgkhbl","cw_jrtcmx_wlyxzgtc","cw_jrtcmx_yxzyzxftcbl","cw_jrtcmx_yxzyqyzxtc","cw_jrtcmx_wzchzxftcbl","cw_jrtcmx_wzchqyzxtc","cw_jrtcmx_wysjzxftcbl","cw_jrtcmx_wysjqyzxtc","cw_jrtcmx_wzcxyzxftcbl","cw_jrtcmx_wzcxyqyzxtc","cw_jrtcmx_dhzyzxftcbl","cw_jrtcmx_dhzyqyzxtc","cw_jrtcmx_wztgyzxftcbl","cw_jrtcmx_wztgyqyzxtc","cw_jrtcmx_wztgyjszxtc","cw_jrtcmx_wztgykhbl","cw_jrtcmx_wztgytc","cw_jrtcmx_sjzxftcbl","cw_jrtcmx_sjqyzxtc","cw_jrtcmx_jjze","cw_jrtcmx_lx","cw_jrtcmx_lrr","cw_jrtcmx_lrsj","cw_jrtcmx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khzq","khbh"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ϸ��ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(1400);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="0%">��������</td>
	<td  width="0%">�ͻ����</td>
	<td  width="0%">�ͻ�����</td>
	<td  width="0%">���ݵ�ַ</td>
	<td  width="0%">��ͬ��</td>
	<td  width="0%">�ص���־</td>
	<td  width="0%">�ײͿͻ�</td>
	<td  width="0%">�곤</td>
	<td  width="0%">��Ա</td>
	<td  width="0%">����ҵ��</td>
	<td  width="0%">���ʦ</td>
	<td  width="0%">����Ա</td>
	<td  width="0%">�ͻ�����</td>
	<td  width="0%">С������</td>
	<td  width="0%">С���鳤</td>
	<td  width="0%">С��רԱ</td>
	<td  width="0%">����Ӫ������</td>
	<td  width="0%">Ӫ��רԱ</td>
	<td  width="0%">��վ�߻�</td>
	<td  width="0%">��ҳ���</td>
	<td  width="0%">��վ����Ա</td>
	<td  width="0%">�绰רԱ</td>
	<td  width="0%">��վ�ƹ�Ա</td>
	<td  width="0%">˾��</td>
	<td  width="0%">�������</td>
	<td  width="0%">��Ʒ�</td>
	<td  width="0%">Զ�̷�</td>
	<td  width="0%">��ǰ���</td>
	<td  width="0%">�ۿ�</td>
	<td  width="0%">˰��</td>
	<td  width="0%">�ۺ�������</td>
	<td  width="0%">��������</td>
	<td  width="0%">���������</td>
	<td  width="0%">�ײ�����������</td>
	<td  width="0%">�곤��Ʒ���ɱ���</td>
	<td  width="0%">�곤ǩԼ��Ʒ����</td>
	<td  width="0%">�곤������Ʒ����</td>
	<td  width="0%">�곤װ�޷���ɱ���</td>
	<td  width="0%">�곤ǩԼװ�����</td>
	<td  width="0%">�곤����װ�����</td>
	<td  width="0%">�곤���С��</td>
	<td  width="0%">�곤���˱���</td>
	<td  width="0%">�곤����ܶ�</td>
	<td  width="0%">��Աװ�޷���ɱ���</td>
	<td  width="0%">��ԱǩԼװ�����</td>
	<td  width="0%">��Ա����װ�����</td>
	<td  width="0%">����ҵ����Ʒ���ɱ���</td>
	<td  width="0%">����ҵ��ǩԼ��Ʒ����</td>
	<td  width="0%">����ҵ�������Ʒ����</td>
	<td  width="0%">����ҵ��װ�޷���ɱ���</td>
	<td  width="0%">����ҵ��ǩԼװ�����</td>
	<td  width="0%">����ҵ�����װ�����</td>
	<td  width="0%">����ҵ�����С��</td>
	<td  width="0%">����ҵ�񿼺˱���</td>
	<td  width="0%">����ҵ������ܶ�</td>
	<td  width="0%">���ʦ��Ʒ���ɱ���</td>
	<td  width="0%">���ʦǩԼ��Ʒ����</td>
	<td  width="0%">���ʦ������Ʒ����</td>
	<td  width="0%">���ʦװ�޷���ɱ���</td>
	<td  width="0%">���ʦǩԼװ�����</td>
	<td  width="0%">���ʦ����װ�����</td>
	<td  width="0%">���ʦԶ�̷���ɱ���</td>
	<td  width="0%">���ʦԶ�̷����</td>
	<td  width="0%">���ʦ��ɺϼ�</td>
	<td  width="0%">�ͻ�����װ�޷���ɱ���</td>
	<td  width="0%">�ͻ�����ǩԼװ�����</td>
	<td  width="0%">�ͻ��������װ�����</td>
	<td  width="0%">�ͻ�����Զ�̷���ɱ���</td>
	<td  width="0%">�ͻ�����Զ�̷����</td>
	<td  width="0%">�ͻ��������С��</td>
	<td  width="0%">�ͻ������˱���</td>
	<td  width="0%">�ͻ�������ɺϼ�</td>
	<td  width="0%">����Աװ�޷���ɱ���</td>
	<td  width="0%">����ԱǩԼװ�����</td>
	<td  width="0%">����Ա����װ�����</td>
	<td  width="0%">����Ա���˱���</td>
	<td  width="0%">����Ա���</td>
	<td  width="0%">С������װ�޷���ɱ���</td>
	<td  width="0%">С������ǩԼװ�����</td>
	<td  width="0%">С�����ܽ���װ�����</td>
	<td  width="0%">С�����ܿ��˱���</td>
	<td  width="0%">С���������</td>
	<td  width="0%">С���鳤װ�޷���ɱ���</td>
	<td  width="0%">С���鳤ǩԼװ�����</td>
	<td  width="0%">С���鳤����װ�����</td>
	<td  width="0%">С���鳤���˱���</td>
	<td  width="0%">С���鳤���</td>
	<td  width="0%">С��רԱװ�޷���ɱ���</td>
	<td  width="0%">С��רԱǩԼװ�����</td>
	<td  width="0%">С��רԱ����װ�����</td>
	<td  width="0%">С��רԱ���˱���</td>
	<td  width="0%">С��רԱ���</td>
	<td  width="0%">����Ӫ������װ�޷���ɱ���</td>
	<td  width="0%">����Ӫ������ǩԼװ�����</td>
	<td  width="0%">����Ӫ�����ܽ���װ�����</td>
	<td  width="0%">����Ӫ�����ܿ��˱���</td>
	<td  width="0%">����Ӫ���������</td>
	<td  width="0%">Ӫ��רԱװ�޷���ɱ���</td>
	<td  width="0%">Ӫ��רԱǩԼװ�����</td>
	<td  width="0%">��վ�߻�װ�޷���ɱ���</td>
	<td  width="0%">��վ�߻�ǩԼװ�����</td>
	<td  width="0%">��ҳ���װ�޷���ɱ���</td>
	<td  width="0%">��ҳ���ǩԼװ�����</td>
	<td  width="0%">��վ����Աװ�޷���ɱ���</td>
	<td  width="0%">��վ����ԱǩԼװ�����</td>
	<td  width="0%">�绰רԱװ�޷���ɱ���</td>
	<td  width="0%">�绰רԱǩԼװ�����</td>
	<td  width="0%">��վ�ƹ�Աװ�޷���ɱ���</td>
	<td  width="0%">��վ�ƹ�ԱǩԼװ�����</td>
	<td  width="0%">��վ�ƹ�Ա����װ�����</td>
	<td  width="0%">��վ�ƹ�Ա���˱���</td>
	<td  width="0%">��վ�ƹ�Ա���</td>
	<td  width="0%">˾��װ�޷���ɱ���</td>
	<td  width="0%">˾��ǩԼװ�����</td>
	<td  width="0%">�����ܶ�</td>
	<td  width="0%">����</td>
	<td  width="0%">¼����</td>
	<td  width="0%">¼��ʱ��</td>
	<td  width="0%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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