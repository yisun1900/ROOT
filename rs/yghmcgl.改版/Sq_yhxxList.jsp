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
	String sq_yhxx_ygbh=null;
	String sq_yhxx_yhmc=null;
	String sq_yhxx_bianhao=null;
	String sq_yhxx_yhdlm=null;
	String sq_yhxx_yhjs=null;
	String sq_yhxx_dwbh=null;
	String sq_yhxx_sjsbh=null;
	String sq_yhxx_xb=null;
	String sq_yhxx_csrq=null;
	String sq_yhxx_hf=null;
	String sq_yhxx_mz=null;
	String sq_yhxx_sfzh=null;
	String sq_yhxx_hjszd=null;
	String sq_yhxx_dacfd=null;
	String sq_yhxx_byyx=null;
	String sq_yhxx_zy=null;
	String sq_yhxx_xlbm=null;
	String sq_yhxx_dh=null;
	String sq_yhxx_email=null;
	String sq_yhxx_zz=null;
	String sq_yhxx_xzzwbm=null;
	String sfzszg=null;
	String sq_yhxx_rzsj=null;
	String sq_yhxx_lzrq=null;
	String sq_yhxx_sfqs=null;
	String sq_yhxx_ylbx=null;
	String sq_yhxx_jylbx=null;
	String sq_yhxx_sybx=null;
	String sq_yhxx_gsby=null;
	String sq_yhxx_shbxh=null;
	String sq_yhxx_jbxdd=null;
	String sq_yhxx_jjlxr=null;
	String sq_yhxx_lxrdh=null;
	String sq_yhxx_zkl=null;
	String sq_yhxx_ckjgbz=null;
	String sq_yhxx_zdyhbz=null;
	String sq_yhxx_kdlxtbz=null;
	String sq_yhxx_bjjb=null;
	String sq_yhxx_glgz=null;
	String sq_yhxx_gwgz=null;
	String sq_yhxx_jbgz=null;
	String sq_yhxx_sjsjb=null;
	String sq_yhxx_yjsxe=null;
	String sq_yhxx_jtbt=null;
	String sq_yhxx_cb=null;
	String sq_yhxx_dhbt=null;
	String sq_yhxx_sfydbs=null;
	String sq_yhxx_sfytj=null;
	String sq_yhxx_tjrq=null;
	String sq_yhxx_cjgzsj=null;
	String sq_yhxx_syx=null;


	String syjzrq=null;
	syjzrq=request.getParameter("syjzrq");
	if (syjzrq!=null)
	{
		syjzrq=syjzrq.trim();
		if (!(syjzrq.equals("")))	wheresql+="  and (sq_yhxx.syjzrq>=TO_DATE('"+syjzrq+"','YYYY/MM/DD'))";
	}
	syjzrq=request.getParameter("syjzrq2");
	if (syjzrq!=null)
	{
		syjzrq=syjzrq.trim();
		if (!(syjzrq.equals("")))	wheresql+="  and (sq_yhxx.syjzrq<=TO_DATE('"+syjzrq+"','YYYY/MM/DD'))";
	}
	
	String sfcjbx=null;
	sfcjbx=request.getParameter("sfcjbx");
	if (sfcjbx!=null)
	{
		if (!(sfcjbx.equals("")))	wheresql+=" and  (sq_yhxx.sfcjbx='"+sfcjbx+"')";
	}
	String sbblsj=null;
	sbblsj=request.getParameter("sbblsj");
	if (sbblsj!=null)
	{
		sbblsj=sbblsj.trim();
		if (!(sbblsj.equals("")))	wheresql+="  and (sq_yhxx.sbblsj>=TO_DATE('"+sbblsj+"','YYYY/MM/DD'))";
	}
	sbblsj=request.getParameter("sbblsj2");
	if (sbblsj!=null)
	{
		sbblsj=sbblsj.trim();
		if (!(sbblsj.equals("")))	wheresql+="  and (sq_yhxx.sbblsj<=TO_DATE('"+sbblsj+"','YYYY/MM/DD'))";
	}

	
	String ldhtbh=null;
	ldhtbh=request.getParameter("ldhtbh");
	if (ldhtbh!=null)
	{
		if (!(ldhtbh.equals("")))	wheresql+=" and  (sq_yhxx.ldhtbh='"+ldhtbh+"')";
	}
	String ldhtlx=null;
	ldhtlx=request.getParameter("ldhtlx");
	if (ldhtlx!=null)
	{
		ldhtlx=cf.GB2Uni(ldhtlx);
		if (!(ldhtlx.equals("")))	wheresql+=" and  (sq_yhxx.ldhtlx='"+ldhtlx+"')";
	}
	String ldhtqx=null;
	ldhtqx=request.getParameter("ldhtqx");
	if (ldhtqx!=null)
	{
		ldhtqx=cf.GB2Uni(ldhtqx);
		if (!(ldhtqx.equals("")))	wheresql+=" and  (sq_yhxx.ldhtqx='"+ldhtqx+"')";
	}
	String htksrq=null;
	htksrq=request.getParameter("htksrq");
	if (htksrq!=null)
	{
		htksrq=htksrq.trim();
		if (!(htksrq.equals("")))	wheresql+="  and (sq_yhxx.htksrq>=TO_DATE('"+htksrq+"','YYYY/MM/DD'))";
	}
	htksrq=request.getParameter("htksrq2");
	if (htksrq!=null)
	{
		htksrq=htksrq.trim();
		if (!(htksrq.equals("")))	wheresql+="  and (sq_yhxx.htksrq<=TO_DATE('"+htksrq+"','YYYY/MM/DD'))";
	}
	String htdqrq=null;
	htdqrq=request.getParameter("htdqrq");
	if (htdqrq!=null)
	{
		htdqrq=htdqrq.trim();
		if (!(htdqrq.equals("")))	wheresql+="  and (sq_yhxx.htdqrq>=TO_DATE('"+htdqrq+"','YYYY/MM/DD'))";
	}
	htdqrq=request.getParameter("htdqrq2");
	if (htdqrq!=null)
	{
		htdqrq=htdqrq.trim();
		if (!(htdqrq.equals("")))	wheresql+="  and (sq_yhxx.htdqrq<=TO_DATE('"+htdqrq+"','YYYY/MM/DD'))";
	}

	String sflz=null;
	sflz=request.getParameter("sflz");
	if (sflz!=null)
	{
		sflz=cf.GB2Uni(sflz);
		if (sflz.equals("1"))
		{
			wheresql+=" and sq_yhxx.sfzszg in('Y','N')";
		}
		else if (sflz.equals("2"))
		{
			wheresql+=" and sq_yhxx.sfzszg in('S','T')";
		}
		else if (sflz.equals("3"))
		{
			wheresql+=" and sq_yhxx.sfzszg in('M','D')";
		}
	}

	String zwflbm=null;
	zwflbm=request.getParameter("zwflbm");
	if (zwflbm!=null)
	{
		if (!(zwflbm.equals("")))	wheresql+=" and  (dm_xzzwbm.zwflbm='"+zwflbm+"')";
	}

	String dhsfgb=null;
	dhsfgb=request.getParameter("dhsfgb");
	if (dhsfgb!=null)
	{
		if (!(dhsfgb.equals("")))	wheresql+=" and  (sq_yhxx.dhsfgb='"+dhsfgb+"')";
	}

	String zwbm=null;
	zwbm=request.getParameter("zwbm");
	if (zwbm!=null)
	{
		zwbm=cf.GB2Uni(zwbm);
		if (!(zwbm.equals("")))	wheresql+=" and  (sq_yhxx.zwbm='"+zwbm+"')";
	}

	String kfgssq=null;
	kfgssq=request.getParameter("kfgssq");
	if (kfgssq!=null)
	{
		kfgssq=cf.GB2Uni(kfgssq);
		if (!(kfgssq.equals("")))	wheresql+=" and  (sq_yhxx.kfgssq='"+kfgssq+"')";
	}

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (sq_yhxx.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (sq_yhxx.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	String gzlb=null;
	gzlb=request.getParameter("gzlb");
	if (gzlb!=null)
	{
		if (!(gzlb.equals("")))	wheresql+=" and  (sq_yhxx.gzlb='"+gzlb+"')";
	}

	String kqhm=null;
	kqhm=request.getParameter("kqhm");
	if (kqhm!=null)
	{
		if (!(kqhm.equals("")))	wheresql+=" and  (sq_yhxx.kqhm='"+kqhm+"')";
	}

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";

	sq_yhxx_ygbh=request.getParameter("sq_yhxx_ygbh");
	if (sq_yhxx_ygbh!=null)
	{
		sq_yhxx_ygbh=sq_yhxx_ygbh.trim();
		if (!(sq_yhxx_ygbh.equals("")))	wheresql+=" and (sq_yhxx.ygbh="+sq_yhxx_ygbh+") ";
	}
	sq_yhxx_yhmc=request.getParameter("sq_yhxx_yhmc");
	if (sq_yhxx_yhmc!=null)
	{
		sq_yhxx_yhmc=cf.GB2Uni(sq_yhxx_yhmc);
		if (!(sq_yhxx_yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+sq_yhxx_yhmc+"%')";
	}
	sq_yhxx_bianhao=request.getParameter("sq_yhxx_bianhao");
	if (sq_yhxx_bianhao!=null)
	{
		sq_yhxx_bianhao=cf.GB2Uni(sq_yhxx_bianhao);
		if (!(sq_yhxx_bianhao.equals("")))	wheresql+=" and  (sq_yhxx.bianhao='"+sq_yhxx_bianhao+"')";
	}
	sq_yhxx_yhdlm=request.getParameter("sq_yhxx_yhdlm");
	if (sq_yhxx_yhdlm!=null)
	{
		sq_yhxx_yhdlm=cf.GB2Uni(sq_yhxx_yhdlm);
		if (!(sq_yhxx_yhdlm.equals("")))	wheresql+=" and  (sq_yhxx.yhdlm='"+sq_yhxx_yhdlm+"')";
	}
	sq_yhxx_yhjs=request.getParameter("sq_yhxx_yhjs");
	if (sq_yhxx_yhjs!=null)
	{
		sq_yhxx_yhjs=cf.GB2Uni(sq_yhxx_yhjs);
		if (!(sq_yhxx_yhjs.equals("")))	wheresql+=" and  (sq_yhxx.yhjs='"+sq_yhxx_yhjs+"')";
	}
	sq_yhxx_dwbh=request.getParameter("sq_yhxx_dwbh");
	if (sq_yhxx_dwbh!=null)
	{
		sq_yhxx_dwbh=cf.GB2Uni(sq_yhxx_dwbh);
		if (!(sq_yhxx_dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+sq_yhxx_dwbh+"')";
	}
	sq_yhxx_sjsbh=request.getParameter("sq_yhxx_sjsbh");
	if (sq_yhxx_sjsbh!=null)
	{
		sq_yhxx_sjsbh=cf.GB2Uni(sq_yhxx_sjsbh);
		if (!(sq_yhxx_sjsbh.equals("")))	wheresql+=" and  (sq_yhxx.sjsbh='"+sq_yhxx_sjsbh+"')";
	}
	sq_yhxx_xb=request.getParameter("sq_yhxx_xb");
	if (sq_yhxx_xb!=null)
	{
		sq_yhxx_xb=cf.GB2Uni(sq_yhxx_xb);
		if (!(sq_yhxx_xb.equals("")))	wheresql+=" and  (sq_yhxx.xb='"+sq_yhxx_xb+"')";
	}
	sq_yhxx_csrq=request.getParameter("sq_yhxx_csrq");
	if (sq_yhxx_csrq!=null)
	{
		sq_yhxx_csrq=sq_yhxx_csrq.trim();
		if (!(sq_yhxx_csrq.equals("")))	wheresql+="  and (sq_yhxx.csrq>=TO_DATE('"+sq_yhxx_csrq+"','YYYY/MM/DD'))";
	}
	sq_yhxx_csrq=request.getParameter("sq_yhxx_csrq2");
	if (sq_yhxx_csrq!=null)
	{
		sq_yhxx_csrq=sq_yhxx_csrq.trim();
		if (!(sq_yhxx_csrq.equals("")))	wheresql+="  and (sq_yhxx.csrq<=TO_DATE('"+sq_yhxx_csrq+"','YYYY/MM/DD'))";
	}
	sq_yhxx_hf=request.getParameter("sq_yhxx_hf");
	if (sq_yhxx_hf!=null)
	{
		sq_yhxx_hf=cf.GB2Uni(sq_yhxx_hf);
		if (!(sq_yhxx_hf.equals("")))	wheresql+=" and  (sq_yhxx.hf='"+sq_yhxx_hf+"')";
	}
	sq_yhxx_mz=request.getParameter("sq_yhxx_mz");
	if (sq_yhxx_mz!=null)
	{
		sq_yhxx_mz=cf.GB2Uni(sq_yhxx_mz);
		if (!(sq_yhxx_mz.equals("")))	wheresql+=" and  (sq_yhxx.mz='"+sq_yhxx_mz+"')";
	}
	sq_yhxx_sfzh=request.getParameter("sq_yhxx_sfzh");
	if (sq_yhxx_sfzh!=null)
	{
		sq_yhxx_sfzh=cf.GB2Uni(sq_yhxx_sfzh);
		if (!(sq_yhxx_sfzh.equals("")))	wheresql+=" and  (sq_yhxx.sfzh='"+sq_yhxx_sfzh+"')";
	}
	sq_yhxx_hjszd=request.getParameter("sq_yhxx_hjszd");
	if (sq_yhxx_hjszd!=null)
	{
		sq_yhxx_hjszd=cf.GB2Uni(sq_yhxx_hjszd);
		if (!(sq_yhxx_hjszd.equals("")))	wheresql+=" and  (sq_yhxx.hjszd like '%"+sq_yhxx_hjszd+"%')";
	}
	sq_yhxx_dacfd=request.getParameter("sq_yhxx_dacfd");
	if (sq_yhxx_dacfd!=null)
	{
		sq_yhxx_dacfd=cf.GB2Uni(sq_yhxx_dacfd);
		if (!(sq_yhxx_dacfd.equals("")))	wheresql+=" and  (sq_yhxx.dacfd like '%"+sq_yhxx_dacfd+"%')";
	}
	sq_yhxx_byyx=request.getParameter("sq_yhxx_byyx");
	if (sq_yhxx_byyx!=null)
	{
		sq_yhxx_byyx=cf.GB2Uni(sq_yhxx_byyx);
		if (!(sq_yhxx_byyx.equals("")))	wheresql+=" and  (sq_yhxx.byyx like '%"+sq_yhxx_byyx+"%')";
	}
	sq_yhxx_zy=request.getParameter("sq_yhxx_zy");
	if (sq_yhxx_zy!=null)
	{
		sq_yhxx_zy=cf.GB2Uni(sq_yhxx_zy);
		if (!(sq_yhxx_zy.equals("")))	wheresql+=" and  (sq_yhxx.zy like '%"+sq_yhxx_zy+"%')";
	}
	sq_yhxx_xlbm=request.getParameter("sq_yhxx_xlbm");
	if (sq_yhxx_xlbm!=null)
	{
		sq_yhxx_xlbm=cf.GB2Uni(sq_yhxx_xlbm);
		if (!(sq_yhxx_xlbm.equals("")))	wheresql+=" and  (sq_yhxx.xlbm='"+sq_yhxx_xlbm+"')";
	}
	sq_yhxx_dh=request.getParameter("sq_yhxx_dh");
	if (sq_yhxx_dh!=null)
	{
		sq_yhxx_dh=cf.GB2Uni(sq_yhxx_dh);
		if (!(sq_yhxx_dh.equals("")))	wheresql+=" and  (sq_yhxx.dh='"+sq_yhxx_dh+"')";
	}
	sq_yhxx_email=request.getParameter("sq_yhxx_email");
	if (sq_yhxx_email!=null)
	{
		sq_yhxx_email=cf.GB2Uni(sq_yhxx_email);
		if (!(sq_yhxx_email.equals("")))	wheresql+=" and  (sq_yhxx.email='"+sq_yhxx_email+"')";
	}
	sq_yhxx_zz=request.getParameter("sq_yhxx_zz");
	if (sq_yhxx_zz!=null)
	{
		sq_yhxx_zz=cf.GB2Uni(sq_yhxx_zz);
		if (!(sq_yhxx_zz.equals("")))	wheresql+=" and  (sq_yhxx.zz like '%"+sq_yhxx_zz+"%')";
	}
	sq_yhxx_xzzwbm=request.getParameter("sq_yhxx_xzzwbm");
	if (sq_yhxx_xzzwbm!=null)
	{
		sq_yhxx_xzzwbm=cf.GB2Uni(sq_yhxx_xzzwbm);
		if (!(sq_yhxx_xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+sq_yhxx_xzzwbm+"')";
	}
	sfzszg=request.getParameter("sfzszg");
	if (sfzszg!=null)
	{
		sfzszg=cf.GB2Uni(sfzszg);
		if (!(sfzszg.equals("")))	wheresql+=" and  (sq_yhxx.sfzszg='"+sfzszg+"')";
	}
	sq_yhxx_rzsj=request.getParameter("sq_yhxx_rzsj");
	if (sq_yhxx_rzsj!=null)
	{
		sq_yhxx_rzsj=sq_yhxx_rzsj.trim();
		if (!(sq_yhxx_rzsj.equals("")))	wheresql+="  and (sq_yhxx.rzsj>=TO_DATE('"+sq_yhxx_rzsj+"','YYYY/MM/DD'))";
	}
	sq_yhxx_rzsj=request.getParameter("sq_yhxx_rzsj2");
	if (sq_yhxx_rzsj!=null)
	{
		sq_yhxx_rzsj=sq_yhxx_rzsj.trim();
		if (!(sq_yhxx_rzsj.equals("")))	wheresql+="  and (sq_yhxx.rzsj<=TO_DATE('"+sq_yhxx_rzsj+"','YYYY/MM/DD'))";
	}

	sq_yhxx_lzrq=request.getParameter("sq_yhxx_lzrq");
	if (sq_yhxx_lzrq!=null)
	{
		sq_yhxx_lzrq=sq_yhxx_lzrq.trim();
		if (!(sq_yhxx_lzrq.equals("")))	wheresql+="  and (sq_yhxx.lzrq>=TO_DATE('"+sq_yhxx_lzrq+"','YYYY/MM/DD'))";
	}
	sq_yhxx_lzrq=request.getParameter("sq_yhxx_lzrq2");
	if (sq_yhxx_lzrq!=null)
	{
		sq_yhxx_lzrq=sq_yhxx_lzrq.trim();
		if (!(sq_yhxx_lzrq.equals("")))	wheresql+="  and (sq_yhxx.lzrq<=TO_DATE('"+sq_yhxx_lzrq+"','YYYY/MM/DD'))";
	}
	sq_yhxx_sfqs=request.getParameter("sq_yhxx_sfqs");
	if (sq_yhxx_sfqs!=null)
	{
		sq_yhxx_sfqs=cf.GB2Uni(sq_yhxx_sfqs);
		if (!(sq_yhxx_sfqs.equals("")))	wheresql+=" and  (sq_yhxx.sfqs='"+sq_yhxx_sfqs+"')";
	}
	sq_yhxx_ylbx=request.getParameter("sq_yhxx_ylbx");
	if (sq_yhxx_ylbx!=null)
	{
		sq_yhxx_ylbx=cf.GB2Uni(sq_yhxx_ylbx);
		if (!(sq_yhxx_ylbx.equals("")))	wheresql+=" and  (sq_yhxx.ylbx='"+sq_yhxx_ylbx+"')";
	}
	sq_yhxx_jylbx=request.getParameter("sq_yhxx_jylbx");
	if (sq_yhxx_jylbx!=null)
	{
		sq_yhxx_jylbx=cf.GB2Uni(sq_yhxx_jylbx);
		if (!(sq_yhxx_jylbx.equals("")))	wheresql+=" and  (sq_yhxx.jylbx='"+sq_yhxx_jylbx+"')";
	}
	sq_yhxx_sybx=request.getParameter("sq_yhxx_sybx");
	if (sq_yhxx_sybx!=null)
	{
		sq_yhxx_sybx=cf.GB2Uni(sq_yhxx_sybx);
		if (!(sq_yhxx_sybx.equals("")))	wheresql+=" and  (sq_yhxx.sybx='"+sq_yhxx_sybx+"')";
	}
	sq_yhxx_gsby=request.getParameter("sq_yhxx_gsby");
	if (sq_yhxx_gsby!=null)
	{
		sq_yhxx_gsby=cf.GB2Uni(sq_yhxx_gsby);
		if (!(sq_yhxx_gsby.equals("")))	wheresql+=" and  (sq_yhxx.gsby='"+sq_yhxx_gsby+"')";
	}
	sq_yhxx_shbxh=request.getParameter("sq_yhxx_shbxh");
	if (sq_yhxx_shbxh!=null)
	{
		sq_yhxx_shbxh=cf.GB2Uni(sq_yhxx_shbxh);
		if (!(sq_yhxx_shbxh.equals("")))	wheresql+=" and  (sq_yhxx.shbxh='"+sq_yhxx_shbxh+"')";
	}
	sq_yhxx_jbxdd=request.getParameter("sq_yhxx_jbxdd");
	if (sq_yhxx_jbxdd!=null)
	{
		sq_yhxx_jbxdd=cf.GB2Uni(sq_yhxx_jbxdd);
		if (!(sq_yhxx_jbxdd.equals("")))	wheresql+=" and  (sq_yhxx.jbxdd like '%"+sq_yhxx_jbxdd+"%')";
	}
	sq_yhxx_jjlxr=request.getParameter("sq_yhxx_jjlxr");
	if (sq_yhxx_jjlxr!=null)
	{
		sq_yhxx_jjlxr=cf.GB2Uni(sq_yhxx_jjlxr);
		if (!(sq_yhxx_jjlxr.equals("")))	wheresql+=" and  (sq_yhxx.jjlxr='"+sq_yhxx_jjlxr+"')";
	}
	sq_yhxx_lxrdh=request.getParameter("sq_yhxx_lxrdh");
	if (sq_yhxx_lxrdh!=null)
	{
		sq_yhxx_lxrdh=cf.GB2Uni(sq_yhxx_lxrdh);
		if (!(sq_yhxx_lxrdh.equals("")))	wheresql+=" and  (sq_yhxx.lxrdh='"+sq_yhxx_lxrdh+"')";
	}
	sq_yhxx_zkl=request.getParameter("sq_yhxx_zkl");
	if (sq_yhxx_zkl!=null)
	{
		sq_yhxx_zkl=sq_yhxx_zkl.trim();
		if (!(sq_yhxx_zkl.equals("")))	wheresql+=" and  (sq_yhxx.zkl="+sq_yhxx_zkl+") ";
	}
	sq_yhxx_ckjgbz=request.getParameter("sq_yhxx_ckjgbz");
	if (sq_yhxx_ckjgbz!=null)
	{
		sq_yhxx_ckjgbz=cf.GB2Uni(sq_yhxx_ckjgbz);
		if (!(sq_yhxx_ckjgbz.equals("")))	wheresql+=" and  (sq_yhxx.ckjgbz='"+sq_yhxx_ckjgbz+"')";
	}
	sq_yhxx_zdyhbz=request.getParameter("sq_yhxx_zdyhbz");
	if (sq_yhxx_zdyhbz!=null)
	{
		sq_yhxx_zdyhbz=cf.GB2Uni(sq_yhxx_zdyhbz);
		if (!(sq_yhxx_zdyhbz.equals("")))	wheresql+=" and  (sq_yhxx.zdyhbz='"+sq_yhxx_zdyhbz+"')";
	}
	sq_yhxx_kdlxtbz=request.getParameter("sq_yhxx_kdlxtbz");
	if (sq_yhxx_kdlxtbz!=null)
	{
		sq_yhxx_kdlxtbz=cf.GB2Uni(sq_yhxx_kdlxtbz);
		if (!(sq_yhxx_kdlxtbz.equals("")))	wheresql+=" and  (sq_yhxx.kdlxtbz='"+sq_yhxx_kdlxtbz+"')";
	}
	sq_yhxx_bjjb=request.getParameter("sq_yhxx_bjjb");
	if (sq_yhxx_bjjb!=null)
	{
		sq_yhxx_bjjb=cf.GB2Uni(sq_yhxx_bjjb);
		if (!(sq_yhxx_bjjb.equals("")))	wheresql+=" and  (sq_yhxx.bjjb='"+sq_yhxx_bjjb+"')";
	}
	sq_yhxx_glgz=request.getParameter("sq_yhxx_glgz");
	if (sq_yhxx_glgz!=null)
	{
		sq_yhxx_glgz=sq_yhxx_glgz.trim();
		if (!(sq_yhxx_glgz.equals("")))	wheresql+=" and  (sq_yhxx.glgz="+sq_yhxx_glgz+") ";
	}
	sq_yhxx_gwgz=request.getParameter("sq_yhxx_gwgz");
	if (sq_yhxx_gwgz!=null)
	{
		sq_yhxx_gwgz=sq_yhxx_gwgz.trim();
		if (!(sq_yhxx_gwgz.equals("")))	wheresql+=" and  (sq_yhxx.gwgz="+sq_yhxx_gwgz+") ";
	}
	sq_yhxx_jbgz=request.getParameter("sq_yhxx_jbgz");
	if (sq_yhxx_jbgz!=null)
	{
		sq_yhxx_jbgz=sq_yhxx_jbgz.trim();
		if (!(sq_yhxx_jbgz.equals("")))	wheresql+=" and  (sq_yhxx.jbgz="+sq_yhxx_jbgz+") ";
	}
	sq_yhxx_sjsjb=request.getParameter("sq_yhxx_sjsjb");
	if (sq_yhxx_sjsjb!=null)
	{
		sq_yhxx_sjsjb=cf.GB2Uni(sq_yhxx_sjsjb);
		if (!(sq_yhxx_sjsjb.equals("")))	wheresql+=" and  (sq_yhxx.sjsjb='"+sq_yhxx_sjsjb+"')";
	}
	sq_yhxx_yjsxe=request.getParameter("sq_yhxx_yjsxe");
	if (sq_yhxx_yjsxe!=null)
	{
		sq_yhxx_yjsxe=sq_yhxx_yjsxe.trim();
		if (!(sq_yhxx_yjsxe.equals("")))	wheresql+=" and  (sq_yhxx.yjsxe="+sq_yhxx_yjsxe+") ";
	}
	sq_yhxx_jtbt=request.getParameter("sq_yhxx_jtbt");
	if (sq_yhxx_jtbt!=null)
	{
		sq_yhxx_jtbt=sq_yhxx_jtbt.trim();
		if (!(sq_yhxx_jtbt.equals("")))	wheresql+=" and  (sq_yhxx.jtbt="+sq_yhxx_jtbt+") ";
	}
	sq_yhxx_cb=request.getParameter("sq_yhxx_cb");
	if (sq_yhxx_cb!=null)
	{
		sq_yhxx_cb=sq_yhxx_cb.trim();
		if (!(sq_yhxx_cb.equals("")))	wheresql+=" and  (sq_yhxx.cb="+sq_yhxx_cb+") ";
	}
	sq_yhxx_dhbt=request.getParameter("sq_yhxx_dhbt");
	if (sq_yhxx_dhbt!=null)
	{
		sq_yhxx_dhbt=sq_yhxx_dhbt.trim();
		if (!(sq_yhxx_dhbt.equals("")))	wheresql+=" and  (sq_yhxx.dhbt="+sq_yhxx_dhbt+") ";
	}
	sq_yhxx_sfydbs=request.getParameter("sq_yhxx_sfydbs");
	if (sq_yhxx_sfydbs!=null)
	{
		sq_yhxx_sfydbs=cf.GB2Uni(sq_yhxx_sfydbs);
		if (!(sq_yhxx_sfydbs.equals("")))	wheresql+=" and  (sq_yhxx.sfydbs='"+sq_yhxx_sfydbs+"')";
	}
	sq_yhxx_sfytj=request.getParameter("sq_yhxx_sfytj");
	if (sq_yhxx_sfytj!=null)
	{
		sq_yhxx_sfytj=cf.GB2Uni(sq_yhxx_sfytj);
		if (!(sq_yhxx_sfytj.equals("")))	wheresql+=" and  (sq_yhxx.sfytj='"+sq_yhxx_sfytj+"')";
	}
	sq_yhxx_tjrq=request.getParameter("sq_yhxx_tjrq");
	if (sq_yhxx_tjrq!=null)
	{
		sq_yhxx_tjrq=sq_yhxx_tjrq.trim();
		if (!(sq_yhxx_tjrq.equals("")))	wheresql+="  and (sq_yhxx.tjrq>=TO_DATE('"+sq_yhxx_tjrq+"','YYYY/MM/DD'))";
	}
	sq_yhxx_tjrq=request.getParameter("sq_yhxx_tjrq2");
	if (sq_yhxx_tjrq!=null)
	{
		sq_yhxx_tjrq=sq_yhxx_tjrq.trim();
		if (!(sq_yhxx_tjrq.equals("")))	wheresql+="  and (sq_yhxx.tjrq<=TO_DATE('"+sq_yhxx_tjrq+"','YYYY/MM/DD'))";
	}
	sq_yhxx_cjgzsj=request.getParameter("sq_yhxx_cjgzsj");
	if (sq_yhxx_cjgzsj!=null)
	{
		sq_yhxx_cjgzsj=sq_yhxx_cjgzsj.trim();
		if (!(sq_yhxx_cjgzsj.equals("")))	wheresql+="  and (sq_yhxx.cjgzsj>=TO_DATE('"+sq_yhxx_cjgzsj+"','YYYY/MM/DD'))";
	}
	sq_yhxx_cjgzsj=request.getParameter("sq_yhxx_cjgzsj2");
	if (sq_yhxx_cjgzsj!=null)
	{
		sq_yhxx_cjgzsj=sq_yhxx_cjgzsj.trim();
		if (!(sq_yhxx_cjgzsj.equals("")))	wheresql+="  and (sq_yhxx.cjgzsj<=TO_DATE('"+sq_yhxx_cjgzsj+"','YYYY/MM/DD'))";
	}
	sq_yhxx_syx=request.getParameter("sq_yhxx_syx");
	if (sq_yhxx_syx!=null)
	{
		sq_yhxx_syx=cf.GB2Uni(sq_yhxx_syx);
		if (!(sq_yhxx_syx.equals("")))	wheresql+=" and  (sq_yhxx.syx='"+sq_yhxx_syx+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String jgpx4=cf.GB2Uni(request.getParameter("jgpx4"));
	String jgpx5=cf.GB2Uni(request.getParameter("jgpx5"));
	String jgpx6=cf.GB2Uni(request.getParameter("jgpx6"));
	String ordersql=" order by sq_yhxx.ssfgs,"+jgpx1;
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


	ls_sql="SELECT b.dwmc fgs,a.dwmc bm,xzzwbm,sq_yhxx.xuhao,DECODE(sq_yhxx.sfzszg,'M','<font color=\"#009999\">ʵϰ��</font>','Y','ת��','N','<font color=\"#0000CC\">������</font>','D','<font color=\"#CCCC00\">����</font>','S','<font color=\"#CC0000\">��ְ</font>','T','<font color=\"#CC00CC\">����</font>'),sq_yhxx.yhmc,dm_zwbm.zwmc,DECODE(sq_yhxx.kfgssq,'0','����Ȩ','1','��Ȩ�����ֹ�˾','2','��Ȩ����ֹ�˾','3','��Ȩ��������','4','��Ȩĳһ�ֹ�˾�������','5','��Ȩ����ֹ�˾�������') kfgssq,sq_yhxx.bianhao,sq_yhxx.ygbh, DECODE(sq_yhxx.yhjs,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','�ֹ�˾����','F3','�����','G0','��Ӧ��','J0','������'),sq_yhxx.sjsbh, DECODE(sq_yhxx.gzlb,'1','�̶�','2','��������'),kqhm, DECODE(sq_yhxx.kdlxtbz,'Y','��','N','��'), DECODE(sq_yhxx.xb,'M','��','W','Ů'),sq_yhxx.csrq, DECODE(sq_yhxx.hf,'Y','��','N','��'),sq_yhxx.mz,sq_yhxx.sfzh,sq_yhxx.hjszd,sq_yhxx.dacfd,sq_yhxx.byyx,sq_yhxx.zy,dm_xlbm.xueli,DECODE(sq_yhxx.dhsfgb,'1','����˾��','2','��������','9','������'),sq_yhxx.dh,sq_yhxx.bgdh,sq_yhxx.jtdh,sq_yhxx.email,sq_yhxx.zz,sq_yhxx.cjgzsj,sq_yhxx.rzsj,sq_yhxx.htksrq,sq_yhxx.htdqrq,sq_yhxx.lzrq, DECODE(sq_yhxx.sfqs,'Y','��','N','��'), DECODE(sq_yhxx.ylbx,'Y','��','N','��'), DECODE(sq_yhxx.jylbx,'Y','��','N','��'), DECODE(sq_yhxx.sybx,'Y','��','N','��'), DECODE(sq_yhxx.gsby,'Y','��','N','��'), DECODE(sq_yhxx.syx,'Y','��','N','��') ,sq_yhxx.shbxh,sq_yhxx.jbxdd,sq_yhxx.jjlxr,sq_yhxx.lxrdh, DECODE(sq_yhxx.zdyhbz,'Y','��','N','��'), sq_yhxx.bjjb,sq_yhxx.glgz,sq_yhxx.gwgz,sq_yhxx.jbgz,rs_sjsjb.sjsjbmc,sq_yhxx.yjsxe,sq_yhxx.jtbt,sq_yhxx.cb,sq_yhxx.dhbt, DECODE(sq_yhxx.sfydbs,'Y','��','N','��'), DECODE(sq_yhxx.sfytj,'Y','��','N','��'),sq_yhxx.tjrq,sq_yhxx.qgzdw,sq_yhxx.lrsj,sq_yhxx.bz ";
	ls_sql+=" FROM dm_xlbm,dm_zwbm,rs_sjsjb,sq_dwxx a,sq_dwxx b,sq_yhxx  ";
    ls_sql+=" where sq_yhxx.sjsjb=rs_sjsjb.sjsjb(+) and sq_yhxx.zwbm=dm_zwbm.zwbm(+) and sq_yhxx.xlbm=dm_xlbm.xlbm(+)";
    ls_sql+=" and sq_yhxx.dwbh=a.dwbh(+) and sq_yhxx.ssfgs=b.dwbh(+)";
	ls_sql+=" and ((sq_yhxx.yhdlm is null) OR (sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz where yhzbh='000000')))";
    ls_sql+=wheresql;
    ls_sql+=ordersql+",sq_yhxx.yhmc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_yhxxList.jsp","","","EditSq_yhxx.jsp");
//	pageObj.setPageRow(30);
/*
//������ʾ��
	String[] disColName={"ygbh","sq_yhxx_yhmc","sq_yhxx_bianhao","sq_yhxx_yhjs","sq_yhxx_ssfgs","sq_dwxx_dwmc","sq_yhxx_sjsbh","sq_yhxx_xb","sq_yhxx_csrq","sq_yhxx_hf","sq_yhxx_mz","sq_yhxx_sfzh","sq_yhxx_hjszd","sq_yhxx_dacfd","sq_yhxx_byyx","sq_yhxx_zy","dm_xlbm_xueli","sq_yhxx_dh","sq_yhxx_email","sq_yhxx_zz","dm_xzzwbm_zwmc","sfzszg","sq_yhxx_rzsj","sq_yhxx_htksrq","sq_yhxx_htdqrq","sq_yhxx_lzrq","sq_yhxx_sfqs","sq_yhxx_ylbx","sq_yhxx_jylbx","sq_yhxx_sybx","sq_yhxx_gsby","sq_yhxx_shbxh","sq_yhxx_jbxdd","sq_yhxx_jjlxr","sq_yhxx_lxrdh","sq_yhxx_zkl","sq_yhxx_ckjgbz","sq_yhxx_zdyhbz","sq_yhxx_kdlxtbz","sq_yhxx_bjjb","sq_yhxx_glgz","sq_yhxx_gwgz","sq_yhxx_jbgz","rs_sjsjb_sjsjbmc","sq_yhxx_yjsxe","sq_yhxx_jtbt","sq_yhxx_cb","sq_yhxx_dhbt","sq_yhxx_sfydbs","sq_yhxx_sfytj","sq_yhxx_tjrq","sq_yhxx_bz","sq_yhxx_cjgzsj","sq_yhxx_syx"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("fgs","1");//�в����������Hash��
	spanColHash.put("bm","1");//�в����������Hash��
	spanColHash.put("xzzwbm","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ygbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewSq_yhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yhmc",coluParm);//�в����������Hash��
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
  <B><font size="3">ά��������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(750);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">�ֹ�˾</td>
	<td  width="2%">��������</td>
	<td  width="2%">����ְ��</td>
	<td  width="1%">�������</td>
	<td  width="1%">Ա��״̬</td>
	<td  width="1%">Ա������</td>
	<td  width="2%">����</td>
	<td  width="2%">�ͻ�������Ȩ��Χ</td>
	<td  width="1%">����</td>
	<td  width="1%">ID</td>
	<td  width="2%">�û���ɫ</td>
	<td  width="1%">���������</td>
	<td  width="1%">�������</td>
	<td  width="1%">���ں���</td>
	<td  width="1%">�ɵ�½ϵͳ��־</td>
	<td  width="1%">�Ա�</td>
	<td  width="2%">��������</td>
	<td  width="1%">���</td>
	<td  width="1%">����</td>
	<td  width="2%">���֤��</td>
	<td  width="3%">�������ڵ�</td>
	<td  width="2%">������ŵ�</td>
	<td  width="3%">��ҵԺУ</td>
	<td  width="2%">רҵ</td>
	<td  width="1%">ѧ��</td>
	<td  width="1%">�绰�Ƿ񹫲�</td>
	<td  width="2%">�ֻ�</td>
	<td  width="2%">�칫�绰</td>
	<td  width="2%">��ͥ�绰</td>
	<td  width="2%">email</td>
	<td  width="4%">סַ</td>
	<td  width="2%">��ҵʱ��</td>
	<td  width="2%">��ְ����</td>
	<td  width="2%">��ͬ��ʼ����</td>
	<td  width="2%">��ͬ��������</td>
	<td  width="2%">��ְ����</td>
	<td  width="1%">�빫˾��Ա��������ϵ</td>
	<td  width="1%">�Ƿ����ҽ�Ʊ���</td>
	<td  width="1%">�Ƿ�������ϱ���</td>
	<td  width="1%">�Ƿ����ʧҵ����</td>
	<td  width="1%">�Ƿ���ɹ��˱���</td>
	<td  width="1%">�Ƿ������������</td>
	<td  width="2%">��ᱣ�պ�</td>
	<td  width="2%">�ɱ��յص�</td>
	<td  width="2%">������ϵ��</td>
	<td  width="2%">����ϵ���ֻ�</td>
	<td  width="1%">�ص��û���־</td>
	<td  width="2%">���ۼ���</td>
	<td  width="1%">���乤��</td>
	<td  width="1%">��λ����</td>
	<td  width="1%">��������</td>
	<td  width="2%">���ʦְ��</td>
	<td  width="1%">���ɻ���</td>
	<td  width="1%">��ͨ����</td>
	<td  width="1%">ÿ�ղͲ�</td>
	<td  width="1%">�ֻ�����</td>
	<td  width="1%">�Ƿ��е�����</td>
	<td  width="1%">�Ƿ������</td>
	<td  width="2%">�������</td>
	<td  width="2%">ǰ������λ</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="2%">��ע</td>
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