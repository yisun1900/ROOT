<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">员工统计表</font></B>
</CENTER>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String sq_yhxx_ygbh=null;
	String sq_yhxx_yhmc=null;
	String sq_yhxx_bianhao=null;
	String sq_yhxx_yhdlm=null;
	String sq_yhxx_yhjs=null;
	String sq_yhxx_ssfgs=null;
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
			wheresql+=" and sq_yhxx.sfzszg in('M')";
		}
	}

	String zwflbm=null;
	zwflbm=request.getParameter("zwflbm");
	if (zwflbm!=null)
	{
		if (!(zwflbm.equals("")))	wheresql+=" and  (dm_xzzwbm.zwflbm='"+zwflbm+"')";
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


	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";
	}

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
	sq_yhxx_ssfgs=request.getParameter("sq_yhxx_ssfgs");
	if (sq_yhxx_ssfgs!=null)
	{
		sq_yhxx_ssfgs=cf.GB2Uni(sq_yhxx_ssfgs);
		if (!(sq_yhxx_ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+sq_yhxx_ssfgs+"')";
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


	String tj1=cf.GB2Uni(request.getParameter("tj1"));
	String tj2=cf.GB2Uni(request.getParameter("tj2"));
	String tj3=cf.GB2Uni(request.getParameter("tj3"));
	String tj4=cf.GB2Uni(request.getParameter("tj4"));
	String tj5=cf.GB2Uni(request.getParameter("tj5"));
	String tj6=cf.GB2Uni(request.getParameter("tj6"));
	String tj1name=cf.GB2Uni(request.getParameter("tj1name"));
	String tj2name=cf.GB2Uni(request.getParameter("tj2name"));
	String tj3name=cf.GB2Uni(request.getParameter("tj3name"));
	String tj4name=cf.GB2Uni(request.getParameter("tj4name"));
	String tj5name=cf.GB2Uni(request.getParameter("tj5name"));
	String tj6name=cf.GB2Uni(request.getParameter("tj6name"));

	String groupsql="";
	String selectgroupsql="";
	int groupsl=0;
	if (tj1!=null)
	{
		if (!(tj1.equals("")))
		{
			groupsql+=","+tj1;
			selectgroupsql+=","+tj1;
			groupsl++;
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			groupsql+=","+tj2;
			selectgroupsql+=","+tj2;
			groupsl++;
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			groupsql+=","+tj3;
			selectgroupsql+=","+tj3;
			groupsl++;
		}
	}
	if (tj4!=null)
	{
		if (!(tj4.equals("")))
		{
			groupsql+=","+tj4;
			selectgroupsql+=","+tj4;
			groupsl++;
		}
	}
	if (tj5!=null)
	{
		if (!(tj5.equals("")))
		{
			groupsql+=","+tj5;
			selectgroupsql+=","+tj5;
			groupsl++;
		}
	}
	if (tj6!=null)
	{
		if (!(tj6.equals("")))
		{
			groupsql+=","+tj6;
			selectgroupsql+=","+tj6;
			groupsl++;
		}
	}
	if (groupsl==0)
	{
		out.println("请选择统计列");
		return;
	}
	else{
		groupsql=groupsql.substring(1);
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(distinct sq_yhxx.ygbh),'<img src=\"/images/ColuGif.gif\" width=\"'||count(distinct sq_yhxx.ygbh)||'\" height=\"14\">'";
	}
%>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
<%
	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"13%\">"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"13%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"13%\">"+tj3name+"</td>");
	}
	if (!tj4name.equals(""))
	{
		out.println("<td  width=\"13%\">"+tj4name+"</td>");
	}
	if (!tj5name.equals(""))
	{
		out.println("<td  width=\"13%\">"+tj5name+"</td>");
	}
	if (!tj6name.equals(""))
	{
		out.println("<td  width=\"13%\">"+tj6name+"</td>");
	}

%>
	<td  width="6%">数量</td>
	<td  width="20%">数量</td>
</tr>
<%

	ls_sql=selectgroupsql;
	ls_sql+=" FROM dm_xlbm,rs_sjsjb,sq_dwxx,sq_yhxx,dm_xzzwbm,dm_zwflbm  ";
    ls_sql+=" where sq_yhxx.sjsjb=rs_sjsjb.sjsjb(+) and sq_yhxx.xlbm=dm_xlbm.xlbm(+) and sq_yhxx.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and sq_yhxx.xzzwbm=dm_xzzwbm.xzzwmc and dm_xzzwbm.zwflbm=dm_zwflbm.zwflbm";
	ls_sql+=" and ((sq_yhxx.yhdlm is null) OR (sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz where yhzbh='000000')))";
	ls_sql+=wheresql;
	ls_sql+=" group by "+groupsql;
	ls_sql+=" order by "+groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);

	pageObj.alignStr[groupsl+1]="align='left'";


//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	if (tj1!=null)
	{
		if (!(tj1.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj1,"1");//列参数对象加入Hash表
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj2,"1");//列参数对象加入Hash表
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj3,"1");//列参数对象加入Hash表
		}
	}
	if (tj4!=null)
	{
		if (!(tj4.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj4,"1");//列参数对象加入Hash表
		}
	}
	if (tj5!=null)
	{
		if (!(tj5.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj5,"1");//列参数对象加入Hash表
		}
	}
	if (tj6!=null)
	{
		if (!(tj6.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj6,"1");//列参数对象加入Hash表
		}
	}
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>