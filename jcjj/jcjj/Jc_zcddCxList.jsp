<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String kkbbz=(String)session.getAttribute("kkbbz");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String yhmc=(String)session.getAttribute("yhmc");
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


	String yjjzsj=null;
	yjjzsj=request.getParameter("yjjzsj");
	if (yjjzsj!=null)
	{
		yjjzsj=yjjzsj.trim();
		if (!(yjjzsj.equals("")))	wheresql+="  and (crm_khxx.yjjzsj>=TO_DATE('"+yjjzsj+"','YYYY/MM/DD'))";
	}
	yjjzsj=request.getParameter("yjjzsj2");
	if (yjjzsj!=null)
	{
		yjjzsj=yjjzsj.trim();
		if (!(yjjzsj.equals("")))	wheresql+="  and (crm_khxx.yjjzsj<=TO_DATE('"+yjjzsj+"','YYYY/MM/DD'))";
	}

	String khjssj=null;
	khjssj=request.getParameter("khjssj");
	if (khjssj!=null)
	{
		khjssj=khjssj.trim();
		if (!(khjssj.equals("")))	wheresql+="  and (crm_khxx.khjssj>=TO_DATE('"+khjssj+"','YYYY/MM/DD'))";
	}
	khjssj=request.getParameter("khjssj2");
	if (khjssj!=null)
	{
		khjssj=khjssj.trim();
		if (!(khjssj.equals("")))	wheresql+="  and (crm_khxx.khjssj<=TO_DATE('"+khjssj+"','YYYY/MM/DD'))";
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

	String qhtsj=null;
	qhtsj=request.getParameter("qhtsj");
	if (qhtsj!=null)
	{
		qhtsj=qhtsj.trim();
		if (!(qhtsj.equals("")))	wheresql+="  and (jc_zcdd.qhtsj>=TO_DATE('"+qhtsj+"','YYYY/MM/DD'))";
	}
	qhtsj=request.getParameter("qhtsj2");
	if (qhtsj!=null)
	{
		qhtsj=qhtsj.trim();
		if (!(qhtsj.equals("")))	wheresql+="  and (jc_zcdd.qhtsj<=TO_DATE('"+qhtsj+"','YYYY/MM/DD'))";
	}

	String dgkh=null;
	dgkh=request.getParameter("dgkh");
	if (dgkh!=null)
	{
		dgkh=cf.GB2Uni(dgkh);
		if (!(dgkh.equals("")))	wheresql+=" and  (crm_khxx.dgkh='"+dgkh+"')";
	}

	String xshth=null;
	xshth=request.getParameter("xshth");
	if (xshth!=null)
	{
		xshth=cf.GB2Uni(xshth);
		if (!(xshth.equals("")))	wheresql+=" and  (jc_zcdd.xshth='"+xshth+"')";
	}

	String sftjp=null;
	sftjp=request.getParameter("sftjp");
	if (sftjp!=null)
	{
		sftjp=cf.GB2Uni(sftjp);
		if (!(sftjp.equals("")))	wheresql+=" and  (jc_zcdd.sftjp='"+sftjp+"')";
	}
	
	String dsksjbz=null;
	dsksjbz=request.getParameter("dsksjbz");
	if (dsksjbz!=null)
	{
		dsksjbz=cf.GB2Uni(dsksjbz);
		if (dsksjbz.equals("N"))
		{
			wheresql+=" and  (jc_zcdd.clzt in('07','09'))";
		}
		else if (dsksjbz.equals("Y"))
		{
			wheresql+=" and  (jc_zcdd.clzt not in('07','09','98','99'))";
		}
	}
	String ddlx=null;
	ddlx=request.getParameter("ddlx");
	if (ddlx!=null)
	{
		ddlx=cf.GB2Uni(ddlx);
		if (!(ddlx.equals("")))	wheresql+=" and  (jc_zcdd.ddlx='"+ddlx+"')";
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


	String ddbh=null;
	ddbh=request.getParameter("ddbh");
	if (ddbh!=null)
	{
		ddbh=cf.GB2Uni(ddbh);
		if (!(ddbh.equals("")))	wheresql+=" and  (jc_zcdd.ddbh='"+ddbh+"')";
	}
	String clzt=null;
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (jc_zcdd.clzt='"+clzt+"')";
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
		if (!(ppbm2.equals("")))	wheresql+=" and  (jc_zcdd.ppbm='"+ppbm2+"')";
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
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_zcdd.ppmc='"+ppmc2+"')";
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
		if (!(gys2.equals("")))	wheresql+=" and  (jc_zcdd.gys='"+gys2+"')";
	}

	String ztjjgw=null;
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_zcdd.ztjjgw='"+ztjjgw+"')";
	}
	String clgw=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_zcdd.clgw='"+clgw+"')";
	}
	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_zcdd.xmzy='"+xmzy+"')";
	}

	String jc_zcdd_lrr=null;
	jc_zcdd_lrr=request.getParameter("jc_zcdd_lrr");
	if (jc_zcdd_lrr!=null)
	{
		jc_zcdd_lrr=cf.GB2Uni(jc_zcdd_lrr);
		if (!(jc_zcdd_lrr.equals("")))	wheresql+=" and  (jc_zcdd.lrr='"+jc_zcdd_lrr+"')";
	}
	String jc_zcdd_lrsj=null;
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
	String myxssl=null;
	if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
	{
		String xsfg=request.getParameter("xsfg");
		if (xsfg.equals("2"))
		{
			pageObj.setType("EXCEL",response);
		}

		myxssl=request.getParameter("myxssl");
	}



	if (yhjs.equals("G0"))
	{
		ls_sql="SELECT  jc_zcdd.ddbh,clztmc,jc_zcdd.ppbm,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.khjl,crm_khxx.zjxm,crm_khxx.hth,jc_zcdd.clgw,crm_khxx.yjjzsj,crm_khxx.khjssj,jc_zcdd.ddqrsj,jc_zcdd.xshth,jc_zcdd.qhtsj,jc_zcdd.wdzje,jc_zcdd.zcpclf,jc_zcdd.tjpclf,jc_zcdd.qtf,jc_zcdd.ycf,jc_zcdd.khfdbl||'%',jc_zcdd.tjpkhfdbl||'%',ROUND(jc_zcdd.zcpclf*jc_zcdd.khfdbl/100+jc_zcdd.tjpclf*jc_zcdd.tjpkhfdbl/100,2) khyh,jc_zcdd.htshsj,jc_zcdd.gys,zcdlbm,jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.khbh,jc_zcdd.bz,DECODE(jc_zcdd.clzt,'07','δ���','09','δ���','98','�˵�','99','�˵�','���'),crm_khxx.qyrq,b.dwmc dm";
		ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt,sq_dwxx a,sq_dwxx b ";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=b.dwbh(+)";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
		ls_sql+=" and jc_zcdd.ddlx in('9','E')";//9�����ɼҾ�����

		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from jxc_ppgysdzb where gysbm='"+ygbh+"' )";
		ls_sql+=wheresql;
		ls_sql+=" order by jc_zcdd.lrsj desc,jc_zcdd.ddbh";
	}
	else{
		ls_sql="SELECT  jc_zcdd.ddbh,clztmc,jc_zcdd.ppbm,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.khjl,crm_khxx.zjxm,crm_khxx.hth,jc_zcdd.clgw,crm_khxx.yjjzsj,crm_khxx.khjssj,jc_zcdd.ddqrsj,jc_zcdd.xshth,jc_zcdd.qhtsj,jc_zcdd.wdzje,jc_zcdd.zcpclf,jc_zcdd.tjpclf,jc_zcdd.qtf,jc_zcdd.ycf,jc_zcdd.khfdbl||'%',jc_zcdd.tjpkhfdbl||'%',ROUND(jc_zcdd.zcpclf*jc_zcdd.khfdbl/100+jc_zcdd.tjpclf*jc_zcdd.tjpkhfdbl/100,2) khyh,jc_zcdd.htshsj,jc_zcdd.gys,zcdlbm,jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.khbh,jc_zcdd.bz,DECODE(jc_zcdd.clzt,'07','δ���','09','δ���','98','�˵�','99','�˵�','���'),crm_khxx.qyrq,b.dwmc dm";
		ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt,sq_dwxx a,sq_dwxx b ";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=b.dwbh(+)";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
		ls_sql+=" and jc_zcdd.ddlx in('9','E')";//9�����ɼҾ�����

		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=wheresql;
		ls_sql+=" order by jc_zcdd.lrsj desc,jc_zcdd.ddbh";
	}

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_zcddCxList.jsp","","","/jcjj/dygl/dypz.jsp");
	if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
	{
		pageObj.setPageRow(Integer.parseInt(myxssl));
	}
	else{
		pageObj.setPageRow(25);
	}
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ddbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","jc_zcdd_clgw","jc_zcdd_jkxz","jc_zcdd_jkdd","jc_zcdd_ddshbz","jc_zcdd_hkze","jc_zcdd_xclbz","jc_zcdd_clzt","jc_zcdd_lrsj","jc_zcdd_dwbh","jc_zcdd_bz","jc_zcdd_xmzy","crm_khxx_lxfs"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("��ӡ");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
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
</head>
<%
if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
	<%
}
else{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
	<noscript><iframe scr="*.htm"></iframe></noscript>
	<%
}
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ɼҾ����ģ���ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">�������</td>
	<td  width="3%">����״̬</td>
	<td  width="3%">��Ʒ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">����ҵ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">�Ҿӹ���</td>
	<td  width="3%">��װ����ҵ��ʱ��</td>
	<td  width="3%">�ͻ���������ʱ��</td>
	<td  width="3%">����ȷ��ʱ��</td>
	<td  width="3%">���ۺ�ͬ��</td>
	<td  width="3%">��������</td>

	<td  width="4%">��ͬ�ܶ�</td>
	<td  width="3%">����Ʒ���Ϸ�</td>
	<td  width="3%">�ؼ�Ʒ���Ϸ�</td>
	<td  width="3%">��װ��</td>
	<td  width="3%">Զ�̷�</td>
	<td  width="2%">����Ʒ�ͻ��������</td>
	<td  width="2%">�ؼ�Ʒ�ͻ��������</td>
	<td  width="3%">�ͻ��Żݽ��</td>
	<td  width="3%">��ͬ�ͻ�ʱ��</td>
	<td  width="6%">��Ӧ��</td>
	<td  width="3%">���Ĵ���</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="3%">¼�벿��</td>
	<td  width="2%">�ͻ����</td>
	<td  width="4%">��ע</td>
	<td  width="2%">��˱�־</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">ǩԼ����</td>
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