<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"170706")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

</head>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<CENTER >
  <B><font size="3">�ͻ�̨�˲�ѯ</font></B>
</CENTER>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������



	String wheresql="";
	String crm_khxx_khbh=null;
	String crm_khxx_cqbm=null;

	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qye=null;

	String crm_khxx_qyrq=null;
	String crm_khxx_kgrq=null;
	String crm_khxx_sjkgrq=null;
	String jhwgsj=null;

	String crm_khxx_jgrq=null;
	String crm_khxx_sjjgrq=null;

	String crm_khxx_gcjdbm=null;
	String ybysxmbm=null;
	String zqysxmbm=null;
	String crm_khxx_dwbh=null;

	String crm_khxx_pdclzt=null;
	String crm_khxx_pdsj=null;
	String zzsgd=null;
	String crm_khxx_sgd=null;
	String cxbz=null;
	String crm_khxx_sgbz=null;

	String crm_khxx_zjxm=null;

	String crm_khxx_hdbz=null;

	String crm_khxx_zt=null;
	String crm_khxx_khlxbm=null;
	String crm_khxx_lrsj=null;
	
	
	String sfyywy=request.getParameter("sfyywy");
	if(sfyywy!=null)
	{
		if (sfyywy.equals("Y"))
		{
			wheresql+=" and (crm_khxx.ywy is not null)";
		}
		else{
			wheresql+=" and (crm_khxx.ywy is null)";
		}
	}


	String gdjsjd=null;
	gdjsjd=request.getParameter("gdjsjd");
	if (gdjsjd!=null)
	{
		gdjsjd=cf.GB2Uni(gdjsjd);
		if (!(gdjsjd.equals("")))	wheresql+=" and  (crm_khxx.gdjsjd='"+gdjsjd+"')";
	}

	
	String khjsbz=null;
	khjsbz=request.getParameter("khjsbz");
	if (khjsbz!=null)
	{
		khjsbz=cf.GB2Uni(khjsbz);
		if (khjsbz.equals("N"))
		{
			wheresql+=" and  (crm_khxx.khjsbz in('N','3'))";
		}
		else {
			wheresql+=" and  (crm_khxx.khjsbz not in('N','3'))";
		}
	}
	
	String zzbz=null;
	zzbz=request.getParameter("zzbz");
	if (zzbz!=null)
	{
		zzbz=cf.GB2Uni(zzbz);
		if (!(zzbz.equals("")))	wheresql+=" and  (bdm_bjjbbm.zzbz='"+zzbz+"')";
	}
	
	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (bdm_bjjbbm.lx='"+lx+"')";
	}
	
	String jzwkqs=null;
	jzwkqs=request.getParameter("jzwkqs");
	if (jzwkqs!=null)
	{
		jzwkqs=cf.GB2Uni(jzwkqs);
		if (!(jzwkqs.equals("")))	wheresql+=" and  (crm_khxx.jzwkqs='"+jzwkqs+"')";
	}
	
	String ysy=null;
	ysy=request.getParameter("ysy");
	if (ysy!=null)
	{
		ysy=cf.GB2Uni(ysy);
		if (!(ysy.equals("")))	wheresql+=" and  (crm_khxx.ysy='"+ysy+"')";
	}

	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_khxx.khjl='"+khjl+"')";
	}
	String clgw=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (crm_khxx.clgw='"+clgw+"')";
	}

	String sgdlx=null;
	sgdlx=request.getParameter("sgdlx");
	if (sgdlx!=null)
	{
		sgdlx=cf.GB2Uni(sgdlx);
		if (!(sgdlx.equals("")))	wheresql+=" and  (sq_sgd.sgdlx='"+sgdlx+"')";
	}
	String smhtbh=null;
	smhtbh=request.getParameter("smhtbh");
	if (smhtbh!=null)
	{
		smhtbh=cf.GB2Uni(smhtbh);
		if (!(smhtbh.equals("")))	wheresql+=" and  (crm_khxx.smhtbh='"+smhtbh+"')";
	}

	String crm_khxx_khxm=null;
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	String crm_khxx_khxm2=null;
	crm_khxx_khxm2=request.getParameter("crm_khxx_khxm2");
	if (crm_khxx_khxm2!=null)
	{
		crm_khxx_khxm2=cf.GB2Uni(crm_khxx_khxm2);
		if (!(crm_khxx_khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm2+"%')";
	}
	String crm_khxx_fwdz=null;
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	String crm_khxx_fwdz2=null;
	crm_khxx_fwdz2=request.getParameter("crm_khxx_fwdz2");
	if (crm_khxx_fwdz2!=null)
	{
		crm_khxx_fwdz2=cf.GB2Uni(crm_khxx_fwdz2);
		if (!(crm_khxx_fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz2+"%')";
	}
	String crm_khxx_lxfs=null;
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	String crm_khxx_lxfs2=null;
	crm_khxx_lxfs2=request.getParameter("crm_khxx_lxfs2");
	if (crm_khxx_lxfs2!=null)
	{
		crm_khxx_lxfs2=cf.GB2Uni(crm_khxx_lxfs2);
		if (!(crm_khxx_lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs2+"%')";
	}


	String sfysbx=null;
	sfysbx=request.getParameter("sfysbx");
	if (sfysbx!=null)
	{
		if (!(sfysbx.equals("")))	wheresql+=" and  (crm_khxx.sfysbx='"+sfysbx+"')";
	}
	String bxkssj=null;
	bxkssj=request.getParameter("bxkssj");
	if (bxkssj!=null)
	{
		if (!(bxkssj.equals("")))	wheresql+="  and (crm_khxx.bxkssj>=TO_DATE('"+bxkssj+"','YYYY/MM/DD'))";
	}
	bxkssj=request.getParameter("bxkssj2");
	if (bxkssj!=null)
	{
		if (!(bxkssj.equals("")))	wheresql+="  and (crm_khxx.bxkssj<=TO_DATE('"+bxkssj+"','YYYY/MM/DD'))";
	}

	String bxjzsj=null;
	bxjzsj=request.getParameter("bxjzsj");
	if (bxjzsj!=null)
	{
		if (!(bxjzsj.equals("")))	wheresql+="  and (crm_khxx.bxjzsj>=TO_DATE('"+bxjzsj+"','YYYY/MM/DD'))";
	}
	bxjzsj=request.getParameter("bxjzsj2");
	if (bxjzsj!=null)
	{
		if (!(bxjzsj.equals("")))	wheresql+="  and (crm_khxx.bxjzsj<=TO_DATE('"+bxjzsj+"','YYYY/MM/DD'))";
	}


	String sffj=null;
	sffj=request.getParameter("sffj");
	if (sffj!=null)
	{
		if (!(sffj.equals("")))	wheresql+=" and  (crm_khxx.sffj='"+sffj+"')";
	}

	String sfyrz=null;
	sfyrz=request.getParameter("sfyrz");
	if (sfyrz!=null)
	{
		if (!(sfyrz.equals("")))	wheresql+=" and  (crm_khxx.sfyrz='"+sfyrz+"')";
	}
	
	String xjf=null;
	xjf=request.getParameter("xjf");
	if (xjf!=null)
	{
		xjf=cf.GB2Uni(xjf);
		if (!(xjf.equals("")))	wheresql+=" and  (crm_khxx.xjf='"+xjf+"')";
	}
	String fwmj=null;
	fwmj=request.getParameter("fwmj");
	if (fwmj!=null)
	{
		fwmj=cf.GB2Uni(fwmj);
		if (!(fwmj.equals("")))	wheresql+=" and  (crm_khxx.fwmj='"+fwmj+"')";
	}
	String bjjb=null;
	bjjb=request.getParameter("bjjb");
	if (bjjb!=null)
	{
		bjjb=cf.GB2Uni(bjjb);
		if (!(bjjb.equals("")))	wheresql+=" and  (crm_khxx.bjjb='"+bjjb+"')";
	}

	String rzsc=null;
	rzsc=request.getParameter("rzsc");
	if (rzsc!=null)
	{
		if (!(rzsc.equals("")))	wheresql+=" and  (crm_khxx.rzsc='"+rzsc+"')";
	}

	String sftd=null;
	sftd=request.getParameter("sftd");
	if (sftd!=null)
	{
		if (sftd.equals("1"))	
		{
			wheresql+=" and  (crm_khxx.zt='3')";
		}
		else if (sftd.equals("2"))	
		{
			wheresql+=" and  (crm_khxx.zt!='3')";
		}
	}

	String dalqbz=null;
	dalqbz=request.getParameter("dalqbz");
	if (dalqbz!=null)
	{
		if (!(dalqbz.equals("")))	wheresql+=" and  (crm_khxx.dalqbz='"+dalqbz+"')";
	}
	String cxhdbm=null;
	cxhdbm=request.getParameter("cxhdbm");
	if (cxhdbm!=null)
	{
		cxhdbm=cf.GB2Uni(cxhdbm);
		if (!(cxhdbm.equals("")))	wheresql+=" and  (crm_khxx.cxhdbm='"+cxhdbm+"')";
	}

	String xqbm=null;
	xqbm=request.getParameter("xqbm");
	if (xqbm!=null)
	{
		xqbm=cf.GB2Uni(xqbm);
		if (!(xqbm.equals("")))	wheresql+=" and  (crm_khxx.xqbm like '%"+xqbm+"%')";
	}
	String sfzhm=null;
	sfzhm=request.getParameter("sfzhm");
	if (sfzhm!=null)
	{
		sfzhm=cf.GB2Uni(sfzhm);
		if (!(sfzhm.equals("")))	wheresql+=" and  (crm_khxx.sfzhm='"+sfzhm+"')";
	}

	String sffk=null;
	sffk=request.getParameter("sffk");
	if (sffk!=null)
	{
		if (!(sffk.equals("")))	wheresql+=" and  (crm_khxx.sffk='"+sffk+"')";
	}
	String djkh=null;
	djkh=request.getParameter("djkh");
	if (djkh!=null)
	{
		djkh=cf.GB2Uni(djkh);
		if (!(djkh.equals("")))	wheresql+=" and  (crm_khxx.djkh='"+djkh+"')";
	}
	String fkrq=null;
	fkrq=request.getParameter("fkrq");
	if (fkrq!=null)
	{
		if (!(fkrq.equals("")))	wheresql+="  and (crm_khxx.fkrq>=TO_DATE('"+fkrq+"','YYYY/MM/DD'))";
	}
	fkrq=request.getParameter("fkrq2");
	if (fkrq!=null)
	{
		if (!(fkrq.equals("")))	wheresql+="  and (crm_khxx.fkrq<=TO_DATE('"+fkrq+"','YYYY/MM/DD'))";
	}



	String tsbz=null;
	tsbz=request.getParameter("tsbz");
	if (tsbz!=null)
	{
		if (!(tsbz.equals("")))	wheresql+=" and  (crm_khxx.tsbz='"+tsbz+"')";
	}
	String bxbz=null;
	bxbz=request.getParameter("bxbz");
	if (bxbz!=null)
	{
		if (!(bxbz.equals("")))	wheresql+=" and  (crm_khxx.bxbz='"+bxbz+"')";
	}

	String gcsfyq=null;
	gcsfyq=request.getParameter("gcsfyq");
	if (gcsfyq!=null)
	{
		gcsfyq=cf.GB2Uni(gcsfyq);
		if (!(gcsfyq.equals("")))	wheresql+=" and  (crm_khxx.gcsfyq='"+gcsfyq+"')";
	}
	String yqts=null;
	yqts=request.getParameter("yqts");
	if (yqts!=null)
	{
		if (!(yqts.equals("")))	wheresql+=" and  (crm_khxx.yqts>="+yqts+")";
	}
	yqts=request.getParameter("yqts2");
	if (yqts!=null)
	{
		if (!(yqts.equals("")))	wheresql+=" and  (crm_khxx.yqts<="+yqts+")";
	}
	String gcyqyybm=null;
	gcyqyybm=request.getParameter("gcyqyybm");
	if (gcyqyybm!=null)
	{
		gcyqyybm=cf.GB2Uni(gcyqyybm);
		if (!(gcyqyybm.equals("")))	wheresql+=" and  (crm_khxx.khbh in(select khbh from crm_gcyqyymx where gcyqyybm='"+gcyqyybm+"'))";
	}
	String yyyqts=null;
	yyyqts=request.getParameter("yyyqts");
	if (yyyqts!=null)
	{
		if (!(yyyqts.equals("")))	wheresql+=" and  (crm_gcyqyymx.yqts>="+yyyqts+")";
	}
	yyyqts=request.getParameter("yyyqts2");
	if (yyyqts!=null)
	{
		if (!(yyyqts.equals("")))	wheresql+=" and  (crm_gcyqyymx.yqts<="+yyyqts+")";
	}


	String rddqbm=null;
	rddqbm=request.getParameter("rddqbm");
	if (rddqbm!=null)
	{
		rddqbm=cf.GB2Uni(rddqbm);
		if (!(rddqbm.equals("")))	wheresql+=" and  (crm_khxx.rddqbm='"+rddqbm+"')";
	}
	String hxwzbm=null;
	hxwzbm=request.getParameter("hxwzbm");
	if (hxwzbm!=null)
	{
		hxwzbm=cf.GB2Uni(hxwzbm);
		if (!(hxwzbm.equals("")))	wheresql+=" and  (crm_khxx.hxwzbm='"+hxwzbm+"')";
	}
	String ysrbm=null;
	ysrbm=request.getParameter("ysrbm");
	if (ysrbm!=null)
	{
		ysrbm=cf.GB2Uni(ysrbm);
		if (!(ysrbm.equals("")))	wheresql+=" and  (crm_khxx.ysrbm='"+ysrbm+"')";
	}
	String nlqjbm=null;
	nlqjbm=request.getParameter("nlqjbm");
	if (nlqjbm!=null)
	{
		nlqjbm=cf.GB2Uni(nlqjbm);
		if (!(nlqjbm.equals("")))	wheresql+=" and  (crm_khxx.nlqjbm='"+nlqjbm+"')";
	}
	String zybm=null;
	zybm=request.getParameter("zybm");
	if (zybm!=null)
	{
		zybm=cf.GB2Uni(zybm);
		if (!(zybm.equals("")))	wheresql+=" and  (crm_khxx.zybm='"+zybm+"')";
	}

	String sjwjrq=null;
	sjwjrq=request.getParameter("sjwjrq");
	if (sjwjrq!=null)
	{
		if (!(sjwjrq.equals("")))	wheresql+="  and (crm_khxx.sjwjrq>=TO_DATE('"+sjwjrq+"','YYYY/MM/DD'))";
	}
	sjwjrq=request.getParameter("sjwjrq2");
	if (sjwjrq!=null)
	{
		if (!(sjwjrq.equals("")))	wheresql+="  and (crm_khxx.sjwjrq<=TO_DATE('"+sjwjrq+"','YYYY/MM/DD'))";
	}

	String yqdwgrq=null;
	yqdwgrq=request.getParameter("yqdwgrq");
	if (yqdwgrq!=null)
	{
		if (!(yqdwgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq+((crm_khxx.jgrq-crm_khxx.kgrq)+NVL(crm_khxx.hzts,0))>=TO_DATE('"+yqdwgrq+"','YYYY/MM/DD'))";
	}
	yqdwgrq=request.getParameter("yqdwgrq2");
	if (yqdwgrq!=null)
	{
		if (!(yqdwgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq+((crm_khxx.jgrq-crm_khxx.kgrq)+NVL(crm_khxx.hzts,0))<=TO_DATE('"+yqdwgrq+"','YYYY/MM/DD'))";
	}




	String crm_khxx_wjbz=null;
	crm_khxx_wjbz=request.getParameter("crm_khxx_wjbz");
	if (crm_khxx_wjbz!=null)
	{
		if (crm_khxx_wjbz.equals("1"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1'))";
		}
		else if (crm_khxx_wjbz.equals("2"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('2','3','6'))";
		}
		else if (crm_khxx_wjbz.equals("3"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','6'))";
		}
		else if (crm_khxx_wjbz.equals("4"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('4'))";
		}
		else if (crm_khxx_wjbz.equals("5"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('4','5'))";
		}
		else if (crm_khxx_wjbz.equals("6"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('2','3','4','6'))";
		}
		else if (crm_khxx_wjbz.equals("7"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4','6'))";
		}
		else if (crm_khxx_wjbz.equals("8"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('5'))";
		}
	}



	String crm_khxx_fwmj=null;
	crm_khxx_fwmj=request.getParameter("crm_khxx_fwmj");
	if (crm_khxx_fwmj!=null)
	{
		if (!(crm_khxx_fwmj.equals("")))	wheresql+=" and  (crm_khxx.fwmj>="+crm_khxx_fwmj+") ";
	}
	crm_khxx_fwmj=request.getParameter("crm_khxx_fwmj2");
	if (crm_khxx_fwmj!=null)
	{
		if (!(crm_khxx_fwmj.equals("")))	wheresql+=" and  (crm_khxx.fwmj<="+crm_khxx_fwmj+") ";
	}


	String kgzbz=null;
	kgzbz=request.getParameter("kgzbz");
	if (kgzbz!=null)
	{
		if (!(kgzbz.equals("")))	wheresql+=" and  (crm_khxx.kgzbz='"+kgzbz+"')";
	}


	
	crm_khxx_khbh=request.getParameter("crm_khxx_khbh");
	if (crm_khxx_khbh!=null)
	{
		crm_khxx_khbh=cf.GB2Uni(crm_khxx_khbh);
		if (!(crm_khxx_khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+crm_khxx_khbh+"')";
	}

	String tgbz=null;
	tgbz=request.getParameter("tgbz");
	if (tgbz!=null)
	{
		if (tgbz.equals("W"))
		{
			wheresql+=" and  (crm_khxx.tgbz is null)";
		}
		if (tgbz.equals(""))
		{
		}
		else 
		{
			wheresql+=" and  (crm_khxx.tgbz='"+tgbz+"' )";
		}
	}

	String ywybm=null;
	ywybm=request.getParameter("ywybm");
	if (ywybm!=null)
	{
		if (!(ywybm.equals("")))	wheresql+=" and  (crm_khxx.ywybm='"+ywybm+"')";
	}

	String ywyssxz=null;
	ywyssxz=request.getParameter("ywyssxz");
	if (ywyssxz!=null)
	{
		if (!(ywyssxz.equals("")))	wheresql+=" and  (crm_khxx.ywyssxz='"+ywyssxz+"')";
	}

	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_khxx.ywy='"+ywy+"')";
	}

	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	
	String sjsbh=null;
	sjsbh=request.getParameter("sjsbh");
	if (sjsbh!=null)
	{
		if (!(sjsbh.equals("")))	wheresql+=" and  (crm_khxx.sjsbh='"+sjsbh+"')";
	}

	crm_khxx_cqbm=request.getParameter("crm_khxx_cqbm");
	if (crm_khxx_cqbm!=null)
	{
		crm_khxx_cqbm=cf.GB2Uni(crm_khxx_cqbm);
		if (!(crm_khxx_cqbm.equals("")))	wheresql+=" and  (crm_khxx.cqbm='"+crm_khxx_cqbm+"')";
	}



	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
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
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq>=TO_DATE('"+crm_khxx_kgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq2");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq<=TO_DATE('"+crm_khxx_kgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjkgrq=request.getParameter("crm_khxx_sjkgrq");
	if (crm_khxx_sjkgrq!=null)
	{
		crm_khxx_sjkgrq=crm_khxx_sjkgrq.trim();
		if (!(crm_khxx_sjkgrq.equals("")))	wheresql+="  and (crm_khxx.sjkgrq>=TO_DATE('"+crm_khxx_sjkgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjkgrq=request.getParameter("crm_khxx_sjkgrq2");
	if (crm_khxx_sjkgrq!=null)
	{
		crm_khxx_sjkgrq=crm_khxx_sjkgrq.trim();
		if (!(crm_khxx_sjkgrq.equals("")))	wheresql+="  and (crm_khxx.sjkgrq<=TO_DATE('"+crm_khxx_sjkgrq+"','YYYY/MM/DD'))";
	}



	crm_khxx_jgrq=request.getParameter("crm_khxx_jgrq");
	if (crm_khxx_jgrq!=null)
	{
		crm_khxx_jgrq=crm_khxx_jgrq.trim();
		if (!(crm_khxx_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq>=TO_DATE('"+crm_khxx_jgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_jgrq=request.getParameter("crm_khxx_jgrq2");
	if (crm_khxx_jgrq!=null)
	{
		crm_khxx_jgrq=crm_khxx_jgrq.trim();
		if (!(crm_khxx_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq<=TO_DATE('"+crm_khxx_jgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjjgrq=request.getParameter("crm_khxx_sjjgrq");
	if (crm_khxx_sjjgrq!=null)
	{
		crm_khxx_sjjgrq=crm_khxx_sjjgrq.trim();
		if (!(crm_khxx_sjjgrq.equals("")))	wheresql+="  and (crm_khxx.sjjgrq>=TO_DATE('"+crm_khxx_sjjgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjjgrq=request.getParameter("crm_khxx_sjjgrq2");
	if (crm_khxx_sjjgrq!=null)
	{
		crm_khxx_sjjgrq=crm_khxx_sjjgrq.trim();
		if (!(crm_khxx_sjjgrq.equals("")))	wheresql+="  and (crm_khxx.sjjgrq<=TO_DATE('"+crm_khxx_sjjgrq+"','YYYY/MM/DD'))";
	}









	crm_khxx_gcjdbm=request.getParameter("crm_khxx_gcjdbm");
	if (crm_khxx_gcjdbm!=null)
	{
		crm_khxx_gcjdbm=cf.GB2Uni(crm_khxx_gcjdbm);
		if (!(crm_khxx_gcjdbm.equals("")))	wheresql+=" and  (crm_khxx.gcjdbm='"+crm_khxx_gcjdbm+"')";
	}
	ybysxmbm=request.getParameter("ybysxmbm");
	if (ybysxmbm!=null)
	{
		ybysxmbm=cf.GB2Uni(ybysxmbm);
		if (!(ybysxmbm.equals("")))	wheresql+=" and  (crm_khxx.ybysxmbm='"+ybysxmbm+"')";
	}
	zqysxmbm=request.getParameter("zqysxmbm");
	if (zqysxmbm!=null)
	{
		zqysxmbm=cf.GB2Uni(zqysxmbm);
		if (!(zqysxmbm.equals("")))	wheresql+=" and  (crm_khxx.zqysxmbm='"+zqysxmbm+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}



	crm_khxx_pdclzt=request.getParameter("crm_khxx_pdclzt");
	if (crm_khxx_pdclzt!=null)
	{
		crm_khxx_pdclzt=cf.GB2Uni(crm_khxx_pdclzt);
		if (!(crm_khxx_pdclzt.equals("")))	wheresql+=" and  (crm_khxx.pdclzt='"+crm_khxx_pdclzt+"')";
	}
	crm_khxx_pdsj=request.getParameter("crm_khxx_pdsj");
	if (crm_khxx_pdsj!=null)
	{
		crm_khxx_pdsj=crm_khxx_pdsj.trim();
		if (!(crm_khxx_pdsj.equals("")))	wheresql+="  and (crm_khxx.pdsj>=TO_DATE('"+crm_khxx_pdsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_pdsj=request.getParameter("crm_khxx_pdsj2");
	if (crm_khxx_pdsj!=null)
	{
		crm_khxx_pdsj=crm_khxx_pdsj.trim();
		if (!(crm_khxx_pdsj.equals("")))	wheresql+="  and (crm_khxx.pdsj<=TO_DATE('"+crm_khxx_pdsj+"','YYYY/MM/DD'))";
	}

	zzsgd=request.getParameter("zzsgd");
	if (zzsgd!=null)
	{
		if (!(zzsgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+zzsgd+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	cxbz=request.getParameter("cxbz");
	if (cxbz!=null)
	{
		if (!(cxbz.equals("")))	wheresql+=" and  (sq_sgd.cxbz='"+cxbz+"')";
	}
	crm_khxx_sgbz=request.getParameter("crm_khxx_sgbz");
	if (crm_khxx_sgbz!=null)
	{
		crm_khxx_sgbz=cf.GB2Uni(crm_khxx_sgbz);
		if (!(crm_khxx_sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+crm_khxx_sgbz+"')";
	}

	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}





	crm_khxx_hdbz=request.getParameter("crm_khxx_hdbz");
	if (crm_khxx_hdbz!=null)
	{
		crm_khxx_hdbz=cf.GB2Uni(crm_khxx_hdbz);
		if (!(crm_khxx_hdbz.equals("")))	wheresql+=" and  (crm_khxx.hdbz='"+crm_khxx_hdbz+"')";
	}




	crm_khxx_zt=request.getParameter("crm_khxx_zt");
	if (crm_khxx_zt!=null)
	{
		crm_khxx_zt=cf.GB2Uni(crm_khxx_zt);
		if (!(crm_khxx_zt.equals("")))	wheresql+=" and  (crm_khxx.zt='"+crm_khxx_zt+"')";
	}
	crm_khxx_khlxbm=request.getParameter("crm_khxx_khlxbm");
	if (crm_khxx_khlxbm!=null)
	{
		crm_khxx_khlxbm=cf.GB2Uni(crm_khxx_khlxbm);
		if (!(crm_khxx_khlxbm.equals("")))	wheresql+=" and  (crm_khxx.khlxbm='"+crm_khxx_khlxbm+"')";
	}


	crm_khxx_lrsj=request.getParameter("crm_khxx_lrsj");
	if (crm_khxx_lrsj!=null)
	{
		crm_khxx_lrsj=crm_khxx_lrsj.trim();
		if (!(crm_khxx_lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj>=TO_DATE('"+crm_khxx_lrsj+"','YYYY-MM-DD'))";
	}
	crm_khxx_lrsj=request.getParameter("crm_khxx_lrsj2");
	if (crm_khxx_lrsj!=null)
	{
		crm_khxx_lrsj=crm_khxx_lrsj.trim();
		if (!(crm_khxx_lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj<=TO_DATE('"+crm_khxx_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String yjjzsj=null;
	yjjzsj=request.getParameter("yjjzsj");
	if (yjjzsj!=null)
	{
		yjjzsj=yjjzsj.trim();
		if (!(yjjzsj.equals("")))	wheresql+="  and (crm_khxx.yjjzsj>=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	}
	yjjzsj=request.getParameter("yjjzsj2");
	if (yjjzsj!=null)
	{
		yjjzsj=yjjzsj.trim();
		if (!(yjjzsj.equals("")))	wheresql+="  and (crm_khxx.yjjzsj<=TO_DATE('"+yjjzsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String tdyjjzsj=null;
	tdyjjzsj=request.getParameter("tdyjjzsj");
	if (tdyjjzsj!=null)
	{
		tdyjjzsj=tdyjjzsj.trim();
		if (!(tdyjjzsj.equals("")))	wheresql+="  and (crm_khxx.tdyjjzsj>=TO_DATE('"+tdyjjzsj+"','YYYY-MM-DD'))";
	}
	tdyjjzsj=request.getParameter("tdyjjzsj2");
	if (tdyjjzsj!=null)
	{
		tdyjjzsj=tdyjjzsj.trim();
		if (!(tdyjjzsj.equals("")))	wheresql+="  and (crm_khxx.tdyjjzsj<=TO_DATE('"+tdyjjzsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String khxxglsj=request.getParameter("khxxglsj");

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


	String myxssl=null;
	myxssl=request.getParameter("myxssl");

%>


<table border="1" width="1180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="50px">���</td>
	<td  width="70px">�ͻ����</td>
	<td  width="1%">�ͻ�����</td>
	<td  width="1%">��ͬ��</td>
	<td  width="2%">���ݵ�ַ</td>
	<td  width="90px">���ʦ</td>
	<td  width="90px">�ʼ�</td>
	<td  width="90px">ʩ����</td>
	<td  width="90px">�ͻ�����</td>
	<td  width="90px">ҵ��Ա</td>
	<td  width="140px">���̽���</td>
	<td  width="100px">���ۼ���</td>
	<td  width="120px">ǩԼ����</td>
	<td  width="120px">ǩ������ҵ��ʱ��</td>
	<td  width="120px">�˵�����ҵ��ʱ��</td>
	<td  width="120px">��ͬ����</td>
	<td  width="120px">��ͬ�깤</td>
	<td  width="120px">ʵ�ʿ���</td>
	<td  width="120px">ʵ���깤</td>
	<td  width="1%">ǩԼ����</td>


	<td  width="120px">��������º�ͬ���</td>
	<td  width="120px">��ǰ����</td>
	<td  width="120px">�ۺ��ۿ�</td>
	<td  width="120px">��ͬ��</td>
	<td  width="120px">��ͬ��ֵ</td>
	<td  width="120px">��ͬҵ����ֵ</td>
	<td  width="120px">����ҵ����ֵ</td>
	<td  width="120px">���������ǰ</td>
	<td  width="120px">��������ۺ�</td>
	<td  width="120px">��Ʒ�</td>
	<td  width="120px">˰�����</td>
	<td  width="120px">˰��</td>
	<td  width="120px">����ѱ���</td>
	<td  width="120px">�����</td>
	<td  width="120px">ˮ��</td>
	<td  width="120px">�����Ѻϼ�</td>

	<td  width="120px">��ǰ������</td>
	<td  width="120px">�ۺ�������</td>
	<td  width="120px">��ͬ��ֵ���</td>
	<td  width="120px">ҵ����ֵ���</td>
	<td  width="120px">���̱����ǰ</td>
	<td  width="120px">���̱���ۺ�</td>
	<td  width="120px">��Ʒѱ��</td>
	<td  width="120px">˰����</td>
	<td  width="120px">����ѱ��</td>
	<td  width="120px">ˮ����</td>
	<td  width="120px">�ۺ󿪹�ǰ������</td>
	<td  width="120px">�ۺ�����������</td>
	<td  width="120px">�ۺ�β��������</td>
	<td  width="120px">�ܽ����</td>

	<td  width="120px">��ͬʩ���ɱ�</td>
	<td  width="120px">��ͬ����ʩ���ɱ�</td>
	<td  width="120px">��ͬ��Ʒ�ʩ���ɱ�</td>
	<td  width="120px">��ͬˮ��ɱ�</td>
	<td  width="120px">��ͬ����ʩ���ɱ�</td>

	<td  width="120px">�����ʩ���ɱ�</td>
	<td  width="120px">����󹤳�ʩ���ɱ�</td>
	<td  width="120px">�������Ʒ�ʩ���ɱ�</td>
	<td  width="120px">�����ˮ��ɱ�</td>
	<td  width="120px">���������ʩ���ɱ�</td>

	<td  width="120px">���ĺ�ͬ���</td>
	<td  width="120px">���ĺ�ͬ�ɱ�</td>
	<td  width="120px">�����������۶�</td>
	<td  width="120px">�������³ɱ�</td>
	<td  width="120px">���ĺ�ͬë��</td>
	<td  width="120px">��������ë��</td>

	<td  width="120px">��ͬë����</td>
	<td  width="120px">��ͬë����</td>
	<td  width="120px">�����ë����</td>
	<td  width="120px">�����ë����</td>
	<td  width="120px">�ͻ���ͬë����</td>
	<td  width="120px">�ͻ�����ë����</td>
	<td  width="120px">ʵ��ë����</td>

	<td  width="120px">����</td>
	<td  width="120px">һ�ڿ�</td>
	<td  width="120px">���ڿ�</td>
	<td  width="120px">���ڿ�</td>
	<td  width="120px">���ڿ�</td>
	<td  width="120px">�����տ�ϼ�</td>
	<td  width="120px">����ʵ���տ����</td>
	<td  width="120px">����Ƿ��</td>
	<td  width="120px">���Ľ���</td>
	<td  width="120px">����Ƿ��</td>
	<td  width="120px">ʵ�տ��ܺϼ�</td>
	<td  width="120px">���տ����</td>
	<td  width="120px">Ԥ���˿�</td>
	<td  width="120px">�����ҵ�����</td>
	<td  width="120px">��֧����ҵ�����</td>

	
	<td  width="120px">�������</td>
	<td  width="120px">���ڲ��Ͽ�</td>
	<td  width="120px">������Ʒ</td>
	<td  width="120px">��һ�β�����</td>
	<td  width="120px">�ڶ��β�����</td>
	<td  width="120px">���ڲ��Ͽ�</td>
	<td  width="120px">β�ڲ��Ͽ�</td>
	<td  width="120px">�����β�����</td>
	<td  width="120px">ʩ���������Ϻϼ�</td>
	<td  width="120px">ʩ�����Ѹ������</td>
	<td  width="120px">����75%����Ҫ����</td>
	<td  width="120px">����100%����Ҫ����</td>

	<td  width="120px">�����ܶ�</td>
	<td  width="120px">���ӽ������</td>
	<td  width="120px">������</td>
	<td  width="120px">�ʱ������</td>
	<td  width="120px">�ʱ�����</td>
	<td  width="120px">������</td>
	<td  width="120px">�������</td>
	<td  width="120px">�������</td>
	<td  width="120px">Ӧ�������</td>

	<td  width="120px">�Żݳɱ�</td>
	<td  width="120px">�ͻ����</td>
	<td  width="120px">���ڷ�</td>
	<td  width="120px">�����Ż�</td>

</tr>


<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	//��ͬ��
	double wdzgce_xj=0;
	double zkl_xj=0;
	double qye_xj=0;
	double htjz_xj=0;
	double yjjz_xj=0;
	double zqgczjf_xj=0;
	double zhgczjf_xj=0;
	double sjf_xj=0;
	double suijin_xj=0;

	double guanlif_xj=0;
	double zhsdlht_xj=0;
	double htqtf_xj=0;


	//������
	double zqljzjx_xj=0;
	double zhljzjx_xj=0;
	double zjxhtjz_xj=0;
	double zjxyjjz_xj=0;
	double zjxje_xj=0;
	double zhzjxje_xj=0;

	double zhsjfzjx_xj=0;
	double zjxsuijin_xj=0;
	double zjxguanlif_xj=0;
	double zhsdlzjx_xj=0;
	double kgzjx_xj=0;
	double zqzjx_xj=0;
	double wqzjx_xj=0;
	double khjsje_xj=0;

	//��ͬʩ���ɱ�
	double sgcbj_xj=0;
	double gcsgcbj_xj=0;
	double sjfsgcbj_xj=0;
	double sdsgcbj_xj=0;
	double qtfsgcbj_xj=0;

	//�����ʩ���ɱ�
	double zxsgcbj_xj=0;
	double zxgcsgcbj_xj=0;
	double zxsjfsgcbj_xj=0;
	double zxsdsgcbj_xj=0;
	double zxqtfsgcbj_xj=0;

	//����
	double zchtje_xj=0;
	double zchtcb_xj=0;
	double zczxje_xj=0;
	double zczxcb_xj=0;
	double zchtml_xj=0;
	double zczxml_xj=0;

	//ë��
	double mle_xj=0;
	double mll_xj=0;
	double zxmle_xj=0;
	double zxmll_xj=0;
	double khhtml_xj=0;
	double khzxml_xj=0;
	double sjml_xj=0;

	//����
	double dj_xj=0;
	double yqk_xj=0;
	double eqyk_xj=0;
	double sqk_xj=0;
	double siqk_xj=0;
	double cwsfke_xj=0;
	double gcskbl_xj=0;
	double gcqk_xj=0;
	double zcjk_xj=0;
	double zcqk_xj=0;
	double sskze_xj=0;
	double zskbl_xj=0;
	double yszk_xj=0;
	double jtyjtc_xj=0;
	double yfyjtc_xj=0;

	//����
	double bkjs_xj=0;
	double sqclk_xj=0;
	double gdyp_xj=0;
	double ycbgf_xj=0;
	double ecbgf_xj=0;
	double zqclk_xj=0;
	double wqclk_xj=0;
	double scbgf_xj=0;

	double jsjsze_xj=0;

	double fbj_xj=0;

	double kzbj_xj=0;
	double fkje_xj=0;
	double jlje_xj=0;
	double qtje_xj=0;
	double yfje_xj=0;

	double sgdlkhj_xj=0;
	double sgdlkbl_xj=0;
	double yfgck_xj=0;
	double yfgckall_xj=0;

	//���
	double sjftc_xj=0;
	double yhcb_xj=0;
	double khpck_xj=0;
	double yqf_xj=0;
	double jsyh_xj=0;
	
	double zxhtjz_xj=0;//���º�ͬ��ֵ
	double zxyjjz_xj=0;//����ҵ����ֵ
	
	
	

	//�ͻ�������Ϣ
	String khbh=null;
	String khxm=null;
	String hth=null;
	String fwdz=null;
	String sjs=null;
	String zjxm=null;
	String sgdmc=null;
	String getkhjl=null;
	String getywy=null;
	String ysgcjdmc=null;
	String bjjbmc=null;
	String dwmc=null;
	String qyrq=null;
	String getyjjzsj=null;
	String gettdyjjzsj=null;
	String zjxxh=null;
	String kgrq=null;
	String jgrq=null;
	String sjkgrq=null;
	String sjjgrq=null;

	//��ͬ��
	double wdzgce=0;
	double zkl=0;
	double qye=0;
	double htjz=0;
	double yjjz=0;
	double zqgczjf=0;
	double zhgczjf=0;
	double sjf=0;
	double suijinbfb=0;
	double suijin=0;
	double glfbfb=0;
	double guanlif=0;
	double zhsdlht=0;
	double htqtf=0;


	//������
	double zqljzjx=0;
	double zhljzjx=0;
	double zjxhtjz=0;
	double zjxyjjz=0;
	double zjxje=0;
	double zhzjxje=0;

	double zhsjfzjx=0;
	double zjxsuijin=0;
	double zjxguanlif=0;
	double zhsdlzjx=0;
	double kgzjx=0;
	double zqzjx=0;
	double wqzjx=0;
	double khjsje=0;

	//��ͬʩ���ɱ�
	double sgcbj=0;
	double gcsgcbj=0;
	double sjfsgcbj=0;
	double sdsgcbj=0;
	double qtfsgcbj=0;

	//�����ʩ���ɱ�
	double zxsgcbj=0;
	double zxgcsgcbj=0;
	double zxsjfsgcbj=0;
	double zxsdsgcbj=0;
	double zxqtfsgcbj=0;

	//����
	double zchtje=0;
	double zchtcb=0;
	double zczxje=0;
	double zczxcb=0;
	double zchtml=0;
	double zczxml=0;

	//ë��
	double mle=0;
	double mll=0;
	double zxmle=0;
	double zxmll=0;
	double khhtml=0;
	double khzxml=0;
	double sjml=0;

	//����
	double dj=0;
	double yqk=0;
	double eqyk=0;
	double sqk=0;
	double siqk=0;
	double cwsfke=0;
	double gcskbl=0;
	double gcqk=0;
	double zcjk=0;
	double zcqk=0;
	double sskze=0;
	double zskbl=0;
	double yszk=0;
	double jtyjtc=0;
	double yfyjtc=0;

	//����
	double bkjs=0;
	double sqclk=0;
	double gdyp=0;
	double ycbgf=0;
	double ecbgf=0;
	double zqclk=0;
	double wqclk=0;
	double scbgf=0;

	double jsjsze=0;
	double jsbl=0;
	double fbj=0;
	double kzbjbl=0;
	double kzbj=0;
	double fkje=0;
	double jlje=0;
	double qtje=0;
	double yfje=0;

	double sgdlkhj=0;
	double sgdlkbl=0;
	double yfgck=0;
	double yfgckall=0;

	//���
	double sjftc=0;
	double yhcb=0;
	double khpck=0;
	double yqf=0;
	double jsyh=0;


	String bgcolorStr=null;
	int row=0;

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,sjs,zjxm,sgdmc,khjl,ywy,ysgcjdmc,bjjbmc,qyrq,yjjzsj,tdyjjzsj,dwmc,zjxxh,kgrq,jgrq,sjkgrq,sjjgrq";
	ls_sql+=" ,wdzgce,zkl,qye,zqgczjf,zhgczjf,sjf,suijinbfb,suijin,glfbfb,guanlif,zhsdlht,zhqtsf+zhwjrqyexm htqtf";
	ls_sql+=" ,zqljzjx,zhljzjx,zjxje,zhzjxje,zhsjfzjx,zjxsuijin,zjxguanlif,zhsdlzjx";
	ls_sql+=" ,cwsfke";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,dm_gcjdbm,bdm_bjjbbm";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+)  and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) ";
	ls_sql+="and crm_khxx.zt not in ('4')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql;
	ls_sql+=ordersql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		//�ͻ�������Ϣ
		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		hth=cf.fillHtml(rs.getString("hth"));
		fwdz=rs.getString("fwdz");
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		getkhjl=cf.fillHtml(rs.getString("khjl"));
		getywy=cf.fillHtml(rs.getString("ywy"));
		ysgcjdmc=cf.fillHtml(rs.getString("ysgcjdmc"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		getyjjzsj=cf.fillHtml(rs.getDate("yjjzsj"));
		gettdyjjzsj=cf.fillHtml(rs.getDate("tdyjjzsj"));
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));

		//��ͬ��
		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		qye=rs.getDouble("qye");
		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		sjf=rs.getDouble("sjf");
		suijinbfb=rs.getDouble("suijinbfb");
		suijin=rs.getDouble("suijin");
		glfbfb=rs.getDouble("glfbfb");
		guanlif=rs.getDouble("guanlif");
		zhsdlht=rs.getDouble("zhsdlht");
		htqtf=rs.getDouble("htqtf");

		//������
		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");
		zhsjfzjx=rs.getDouble("zhsjfzjx");
		zjxsuijin=rs.getDouble("zjxsuijin");
		zjxguanlif=rs.getDouble("zjxguanlif");
		zhsdlzjx=rs.getDouble("zhsdlzjx");

		row++;

		if (row>Integer.parseInt(myxssl))
		{
			break;
		}

		//ˮ��·
		double qtsdlje=0;
		ls_sql=" SELECT sum(sfje)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and sfxmlx in('D','E')";//D��ˮ��·
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qtsdlje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		double gcsdlje=0;
		ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx  ";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" and bj_bjxmmx.xmflbm='01'";//01��ˮ�粿��
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gcsdlje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		zhsdlht=cf.round(gcsdlje+qtsdlje,2);

		htqtf=cf.round(htqtf-qtsdlje,2);
		

		//�����տ�ϼ�
		cwsfke=rs.getDouble("cwsfke");

		if ((qye+zhljzjx)==0)
		{
			gcskbl=0;
		}
		else{
			gcskbl=cf.round(cwsfke*100/(qye+zhljzjx),2);
		}
		//����Ƿ��
		gcqk=cf.round(qye+zhljzjx-cwsfke,2);
		

		
		htjz=0;//��ͬ��ֵ
		yjjz=0;//ҵ����ֵ
		double zxhtjz=0;//���º�ͬ��ֵ
		double zxyjjz=0;//����ҵ����ֵ
		sgcbj=0;//��ͬʩ���ɱ�
		zxsgcbj=0;//�����ʩ���ɱ�

		//����
		zchtje=0;//���ĺ�ͬ���
		zchtcb=0;//���ĺ�ͬ�ɱ�
		zczxje=0;//�����������۶�
		zczxcb=0;//�������³ɱ�
		zchtml=0;//���ĺ�ͬë��
		zczxml=0;//��������ë��

		//ë��
		mle=0;
		mll=0;
		zxmle=0;
		zxmll=0;
		khhtml=0;
		khzxml=0;

		//���
		yhcb=0;

		//�ͻ����
		khpck=0;
		yqf=0;
		jsyh=0;

		ls_sql=" SELECT htjz,yjjz,zxhtjz,zxyjjz,sgcbj,zxsgcbj";
		ls_sql+=" ,zchtje,zchtcb,zczxje,zczxcb,zchtml,zczxml";
		ls_sql+=" ,mle,mll,zxmle,zxmll,khhtml,khzxml";
		ls_sql+=" ,zxzsjz";
		ls_sql+=" ,khpck,yqf,jsyh";
		ls_sql+=" FROM crm_khqye";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			htjz=rs1.getDouble("htjz");
			yjjz=rs1.getDouble("yjjz");
			zxhtjz=rs1.getDouble("zxhtjz");
			zxyjjz=rs1.getDouble("zxyjjz");
			sgcbj=rs1.getDouble("sgcbj");
			zxsgcbj=rs1.getDouble("zxsgcbj");

			//����
			zchtje=rs1.getDouble("zchtje");//���ĺ�ͬ���
			zchtcb=rs1.getDouble("zchtcb");//���ĺ�ͬ�ɱ�
			zczxje=rs1.getDouble("zczxje");//�����������۶�
			zczxcb=rs1.getDouble("zczxcb");//�������³ɱ�
			zchtml=rs1.getDouble("zchtml");//���ĺ�ͬë��
			zczxml=rs1.getDouble("zczxml");//��������ë��

			//ë��
			mle=rs1.getDouble("mle");
			mll=rs1.getDouble("mll");
			zxmle=rs1.getDouble("zxmle");
			zxmll=rs1.getDouble("zxmll");
			khhtml=rs1.getDouble("khhtml");
			khzxml=rs1.getDouble("khzxml");

			//���
			yhcb=rs1.getDouble("zxzsjz");

			//�ͻ����
			khpck=rs1.getDouble("khpck");
			yqf=rs1.getDouble("yqf");
			jsyh=rs1.getDouble("jsyh");
		}
		rs1.close();
		ps1.close();


	
		zchtje=0;
		zchtcb=0;
		ls_sql="SELECT sum(hkze),sum(cbze)";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and sfjrht='Y'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09����ͬ�����
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zchtje=rs1.getDouble(1);//���ĺ�ͬ���
			zchtcb=rs1.getInt(2);//���ĺ�ͬ�ɱ�
		}
		rs1.close();
		ps1.close();

		ls_sql="SELECT sum(zjxze),sum(zjxcbze)";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and sfjrht='Y'";
		ls_sql+=" and clzt not in('00','99')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zchtje+=rs1.getDouble(1);//���ĺ�ͬ���
			zchtcb+=rs1.getInt(2);//���ĺ�ͬ�ɱ�
		}
		rs1.close();
		ps1.close();

		zchtje=cf.round(zchtje,2);
		zchtcb=cf.round(zchtcb,2);

		zczxje=0;
		zczxcb=0;
		ls_sql="SELECT sum(hkze+zjhze),sum(cbze+zjxcbze)";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and sfjrht='Y'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09����ͬ�����
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zczxje=rs1.getDouble(1);//�����������۶�
			zczxcb=rs1.getInt(2);//�������³ɱ�
		}
		rs1.close();
		ps1.close();

		khhtml=0;//�ͻ���ͬë��
		if ((zchtje+htjz)!=0)
		{
			khhtml=cf.round((zchtje-zchtcb+mle)*100/(zchtje+htjz),2);
		}

		khzxml=0;//�ͻ�����ë��
		if ((zczxje+zxhtjz)!=0)
		{
			khzxml=cf.round((zczxje-zczxcb+zxmle)*100/(zczxje+zxhtjz),2);
		}

		sjml=0;//ʵ��ë��
		if ((zczxje+zxhtjz)!=0)
		{
			sjml=cf.round((zczxje-zczxcb+zxmle-khpck-yqf-jsyh)*100/(zczxje+zxhtjz),2);
		}

		//���������������������������������������������
		zjxhtjz=cf.round(zxhtjz-htjz,2);
		zjxyjjz=cf.round(zxyjjz-yjjz,2);

		//����ǰ������
		ls_sql=" SELECT sum(zhzjze)";
		ls_sql+=" FROM crm_zjxdj";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and zjxfsjd='1'";//1�� ǰ�ڣ�2�����ڣ�3������
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			kgzjx=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//����������
		ls_sql=" SELECT sum(zhzjze)";
		ls_sql+=" FROM crm_zjxdj";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and zjxfsjd='2'";//1�� ǰ�ڣ�2�����ڣ�3������
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zqzjx=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//β��������
		ls_sql=" SELECT sum(zhzjze)";
		ls_sql+=" FROM crm_zjxdj";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and zjxfsjd='3'";//1�� ǰ�ڣ�2�����ڣ�3������
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			wqzjx=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//��ͬʩ���ɱ�+++++++++++++++++++++++++++++++++++

		//��ͬ����ʩ���ɱ�
		gcsgcbj=0;
		ls_sql="SELECT sum(ROUND(bj_gclmx.sl*bj_bjxmmx.sgcbj,2))";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gcsgcbj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();


		//��ͬ��Ʒ�ʩ���ɱ�
		sjfsgcbj=0;
		ls_sql="SELECT sum(ROUND(zqsfje*sgcbjbfb/100,2))";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx='3' ";//3����Ʒ�
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjfsgcbj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ls_sql="SELECT sum(ROUND(sfje*sgcbjbfb/100,2))";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx='3' ";//3����Ʒ�
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjfsgcbj+=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		sjfsgcbj=cf.round(sjfsgcbj,2);

		//��ͬˮ��ɱ�
		sdsgcbj=0;
		ls_sql="SELECT sum(ROUND(zqsfje*sgcbjbfb/100,2))";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx in('D','E')";//D��ˮ��·
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sdsgcbj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ls_sql="SELECT sum(ROUND(sfje*sgcbjbfb/100,2))";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx in('D','E')";//D��ˮ��·
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sdsgcbj+=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();


		ls_sql="SELECT sum(ROUND(bj_gclmx.sl*bj_bjxmmx.sgcbj,2))";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx  ";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" and bj_bjxmmx.xmflbm='01'";//01��ˮ�粿��
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sdsgcbj+=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();


		sdsgcbj=cf.round(sdsgcbj,2);

		//��ͬ����ʩ���ɱ�
		qtfsgcbj=0;
		ls_sql="SELECT sum(ROUND(zqsfje*sgcbjbfb/100,2))";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx not in('3','5','6','7','8','A','B','D','E')";
		//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qtfsgcbj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ls_sql="SELECT sum(ROUND(sfje*sgcbjbfb/100,2))";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx not in('3','5','6','7','8','A','B','D','E')";
		//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qtfsgcbj+=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		qtfsgcbj=cf.round(qtfsgcbj,2);

		
		//�����ʩ���ɱ�������������������������������������������������
		
		//����󹤳�ʩ���ɱ�
		zxgcsgcbj=0;
		if (zjxxh.equals(""))
		{
			zxgcsgcbj=gcsgcbj;
		}
		else{
			ls_sql="SELECT sum(ROUND(bj_gclmxh.sl*bj_bjxmmxh.sgcbj,2))";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zxgcsgcbj=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();
		}


		//�������Ʒ�ʩ���ɱ�
		zxsjfsgcbj=0;
		if (zjxxh.equals(""))
		{
			zxsjfsgcbj=sjfsgcbj;
		}
		else{
			ls_sql="SELECT sum(ROUND(zqsfje*sgcbjbfb/100,2))";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where bj_sfxmmxh.zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
			ls_sql+=" and sfxmlx='3' ";//3����Ʒ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zxsjfsgcbj=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			ls_sql="SELECT sum(ROUND(sfje*sgcbjbfb/100,2))";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where bj_sfxmmxh.zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
			ls_sql+=" and sfxmlx='3' ";//3����Ʒ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zxsjfsgcbj+=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			zxsjfsgcbj=cf.round(zxsjfsgcbj,2);
		}


		//�����ˮ��ɱ�
		zxsdsgcbj=0;
		if (zjxxh.equals(""))
		{
			zxsdsgcbj=sdsgcbj;
		}
		else{
			ls_sql="SELECT sum(ROUND(zqsfje*sgcbjbfb/100,2))";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where bj_sfxmmxh.zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
			ls_sql+=" and sfxmlx in('D','E')";//D��ˮ��·
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zxsdsgcbj=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			ls_sql="SELECT sum(ROUND(sfje*sgcbjbfb/100,2))";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where bj_sfxmmxh.zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
			ls_sql+=" and sfxmlx in('D','E')";//D��ˮ��·
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zxsdsgcbj+=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();


			ls_sql="SELECT sum(ROUND(bj_gclmxh.sl*bj_bjxmmxh.sgcbj,2))";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh";
			ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ls_sql+=" and bj_bjxmmxh.xmflbm='01'";//01��ˮ�粿��
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zxsdsgcbj+=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();


			zxsdsgcbj=cf.round(zxsdsgcbj,2);
		}


		//���������ʩ���ɱ�
		zxqtfsgcbj=0;
		if (zjxxh.equals(""))
		{
			zxqtfsgcbj=qtfsgcbj;
		}
		else{
			ls_sql="SELECT sum(ROUND(zqsfje*sgcbjbfb/100,2))";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where bj_sfxmmxh.zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
			ls_sql+=" and sfxmlx not in('3','5','6','7','8','A','B','D','E')";
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zxqtfsgcbj=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			ls_sql="SELECT sum(ROUND(sfje*sgcbjbfb/100,2))";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where bj_sfxmmxh.zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
			ls_sql+=" and sfxmlx not in('3','5','6','7','8','A','B','D','E')";
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zxqtfsgcbj+=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			zxqtfsgcbj=cf.round(zxqtfsgcbj,2);
		}



		//���񣫣���������������������������������������������
		
		//����
		dj=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ls_sql+=" and fklxbm='52'";//52����������
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			dj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		
		//һ�ڿ�
		yqk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ls_sql+=" and fklxbm='11' and fkcs=1";//11����װ��
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yqk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		
		//���ڿ�
		eqyk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ls_sql+=" and fklxbm='11' and fkcs=2";//11����װ��
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			eqyk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		
		//���ڿ�
		sqk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ls_sql+=" and fklxbm='11' and fkcs=3";//11����װ��
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sqk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		
		//���ڿ�
		siqk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ls_sql+=" and fklxbm='11' and fkcs=4";//11����װ��
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			siqk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//���Ľ���
		zcjk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ls_sql+=" and fklxbm in('23','34')";//23:����
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zcjk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//����Ƿ��
		zcqk=0;
		zcqk=cf.round(zczxje-zcjk,2);

		//ʵ�տ��ܺϼ�=��װ+����
		sskze=cf.round(zcjk+cwsfke,2);

		//���տ����
		zskbl=0;
		if ((qye+zhljzjx+zczxje)==0)
		{
			zskbl=0;
		}
		else{
			zskbl=cf.round(sskze*100/(qye+zhljzjx+zczxje),2);
		}


		//Ԥ���˿�
		yszk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ls_sql+=" and fklxbm in('61','62')";//61����װԤ���62������Ԥ����
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yszk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();


		//�����ҵ�����
		jtyjtc=0;
		//��֧����ҵ�����
		yfyjtc=0;
		
		
		
		//���㣫����������������������������������������������
		//�������
		bkjs=0;
		ls_sql="select jsjsze";
		ls_sql+=" from  cw_sgdzqjs";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" order by jsjlh desc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			bkjs=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (bkjs==0)//���Ϊ0ȡ����ʩ���ɱ���
		{
			bkjs=zxsgcbj;//�������=���¹���ʩ���ɱ���
		}
		

		

		
		//���ڲ��Ͽ�
		sqclk=0;
		ls_sql="select sum(pszje)";
		ls_sql+=" from  jxc_clpsd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and fclb in('1')";//1��������2�����ϣ�3�����ڣ�4���˵�
		ls_sql+=" and psdzt in('2','3','5')";
		//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����������޸ģ�7������
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sqclk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		
		//������Ʒ
		gdyp=0;
		ls_sql="select sum(je)";
		ls_sql+=" from  cw_gdyplyjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N'";//0��δ���㣻1���ѽ���
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gdyp=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		
		//��һ�β�����
		ycbgf=0;
		ls_sql="select sum(sjbk)";
		ls_sql+=" from  cw_sgdzqjs";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and lx in('A','B','C')";//A	���Ե�һ�β�����;B	��һ�β�����;C	��һ�β����������
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ycbgf=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		
		//�ڶ��β�����
		ecbgf=0;
		ls_sql="select sum(sjbk)";
		ls_sql+=" from  cw_sgdzqjs";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and lx in('D','E','F')";//D	���Եڶ��β�����;E	�ڶ��β�����;F	�ڶ��β����������

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ecbgf=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		
		//���ڲ��Ͽ�
		zqclk=0;
		ls_sql="select sum(pszje)";
		ls_sql+=" from  jxc_clpsd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and fclb in('3')";//1��������2�����ϣ�3�����ڣ�4���˵�
		ls_sql+=" and psdzt in('2','3','5')";
		//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����������޸ģ�7������
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zqclk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		
		//β�ڲ��Ͽ�
		wqclk=0;
		ls_sql="select sum(pszje)";
		ls_sql+=" from  jxc_clpsd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and fclb in('2')";//1��������2�����ϣ�3�����ڣ�4���˵�
		ls_sql+=" and psdzt in('2','3','5')";
		//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����������޸ģ�7������
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			wqclk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		
		//�����β�����
		scbgf=0;
		ls_sql="select sum(sjbk)";
		ls_sql+=" from  cw_sgdzqjs";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and lx in('G','H','I')";//G	���Ե����β�����;H	�����β�����;I	�����β����������

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			scbgf=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//�깤���㲦����
		yfje=0;
		ls_sql="select sum(yfje)";
		ls_sql+=" from  cw_sgdwgjs";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yfje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		jsjsze=0;
		jsbl=0;
		fbj=0;
		kzbjbl=0;
		kzbj=0;
		fkje=0;
		jlje=0;
		qtje=0;
		yfje=0;

		ls_sql="select jsjsze,jsbl+tzjsbl,jsje,kzbjbl,kzbj,fkje,jlje,qtje,yfje";
		ls_sql+=" from  cw_sgdwgjs";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jsjsze=rs1.getDouble(1);
			jsbl=rs1.getDouble(2);
			fbj=rs1.getDouble(3);
			kzbjbl=rs1.getDouble(4);
			kzbj=rs1.getDouble(5);
			fkje=rs1.getDouble(6);
			jlje=rs1.getDouble(7);
			qtje=rs1.getDouble(8);
			yfje=rs1.getDouble(9);
		}
		rs1.close();
		ps1.close();

	


		//ʩ���������Ϻϼ�
		sgdlkhj=0;
		ls_sql="select sum(pszje)";
		ls_sql+=" from  jxc_clpsd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and psdzt in('2','3','5')";
		//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����������޸ģ�7������
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sgdlkhj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		sgdlkhj=cf.round(sgdlkhj+gdyp+ycbgf+ecbgf+scbgf,2);
	
		//ʩ�����Ѹ������
		sgdlkbl=0;

		if (bkjs!=0)
		{
			sgdlkbl=cf.round(sgdlkhj*100/bkjs,2);
		}
		
		//����75%����Ҫ����
		yfgck=0;
		yfgck=cf.round(bkjs*0.75,2)-sgdlkhj;
		yfgck=cf.round(yfgck,2);
		
		//����100%����Ҫ����
		yfgckall=0;
		yfgckall=zxsgcbj-sgdlkhj;
		yfgckall=cf.round(yfgckall,2);
		
		
		//��ɣ�����������������������������������������������
		sjftc=0;
		
		

		//��ͬ��
		wdzgce_xj+=wdzgce;


		qye_xj+=qye;

		htjz_xj+=htjz;
		yjjz_xj+=yjjz;
		zqgczjf_xj+=zqgczjf;
		zhgczjf_xj+=zhgczjf;
		sjf_xj+=sjf;


		suijin_xj+=suijin;


		guanlif_xj+=guanlif;
		zhsdlht_xj+=zhsdlht;
		htqtf_xj+=htqtf;


		//������
		zqljzjx_xj+=zqljzjx;
		zhljzjx_xj+=zhljzjx;
		zjxhtjz_xj+=zjxhtjz;
		zjxyjjz_xj+=zjxyjjz;
		zjxje_xj+=zjxje;
		zhzjxje_xj+=zhzjxje;

		zhsjfzjx_xj+=zhsjfzjx;
		zjxsuijin_xj+=zjxsuijin;
		zjxguanlif_xj+=zjxguanlif;
		zhsdlzjx_xj+=zhsdlzjx;
		kgzjx_xj+=kgzjx;
		zqzjx_xj+=zqzjx;
		wqzjx_xj+=wqzjx;
		khjsje_xj+=khjsje;

		//��ͬʩ���ɱ�
		sgcbj_xj+=sgcbj;
		gcsgcbj_xj+=gcsgcbj;
		sjfsgcbj_xj+=sjfsgcbj;
		sdsgcbj_xj+=sdsgcbj;
		qtfsgcbj_xj+=qtfsgcbj;

		//�����ʩ���ɱ�
		zxsgcbj_xj+=zxsgcbj;
		zxgcsgcbj_xj+=zxgcsgcbj;
		zxsjfsgcbj_xj+=zxsjfsgcbj;
		zxsdsgcbj_xj+=zxsdsgcbj;
		zxqtfsgcbj_xj+=zxqtfsgcbj;

		//����
		zchtje_xj+=zchtje;
		zchtcb_xj+=zchtcb;
		zczxje_xj+=zczxje;
		zczxcb_xj+=zczxcb;


		//ë��
		mle_xj+=mle;


		zxmle_xj+=zxmle;


		//����
		dj_xj+=dj;
		yqk_xj+=yqk;
		eqyk_xj+=eqyk;
		sqk_xj+=sqk;
		siqk_xj+=siqk;
		cwsfke_xj+=cwsfke;


		gcqk_xj+=gcqk;
		zcjk_xj+=zcjk;
		zcqk_xj+=zcqk;
		sskze_xj+=sskze;


		yszk_xj+=yszk;
		jtyjtc_xj+=jtyjtc;
		yfyjtc_xj+=yfyjtc;

		//����
		bkjs_xj+=bkjs;
		sqclk_xj+=sqclk;
		gdyp_xj+=gdyp;
		ycbgf_xj+=ycbgf;
		ecbgf_xj+=ecbgf;
		zqclk_xj+=zqclk;
		wqclk_xj+=wqclk;
		scbgf_xj+=scbgf;

		jsjsze_xj+=jsjsze;


		fbj_xj+=fbj;



		kzbj_xj+=kzbj;
		fkje_xj+=fkje;
		jlje_xj+=jlje;
		qtje_xj+=qtje;
		yfje_xj+=yfje;

		sgdlkhj_xj+=sgdlkhj;



		yfgck_xj+=yfgck;
		yfgckall_xj+=yfgckall;

		//���
		sjftc_xj+=sjftc;
		yhcb_xj+=yhcb;
		khpck_xj+=khpck;
		yqf_xj+=yqf;
		jsyh_xj+=jsyh;


		zxhtjz_xj+=zxhtjz;//���º�ͬ��ֵ
		zxyjjz_xj+=zxyjjz;//����ҵ����ֵ
		
		
		
		if (row%2==1)
		{
		   bgcolorStr="#FFFFFF";
		}
		else{
		   bgcolorStr="#E8E8FF";
		}

		%>
		<tr bgcolor="<%=bgcolorStr%>"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td><%=row%></td>
			<td><A HREF="/khxx/ViewMllCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khbh%></A></td>
			<td><%=khxm%></td>
			<td><%=hth%></td>
			<td><%=fwdz%></td>
			<td><%=sjs%></td>
			<td><%=zjxm%></td>
			<td><%=sgdmc%></td>
			<td><%=getkhjl%></td>
			<td><%=getywy%></td>
			<td><%=ysgcjdmc%></td>
			<td><%=bjjbmc%></td>
			<td><%=qyrq%></td>
			<td><%=getyjjzsj%></td>
			<td><%=gettdyjjzsj%></td>
			<td><%=kgrq%></td>
			<td><%=jgrq%></td>
			<td><%=sjkgrq%></td>
			<td><%=sjjgrq%></td>
			<td><%=dwmc%></td>

			<td><%=cf.round(qye+zhljzjx,2)%></td>
			<td><%=wdzgce%></td>
			<td><%=zkl%></td>
			<td><%=qye%></td>
			<td><%=htjz%></td>
			<td><%=yjjz%></td>
			<td><%=zxyjjz%></td>
			<td><%=zqgczjf%></td>
			<td><%=zhgczjf%></td>
			<td><%=sjf%></td>
			<td><%=suijinbfb%>%</td>
			<td><%=suijin%></td>
			<td><%=glfbfb%>%</td>
			<td><%=guanlif%></td>
			<td><%=zhsdlht%></td>
			<td><%=htqtf%></td>


			<td><%=zqljzjx%></td>
			<td><%=zhljzjx%></td>
			<td><%=zjxhtjz%></td>
			<td><%=zjxyjjz%></td>
			<td><%=zjxje%></td>
			<td><%=zhzjxje%></td>
			<td><%=zhsjfzjx%></td>
			<td><%=zjxsuijin%></td>
			<td><%=zjxguanlif%></td>
			<td><%=zhsdlzjx%></td>
			<td><%=kgzjx%></td>
			<td><%=zqzjx%></td>
			<td><%=wqzjx%></td>
			<td><%=khjsje%></td>


			<td><%=sgcbj%></td>
			<td><%=gcsgcbj%></td>
			<td><%=sjfsgcbj%></td>
			<td><%=sdsgcbj%></td>
			<td><%=qtfsgcbj%></td>

			<td><%=zxsgcbj%></td>
			<td><%=zxgcsgcbj%></td>
			<td><%=zxsjfsgcbj%></td>
			<td><%=zxsdsgcbj%></td>
			<td><%=zxqtfsgcbj%></td>

			<td><%=zchtje%></td>
			<td><%=zchtcb%></td>
			<td><%=zczxje%></td>
			<td><%=zczxcb%></td>
			<td><%=zchtml%>%</td>
			<td><%=zczxml%>%</td>

			<td><%=mle%></td>
			<td><%=mll%>%</td>
			<td><%=zxmle%></td>
			<td><%=zxmll%>%</td>
			<td><%=khhtml%>%</td>
			<td><%=khzxml%>%</td>
			<td><%=sjml%>%</td>

			<td><%=dj%></td>
			<td><%=yqk%></td>
			<td><%=eqyk%></td>
			<td><%=sqk%></td>
			<td><%=siqk%></td>
			<td><%=cwsfke%></td>
			<td><%=gcskbl%>%</td>
			<td><%=gcqk%></td>
			<td><%=zcjk%></td>
			<td><%=zcqk%></td>
			<td><%=sskze%></td>
			<td><%=zskbl%>%</td>
			<td><%=yszk%></td>
			<td><%=jtyjtc%></td>
			<td><%=yfyjtc%></td>

			<td><%=bkjs%></td>
			<td><%=sqclk%></td>
			<td><%=gdyp%></td>
			<td><%=ycbgf%></td>
			<td><%=ecbgf%></td>
			<td><%=zqclk%></td>
			<td><%=wqclk%></td>
			<td><%=scbgf%></td>
			<td><%=sgdlkhj%></td>
			<td><%=sgdlkbl%>%</td>
			<td><%=yfgck%></td>
			<td><%=yfgckall%></td>

			<td><%=jsjsze%></td>
			<td><%=jsbl%>%</td>
			<td><%=fbj%></td>
			<td><%=kzbjbl%>%</td>
			<td><%=kzbj%></td>
			<td><%=fkje%></td>
			<td><%=jlje%></td>
			<td><%=qtje%></td>
			<td><%=yfje%></td>


			<td><%=yhcb%></td>
			<td><%=khpck%></td>
			<td><%=yqf%></td>
			<td><%=jsyh%></td>

		</tr>
		<%
	}
	rs.close();
	ps.close();

	zkl_xj=10;
	if (wdzgce_xj!=0)
	{
		zkl_xj=cf.round(qye_xj*10/wdzgce_xj,2);
	}

	sgdlkbl_xj=0;
	if (bkjs_xj!=0)
	{
		sgdlkbl_xj=cf.round(sgdlkhj_xj*100/bkjs_xj,2);
	}


	zchtml_xj=0;
	if (zchtje_xj!=0)
	{
		zchtml_xj=cf.round((zchtje_xj-zchtcb_xj)*100/zchtje_xj,2);
	}

	zczxml_xj=0;
	if (zczxje_xj!=0)
	{
		zczxml_xj=cf.round((zczxje_xj-zczxcb_xj)*100/zczxje_xj,2);
	}

	mll_xj=0;
	if (htjz_xj!=0)
	{
		mll_xj=cf.round(mle_xj*100/htjz_xj,2);
	}

	zxmll_xj=0;
	if (zxhtjz_xj!=0)
	{
		zxmll_xj=cf.round(zxmle_xj*100/zxhtjz_xj,2);
	}

	khhtml_xj=0;//�ͻ���ͬë��
	if ((zchtje_xj+htjz_xj)!=0)
	{
		khhtml_xj=cf.round((zchtje_xj-zchtcb_xj+mle_xj)*100/(zchtje_xj+htjz_xj),2);
	}

	khzxml_xj=0;//�ͻ�����ë��
	if ((zczxje_xj+zxhtjz_xj)!=0)
	{
		khzxml_xj=cf.round((zczxje_xj-zczxcb_xj+zxmle_xj)*100/(zczxje_xj+zxhtjz_xj),2);
	}

	sjml_xj=0;//ʵ��ë��
	if ((zczxje_xj+zxhtjz_xj)!=0)
	{
		sjml_xj=cf.round((zczxje_xj-zczxcb_xj+zxmle_xj-khpck_xj-jsyh_xj)*100/(zczxje_xj+zxhtjz_xj),2);
	}

	if ((qye_xj+zhljzjx_xj)==0)
	{
		gcskbl_xj=0;
	}
	else{
		gcskbl_xj=cf.round(cwsfke_xj*100/(qye_xj+zhljzjx_xj),2);
	}

	//���տ����
	zskbl_xj=0;
	if ((qye_xj+zhljzjx_xj+zczxje_xj)==0)
	{
		zskbl_xj=0;
	}
	else{
		zskbl_xj=cf.round(sskze_xj*100/(qye_xj+zhljzjx_xj+zczxje_xj),2);
	}

%>


<tr bgcolor="<%=bgcolorStr%>"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="3">С ��</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>


	<td><%=cf.round(qye_xj+zhljzjx_xj,2)%></td>
	<td><%=cf.round(wdzgce_xj,2)%></td>
	<td><%=cf.round(zkl_xj,2)%></td>
	<td><%=cf.round(qye_xj,2)%></td>
	<td><%=cf.round(htjz_xj,2)%></td>
	<td><%=cf.round(yjjz_xj,2)%></td>
	<td><%=cf.round(zxyjjz_xj,2)%></td>
	<td><%=cf.round(zqgczjf_xj,2)%></td>
	<td><%=cf.round(zhgczjf_xj,2)%></td>
	<td><%=cf.round(sjf_xj,2)%></td>
	<td>&nbsp;</td>
	<td><%=cf.round(suijin_xj,2)%></td>
	<td>&nbsp;</td>
	<td><%=cf.round(guanlif_xj,2)%></td>
	<td><%=cf.round(zhsdlht_xj,2)%></td>
	<td><%=cf.round(htqtf_xj,2)%></td>


	<td><%=cf.round(zqljzjx_xj,2)%></td>
	<td><%=cf.round(zhljzjx_xj,2)%></td>
	<td><%=cf.round(zjxhtjz_xj,2)%></td>
	<td><%=cf.round(zjxyjjz_xj,2)%></td>
	<td><%=cf.round(zjxje_xj,2)%></td>
	<td><%=cf.round(zhzjxje_xj,2)%></td>
	<td><%=cf.round(zhsjfzjx_xj,2)%></td>
	<td><%=cf.round(zjxsuijin_xj,2)%></td>
	<td><%=cf.round(zjxguanlif_xj,2)%></td>
	<td><%=cf.round(zhsdlzjx_xj,2)%></td>
	<td><%=cf.round(kgzjx_xj,2)%></td>
	<td><%=cf.round(zqzjx_xj,2)%></td>
	<td><%=cf.round(wqzjx_xj,2)%></td>
	<td><%=cf.round(khjsje_xj,2)%></td>


	<td><%=cf.round(sgcbj_xj,2)%></td>
	<td><%=cf.round(gcsgcbj_xj,2)%></td>
	<td><%=cf.round(sjfsgcbj_xj,2)%></td>
	<td><%=cf.round(sdsgcbj_xj,2)%></td>
	<td><%=cf.round(qtfsgcbj_xj,2)%></td>

	<td><%=cf.round(zxsgcbj_xj,2)%></td>
	<td><%=cf.round(zxgcsgcbj_xj,2)%></td>
	<td><%=cf.round(zxsjfsgcbj_xj,2)%></td>
	<td><%=cf.round(zxsdsgcbj_xj,2)%></td>
	<td><%=cf.round(zxqtfsgcbj_xj,2)%></td>

	<td><%=cf.round(zchtje_xj,2)%></td>
	<td><%=cf.round(zchtcb_xj,2)%></td>
	<td><%=cf.round(zczxje_xj,2)%></td>
	<td><%=cf.round(zczxcb_xj,2)%></td>
	<td><%=cf.round(zchtml_xj,2)%>%</td>
	<td><%=cf.round(zczxml_xj,2)%>%</td>

	<td><%=cf.round(mle_xj,2)%></td>
	<td><%=cf.round(mll_xj,2)%>%</td>
	<td><%=cf.round(zxmle_xj,2)%></td>
	<td><%=cf.round(zxmll_xj,2)%>%</td>
	<td><%=cf.round(khhtml_xj,2)%>%</td>
	<td><%=cf.round(khzxml_xj,2)%>%</td>
	<td><%=cf.round(sjml_xj,2)%>%</td>

	<td><%=cf.round(dj_xj,2)%></td>
	<td><%=cf.round(yqk_xj,2)%></td>
	<td><%=cf.round(eqyk_xj,2)%></td>
	<td><%=cf.round(sqk_xj,2)%></td>
	<td><%=cf.round(siqk_xj,2)%></td>
	<td><%=cf.round(cwsfke_xj,2)%></td>
	<td><%=cf.round(gcskbl_xj,2)%>%</td>
	<td><%=cf.round(gcqk_xj,2)%></td>
	<td><%=cf.round(zcjk_xj,2)%></td>
	<td><%=cf.round(zcqk_xj,2)%></td>
	<td><%=cf.round(sskze_xj,2)%></td>
	<td><%=cf.round(zskbl_xj,2)%>%</td>
	<td><%=cf.round(yszk_xj,2)%></td>
	<td><%=cf.round(jtyjtc_xj,2)%></td>
	<td><%=cf.round(yfyjtc_xj,2)%></td>

	<td><%=cf.round(bkjs_xj,2)%></td>
	<td><%=cf.round(sqclk_xj,2)%></td>
	<td><%=cf.round(gdyp_xj,2)%></td>
	<td><%=cf.round(ycbgf_xj,2)%></td>
	<td><%=cf.round(ecbgf_xj,2)%></td>
	<td><%=cf.round(zqclk_xj,2)%></td>
	<td><%=cf.round(wqclk_xj,2)%></td>
	<td><%=cf.round(scbgf_xj,2)%></td>
	<td><%=cf.round(sgdlkhj_xj,2)%></td>
	<td><%=cf.round(sgdlkbl_xj,2)%>%</td>
	<td><%=cf.round(yfgck_xj,2)%></td>
	<td><%=cf.round(yfgckall_xj,2)%></td>

	<td><%=cf.round(jsjsze_xj,2)%></td>
	<td>&nbsp;</td>
	<td><%=cf.round(fbj_xj,2)%></td>
	<td>&nbsp;</td>
	<td><%=cf.round(kzbj_xj,2)%></td>
	<td><%=cf.round(fkje_xj,2)%></td>
	<td><%=cf.round(jlje_xj,2)%></td>
	<td><%=cf.round(qtje_xj,2)%></td>
	<td><%=cf.round(yfje_xj,2)%></td>


	<td><%=cf.round(yhcb_xj,2)%></td>
	<td><%=cf.round(khpck_xj,2)%></td>
	<td><%=cf.round(yqf_xj,2)%></td>
	<td><%=cf.round(jsyh_xj,2)%></td>

</tr>




</table>
</body>
</html>

<script>
function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}</script> 

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

