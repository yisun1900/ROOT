<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String rs_yhxxqmjz_ygbh=null;
	String rs_yhxxqmjz_yhmc=null;
	String rs_yhxxqmjz_bianhao=null;
	String rs_yhxxqmjz_yhdlm=null;
	String rs_yhxxqmjz_yhjs=null;
	String rs_yhxxqmjz_dwbh=null;
	String rs_yhxxqmjz_sjsbh=null;
	String rs_yhxxqmjz_xb=null;
	String rs_yhxxqmjz_csrq=null;
	String rs_yhxxqmjz_hf=null;
	String rs_yhxxqmjz_mz=null;
	String rs_yhxxqmjz_sfzh=null;
	String rs_yhxxqmjz_hjszd=null;
	String rs_yhxxqmjz_dacfd=null;
	String rs_yhxxqmjz_byyx=null;
	String rs_yhxxqmjz_zy=null;
	String rs_yhxxqmjz_xlbm=null;
	String rs_yhxxqmjz_dh=null;
	String rs_yhxxqmjz_email=null;
	String rs_yhxxqmjz_zz=null;
	String rs_yhxxqmjz_xzzwbm=null;
	String sfzszg=null;
	String rs_yhxxqmjz_rzsj=null;
	String rs_yhxxqmjz_lzrq=null;
	String rs_yhxxqmjz_sfqs=null;
	String rs_yhxxqmjz_ylbx=null;
	String rs_yhxxqmjz_jylbx=null;
	String rs_yhxxqmjz_sybx=null;
	String rs_yhxxqmjz_gsby=null;
	String rs_yhxxqmjz_shbxh=null;
	String rs_yhxxqmjz_jbxdd=null;
	String rs_yhxxqmjz_jjlxr=null;
	String rs_yhxxqmjz_lxrdh=null;
	String rs_yhxxqmjz_zkl=null;
	String rs_yhxxqmjz_ckjgbz=null;
	String rs_yhxxqmjz_zdyhbz=null;
	String rs_yhxxqmjz_kdlxtbz=null;
	String rs_yhxxqmjz_bjjb=null;
	String rs_yhxxqmjz_glgz=null;
	String rs_yhxxqmjz_gwgz=null;
	String rs_yhxxqmjz_jbgz=null;
	String rs_yhxxqmjz_sjsjb=null;
	String rs_yhxxqmjz_yjsxe=null;
	String rs_yhxxqmjz_jtbt=null;
	String rs_yhxxqmjz_cb=null;
	String rs_yhxxqmjz_dhbt=null;
	String rs_yhxxqmjz_sfydbs=null;
	String rs_yhxxqmjz_sfytj=null;
	String rs_yhxxqmjz_tjrq=null;
	String rs_yhxxqmjz_cjgzsj=null;
	String rs_yhxxqmjz_syx=null;

	String jzrq=null;
	jzrq=request.getParameter("jzrq");
	if (jzrq!=null)
	{
		jzrq=jzrq.trim();
		if (!(jzrq.equals("")))	wheresql+="  and (rs_yhxxqmjz.jzrq=TO_DATE('"+jzrq+"','YYYY/MM/DD'))";
	}

	String sfcjbx=null;
	sfcjbx=request.getParameter("sfcjbx");
	if (sfcjbx!=null)
	{
		if (!(sfcjbx.equals("")))	wheresql+=" and  (rs_yhxxqmjz.sfcjbx='"+sfcjbx+"')";
	}
	String sbblsj=null;
	sbblsj=request.getParameter("sbblsj");
	if (sbblsj!=null)
	{
		sbblsj=sbblsj.trim();
		if (!(sbblsj.equals("")))	wheresql+="  and (rs_yhxxqmjz.sbblsj>=TO_DATE('"+sbblsj+"','YYYY/MM/DD'))";
	}
	sbblsj=request.getParameter("sbblsj2");
	if (sbblsj!=null)
	{
		sbblsj=sbblsj.trim();
		if (!(sbblsj.equals("")))	wheresql+="  and (rs_yhxxqmjz.sbblsj<=TO_DATE('"+sbblsj+"','YYYY/MM/DD'))";
	}

	
	String ldhtbh=null;
	ldhtbh=request.getParameter("ldhtbh");
	if (ldhtbh!=null)
	{
		if (!(ldhtbh.equals("")))	wheresql+=" and  (rs_yhxxqmjz.ldhtbh='"+ldhtbh+"')";
	}
	String ldhtlx=null;
	ldhtlx=request.getParameter("ldhtlx");
	if (ldhtlx!=null)
	{
		ldhtlx=cf.GB2Uni(ldhtlx);
		if (!(ldhtlx.equals("")))	wheresql+=" and  (rs_yhxxqmjz.ldhtlx='"+ldhtlx+"')";
	}
	String ldhtqx=null;
	ldhtqx=request.getParameter("ldhtqx");
	if (ldhtqx!=null)
	{
		ldhtqx=cf.GB2Uni(ldhtqx);
		if (!(ldhtqx.equals("")))	wheresql+=" and  (rs_yhxxqmjz.ldhtqx='"+ldhtqx+"')";
	}
	String htksrq=null;
	htksrq=request.getParameter("htksrq");
	if (htksrq!=null)
	{
		htksrq=htksrq.trim();
		if (!(htksrq.equals("")))	wheresql+="  and (rs_yhxxqmjz.htksrq>=TO_DATE('"+htksrq+"','YYYY/MM/DD'))";
	}
	htksrq=request.getParameter("htksrq2");
	if (htksrq!=null)
	{
		htksrq=htksrq.trim();
		if (!(htksrq.equals("")))	wheresql+="  and (rs_yhxxqmjz.htksrq<=TO_DATE('"+htksrq+"','YYYY/MM/DD'))";
	}
	String htdqrq=null;
	htdqrq=request.getParameter("htdqrq");
	if (htdqrq!=null)
	{
		htdqrq=htdqrq.trim();
		if (!(htdqrq.equals("")))	wheresql+="  and (rs_yhxxqmjz.htdqrq>=TO_DATE('"+htdqrq+"','YYYY/MM/DD'))";
	}
	htdqrq=request.getParameter("htdqrq2");
	if (htdqrq!=null)
	{
		htdqrq=htdqrq.trim();
		if (!(htdqrq.equals("")))	wheresql+="  and (rs_yhxxqmjz.htdqrq<=TO_DATE('"+htdqrq+"','YYYY/MM/DD'))";
	}

	String sflz=null;
	sflz=request.getParameter("sflz");
	if (sflz!=null)
	{
		sflz=cf.GB2Uni(sflz);
		if (sflz.equals("1"))
		{
			wheresql+=" and rs_yhxxqmjz.sfzszg in('Y','N')";
		}
		else if (sflz.equals("2"))
		{
			wheresql+=" and rs_yhxxqmjz.sfzszg in('S','T')";
		}
		else if (sflz.equals("3"))
		{
			wheresql+=" and rs_yhxxqmjz.sfzszg in('M')";
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
		if (!(dhsfgb.equals("")))	wheresql+=" and  (rs_yhxxqmjz.dhsfgb='"+dhsfgb+"')";
	}

	String zwbm=null;
	zwbm=request.getParameter("zwbm");
	if (zwbm!=null)
	{
		zwbm=cf.GB2Uni(zwbm);
		if (!(zwbm.equals("")))	wheresql+=" and  (rs_yhxxqmjz.zwbm='"+zwbm+"')";
	}

	String jzbm=null;
	jzbm=request.getParameter("jzbm");
	if (jzbm!=null)
	{
		jzbm=cf.GB2Uni(jzbm);
		if (!(jzbm.equals("")))	wheresql+=" and  (rs_yhxxqmjz.jzbm='"+jzbm+"')";
	}

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_yhxxqmjz.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_yhxxqmjz.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	String gzlb=null;
	gzlb=request.getParameter("gzlb");
	if (gzlb!=null)
	{
		if (!(gzlb.equals("")))	wheresql+=" and  (rs_yhxxqmjz.gzlb='"+gzlb+"')";
	}

	String kqhm=null;
	kqhm=request.getParameter("kqhm");
	if (kqhm!=null)
	{
		if (!(kqhm.equals("")))	wheresql+=" and  (rs_yhxxqmjz.kqhm='"+kqhm+"')";
	}

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (rs_yhxxqmjz.ssfgs='"+ssfgs+"')";

	rs_yhxxqmjz_ygbh=request.getParameter("rs_yhxxqmjz_ygbh");
	if (rs_yhxxqmjz_ygbh!=null)
	{
		rs_yhxxqmjz_ygbh=rs_yhxxqmjz_ygbh.trim();
		if (!(rs_yhxxqmjz_ygbh.equals("")))	wheresql+=" and (rs_yhxxqmjz.ygbh="+rs_yhxxqmjz_ygbh+") ";
	}
	rs_yhxxqmjz_yhmc=request.getParameter("rs_yhxxqmjz_yhmc");
	if (rs_yhxxqmjz_yhmc!=null)
	{
		rs_yhxxqmjz_yhmc=cf.GB2Uni(rs_yhxxqmjz_yhmc);
		if (!(rs_yhxxqmjz_yhmc.equals("")))	wheresql+=" and  (rs_yhxxqmjz.yhmc like '%"+rs_yhxxqmjz_yhmc+"%')";
	}
	rs_yhxxqmjz_bianhao=request.getParameter("rs_yhxxqmjz_bianhao");
	if (rs_yhxxqmjz_bianhao!=null)
	{
		rs_yhxxqmjz_bianhao=cf.GB2Uni(rs_yhxxqmjz_bianhao);
		if (!(rs_yhxxqmjz_bianhao.equals("")))	wheresql+=" and  (rs_yhxxqmjz.bianhao='"+rs_yhxxqmjz_bianhao+"')";
	}
	rs_yhxxqmjz_yhdlm=request.getParameter("rs_yhxxqmjz_yhdlm");
	if (rs_yhxxqmjz_yhdlm!=null)
	{
		rs_yhxxqmjz_yhdlm=cf.GB2Uni(rs_yhxxqmjz_yhdlm);
		if (!(rs_yhxxqmjz_yhdlm.equals("")))	wheresql+=" and  (rs_yhxxqmjz.yhdlm='"+rs_yhxxqmjz_yhdlm+"')";
	}
	rs_yhxxqmjz_yhjs=request.getParameter("rs_yhxxqmjz_yhjs");
	if (rs_yhxxqmjz_yhjs!=null)
	{
		rs_yhxxqmjz_yhjs=cf.GB2Uni(rs_yhxxqmjz_yhjs);
		if (!(rs_yhxxqmjz_yhjs.equals("")))	wheresql+=" and  (rs_yhxxqmjz.yhjs='"+rs_yhxxqmjz_yhjs+"')";
	}
	rs_yhxxqmjz_dwbh=request.getParameter("rs_yhxxqmjz_dwbh");
	if (rs_yhxxqmjz_dwbh!=null)
	{
		rs_yhxxqmjz_dwbh=cf.GB2Uni(rs_yhxxqmjz_dwbh);
		if (!(rs_yhxxqmjz_dwbh.equals("")))	wheresql+=" and  (rs_yhxxqmjz.dwbh='"+rs_yhxxqmjz_dwbh+"')";
	}
	rs_yhxxqmjz_sjsbh=request.getParameter("rs_yhxxqmjz_sjsbh");
	if (rs_yhxxqmjz_sjsbh!=null)
	{
		rs_yhxxqmjz_sjsbh=cf.GB2Uni(rs_yhxxqmjz_sjsbh);
		if (!(rs_yhxxqmjz_sjsbh.equals("")))	wheresql+=" and  (rs_yhxxqmjz.sjsbh='"+rs_yhxxqmjz_sjsbh+"')";
	}
	rs_yhxxqmjz_xb=request.getParameter("rs_yhxxqmjz_xb");
	if (rs_yhxxqmjz_xb!=null)
	{
		rs_yhxxqmjz_xb=cf.GB2Uni(rs_yhxxqmjz_xb);
		if (!(rs_yhxxqmjz_xb.equals("")))	wheresql+=" and  (rs_yhxxqmjz.xb='"+rs_yhxxqmjz_xb+"')";
	}
	rs_yhxxqmjz_csrq=request.getParameter("rs_yhxxqmjz_csrq");
	if (rs_yhxxqmjz_csrq!=null)
	{
		rs_yhxxqmjz_csrq=rs_yhxxqmjz_csrq.trim();
		if (!(rs_yhxxqmjz_csrq.equals("")))	wheresql+="  and (rs_yhxxqmjz.csrq>=TO_DATE('"+rs_yhxxqmjz_csrq+"','YYYY/MM/DD'))";
	}
	rs_yhxxqmjz_csrq=request.getParameter("rs_yhxxqmjz_csrq2");
	if (rs_yhxxqmjz_csrq!=null)
	{
		rs_yhxxqmjz_csrq=rs_yhxxqmjz_csrq.trim();
		if (!(rs_yhxxqmjz_csrq.equals("")))	wheresql+="  and (rs_yhxxqmjz.csrq<=TO_DATE('"+rs_yhxxqmjz_csrq+"','YYYY/MM/DD'))";
	}
	rs_yhxxqmjz_hf=request.getParameter("rs_yhxxqmjz_hf");
	if (rs_yhxxqmjz_hf!=null)
	{
		rs_yhxxqmjz_hf=cf.GB2Uni(rs_yhxxqmjz_hf);
		if (!(rs_yhxxqmjz_hf.equals("")))	wheresql+=" and  (rs_yhxxqmjz.hf='"+rs_yhxxqmjz_hf+"')";
	}
	rs_yhxxqmjz_mz=request.getParameter("rs_yhxxqmjz_mz");
	if (rs_yhxxqmjz_mz!=null)
	{
		rs_yhxxqmjz_mz=cf.GB2Uni(rs_yhxxqmjz_mz);
		if (!(rs_yhxxqmjz_mz.equals("")))	wheresql+=" and  (rs_yhxxqmjz.mz='"+rs_yhxxqmjz_mz+"')";
	}
	rs_yhxxqmjz_sfzh=request.getParameter("rs_yhxxqmjz_sfzh");
	if (rs_yhxxqmjz_sfzh!=null)
	{
		rs_yhxxqmjz_sfzh=cf.GB2Uni(rs_yhxxqmjz_sfzh);
		if (!(rs_yhxxqmjz_sfzh.equals("")))	wheresql+=" and  (rs_yhxxqmjz.sfzh='"+rs_yhxxqmjz_sfzh+"')";
	}
	rs_yhxxqmjz_hjszd=request.getParameter("rs_yhxxqmjz_hjszd");
	if (rs_yhxxqmjz_hjszd!=null)
	{
		rs_yhxxqmjz_hjszd=cf.GB2Uni(rs_yhxxqmjz_hjszd);
		if (!(rs_yhxxqmjz_hjszd.equals("")))	wheresql+=" and  (rs_yhxxqmjz.hjszd like '%"+rs_yhxxqmjz_hjszd+"%')";
	}
	rs_yhxxqmjz_dacfd=request.getParameter("rs_yhxxqmjz_dacfd");
	if (rs_yhxxqmjz_dacfd!=null)
	{
		rs_yhxxqmjz_dacfd=cf.GB2Uni(rs_yhxxqmjz_dacfd);
		if (!(rs_yhxxqmjz_dacfd.equals("")))	wheresql+=" and  (rs_yhxxqmjz.dacfd like '%"+rs_yhxxqmjz_dacfd+"%')";
	}
	rs_yhxxqmjz_byyx=request.getParameter("rs_yhxxqmjz_byyx");
	if (rs_yhxxqmjz_byyx!=null)
	{
		rs_yhxxqmjz_byyx=cf.GB2Uni(rs_yhxxqmjz_byyx);
		if (!(rs_yhxxqmjz_byyx.equals("")))	wheresql+=" and  (rs_yhxxqmjz.byyx like '%"+rs_yhxxqmjz_byyx+"%')";
	}
	rs_yhxxqmjz_zy=request.getParameter("rs_yhxxqmjz_zy");
	if (rs_yhxxqmjz_zy!=null)
	{
		rs_yhxxqmjz_zy=cf.GB2Uni(rs_yhxxqmjz_zy);
		if (!(rs_yhxxqmjz_zy.equals("")))	wheresql+=" and  (rs_yhxxqmjz.zy like '%"+rs_yhxxqmjz_zy+"%')";
	}
	rs_yhxxqmjz_xlbm=request.getParameter("rs_yhxxqmjz_xlbm");
	if (rs_yhxxqmjz_xlbm!=null)
	{
		rs_yhxxqmjz_xlbm=cf.GB2Uni(rs_yhxxqmjz_xlbm);
		if (!(rs_yhxxqmjz_xlbm.equals("")))	wheresql+=" and  (rs_yhxxqmjz.xlbm='"+rs_yhxxqmjz_xlbm+"')";
	}
	rs_yhxxqmjz_dh=request.getParameter("rs_yhxxqmjz_dh");
	if (rs_yhxxqmjz_dh!=null)
	{
		rs_yhxxqmjz_dh=cf.GB2Uni(rs_yhxxqmjz_dh);
		if (!(rs_yhxxqmjz_dh.equals("")))	wheresql+=" and  (rs_yhxxqmjz.dh='"+rs_yhxxqmjz_dh+"')";
	}
	rs_yhxxqmjz_email=request.getParameter("rs_yhxxqmjz_email");
	if (rs_yhxxqmjz_email!=null)
	{
		rs_yhxxqmjz_email=cf.GB2Uni(rs_yhxxqmjz_email);
		if (!(rs_yhxxqmjz_email.equals("")))	wheresql+=" and  (rs_yhxxqmjz.email='"+rs_yhxxqmjz_email+"')";
	}
	rs_yhxxqmjz_zz=request.getParameter("rs_yhxxqmjz_zz");
	if (rs_yhxxqmjz_zz!=null)
	{
		rs_yhxxqmjz_zz=cf.GB2Uni(rs_yhxxqmjz_zz);
		if (!(rs_yhxxqmjz_zz.equals("")))	wheresql+=" and  (rs_yhxxqmjz.zz like '%"+rs_yhxxqmjz_zz+"%')";
	}
	rs_yhxxqmjz_xzzwbm=request.getParameter("rs_yhxxqmjz_xzzwbm");
	if (rs_yhxxqmjz_xzzwbm!=null)
	{
		rs_yhxxqmjz_xzzwbm=cf.GB2Uni(rs_yhxxqmjz_xzzwbm);
		if (!(rs_yhxxqmjz_xzzwbm.equals("")))	wheresql+=" and  (rs_yhxxqmjz.xzzwbm='"+rs_yhxxqmjz_xzzwbm+"')";
	}
	sfzszg=request.getParameter("sfzszg");
	if (sfzszg!=null)
	{
		sfzszg=cf.GB2Uni(sfzszg);
		if (!(sfzszg.equals("")))	wheresql+=" and  (rs_yhxxqmjz.sfzszg='"+sfzszg+"')";
	}
	rs_yhxxqmjz_rzsj=request.getParameter("rs_yhxxqmjz_rzsj");
	if (rs_yhxxqmjz_rzsj!=null)
	{
		rs_yhxxqmjz_rzsj=rs_yhxxqmjz_rzsj.trim();
		if (!(rs_yhxxqmjz_rzsj.equals("")))	wheresql+="  and (rs_yhxxqmjz.rzsj>=TO_DATE('"+rs_yhxxqmjz_rzsj+"','YYYY/MM/DD'))";
	}
	rs_yhxxqmjz_rzsj=request.getParameter("rs_yhxxqmjz_rzsj2");
	if (rs_yhxxqmjz_rzsj!=null)
	{
		rs_yhxxqmjz_rzsj=rs_yhxxqmjz_rzsj.trim();
		if (!(rs_yhxxqmjz_rzsj.equals("")))	wheresql+="  and (rs_yhxxqmjz.rzsj<=TO_DATE('"+rs_yhxxqmjz_rzsj+"','YYYY/MM/DD'))";
	}

	rs_yhxxqmjz_lzrq=request.getParameter("rs_yhxxqmjz_lzrq");
	if (rs_yhxxqmjz_lzrq!=null)
	{
		rs_yhxxqmjz_lzrq=rs_yhxxqmjz_lzrq.trim();
		if (!(rs_yhxxqmjz_lzrq.equals("")))	wheresql+="  and (rs_yhxxqmjz.lzrq>=TO_DATE('"+rs_yhxxqmjz_lzrq+"','YYYY/MM/DD'))";
	}
	rs_yhxxqmjz_lzrq=request.getParameter("rs_yhxxqmjz_lzrq2");
	if (rs_yhxxqmjz_lzrq!=null)
	{
		rs_yhxxqmjz_lzrq=rs_yhxxqmjz_lzrq.trim();
		if (!(rs_yhxxqmjz_lzrq.equals("")))	wheresql+="  and (rs_yhxxqmjz.lzrq<=TO_DATE('"+rs_yhxxqmjz_lzrq+"','YYYY/MM/DD'))";
	}
	rs_yhxxqmjz_sfqs=request.getParameter("rs_yhxxqmjz_sfqs");
	if (rs_yhxxqmjz_sfqs!=null)
	{
		rs_yhxxqmjz_sfqs=cf.GB2Uni(rs_yhxxqmjz_sfqs);
		if (!(rs_yhxxqmjz_sfqs.equals("")))	wheresql+=" and  (rs_yhxxqmjz.sfqs='"+rs_yhxxqmjz_sfqs+"')";
	}
	rs_yhxxqmjz_ylbx=request.getParameter("rs_yhxxqmjz_ylbx");
	if (rs_yhxxqmjz_ylbx!=null)
	{
		rs_yhxxqmjz_ylbx=cf.GB2Uni(rs_yhxxqmjz_ylbx);
		if (!(rs_yhxxqmjz_ylbx.equals("")))	wheresql+=" and  (rs_yhxxqmjz.ylbx='"+rs_yhxxqmjz_ylbx+"')";
	}
	rs_yhxxqmjz_jylbx=request.getParameter("rs_yhxxqmjz_jylbx");
	if (rs_yhxxqmjz_jylbx!=null)
	{
		rs_yhxxqmjz_jylbx=cf.GB2Uni(rs_yhxxqmjz_jylbx);
		if (!(rs_yhxxqmjz_jylbx.equals("")))	wheresql+=" and  (rs_yhxxqmjz.jylbx='"+rs_yhxxqmjz_jylbx+"')";
	}
	rs_yhxxqmjz_sybx=request.getParameter("rs_yhxxqmjz_sybx");
	if (rs_yhxxqmjz_sybx!=null)
	{
		rs_yhxxqmjz_sybx=cf.GB2Uni(rs_yhxxqmjz_sybx);
		if (!(rs_yhxxqmjz_sybx.equals("")))	wheresql+=" and  (rs_yhxxqmjz.sybx='"+rs_yhxxqmjz_sybx+"')";
	}
	rs_yhxxqmjz_gsby=request.getParameter("rs_yhxxqmjz_gsby");
	if (rs_yhxxqmjz_gsby!=null)
	{
		rs_yhxxqmjz_gsby=cf.GB2Uni(rs_yhxxqmjz_gsby);
		if (!(rs_yhxxqmjz_gsby.equals("")))	wheresql+=" and  (rs_yhxxqmjz.gsby='"+rs_yhxxqmjz_gsby+"')";
	}
	rs_yhxxqmjz_shbxh=request.getParameter("rs_yhxxqmjz_shbxh");
	if (rs_yhxxqmjz_shbxh!=null)
	{
		rs_yhxxqmjz_shbxh=cf.GB2Uni(rs_yhxxqmjz_shbxh);
		if (!(rs_yhxxqmjz_shbxh.equals("")))	wheresql+=" and  (rs_yhxxqmjz.shbxh='"+rs_yhxxqmjz_shbxh+"')";
	}
	rs_yhxxqmjz_jbxdd=request.getParameter("rs_yhxxqmjz_jbxdd");
	if (rs_yhxxqmjz_jbxdd!=null)
	{
		rs_yhxxqmjz_jbxdd=cf.GB2Uni(rs_yhxxqmjz_jbxdd);
		if (!(rs_yhxxqmjz_jbxdd.equals("")))	wheresql+=" and  (rs_yhxxqmjz.jbxdd like '%"+rs_yhxxqmjz_jbxdd+"%')";
	}
	rs_yhxxqmjz_jjlxr=request.getParameter("rs_yhxxqmjz_jjlxr");
	if (rs_yhxxqmjz_jjlxr!=null)
	{
		rs_yhxxqmjz_jjlxr=cf.GB2Uni(rs_yhxxqmjz_jjlxr);
		if (!(rs_yhxxqmjz_jjlxr.equals("")))	wheresql+=" and  (rs_yhxxqmjz.jjlxr='"+rs_yhxxqmjz_jjlxr+"')";
	}
	rs_yhxxqmjz_lxrdh=request.getParameter("rs_yhxxqmjz_lxrdh");
	if (rs_yhxxqmjz_lxrdh!=null)
	{
		rs_yhxxqmjz_lxrdh=cf.GB2Uni(rs_yhxxqmjz_lxrdh);
		if (!(rs_yhxxqmjz_lxrdh.equals("")))	wheresql+=" and  (rs_yhxxqmjz.lxrdh='"+rs_yhxxqmjz_lxrdh+"')";
	}
	rs_yhxxqmjz_zkl=request.getParameter("rs_yhxxqmjz_zkl");
	if (rs_yhxxqmjz_zkl!=null)
	{
		rs_yhxxqmjz_zkl=rs_yhxxqmjz_zkl.trim();
		if (!(rs_yhxxqmjz_zkl.equals("")))	wheresql+=" and  (rs_yhxxqmjz.zkl="+rs_yhxxqmjz_zkl+") ";
	}
	rs_yhxxqmjz_ckjgbz=request.getParameter("rs_yhxxqmjz_ckjgbz");
	if (rs_yhxxqmjz_ckjgbz!=null)
	{
		rs_yhxxqmjz_ckjgbz=cf.GB2Uni(rs_yhxxqmjz_ckjgbz);
		if (!(rs_yhxxqmjz_ckjgbz.equals("")))	wheresql+=" and  (rs_yhxxqmjz.ckjgbz='"+rs_yhxxqmjz_ckjgbz+"')";
	}
	rs_yhxxqmjz_zdyhbz=request.getParameter("rs_yhxxqmjz_zdyhbz");
	if (rs_yhxxqmjz_zdyhbz!=null)
	{
		rs_yhxxqmjz_zdyhbz=cf.GB2Uni(rs_yhxxqmjz_zdyhbz);
		if (!(rs_yhxxqmjz_zdyhbz.equals("")))	wheresql+=" and  (rs_yhxxqmjz.zdyhbz='"+rs_yhxxqmjz_zdyhbz+"')";
	}
	rs_yhxxqmjz_kdlxtbz=request.getParameter("rs_yhxxqmjz_kdlxtbz");
	if (rs_yhxxqmjz_kdlxtbz!=null)
	{
		rs_yhxxqmjz_kdlxtbz=cf.GB2Uni(rs_yhxxqmjz_kdlxtbz);
		if (!(rs_yhxxqmjz_kdlxtbz.equals("")))	wheresql+=" and  (rs_yhxxqmjz.kdlxtbz='"+rs_yhxxqmjz_kdlxtbz+"')";
	}
	rs_yhxxqmjz_bjjb=request.getParameter("rs_yhxxqmjz_bjjb");
	if (rs_yhxxqmjz_bjjb!=null)
	{
		rs_yhxxqmjz_bjjb=cf.GB2Uni(rs_yhxxqmjz_bjjb);
		if (!(rs_yhxxqmjz_bjjb.equals("")))	wheresql+=" and  (rs_yhxxqmjz.bjjb='"+rs_yhxxqmjz_bjjb+"')";
	}
	rs_yhxxqmjz_glgz=request.getParameter("rs_yhxxqmjz_glgz");
	if (rs_yhxxqmjz_glgz!=null)
	{
		rs_yhxxqmjz_glgz=rs_yhxxqmjz_glgz.trim();
		if (!(rs_yhxxqmjz_glgz.equals("")))	wheresql+=" and  (rs_yhxxqmjz.glgz="+rs_yhxxqmjz_glgz+") ";
	}
	rs_yhxxqmjz_gwgz=request.getParameter("rs_yhxxqmjz_gwgz");
	if (rs_yhxxqmjz_gwgz!=null)
	{
		rs_yhxxqmjz_gwgz=rs_yhxxqmjz_gwgz.trim();
		if (!(rs_yhxxqmjz_gwgz.equals("")))	wheresql+=" and  (rs_yhxxqmjz.gwgz="+rs_yhxxqmjz_gwgz+") ";
	}
	rs_yhxxqmjz_jbgz=request.getParameter("rs_yhxxqmjz_jbgz");
	if (rs_yhxxqmjz_jbgz!=null)
	{
		rs_yhxxqmjz_jbgz=rs_yhxxqmjz_jbgz.trim();
		if (!(rs_yhxxqmjz_jbgz.equals("")))	wheresql+=" and  (rs_yhxxqmjz.jbgz="+rs_yhxxqmjz_jbgz+") ";
	}
	rs_yhxxqmjz_sjsjb=request.getParameter("rs_yhxxqmjz_sjsjb");
	if (rs_yhxxqmjz_sjsjb!=null)
	{
		rs_yhxxqmjz_sjsjb=cf.GB2Uni(rs_yhxxqmjz_sjsjb);
		if (!(rs_yhxxqmjz_sjsjb.equals("")))	wheresql+=" and  (rs_yhxxqmjz.sjsjb='"+rs_yhxxqmjz_sjsjb+"')";
	}
	rs_yhxxqmjz_yjsxe=request.getParameter("rs_yhxxqmjz_yjsxe");
	if (rs_yhxxqmjz_yjsxe!=null)
	{
		rs_yhxxqmjz_yjsxe=rs_yhxxqmjz_yjsxe.trim();
		if (!(rs_yhxxqmjz_yjsxe.equals("")))	wheresql+=" and  (rs_yhxxqmjz.yjsxe="+rs_yhxxqmjz_yjsxe+") ";
	}
	rs_yhxxqmjz_jtbt=request.getParameter("rs_yhxxqmjz_jtbt");
	if (rs_yhxxqmjz_jtbt!=null)
	{
		rs_yhxxqmjz_jtbt=rs_yhxxqmjz_jtbt.trim();
		if (!(rs_yhxxqmjz_jtbt.equals("")))	wheresql+=" and  (rs_yhxxqmjz.jtbt="+rs_yhxxqmjz_jtbt+") ";
	}
	rs_yhxxqmjz_cb=request.getParameter("rs_yhxxqmjz_cb");
	if (rs_yhxxqmjz_cb!=null)
	{
		rs_yhxxqmjz_cb=rs_yhxxqmjz_cb.trim();
		if (!(rs_yhxxqmjz_cb.equals("")))	wheresql+=" and  (rs_yhxxqmjz.cb="+rs_yhxxqmjz_cb+") ";
	}
	rs_yhxxqmjz_dhbt=request.getParameter("rs_yhxxqmjz_dhbt");
	if (rs_yhxxqmjz_dhbt!=null)
	{
		rs_yhxxqmjz_dhbt=rs_yhxxqmjz_dhbt.trim();
		if (!(rs_yhxxqmjz_dhbt.equals("")))	wheresql+=" and  (rs_yhxxqmjz.dhbt="+rs_yhxxqmjz_dhbt+") ";
	}
	rs_yhxxqmjz_sfydbs=request.getParameter("rs_yhxxqmjz_sfydbs");
	if (rs_yhxxqmjz_sfydbs!=null)
	{
		rs_yhxxqmjz_sfydbs=cf.GB2Uni(rs_yhxxqmjz_sfydbs);
		if (!(rs_yhxxqmjz_sfydbs.equals("")))	wheresql+=" and  (rs_yhxxqmjz.sfydbs='"+rs_yhxxqmjz_sfydbs+"')";
	}
	rs_yhxxqmjz_sfytj=request.getParameter("rs_yhxxqmjz_sfytj");
	if (rs_yhxxqmjz_sfytj!=null)
	{
		rs_yhxxqmjz_sfytj=cf.GB2Uni(rs_yhxxqmjz_sfytj);
		if (!(rs_yhxxqmjz_sfytj.equals("")))	wheresql+=" and  (rs_yhxxqmjz.sfytj='"+rs_yhxxqmjz_sfytj+"')";
	}
	rs_yhxxqmjz_tjrq=request.getParameter("rs_yhxxqmjz_tjrq");
	if (rs_yhxxqmjz_tjrq!=null)
	{
		rs_yhxxqmjz_tjrq=rs_yhxxqmjz_tjrq.trim();
		if (!(rs_yhxxqmjz_tjrq.equals("")))	wheresql+="  and (rs_yhxxqmjz.tjrq>=TO_DATE('"+rs_yhxxqmjz_tjrq+"','YYYY/MM/DD'))";
	}
	rs_yhxxqmjz_tjrq=request.getParameter("rs_yhxxqmjz_tjrq2");
	if (rs_yhxxqmjz_tjrq!=null)
	{
		rs_yhxxqmjz_tjrq=rs_yhxxqmjz_tjrq.trim();
		if (!(rs_yhxxqmjz_tjrq.equals("")))	wheresql+="  and (rs_yhxxqmjz.tjrq<=TO_DATE('"+rs_yhxxqmjz_tjrq+"','YYYY/MM/DD'))";
	}
	rs_yhxxqmjz_cjgzsj=request.getParameter("rs_yhxxqmjz_cjgzsj");
	if (rs_yhxxqmjz_cjgzsj!=null)
	{
		rs_yhxxqmjz_cjgzsj=rs_yhxxqmjz_cjgzsj.trim();
		if (!(rs_yhxxqmjz_cjgzsj.equals("")))	wheresql+="  and (rs_yhxxqmjz.cjgzsj>=TO_DATE('"+rs_yhxxqmjz_cjgzsj+"','YYYY/MM/DD'))";
	}
	rs_yhxxqmjz_cjgzsj=request.getParameter("rs_yhxxqmjz_cjgzsj2");
	if (rs_yhxxqmjz_cjgzsj!=null)
	{
		rs_yhxxqmjz_cjgzsj=rs_yhxxqmjz_cjgzsj.trim();
		if (!(rs_yhxxqmjz_cjgzsj.equals("")))	wheresql+="  and (rs_yhxxqmjz.cjgzsj<=TO_DATE('"+rs_yhxxqmjz_cjgzsj+"','YYYY/MM/DD'))";
	}
	rs_yhxxqmjz_syx=request.getParameter("rs_yhxxqmjz_syx");
	if (rs_yhxxqmjz_syx!=null)
	{
		rs_yhxxqmjz_syx=cf.GB2Uni(rs_yhxxqmjz_syx);
		if (!(rs_yhxxqmjz_syx.equals("")))	wheresql+=" and  (rs_yhxxqmjz.syx='"+rs_yhxxqmjz_syx+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String jgpx4=cf.GB2Uni(request.getParameter("jgpx4"));
	String jgpx5=cf.GB2Uni(request.getParameter("jgpx5"));
	String jgpx6=cf.GB2Uni(request.getParameter("jgpx6"));
	String ordersql=" order by rs_yhxxqmjz.jzrq,rs_yhxxqmjz.ssfgs,"+jgpx1;
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


	ls_sql="SELECT rs_yhxxqmjz.jzrq,b.dwmc fgs,a.dwmc bm,DECODE(rs_yhxxqmjz.sfzszg,'M','<font color=\"#009999\">实习生</font>','Y','转正','N','<font color=\"#0000CC\">试用期</font>','D','<font color=\"#CCCC00\">待岗</font>','S','<font color=\"#CC0000\">辞职</font>','T','<font color=\"#CC00CC\">辞退</font>'),rs_yhxxqmjz.bianhao,rs_yhxxqmjz.yhmc,rs_yhxxqmjz.xzzwbm,rs_yhxxqmjz.ygbh,dm_zwbm.zwmc,c.dwmc jzbm, DECODE(rs_yhxxqmjz.yhjs,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','分公司店面','F3','设计室','G0','供应商','J0','加盟商'),rs_yhxxqmjz.sjsbh, DECODE(rs_yhxxqmjz.gzlb,'1','固定','2','浮动工资'),kqhm, DECODE(rs_yhxxqmjz.kdlxtbz,'Y','是','N','否'), DECODE(rs_yhxxqmjz.xb,'M','男','W','女'),rs_yhxxqmjz.csrq, DECODE(rs_yhxxqmjz.hf,'Y','是','N','否'),rs_yhxxqmjz.mz,rs_yhxxqmjz.sfzh,rs_yhxxqmjz.hjszd,rs_yhxxqmjz.dacfd,rs_yhxxqmjz.byyx,rs_yhxxqmjz.zy,dm_xlbm.xueli,DECODE(rs_yhxxqmjz.dhsfgb,'1','本公司内','2','不受限制','9','不公布'),rs_yhxxqmjz.dh,rs_yhxxqmjz.bgdh,rs_yhxxqmjz.jtdh,rs_yhxxqmjz.email,rs_yhxxqmjz.zz,rs_yhxxqmjz.cjgzsj,ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj,rs_yhxxqmjz.rzsj,rs_yhxxqmjz.htksrq,rs_yhxxqmjz.htdqrq,rs_yhxxqmjz.lzrq, DECODE(rs_yhxxqmjz.sfqs,'Y','是','N','否'), DECODE(rs_yhxxqmjz.ylbx,'Y','是','N','否'), DECODE(rs_yhxxqmjz.jylbx,'Y','是','N','否'), DECODE(rs_yhxxqmjz.sybx,'Y','是','N','否'), DECODE(rs_yhxxqmjz.gsby,'Y','是','N','否'), DECODE(rs_yhxxqmjz.syx,'Y','是','N','否') ,rs_yhxxqmjz.shbxh,rs_yhxxqmjz.jbxdd,rs_yhxxqmjz.jjlxr,rs_yhxxqmjz.lxrdh,rs_yhxxqmjz.zkl, DECODE(rs_yhxxqmjz.ckjgbz,'Y','可看','N','不可'), DECODE(rs_yhxxqmjz.zdyhbz,'Y','是','N','否'), rs_yhxxqmjz.bjjb,rs_yhxxqmjz.glgz,rs_yhxxqmjz.gwgz,rs_yhxxqmjz.jbgz,rs_sjsjb.sjsjbmc,rs_yhxxqmjz.yjsxe,rs_yhxxqmjz.jtbt,rs_yhxxqmjz.cb,rs_yhxxqmjz.dhbt, DECODE(rs_yhxxqmjz.sfydbs,'Y','是','N','否'), DECODE(rs_yhxxqmjz.sfytj,'Y','是','N','否'),rs_yhxxqmjz.tjrq,rs_yhxxqmjz.qgzdw,rs_yhxxqmjz.bz ";
	ls_sql+=" FROM dm_xlbm,dm_zwbm,rs_sjsjb,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_yhxxqmjz,dm_xzzwbm,dm_zwflbm  ";
    ls_sql+=" where rs_yhxxqmjz.sjsjb=rs_sjsjb.sjsjb(+) and rs_yhxxqmjz.zwbm=dm_zwbm.zwbm(+) and rs_yhxxqmjz.xlbm=dm_xlbm.xlbm(+)";
    ls_sql+=" and rs_yhxxqmjz.dwbh=a.dwbh(+) and rs_yhxxqmjz.ssfgs=b.dwbh(+) and rs_yhxxqmjz.jzbm=c.dwbh(+)";
	ls_sql+=" and ((rs_yhxxqmjz.yhdlm is null) OR (rs_yhxxqmjz.yhdlm not in(select yhdlm from sq_yhssz where yhzbh='000000')))";
    ls_sql+=" and rs_yhxxqmjz.xzzwbm=dm_xzzwbm.xzzwmc and dm_xzzwbm.zwflbm=dm_zwflbm.zwflbm";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_yhxxqmjzCxList.jsp","SelectCxRs_yhxxqmjz.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"ygbh","rs_yhxxqmjz_yhmc","rs_yhxxqmjz_bianhao","rs_yhxxqmjz_yhjs","rs_yhxxqmjz_ssfgs","sq_dwxx_dwmc","rs_yhxxqmjz_sjsbh","rs_yhxxqmjz_xb","rs_yhxxqmjz_csrq","rs_yhxxqmjz_hf","rs_yhxxqmjz_mz","rs_yhxxqmjz_sfzh","rs_yhxxqmjz_hjszd","rs_yhxxqmjz_dacfd","rs_yhxxqmjz_byyx","rs_yhxxqmjz_zy","dm_xlbm_xueli","rs_yhxxqmjz_dh","rs_yhxxqmjz_email","rs_yhxxqmjz_zz","dm_xzzwbm_xzzwmc","sfzszg","rs_yhxxqmjz_rzsj","rs_yhxxqmjz_htksrq","rs_yhxxqmjz_htdqrq","rs_yhxxqmjz_lzrq","rs_yhxxqmjz_sfqs","rs_yhxxqmjz_ylbx","rs_yhxxqmjz_jylbx","rs_yhxxqmjz_sybx","rs_yhxxqmjz_gsby","rs_yhxxqmjz_shbxh","rs_yhxxqmjz_jbxdd","rs_yhxxqmjz_jjlxr","rs_yhxxqmjz_lxrdh","rs_yhxxqmjz_zkl","rs_yhxxqmjz_ckjgbz","rs_yhxxqmjz_zdyhbz","rs_yhxxqmjz_kdlxtbz","rs_yhxxqmjz_bjjb","rs_yhxxqmjz_glgz","rs_yhxxqmjz_gwgz","rs_yhxxqmjz_jbgz","rs_sjsjb_sjsjbmc","rs_yhxxqmjz_yjsxe","rs_yhxxqmjz_jtbt","rs_yhxxqmjz_cb","rs_yhxxqmjz_dhbt","rs_yhxxqmjz_sfydbs","rs_yhxxqmjz_sfytj","rs_yhxxqmjz_tjrq","rs_yhxxqmjz_bz","rs_yhxxqmjz_cjgzsj","rs_yhxxqmjz_syx"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ygbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/rs/yghmcgl/Viewrs_yhxxqmjz.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yhmc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结转明细</font></B>
</CENTER>

<div style="height:100%;width:100%;overflow:auto;">

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(700,2,5);
%>


<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">结转日期</td>
	<td  width="2%">分公司</td>
	<td  width="2%">所属部门</td>
	<td  width="1%">员工状态</td>
	<td  width="1%">工号</td>
	<td  width="1%">员工名称</td>
	<td  width="2%">行政职务</td>
	<td  width="1%">序号</td>
	<td  width="2%">工种</td>
	<td  width="2%">兼职部门</td>
	<td  width="2%">用户角色</td>
	<td  width="1%">所属设计室</td>
	<td  width="1%">工资类别</td>
	<td  width="1%">考勤号码</td>
	<td  width="1%">可登陆系统标志</td>
	<td  width="1%">性别</td>
	<td  width="2%">出生日期</td>
	<td  width="1%">婚否</td>
	<td  width="1%">民族</td>
	<td  width="2%">身份证号</td>
	<td  width="2%">户籍所在地</td>
	<td  width="2%">档案存放地</td>
	<td  width="2%">毕业院校</td>
	<td  width="2%">专业</td>
	<td  width="2%">学历</td>
	<td  width="1%">电话是否公布</td>
	<td  width="2%">手机</td>
	<td  width="2%">办公电话</td>
	<td  width="2%">家庭电话</td>
	<td  width="2%">email</td>
	<td  width="4%">住址</td>
	<td  width="2%">毕业时间</td>
	<td  width="1%">工龄</td>
	<td  width="2%">入职日期</td>
	<td  width="2%">合同开始日期</td>
	<td  width="2%">合同到期日期</td>
	<td  width="2%">离职日期</td>
	<td  width="1%">与公司有亲属关系</td>
	<td  width="1%">是否缴纳医疗保险</td>
	<td  width="1%">是否缴纳养老保险</td>
	<td  width="1%">是否缴纳失业保险</td>
	<td  width="1%">是否缴纳工伤保险</td>
	<td  width="1%">是否缴纳生育保险</td>
	<td  width="2%">社会保险号</td>
	<td  width="2%">缴保险地点</td>
	<td  width="2%">紧急联系人</td>
	<td  width="2%">急联系人手机</td>
	<td  width="1%">允许折扣率</td>
	<td  width="1%">允许查看价格明细</td>
	<td  width="1%">重点用户标志</td>
	<td  width="2%">报价级别</td>
	<td  width="1%">工龄工资</td>
	<td  width="1%">岗位工资</td>
	<td  width="1%">基本工资</td>
	<td  width="2%">设计师职称</td>
	<td  width="1%">交纳基数</td>
	<td  width="1%">交通补贴</td>
	<td  width="1%">每日餐补</td>
	<td  width="1%">手机补贴</td>
	<td  width="1%">是否有担保书</td>
	<td  width="1%">是否已体检</td>
	<td  width="2%">体检日期</td>
	<td  width="2%">前工作单位</td>
	<td  width="2%">备注</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

  </DIV>

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>