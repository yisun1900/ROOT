<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String gdm_gdjcjl_jcjlh=null;
	String gdm_gdjcjl_khbh=null;
	String gdm_gdjcjl_sgd=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_sjs=null;
	String gdm_gdjcjl_xjr=null;
	String gdm_gdjcjl_xjsj=null;
	String gdm_gdjcjl_xxlybm=null;
	String gdm_gdjcjl_jclxbm=null;
	String gdm_gdjcjl_jcjgbm=null;
	String gdm_gdjcjl_jcwtflbm=null;
	String gdm_gdjcjl_cfspbz=null;
	String gdm_gdjcjl_spr=null;
	String gdm_gdjcjl_spsj=null;
	String gdm_gdjcjl_sffszg=null;
	String gdm_gdjcjl_yqjjsj=null;
	String gdm_gdjcjl_dwbh=null;
	String gdm_gdjcjl_zrr=null;

	String gdm_gdjcjl_sfxldcl=null;
	String gdm_gdjcjl_ldyqjjsj=null;
	String gdm_gdjcjl_ldclr=null;
	String gdm_gdjcjl_ldclsj=null;
	String gdm_gdjcjl_jssj=null;
	String gdm_gdjcjl_jsr=null;
	String gdm_gdjcjl_jhcfasj=null;
	String gdm_gdjcjl_cfajlh=null;
	String gdm_gdjcjl_sjcfasj=null;
	String gdm_gdjcjl_sjcfar=null;
	String gdm_gdjcjl_jhjjsj=null;
	String gdm_gdjcjl_shbm=null;
	String gdm_gdjcjl_shr=null;
	String gdm_gdjcjl_shsj=null;
	String gdm_gdjcjl_cljlh=null;
	String gdm_gdjcjl_clsj=null;
	String gdm_gdjcjl_clr=null;
	String gdm_gdjcjl_clzt=null;
	String gdm_gdjcjl_kpbz=null;
	String gdm_gdjcjl_kpjlh=null;
	String gdm_gdjcjl_jsbz=null;
	String gdm_gdjcjl_jsjlh=null;
	String gdm_gdjcjl_lrr=null;
	String gdm_gdjcjl_lrsj=null;
	String gdm_gdjcjl_lrdw=null;
	gdm_gdjcjl_jcjlh=request.getParameter("gdm_gdjcjl_jcjlh");
	if (gdm_gdjcjl_jcjlh!=null)
	{
		gdm_gdjcjl_jcjlh=cf.GB2Uni(gdm_gdjcjl_jcjlh);
		if (!(gdm_gdjcjl_jcjlh.equals("")))	wheresql+=" and  (gdm_gdjcjl.jcjlh='"+gdm_gdjcjl_jcjlh+"')";
	}
	gdm_gdjcjl_khbh=request.getParameter("gdm_gdjcjl_khbh");
	if (gdm_gdjcjl_khbh!=null)
	{
		gdm_gdjcjl_khbh=cf.GB2Uni(gdm_gdjcjl_khbh);
		if (!(gdm_gdjcjl_khbh.equals("")))	wheresql+=" and  (gdm_gdjcjl.khbh='"+gdm_gdjcjl_khbh+"')";
	}
	gdm_gdjcjl_sgd=request.getParameter("gdm_gdjcjl_sgd");
	if (gdm_gdjcjl_sgd!=null)
	{
		gdm_gdjcjl_sgd=cf.GB2Uni(gdm_gdjcjl_sgd);
		if (!(gdm_gdjcjl_sgd.equals("")))	wheresql+=" and  (gdm_gdjcjl.sgd='"+gdm_gdjcjl_sgd+"')";
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
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	gdm_gdjcjl_xjr=request.getParameter("gdm_gdjcjl_xjr");
	if (gdm_gdjcjl_xjr!=null)
	{
		gdm_gdjcjl_xjr=cf.GB2Uni(gdm_gdjcjl_xjr);
		if (!(gdm_gdjcjl_xjr.equals("")))	wheresql+=" and  (gdm_gdjcjl.xjr='"+gdm_gdjcjl_xjr+"')";
	}
	gdm_gdjcjl_xjsj=request.getParameter("gdm_gdjcjl_xjsj");
	if (gdm_gdjcjl_xjsj!=null)
	{
		gdm_gdjcjl_xjsj=gdm_gdjcjl_xjsj.trim();
		if (!(gdm_gdjcjl_xjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.xjsj>=TO_DATE('"+gdm_gdjcjl_xjsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_xjsj=request.getParameter("gdm_gdjcjl_xjsj2");
	if (gdm_gdjcjl_xjsj!=null)
	{
		gdm_gdjcjl_xjsj=gdm_gdjcjl_xjsj.trim();
		if (!(gdm_gdjcjl_xjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.xjsj<=TO_DATE('"+gdm_gdjcjl_xjsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_xxlybm=request.getParameter("gdm_gdjcjl_xxlybm");
	if (gdm_gdjcjl_xxlybm!=null)
	{
		gdm_gdjcjl_xxlybm=cf.GB2Uni(gdm_gdjcjl_xxlybm);
		if (!(gdm_gdjcjl_xxlybm.equals("")))	wheresql+=" and  (gdm_gdjcjl.xxlybm='"+gdm_gdjcjl_xxlybm+"')";
	}
	gdm_gdjcjl_jclxbm=request.getParameter("gdm_gdjcjl_jclxbm");
	if (gdm_gdjcjl_jclxbm!=null)
	{
		gdm_gdjcjl_jclxbm=cf.GB2Uni(gdm_gdjcjl_jclxbm);
		if (!(gdm_gdjcjl_jclxbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jclxbm='"+gdm_gdjcjl_jclxbm+"')";
	}
	gdm_gdjcjl_jcjgbm=request.getParameter("gdm_gdjcjl_jcjgbm");
	if (gdm_gdjcjl_jcjgbm!=null)
	{
		gdm_gdjcjl_jcjgbm=cf.GB2Uni(gdm_gdjcjl_jcjgbm);
		if (!(gdm_gdjcjl_jcjgbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jcjgbm='"+gdm_gdjcjl_jcjgbm+"')";
	}
	gdm_gdjcjl_jcwtflbm=request.getParameter("gdm_gdjcjl_jcwtflbm");
	if (gdm_gdjcjl_jcwtflbm!=null)
	{
		gdm_gdjcjl_jcwtflbm=cf.GB2Uni(gdm_gdjcjl_jcwtflbm);
		if (!(gdm_gdjcjl_jcwtflbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jcwtflbm='"+gdm_gdjcjl_jcwtflbm+"')";
	}
	gdm_gdjcjl_cfspbz=request.getParameter("gdm_gdjcjl_cfspbz");
	if (gdm_gdjcjl_cfspbz!=null)
	{
		gdm_gdjcjl_cfspbz=cf.GB2Uni(gdm_gdjcjl_cfspbz);
		if (!(gdm_gdjcjl_cfspbz.equals("")))	wheresql+=" and  (gdm_gdjcjl.cfspbz='"+gdm_gdjcjl_cfspbz+"')";
	}
	gdm_gdjcjl_spr=request.getParameter("gdm_gdjcjl_spr");
	if (gdm_gdjcjl_spr!=null)
	{
		gdm_gdjcjl_spr=cf.GB2Uni(gdm_gdjcjl_spr);
		if (!(gdm_gdjcjl_spr.equals("")))	wheresql+=" and  (gdm_gdjcjl.spr='"+gdm_gdjcjl_spr+"')";
	}
	gdm_gdjcjl_spsj=request.getParameter("gdm_gdjcjl_spsj");
	if (gdm_gdjcjl_spsj!=null)
	{
		gdm_gdjcjl_spsj=gdm_gdjcjl_spsj.trim();
		if (!(gdm_gdjcjl_spsj.equals("")))	wheresql+="  and (gdm_gdjcjl.spsj>=TO_DATE('"+gdm_gdjcjl_spsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_spsj=request.getParameter("gdm_gdjcjl_spsj2");
	if (gdm_gdjcjl_spsj!=null)
	{
		gdm_gdjcjl_spsj=gdm_gdjcjl_spsj.trim();
		if (!(gdm_gdjcjl_spsj.equals("")))	wheresql+="  and (gdm_gdjcjl.spsj<=TO_DATE('"+gdm_gdjcjl_spsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_sffszg=request.getParameter("gdm_gdjcjl_sffszg");
	if (gdm_gdjcjl_sffszg!=null)
	{
		gdm_gdjcjl_sffszg=cf.GB2Uni(gdm_gdjcjl_sffszg);
		if (!(gdm_gdjcjl_sffszg.equals("")))	wheresql+=" and  (gdm_gdjcjl.sffszg='"+gdm_gdjcjl_sffszg+"')";
	}
	gdm_gdjcjl_yqjjsj=request.getParameter("gdm_gdjcjl_yqjjsj");
	if (gdm_gdjcjl_yqjjsj!=null)
	{
		gdm_gdjcjl_yqjjsj=gdm_gdjcjl_yqjjsj.trim();
		if (!(gdm_gdjcjl_yqjjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.yqjjsj>=TO_DATE('"+gdm_gdjcjl_yqjjsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_yqjjsj=request.getParameter("gdm_gdjcjl_yqjjsj2");
	if (gdm_gdjcjl_yqjjsj!=null)
	{
		gdm_gdjcjl_yqjjsj=gdm_gdjcjl_yqjjsj.trim();
		if (!(gdm_gdjcjl_yqjjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.yqjjsj<=TO_DATE('"+gdm_gdjcjl_yqjjsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_dwbh=request.getParameter("gdm_gdjcjl_dwbh");
	if (gdm_gdjcjl_dwbh!=null)
	{
		gdm_gdjcjl_dwbh=cf.GB2Uni(gdm_gdjcjl_dwbh);
		if (!(gdm_gdjcjl_dwbh.equals("")))	wheresql+=" and  (gdm_gdjcjl.dwbh='"+gdm_gdjcjl_dwbh+"')";
	}
	gdm_gdjcjl_zrr=request.getParameter("gdm_gdjcjl_zrr");
	if (gdm_gdjcjl_zrr!=null)
	{
		gdm_gdjcjl_zrr=cf.GB2Uni(gdm_gdjcjl_zrr);
		if (!(gdm_gdjcjl_zrr.equals("")))	wheresql+=" and  (gdm_gdjcjl.zrr='"+gdm_gdjcjl_zrr+"')";
	}

	gdm_gdjcjl_sfxldcl=request.getParameter("gdm_gdjcjl_sfxldcl");
	if (gdm_gdjcjl_sfxldcl!=null)
	{
		gdm_gdjcjl_sfxldcl=cf.GB2Uni(gdm_gdjcjl_sfxldcl);
		if (!(gdm_gdjcjl_sfxldcl.equals("")))	wheresql+=" and  (gdm_gdjcjl.sfxldcl='"+gdm_gdjcjl_sfxldcl+"')";
	}
	gdm_gdjcjl_ldyqjjsj=request.getParameter("gdm_gdjcjl_ldyqjjsj");
	if (gdm_gdjcjl_ldyqjjsj!=null)
	{
		gdm_gdjcjl_ldyqjjsj=gdm_gdjcjl_ldyqjjsj.trim();
		if (!(gdm_gdjcjl_ldyqjjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.ldyqjjsj>=TO_DATE('"+gdm_gdjcjl_ldyqjjsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_ldyqjjsj=request.getParameter("gdm_gdjcjl_ldyqjjsj2");
	if (gdm_gdjcjl_ldyqjjsj!=null)
	{
		gdm_gdjcjl_ldyqjjsj=gdm_gdjcjl_ldyqjjsj.trim();
		if (!(gdm_gdjcjl_ldyqjjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.ldyqjjsj<=TO_DATE('"+gdm_gdjcjl_ldyqjjsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_ldclr=request.getParameter("gdm_gdjcjl_ldclr");
	if (gdm_gdjcjl_ldclr!=null)
	{
		gdm_gdjcjl_ldclr=cf.GB2Uni(gdm_gdjcjl_ldclr);
		if (!(gdm_gdjcjl_ldclr.equals("")))	wheresql+=" and  (gdm_gdjcjl.ldclr='"+gdm_gdjcjl_ldclr+"')";
	}
	gdm_gdjcjl_ldclsj=request.getParameter("gdm_gdjcjl_ldclsj");
	if (gdm_gdjcjl_ldclsj!=null)
	{
		gdm_gdjcjl_ldclsj=gdm_gdjcjl_ldclsj.trim();
		if (!(gdm_gdjcjl_ldclsj.equals("")))	wheresql+="  and (gdm_gdjcjl.ldclsj>=TO_DATE('"+gdm_gdjcjl_ldclsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_ldclsj=request.getParameter("gdm_gdjcjl_ldclsj2");
	if (gdm_gdjcjl_ldclsj!=null)
	{
		gdm_gdjcjl_ldclsj=gdm_gdjcjl_ldclsj.trim();
		if (!(gdm_gdjcjl_ldclsj.equals("")))	wheresql+="  and (gdm_gdjcjl.ldclsj<=TO_DATE('"+gdm_gdjcjl_ldclsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_jssj=request.getParameter("gdm_gdjcjl_jssj");
	if (gdm_gdjcjl_jssj!=null)
	{
		gdm_gdjcjl_jssj=gdm_gdjcjl_jssj.trim();
		if (!(gdm_gdjcjl_jssj.equals("")))	wheresql+="  and (gdm_gdjcjl.jssj>=TO_DATE('"+gdm_gdjcjl_jssj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_jssj=request.getParameter("gdm_gdjcjl_jssj2");
	if (gdm_gdjcjl_jssj!=null)
	{
		gdm_gdjcjl_jssj=gdm_gdjcjl_jssj.trim();
		if (!(gdm_gdjcjl_jssj.equals("")))	wheresql+="  and (gdm_gdjcjl.jssj<=TO_DATE('"+gdm_gdjcjl_jssj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_jsr=request.getParameter("gdm_gdjcjl_jsr");
	if (gdm_gdjcjl_jsr!=null)
	{
		gdm_gdjcjl_jsr=cf.GB2Uni(gdm_gdjcjl_jsr);
		if (!(gdm_gdjcjl_jsr.equals("")))	wheresql+=" and  (gdm_gdjcjl.jsr='"+gdm_gdjcjl_jsr+"')";
	}
	gdm_gdjcjl_jhcfasj=request.getParameter("gdm_gdjcjl_jhcfasj");
	if (gdm_gdjcjl_jhcfasj!=null)
	{
		gdm_gdjcjl_jhcfasj=gdm_gdjcjl_jhcfasj.trim();
		if (!(gdm_gdjcjl_jhcfasj.equals("")))	wheresql+="  and (gdm_gdjcjl.jhcfasj>=TO_DATE('"+gdm_gdjcjl_jhcfasj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_jhcfasj=request.getParameter("gdm_gdjcjl_jhcfasj2");
	if (gdm_gdjcjl_jhcfasj!=null)
	{
		gdm_gdjcjl_jhcfasj=gdm_gdjcjl_jhcfasj.trim();
		if (!(gdm_gdjcjl_jhcfasj.equals("")))	wheresql+="  and (gdm_gdjcjl.jhcfasj<=TO_DATE('"+gdm_gdjcjl_jhcfasj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_cfajlh=request.getParameter("gdm_gdjcjl_cfajlh");
	if (gdm_gdjcjl_cfajlh!=null)
	{
		gdm_gdjcjl_cfajlh=cf.GB2Uni(gdm_gdjcjl_cfajlh);
		if (!(gdm_gdjcjl_cfajlh.equals("")))	wheresql+=" and  (gdm_gdjcjl.cfajlh='"+gdm_gdjcjl_cfajlh+"')";
	}
	gdm_gdjcjl_sjcfasj=request.getParameter("gdm_gdjcjl_sjcfasj");
	if (gdm_gdjcjl_sjcfasj!=null)
	{
		gdm_gdjcjl_sjcfasj=gdm_gdjcjl_sjcfasj.trim();
		if (!(gdm_gdjcjl_sjcfasj.equals("")))	wheresql+="  and (gdm_gdjcjl.sjcfasj>=TO_DATE('"+gdm_gdjcjl_sjcfasj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_sjcfasj=request.getParameter("gdm_gdjcjl_sjcfasj2");
	if (gdm_gdjcjl_sjcfasj!=null)
	{
		gdm_gdjcjl_sjcfasj=gdm_gdjcjl_sjcfasj.trim();
		if (!(gdm_gdjcjl_sjcfasj.equals("")))	wheresql+="  and (gdm_gdjcjl.sjcfasj<=TO_DATE('"+gdm_gdjcjl_sjcfasj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_sjcfar=request.getParameter("gdm_gdjcjl_sjcfar");
	if (gdm_gdjcjl_sjcfar!=null)
	{
		gdm_gdjcjl_sjcfar=cf.GB2Uni(gdm_gdjcjl_sjcfar);
		if (!(gdm_gdjcjl_sjcfar.equals("")))	wheresql+=" and  (gdm_gdjcjl.sjcfar='"+gdm_gdjcjl_sjcfar+"')";
	}
	gdm_gdjcjl_jhjjsj=request.getParameter("gdm_gdjcjl_jhjjsj");
	if (gdm_gdjcjl_jhjjsj!=null)
	{
		gdm_gdjcjl_jhjjsj=gdm_gdjcjl_jhjjsj.trim();
		if (!(gdm_gdjcjl_jhjjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.jhjjsj=TO_DATE('"+gdm_gdjcjl_jhjjsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_shbm=request.getParameter("gdm_gdjcjl_shbm");
	if (gdm_gdjcjl_shbm!=null)
	{
		gdm_gdjcjl_shbm=cf.GB2Uni(gdm_gdjcjl_shbm);
		if (!(gdm_gdjcjl_shbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.shbm='"+gdm_gdjcjl_shbm+"')";
	}
	gdm_gdjcjl_shr=request.getParameter("gdm_gdjcjl_shr");
	if (gdm_gdjcjl_shr!=null)
	{
		gdm_gdjcjl_shr=cf.GB2Uni(gdm_gdjcjl_shr);
		if (!(gdm_gdjcjl_shr.equals("")))	wheresql+=" and  (gdm_gdjcjl.shr='"+gdm_gdjcjl_shr+"')";
	}
	gdm_gdjcjl_shsj=request.getParameter("gdm_gdjcjl_shsj");
	if (gdm_gdjcjl_shsj!=null)
	{
		gdm_gdjcjl_shsj=gdm_gdjcjl_shsj.trim();
		if (!(gdm_gdjcjl_shsj.equals("")))	wheresql+="  and (gdm_gdjcjl.shsj>=TO_DATE('"+gdm_gdjcjl_shsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_shsj=request.getParameter("gdm_gdjcjl_shsj2");
	if (gdm_gdjcjl_shsj!=null)
	{
		gdm_gdjcjl_shsj=gdm_gdjcjl_shsj.trim();
		if (!(gdm_gdjcjl_shsj.equals("")))	wheresql+="  and (gdm_gdjcjl.shsj<=TO_DATE('"+gdm_gdjcjl_shsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_cljlh=request.getParameter("gdm_gdjcjl_cljlh");
	if (gdm_gdjcjl_cljlh!=null)
	{
		gdm_gdjcjl_cljlh=cf.GB2Uni(gdm_gdjcjl_cljlh);
		if (!(gdm_gdjcjl_cljlh.equals("")))	wheresql+=" and  (gdm_gdjcjl.cljlh='"+gdm_gdjcjl_cljlh+"')";
	}
	gdm_gdjcjl_clsj=request.getParameter("gdm_gdjcjl_clsj");
	if (gdm_gdjcjl_clsj!=null)
	{
		gdm_gdjcjl_clsj=gdm_gdjcjl_clsj.trim();
		if (!(gdm_gdjcjl_clsj.equals("")))	wheresql+="  and (gdm_gdjcjl.clsj>=TO_DATE('"+gdm_gdjcjl_clsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_clsj=request.getParameter("gdm_gdjcjl_clsj2");
	if (gdm_gdjcjl_clsj!=null)
	{
		gdm_gdjcjl_clsj=gdm_gdjcjl_clsj.trim();
		if (!(gdm_gdjcjl_clsj.equals("")))	wheresql+="  and (gdm_gdjcjl.clsj<=TO_DATE('"+gdm_gdjcjl_clsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_clr=request.getParameter("gdm_gdjcjl_clr");
	if (gdm_gdjcjl_clr!=null)
	{
		gdm_gdjcjl_clr=cf.GB2Uni(gdm_gdjcjl_clr);
		if (!(gdm_gdjcjl_clr.equals("")))	wheresql+=" and  (gdm_gdjcjl.clr='"+gdm_gdjcjl_clr+"')";
	}
	gdm_gdjcjl_clzt=request.getParameter("gdm_gdjcjl_clzt");
	if (gdm_gdjcjl_clzt!=null)
	{
		gdm_gdjcjl_clzt=cf.GB2Uni(gdm_gdjcjl_clzt);
		if (!(gdm_gdjcjl_clzt.equals("")))	wheresql+=" and  (gdm_gdjcjl.clzt='"+gdm_gdjcjl_clzt+"')";
	}
	gdm_gdjcjl_kpbz=request.getParameter("gdm_gdjcjl_kpbz");
	if (gdm_gdjcjl_kpbz!=null)
	{
		gdm_gdjcjl_kpbz=cf.GB2Uni(gdm_gdjcjl_kpbz);
		if (!(gdm_gdjcjl_kpbz.equals("")))	wheresql+=" and  (gdm_gdjcjl.kpbz='"+gdm_gdjcjl_kpbz+"')";
	}
	gdm_gdjcjl_kpjlh=request.getParameter("gdm_gdjcjl_kpjlh");
	if (gdm_gdjcjl_kpjlh!=null)
	{
		gdm_gdjcjl_kpjlh=gdm_gdjcjl_kpjlh.trim();
		if (!(gdm_gdjcjl_kpjlh.equals("")))	wheresql+=" and (gdm_gdjcjl.kpjlh="+gdm_gdjcjl_kpjlh+") ";
	}
	gdm_gdjcjl_jsbz=request.getParameter("gdm_gdjcjl_jsbz");
	if (gdm_gdjcjl_jsbz!=null)
	{
		gdm_gdjcjl_jsbz=cf.GB2Uni(gdm_gdjcjl_jsbz);
		if (!(gdm_gdjcjl_jsbz.equals("")))	wheresql+=" and  (gdm_gdjcjl.jsbz='"+gdm_gdjcjl_jsbz+"')";
	}
	gdm_gdjcjl_jsjlh=request.getParameter("gdm_gdjcjl_jsjlh");
	if (gdm_gdjcjl_jsjlh!=null)
	{
		gdm_gdjcjl_jsjlh=cf.GB2Uni(gdm_gdjcjl_jsjlh);
		if (!(gdm_gdjcjl_jsjlh.equals("")))	wheresql+=" and  (gdm_gdjcjl.jsjlh='"+gdm_gdjcjl_jsjlh+"')";
	}
	gdm_gdjcjl_lrr=request.getParameter("gdm_gdjcjl_lrr");
	if (gdm_gdjcjl_lrr!=null)
	{
		gdm_gdjcjl_lrr=cf.GB2Uni(gdm_gdjcjl_lrr);
		if (!(gdm_gdjcjl_lrr.equals("")))	wheresql+=" and  (gdm_gdjcjl.lrr='"+gdm_gdjcjl_lrr+"')";
	}
	gdm_gdjcjl_lrsj=request.getParameter("gdm_gdjcjl_lrsj");
	if (gdm_gdjcjl_lrsj!=null)
	{
		gdm_gdjcjl_lrsj=gdm_gdjcjl_lrsj.trim();
		if (!(gdm_gdjcjl_lrsj.equals("")))	wheresql+="  and (gdm_gdjcjl.lrsj>=TO_DATE('"+gdm_gdjcjl_lrsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_lrsj=request.getParameter("gdm_gdjcjl_lrsj2");
	if (gdm_gdjcjl_lrsj!=null)
	{
		gdm_gdjcjl_lrsj=gdm_gdjcjl_lrsj.trim();
		if (!(gdm_gdjcjl_lrsj.equals("")))	wheresql+="  and (gdm_gdjcjl.lrsj<=TO_DATE('"+gdm_gdjcjl_lrsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_lrdw=request.getParameter("gdm_gdjcjl_lrdw");
	if (gdm_gdjcjl_lrdw!=null)
	{
		gdm_gdjcjl_lrdw=cf.GB2Uni(gdm_gdjcjl_lrdw);
		if (!(gdm_gdjcjl_lrdw.equals("")))	wheresql+=" and  (gdm_gdjcjl.lrdw='"+gdm_gdjcjl_lrdw+"')";
	}
	ls_sql="SELECT gdm_gdjcjl.jcjlh,DECODE(gdm_gdjcjl.clzt,'1','δ����','2','�ѽ��յȴ�������','D','�ѽ��ղ��������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','B','�ڴ���'),DECODE(gdm_gdjcjl.cfspbz,'1','��������','2','δ����','3','����ͨ��','4','����δͨ��'), DECODE(gdm_gdjcjl.sffszg,'Y','����','N','δ����'),gdm_gdjcjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,crm_khxx.sjs,gdm_gdjcjl.xjr,gdm_gdjcjl.xjsj,xxlymc,jclxmc,jcjgmc,jcwtflmc,gdm_gdjcjl.kfzs,gdm_gdjcjl.fkze,gdm_gdjcjl.jlje,gdm_gdjcjl.spr,gdm_gdjcjl.spsj,gdm_gdjcjl.spyj,gdm_gdjcjl.yqjjsj,gdm_gdjcjl.dwbh,gdm_gdjcjl.zrr,gdm_gdjcjl.ygbh, DECODE(gdm_gdjcjl.sfxldcl,'Y','��Ҫδ����','N','����Ҫ','C','�Ѵ���'),gdm_gdjcjl.ldyqjjsj,gdm_gdjcjl.ldclyj,gdm_gdjcjl.ldclr,gdm_gdjcjl.ldclsj,gdm_gdjcjl.jssj,gdm_gdjcjl.jsr,gdm_gdjcjl.jssm,gdm_gdjcjl.jhcfasj,gdm_gdjcjl.cfajlh,gdm_gdjcjl.sjcfasj,gdm_gdjcjl.sjcfar,gdm_gdjcjl.jjfa,gdm_gdjcjl.jhjjsj,gdm_gdjcjl.shbm,gdm_gdjcjl.shr,gdm_gdjcjl.shsj,gdm_gdjcjl.shsm,gdm_gdjcjl.cljlh,gdm_gdjcjl.clsj,gdm_gdjcjl.clr,gdm_gdjcjl.clqk, DECODE(gdm_gdjcjl.kpbz,'N','δ����','Y','�ѿ���'),gdm_gdjcjl.kpjlh, DECODE(gdm_gdjcjl.jsbz,'N','δ����','Y','�ѽ���'),gdm_gdjcjl.jsjlh,gdm_gdjcjl.lrr,gdm_gdjcjl.lrsj,a.dwmc lrdw,gdm_gdjcjl.bz  ";
	ls_sql+=" FROM crm_khxx,gdm_gdjcjl,sq_sgd,sq_dwxx a,gdm_xxlybm,gdm_jclxbm,gdm_jcjgbm,gdm_jcwtflbm ";
    ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and gdm_gdjcjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and gdm_gdjcjl.lrdw=a.dwbh(+)";
    ls_sql+=" and gdm_gdjcjl.xxlybm=gdm_xxlybm.xxlybm(+)";
    ls_sql+=" and gdm_gdjcjl.jclxbm=gdm_jclxbm.jclxbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcjgbm=gdm_jcjgbm.jcjgbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcwtflbm=gdm_jcwtflbm.jcwtflbm(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Gdm_gdjcjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jcjlh","gdm_gdjcjl_khbh","gdm_gdjcjl_sgd","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_sjs","gdm_gdjcjl_xjr","gdm_gdjcjl_xjsj","gdm_gdjcjl_xxlybm","gdm_gdjcjl_jclxbm","gdm_gdjcjl_jcjgbm","gdm_gdjcjl_jcwtflbm","gdm_gdjcjl_kfzs","gdm_gdjcjl_fkze","gdm_gdjcjl_jlje","gdm_gdjcjl_cfspbz","gdm_gdjcjl_spr","gdm_gdjcjl_spsj","gdm_gdjcjl_spyj","gdm_gdjcjl_sffszg","gdm_gdjcjl_yqjjsj","gdm_gdjcjl_dwbh","gdm_gdjcjl_zrr","gdm_gdjcjl_ygbh","gdm_gdjcjl_sfxldcl","gdm_gdjcjl_ldyqjjsj","gdm_gdjcjl_ldclyj","gdm_gdjcjl_ldclr","gdm_gdjcjl_ldclsj","gdm_gdjcjl_jssj","gdm_gdjcjl_jsr","gdm_gdjcjl_jssm","gdm_gdjcjl_jhcfasj","gdm_gdjcjl_cfajlh","gdm_gdjcjl_sjcfasj","gdm_gdjcjl_sjcfar","gdm_gdjcjl_jjfa","gdm_gdjcjl_jhjjsj","gdm_gdjcjl_shbm","gdm_gdjcjl_shr","gdm_gdjcjl_shsj","gdm_gdjcjl_shsm","gdm_gdjcjl_cljlh","gdm_gdjcjl_clsj","gdm_gdjcjl_clr","gdm_gdjcjl_clqk","gdm_gdjcjl_clzt","gdm_gdjcjl_kpbz","gdm_gdjcjl_kpjlh","gdm_gdjcjl_jsbz","gdm_gdjcjl_jsjlh","gdm_gdjcjl_lrr","gdm_gdjcjl_lrsj","gdm_gdjcjl_lrdw","gdm_gdjcjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jcjlh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link=" /khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">���ؼ���¼����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(700);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">����¼��</td>
	<td  width="1%">����״̬</td>
	<td  width="1%">����������־</td>
	<td  width="1%">�Ƿ�������</td>
	<td  width="1%">�ͻ����</td>
	<td  width="1%">�ͻ�����</td>
	<td  width="3%">���ݵ�ַ</td>
	<td  width="1%">ʩ����</td>
	<td  width="1%">���ʦ</td>
	<td  width="1%">�����</td>
	<td  width="2%">���ʱ��</td>
	<td  width="1%">��Ϣ��Դ</td>
	<td  width="1%">�������</td>
	<td  width="1%">�����</td>
	<td  width="1%">�������</td>
	<td  width="1%">�۷�����</td>
	<td  width="1%">�����ܶ�</td>
	<td  width="1%">�������</td>

	<td  width="1%">����������</td>
	<td  width="2%">��������ʱ��</td>
	<td  width="4%">�����������</td>

	<td  width="2%">�ͻ�Ҫ����ʱ��</td>
	<td  width="1%">���β���</td>
	<td  width="1%">������</td>
	<td  width="1%">�����˱��</td>
	<td  width="1%">�Ƿ����쵼����</td>
	<td  width="2%">�쵼Ҫ����ʱ��</td>
	<td  width="6%">�쵼�������</td>
	<td  width="1%">�쵼������</td>
	<td  width="2%">�쵼����ʱ��</td>
	<td  width="2%">����ʱ��</td>
	<td  width="1%">������</td>
	<td  width="6%">����˵��</td>
	<td  width="2%">�ƻ�������ʱ��</td>
	<td  width="1%">��������¼��</td>
	<td  width="2%">ʵ�ʳ�����ʱ��</td>
	<td  width="1%">ʵ�ʳ�������</td>
	<td  width="6%">�������</td>
	<td  width="2%">�ƻ����ʱ��</td>
	<td  width="2%">������˲���</td>
	<td  width="1%">���������</td>
	<td  width="2%">�������ʱ��</td>
	<td  width="4%">�������˵��</td>
	<td  width="1%">�����¼��</td>
	<td  width="2%">���´���ʱ��</td>
	<td  width="1%">���´�����</td>
	<td  width="6%">���´������</td>
	<td  width="1%">������־</td>
	<td  width="1%">������¼��</td>
	<td  width="1%">�����־</td>
	<td  width="1%">�����¼��</td>
	<td  width="1%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="2%">¼�뵥λ</td>
	<td  width="81%">��ע</td>
</tr>
<%
	pageObj.displayDate();
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