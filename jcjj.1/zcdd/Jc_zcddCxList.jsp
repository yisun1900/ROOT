<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String zwbm=(String)session.getAttribute("zwbm");//08:�Ҿӹ���;10:��ĿרԱ;12:�Ҿ����ʦ;18:ľ�Ų���ʦ
String ssfgs=(String)session.getAttribute("ssfgs");
String xmzyglbz=cf.fillNull(cf.executeQuery("select xmzyglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//��ĿרԱ����
String jjgwglbz=cf.fillNull(cf.executeQuery("select jjgwglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿӹ��ʹ���
String jjsjsglbz=cf.fillNull(cf.executeQuery("select jjsjsglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿ����ʦ����

if (zwbm.equals("10"))//10:��ĿרԱ
{
	if (xmzyglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("08"))//08:�Ҿӹ���
{
	if (jjgwglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("12"))//12:�Ҿ����ʦ
{
	if (jjsjsglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
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

	String zjxxh=null;
	zjxxh=request.getParameter("zjxxh");
	if (zjxxh!=null)
	{
		zjxxh=cf.GB2Uni(zjxxh);
		if (!(zjxxh.equals("")))	wheresql+=" and  (jc_zcdd.zjxxh='"+zjxxh+"')";
	}

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
		//1������Ʒ��3����¼��ͬ��4���п�涩����5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9���������ģ�A:����������B:��������շѡ�C:ѡ������
		if (ddlx.equals("99"))
		{
			wheresql+=" and  jc_zcdd.ddlx in('6','7','8')";
		}
		else if (ddlx.equals("61"))
		{
			wheresql+=" and  (jc_zcdd.ddlx='6' and jc_zcdd.zctclx='1')";
		}
		else if (ddlx.equals("62"))
		{
			wheresql+=" and  (jc_zcdd.ddlx='6' and jc_zcdd.zctclx='2')";
		}
		else if (ddlx.equals("71"))
		{
			wheresql+=" and  (jc_zcdd.ddlx='7' and jc_zcdd.zctclx='1')";
		}
		else if (ddlx.equals("72"))
		{
			wheresql+=" and  (jc_zcdd.ddlx='7' and jc_zcdd.zctclx='2')";
		}
		else if (ddlx.equals("81"))
		{
			wheresql+=" and  (jc_zcdd.ddlx='8' and jc_zcdd.zctclx='1')";
		}
		else if (ddlx.equals("AB"))
		{
			wheresql+=" and  (jc_zcdd.ddlx='A' OR jc_zcdd.zctclx='B')";
		}
		else if (!(ddlx.equals("")))
		{
			wheresql+=" and  (jc_zcdd.ddlx='"+ddlx+"')";
		}
	}

	String zczkl=null;
	zczkl=request.getParameter("zczkl");
	if (zczkl!=null)
	{
		zczkl=cf.GB2Uni(zczkl);
		if (!(zczkl.equals("")))	wheresql+=" and  (jc_zcdd.zczkl>="+zczkl+")";
	}
	zczkl=request.getParameter("zczkl2");
	if (zczkl!=null)
	{
		zczkl=cf.GB2Uni(zczkl);
		if (!(zczkl.equals("")))	wheresql+=" and  (jc_zcdd.zczkl<="+zczkl+")";
	}

	String sxhtsfysh=null;
	sxhtsfysh=request.getParameter("sxhtsfysh");
	if (sxhtsfysh!=null)
	{
		if (!(sxhtsfysh.equals("")))	wheresql+=" and  (jc_zcdd.sxhtsfysh='"+sxhtsfysh+"')";
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
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}


	String crm_khxx_wjbz=null;
	crm_khxx_wjbz=request.getParameter("crm_khxx_wjbz");
	if (crm_khxx_wjbz!=null)
	{
		if (crm_khxx_wjbz.equals("1"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4'))";
		}
		else if (crm_khxx_wjbz.equals("2"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('5'))";
		}
	}

	String ddqrsj=null;
	ddqrsj=request.getParameter("ddqrsj");
	if (ddqrsj!=null)
	{
		ddqrsj=ddqrsj.trim();
		if (!(ddqrsj.equals("")))	wheresql+="  and (jc_zcdd.ddqrsj>=TO_DATE('"+ddqrsj+"','YYYY/MM/DD'))";
	}
	ddqrsj=request.getParameter("ddqrsj2");
	if (ddqrsj!=null)
	{
		ddqrsj=ddqrsj.trim();
		if (!(ddqrsj.equals("")))	wheresql+="  and (jc_zcdd.ddqrsj<=TO_DATE('"+ddqrsj+"','YYYY/MM/DD'))";
	}

	String gysjslrsj=null;
	gysjslrsj=request.getParameter("gysjslrsj");
	if (gysjslrsj!=null)
	{
		gysjslrsj=gysjslrsj.trim();
		if (!(gysjslrsj.equals("")))	wheresql+="  and (jc_zcdd.gysjslrsj>=TO_DATE('"+gysjslrsj+"','YYYY/MM/DD'))";
	}
	gysjslrsj=request.getParameter("gysjslrsj2");
	if (gysjslrsj!=null)
	{
		gysjslrsj=gysjslrsj.trim();
		if (!(gysjslrsj.equals("")))	wheresql+="  and (jc_zcdd.gysjslrsj<=TO_DATE('"+gysjslrsj+"','YYYY/MM/DD'))";
	}


	String wjsj=null;
	wjsj=request.getParameter("wjsj");
	if (wjsj!=null)
	{
		wjsj=wjsj.trim();
		if (!(wjsj.equals("")))	wheresql+="  and (jc_zcdd.wjsj>=TO_DATE('"+wjsj+"','YYYY/MM/DD'))";
	}
	wjsj=request.getParameter("wjsj2");
	if (wjsj!=null)
	{
		wjsj=wjsj.trim();
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
		if (!(khbh.equals("")))	wheresql+=" and  (jc_zcdd.khbh='"+khbh+"')";
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
	String ordersql=" order by jc_zcdd.ddlx,"+jgpx1;
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
		ls_sql="SELECT jc_zcdd.ddbh,clztmc,DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','��������','A','��������','B','��������շ�','C','ѡ������','D','�ײ�������','E','ɢ��'),zctcmc,DECODE(jc_zcdd.sfjrht,'Y','����','N','������') sfjrht,DECODE(jc_zcdd.sfjs,'N','δ����','C','��ѡ�����','Y','�ѽ���','M','���������','F','���㸶��','P','�������') sfjs,crm_khxx.khxm,ppbm,ppmc,ysgcjdmc,gys,zcdlbm,zcxlbm,crm_khxx.hth,crm_khxx.fwdz,cxhdbm,crm_khxx.sjs,c.dwmc dm,crm_khxx.sgbz,sq_bzxx.dh,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,TO_CHAR(jc_zcdd.zczkl) zczkl,jc_zcdd.dzyy,jc_zcdd.zsje,jc_zcdd.zjxzsje,jc_zcdd.wdzje,jc_zcdd.hkze,jc_zcdd.zqclf,jc_zcdd.zhclf,jc_zcdd.ycf,jc_zcdd.qtycf,jc_zcdd.qtf,jc_zcdd.htcxhdje,0 htyjjrje,jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.zqzjxclf,jc_zcdd.zhzjxclf,jc_zcdd.zjxycf,jc_zcdd.zjxqtf,jc_zcdd.zjxcxhdje,0 zjxyjjrje,jc_zcdd.wdzje+jc_zcdd.zqzjhze,jc_zcdd.hkze+jc_zcdd.zjhze,jc_zcdd.zqclf+jc_zcdd.zqzjxclf,jc_zcdd.zhclf+jc_zcdd.zhzjxclf,jc_zcdd.ycf+jc_zcdd.zjxycf,jc_zcdd.qtf+jc_zcdd.zjxqtf,jc_zcdd.htcxhdje+jc_zcdd.zjxcxhdje,0 jryjhj,jc_zcdd.tdsm,jc_zcdd.qhtsj,jc_zcdd.ddqrsj,jc_zcdd.htshsj,jc_zcdd.jhshsj,jc_zcdd.tzshsj,jc_zcdd.sshsj,jc_zcdd.wjsj,tzry,shqk, DECODE(jc_zcdd.ddshbz,'1','�������','2','����δ֪ͨ','3','������֪ͨ'),DECODE(jc_zcdd.xclbz,'1','�Ƕ���','2','����ʽ��Ʒ'),jc_zcdd.lrr,jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.khbh,jc_zcdd.jssj,jc_zcdd.zjxxh,jc_zcdd.bz";
		ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,sq_dwxx c ,jdm_zcddzt,sq_bzxx,dm_gcjdbm ";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and jc_zcdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=c.dwbh(+)";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
		ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
		ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
		ls_sql+=" and jc_zcdd.clzt>='13' and jc_zcdd.clzt not in('98')";

		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from jxc_ppgysdzb where gysbm='"+ygbh+"' )";
		
		ls_sql+=wheresql;
		ls_sql+=ordersql;
		pageObj.sql=ls_sql;
	//���ж����ʼ��
		pageObj.initPage("Jc_zcddCxList.jsp","","","/jcjj/dygl/zcht1.jsp");
		pageObj.setEditStr("��ӡ");
		pageObj.setPageRow(Integer.parseInt(myxssl));
	}
	else{
		ls_sql="SELECT jc_zcdd.ddbh,clztmc,DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','��������','A','��������','B','��������շ�','C','ѡ������','D','�ײ�������','E','ɢ��'),zctcmc,DECODE(jc_zcdd.sfjrht,'Y','����','N','������') sfjrht,DECODE(jc_zcdd.sfjs,'N','δ����','C','��ѡ�����','Y','�ѽ���','M','���������','F','���㸶��','P','�������') sfjs,crm_khxx.khxm,ppbm,ppmc,ysgcjdmc,gys,zcdlbm,zcxlbm,crm_khxx.hth,crm_khxx.fwdz,cxhdbm,crm_khxx.sjs,c.dwmc dm,crm_khxx.sgbz,sq_bzxx.dh,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,TO_CHAR(jc_zcdd.zczkl) zczkl,jc_zcdd.dzyy,jc_zcdd.zsje,jc_zcdd.zjxzsje,jc_zcdd.wdzje,jc_zcdd.hkze,jc_zcdd.zqclf,jc_zcdd.zhclf,jc_zcdd.ycf,jc_zcdd.qtycf,jc_zcdd.qtf,jc_zcdd.htcxhdje,jc_zcdd.htyjjrje,jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.zqzjxclf,jc_zcdd.zhzjxclf,jc_zcdd.zjxycf,jc_zcdd.zjxqtf,jc_zcdd.zjxcxhdje,jc_zcdd.zjxyjjrje,jc_zcdd.wdzje+jc_zcdd.zqzjhze,jc_zcdd.hkze+jc_zcdd.zjhze,jc_zcdd.zqclf+jc_zcdd.zqzjxclf,jc_zcdd.zhclf+jc_zcdd.zhzjxclf,jc_zcdd.ycf+jc_zcdd.zjxycf,jc_zcdd.qtf+jc_zcdd.zjxqtf,jc_zcdd.htcxhdje+jc_zcdd.zjxcxhdje,jc_zcdd.htyjjrje+jc_zcdd.zjxyjjrje,jc_zcdd.tdsm,jc_zcdd.qhtsj,jc_zcdd.ddqrsj,jc_zcdd.htshsj,jc_zcdd.jhshsj,jc_zcdd.tzshsj,jc_zcdd.sshsj,jc_zcdd.wjsj,tzry,shqk, DECODE(jc_zcdd.ddshbz,'1','�������','2','����δ֪ͨ','3','������֪ͨ'),DECODE(jc_zcdd.xclbz,'1','�Ƕ���','2','����ʽ��Ʒ'),jc_zcdd.lrr,jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.khbh,jc_zcdd.jssj,jc_zcdd.zjxxh,jc_zcdd.bz";
		ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,sq_dwxx c ,jdm_zcddzt,sq_bzxx,dm_gcjdbm ";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and jc_zcdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=c.dwbh(+)";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
		ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
		ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";

		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

		if (zwbm.equals("08"))//08:�Ҿӹ���
		{
			ls_sql+=" and (jc_zcdd.clgw='"+yhmc+"' OR jc_zcdd.ztjjgw='"+yhmc+"' OR jc_zcdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("12"))//12:�Ҿ����ʦ
		{
			ls_sql+=" and (jc_zcdd.jjsjs='"+yhmc+"' OR jc_zcdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("10"))//10:��ĿרԱ
		{
			ls_sql+=" and (jc_zcdd.xmzy='"+yhmc+"' OR jc_zcdd.lrr='"+yhmc+"')";
		}
		ls_sql+=wheresql;
		ls_sql+=ordersql;
		pageObj.sql=ls_sql;
	//���ж����ʼ��
		pageObj.initPage("Jc_zcddCxList.jsp","","","/jcjj/dygl/DyZcHt.jsp");
		pageObj.setEditStr("��ӡ");
		pageObj.setPageRow(Integer.parseInt(myxssl));
	}

//	out.println(ls_sql);

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"�ϲ���ӡ����"};//��ť����ʾ����
	String[] buttonLink={"/jcjj/dygl/zcddhbdy.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
    
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	if (!yhjs.equals("G0"))
	{
		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey1={"khbh"};//�����в�����coluParm.key������
		coluParm.key=coluKey1;//�����в�����coluParm.key������
		coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("khxm",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��
	}
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<title>��ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���Ķ�����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(970);
%>

<tr bgcolor="#CCCCCC"  align="center">
    <td  width="55px">&nbsp;</td>
   	<td  width="60px">�������</td>
	<td  width="80px">����״̬</td>
	<td  width="80px">��������</td>
	<td  width="80px">�ײ�����</td>
	<td  width="55px">�Ƿ�����װ��ͬ</td>
	<td  width="60px">�Ƿ��ѽ���</td>
	<td  width="80px">�ͻ�����</td>
	<td  width="160px">��Ʒ��</td>
	<td  width="120px">Ʒ��</td>
	<td  width="110px">���̽���</td>
	<td  width="3%">��Ӧ��</td>
	<td  width="120px">���Ĵ���</td>
	<td  width="120px">����С��</td>
	<td  width="70px">��ͬ��</td>
	<td  width="3%">���ݵ�ַ</td>
	<td  width="2%">�μӴ����</td>
	<td  width="60px">��װ���ʦ</td>
	<td  width="120px">ǩԼ����</td>
	<td  width="60px">ʩ���೤</td>
	<td  width="170px">�೤�绰</td>
	<td  width="60px">פ��Ҿӹ���</td>
	<td  width="60px">չ���Ҿӹ���</td>
	<td  width="60px">��ĿרԱ</td>
	<td  width="60px">�Ҿ����ʦ</td>
	<td  width="50px">�ۿ���</td>
	<td  width="300px">����ԭ��</td>
	<td  width="90px"><strong>��ͬ���Ͷ�</strong></td>
	<td  width="90px"><strong>���������Ͷ�</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>��ͬ��-��ǰ</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong><font color="#0000CC">��ͬ��-�ۺ�</font></strong></td>

	<td  width="90px" bgcolor="#99FFFF"><strong>��ͬ���Ϸ�-��ǰ</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong><font color="#0000CC">��ͬ���Ϸ�-�ۺ�</font></strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>��ͬԶ�̷�</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>�ײͶ���Զ�̷�</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>��ͬ������</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>��ͬ�������</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>��ͬҵ��������</strong></td>


	<td  width="90px"><strong>������-��ǰ</strong></td>
	<td  width="90px"><strong><font color="#0000CC">������-�ۺ�</font></strong></td>

	<td  width="90px"><strong>��������Ϸ�-��ǰ</strong></td>
	<td  width="90px"><strong><font color="#0000CC">��������Ϸ�-�ۺ�</font></strong></td>
	<td  width="90px"><strong>������Զ�̷�</strong></td>
	<td  width="90px"><strong>������������</strong></td>
	<td  width="90px"><strong>������������</strong></td>
	<td  width="90px"><strong>������ҵ��������</strong></td>
	
	<td  width="90px" bgcolor="#FFFFCC"><strong>ȫ���ܶ�-��ǰ</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong><font color="#0000CC">ȫ���ܶ�-��ǰ</font></strong></td>


	<td  width="90px" bgcolor="#FFFFCC"><strong>���Ϸ��ܼ�-��ǰ</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong><font color="#0000CC">���Ϸ��ܼ�-�ۺ�</font></strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>Զ�̷��ܼ�</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>�������ܼ�</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>�����ܶ�</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>ҵ�������ܶ�</strong></td>
	
	<td  width="2%">�˵�˵��</td>
	<td  width="65px">ǩ��ͬʱ��</td>
	<td  width="65px">����ȷ��ʱ��</td>
	<td  width="65px">��ͬ�ͻ�ʱ��</td>
	<td  width="65px">�ƻ��ͻ�ʱ��</td>
	<td  width="65px">���ͻ�֪ͨʱ��</td>
	<td  width="65px">ʵ�ͻ�ʱ��</td>
	<td  width="65px">���ʱ��</td>
	<td  width="80px">֪ͨ��Ա</td>
	<td  width="320px">�ͻ����</td>
	<td  width="80px">�ȴ��ͻ�֪ͨ</td>
	<td  width="80px">��Ʒ����</td>
	<td  width="45px">¼����</td>
	<td  width="65px">¼��ʱ��</td>
	<td  width="110px">¼�벿��</td>
	<td  width="50px">�ͻ����</td>
	<td  width="65px">����ʱ��</td>
	<td  width="65px">�˲������</td>
	<td  width="310px">��ע</td>
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