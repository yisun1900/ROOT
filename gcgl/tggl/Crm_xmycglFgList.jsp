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
	String gj=null;
	gj=request.getParameter("gj");
	if (gj!=null)
	{
		gj=cf.GB2Uni(gj);
		if (!(gj.equals("")))	wheresql+=" and  (crm_khxx.gj='"+gj+"')";
	}
	String dd=null;
	dd=request.getParameter("dd");
	if (dd!=null)
	{
		dd=cf.GB2Uni(dd);
		if (!(dd.equals("")))	wheresql+=" and  (crm_khxx.dd='"+dd+"')";
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
	
	
	String crm_xmycgl_djbh=null;
	String crm_xmycgl_cxwtsj=null;
	String crm_xmycgl_dsr=null;
	String crm_xmycgl_zt=null;
	String crm_xmycgl_lrr=null;
	String crm_xmycgl_lrsj=null;
	String crm_xmycgl_jjfazdr=null;
	String crm_xmycgl_jjfazdsj=null;
	String crm_xmycgl_jjfashr=null;
	String crm_xmycgl_jjfashsj=null;
	String crm_xmycgl_clqklrr=null;
	String crm_xmycgl_clqklrsj=null;
	String crm_xmycgl_sjcljg=null;
	String crm_xmycgl_tgsqr=null;
	String crm_xmycgl_tgsqsj=null;
	String crm_xmycgl_tgshr=null;
	String crm_xmycgl_tgshsj=null;
	String crm_xmycgl_tgshjg=null;
	String crm_xmycgl_tgyybm=null;
	String crm_xmycgl_tgkssj=null;
	String crm_xmycgl_gjfgsj=null;
	String crm_xmycgl_tglrr=null;
	String crm_xmycgl_tglrsj=null;
	crm_xmycgl_djbh=request.getParameter("crm_xmycgl_djbh");
	if (crm_xmycgl_djbh!=null)
	{
		crm_xmycgl_djbh=cf.GB2Uni(crm_xmycgl_djbh);
		if (!(crm_xmycgl_djbh.equals("")))	wheresql+=" and  (crm_xmycgl.djbh='"+crm_xmycgl_djbh+"')";
	}
	crm_xmycgl_cxwtsj=request.getParameter("crm_xmycgl_cxwtsj");
	if (crm_xmycgl_cxwtsj!=null)
	{
		crm_xmycgl_cxwtsj=crm_xmycgl_cxwtsj.trim();
		if (!(crm_xmycgl_cxwtsj.equals("")))	wheresql+="  and (crm_xmycgl.cxwtsj>=TO_DATE('"+crm_xmycgl_cxwtsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_cxwtsj=request.getParameter("crm_xmycgl_cxwtsj2");
	if (crm_xmycgl_cxwtsj!=null)
	{
		crm_xmycgl_cxwtsj=crm_xmycgl_cxwtsj.trim();
		if (!(crm_xmycgl_cxwtsj.equals("")))	wheresql+="  and (crm_xmycgl.cxwtsj<=TO_DATE('"+crm_xmycgl_cxwtsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_dsr=request.getParameter("crm_xmycgl_dsr");
	if (crm_xmycgl_dsr!=null)
	{
		crm_xmycgl_dsr=cf.GB2Uni(crm_xmycgl_dsr);
		if (!(crm_xmycgl_dsr.equals("")))	wheresql+=" and  (crm_xmycgl.dsr='"+crm_xmycgl_dsr+"')";
	}
	crm_xmycgl_zt=request.getParameter("crm_xmycgl_zt");
	if (crm_xmycgl_zt!=null)
	{
		crm_xmycgl_zt=cf.GB2Uni(crm_xmycgl_zt);
		if (!(crm_xmycgl_zt.equals("")))	wheresql+=" and  (crm_xmycgl.zt='"+crm_xmycgl_zt+"')";
	}
	crm_xmycgl_lrr=request.getParameter("crm_xmycgl_lrr");
	if (crm_xmycgl_lrr!=null)
	{
		crm_xmycgl_lrr=cf.GB2Uni(crm_xmycgl_lrr);
		if (!(crm_xmycgl_lrr.equals("")))	wheresql+=" and  (crm_xmycgl.lrr='"+crm_xmycgl_lrr+"')";
	}
	crm_xmycgl_lrsj=request.getParameter("crm_xmycgl_lrsj");
	if (crm_xmycgl_lrsj!=null)
	{
		crm_xmycgl_lrsj=crm_xmycgl_lrsj.trim();
		if (!(crm_xmycgl_lrsj.equals("")))	wheresql+="  and (crm_xmycgl.lrsj>=TO_DATE('"+crm_xmycgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_lrsj=request.getParameter("crm_xmycgl_lrsj2");
	if (crm_xmycgl_lrsj!=null)
	{
		crm_xmycgl_lrsj=crm_xmycgl_lrsj.trim();
		if (!(crm_xmycgl_lrsj.equals("")))	wheresql+="  and (crm_xmycgl.lrsj<=TO_DATE('"+crm_xmycgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_jjfazdr=request.getParameter("crm_xmycgl_jjfazdr");
	if (crm_xmycgl_jjfazdr!=null)
	{
		crm_xmycgl_jjfazdr=cf.GB2Uni(crm_xmycgl_jjfazdr);
		if (!(crm_xmycgl_jjfazdr.equals("")))	wheresql+=" and  (crm_xmycgl.jjfazdr='"+crm_xmycgl_jjfazdr+"')";
	}
	crm_xmycgl_jjfazdsj=request.getParameter("crm_xmycgl_jjfazdsj");
	if (crm_xmycgl_jjfazdsj!=null)
	{
		crm_xmycgl_jjfazdsj=crm_xmycgl_jjfazdsj.trim();
		if (!(crm_xmycgl_jjfazdsj.equals("")))	wheresql+="  and (crm_xmycgl.jjfazdsj>=TO_DATE('"+crm_xmycgl_jjfazdsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_jjfazdsj=request.getParameter("crm_xmycgl_jjfazdsj2");
	if (crm_xmycgl_jjfazdsj!=null)
	{
		crm_xmycgl_jjfazdsj=crm_xmycgl_jjfazdsj.trim();
		if (!(crm_xmycgl_jjfazdsj.equals("")))	wheresql+="  and (crm_xmycgl.jjfazdsj<=TO_DATE('"+crm_xmycgl_jjfazdsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_jjfashr=request.getParameter("crm_xmycgl_jjfashr");
	if (crm_xmycgl_jjfashr!=null)
	{
		crm_xmycgl_jjfashr=cf.GB2Uni(crm_xmycgl_jjfashr);
		if (!(crm_xmycgl_jjfashr.equals("")))	wheresql+=" and  (crm_xmycgl.jjfashr='"+crm_xmycgl_jjfashr+"')";
	}
	crm_xmycgl_jjfashsj=request.getParameter("crm_xmycgl_jjfashsj");
	if (crm_xmycgl_jjfashsj!=null)
	{
		crm_xmycgl_jjfashsj=crm_xmycgl_jjfashsj.trim();
		if (!(crm_xmycgl_jjfashsj.equals("")))	wheresql+="  and (crm_xmycgl.jjfashsj>=TO_DATE('"+crm_xmycgl_jjfashsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_jjfashsj=request.getParameter("crm_xmycgl_jjfashsj2");
	if (crm_xmycgl_jjfashsj!=null)
	{
		crm_xmycgl_jjfashsj=crm_xmycgl_jjfashsj.trim();
		if (!(crm_xmycgl_jjfashsj.equals("")))	wheresql+="  and (crm_xmycgl.jjfashsj<=TO_DATE('"+crm_xmycgl_jjfashsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_clqklrr=request.getParameter("crm_xmycgl_clqklrr");
	if (crm_xmycgl_clqklrr!=null)
	{
		crm_xmycgl_clqklrr=cf.GB2Uni(crm_xmycgl_clqklrr);
		if (!(crm_xmycgl_clqklrr.equals("")))	wheresql+=" and  (crm_xmycgl.clqklrr='"+crm_xmycgl_clqklrr+"')";
	}
	crm_xmycgl_clqklrsj=request.getParameter("crm_xmycgl_clqklrsj");
	if (crm_xmycgl_clqklrsj!=null)
	{
		crm_xmycgl_clqklrsj=crm_xmycgl_clqklrsj.trim();
		if (!(crm_xmycgl_clqklrsj.equals("")))	wheresql+="  and (crm_xmycgl.clqklrsj>=TO_DATE('"+crm_xmycgl_clqklrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_clqklrsj=request.getParameter("crm_xmycgl_clqklrsj2");
	if (crm_xmycgl_clqklrsj!=null)
	{
		crm_xmycgl_clqklrsj=crm_xmycgl_clqklrsj.trim();
		if (!(crm_xmycgl_clqklrsj.equals("")))	wheresql+="  and (crm_xmycgl.clqklrsj<=TO_DATE('"+crm_xmycgl_clqklrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_sjcljg=request.getParameter("crm_xmycgl_sjcljg");
	if (crm_xmycgl_sjcljg!=null)
	{
		crm_xmycgl_sjcljg=cf.GB2Uni(crm_xmycgl_sjcljg);
		if (!(crm_xmycgl_sjcljg.equals("")))	wheresql+=" and  (crm_xmycgl.sjcljg='"+crm_xmycgl_sjcljg+"')";
	}
	crm_xmycgl_tgsqr=request.getParameter("crm_xmycgl_tgsqr");
	if (crm_xmycgl_tgsqr!=null)
	{
		crm_xmycgl_tgsqr=cf.GB2Uni(crm_xmycgl_tgsqr);
		if (!(crm_xmycgl_tgsqr.equals("")))	wheresql+=" and  (crm_xmycgl.tgsqr='"+crm_xmycgl_tgsqr+"')";
	}
	crm_xmycgl_tgsqsj=request.getParameter("crm_xmycgl_tgsqsj");
	if (crm_xmycgl_tgsqsj!=null)
	{
		crm_xmycgl_tgsqsj=crm_xmycgl_tgsqsj.trim();
		if (!(crm_xmycgl_tgsqsj.equals("")))	wheresql+="  and (crm_xmycgl.tgsqsj>=TO_DATE('"+crm_xmycgl_tgsqsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tgsqsj=request.getParameter("crm_xmycgl_tgsqsj2");
	if (crm_xmycgl_tgsqsj!=null)
	{
		crm_xmycgl_tgsqsj=crm_xmycgl_tgsqsj.trim();
		if (!(crm_xmycgl_tgsqsj.equals("")))	wheresql+="  and (crm_xmycgl.tgsqsj<=TO_DATE('"+crm_xmycgl_tgsqsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tgshr=request.getParameter("crm_xmycgl_tgshr");
	if (crm_xmycgl_tgshr!=null)
	{
		crm_xmycgl_tgshr=cf.GB2Uni(crm_xmycgl_tgshr);
		if (!(crm_xmycgl_tgshr.equals("")))	wheresql+=" and  (crm_xmycgl.tgshr='"+crm_xmycgl_tgshr+"')";
	}
	crm_xmycgl_tgshsj=request.getParameter("crm_xmycgl_tgshsj");
	if (crm_xmycgl_tgshsj!=null)
	{
		crm_xmycgl_tgshsj=crm_xmycgl_tgshsj.trim();
		if (!(crm_xmycgl_tgshsj.equals("")))	wheresql+="  and (crm_xmycgl.tgshsj>=TO_DATE('"+crm_xmycgl_tgshsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tgshsj=request.getParameter("crm_xmycgl_tgshsj2");
	if (crm_xmycgl_tgshsj!=null)
	{
		crm_xmycgl_tgshsj=crm_xmycgl_tgshsj.trim();
		if (!(crm_xmycgl_tgshsj.equals("")))	wheresql+="  and (crm_xmycgl.tgshsj<=TO_DATE('"+crm_xmycgl_tgshsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tgshjg=request.getParameter("crm_xmycgl_tgshjg");
	if (crm_xmycgl_tgshjg!=null)
	{
		crm_xmycgl_tgshjg=cf.GB2Uni(crm_xmycgl_tgshjg);
		if (!(crm_xmycgl_tgshjg.equals("")))	wheresql+=" and  (crm_xmycgl.tgshjg='"+crm_xmycgl_tgshjg+"')";
	}
	crm_xmycgl_tgyybm=request.getParameter("crm_xmycgl_tgyybm");
	if (crm_xmycgl_tgyybm!=null)
	{
		crm_xmycgl_tgyybm=cf.GB2Uni(crm_xmycgl_tgyybm);
		if (!(crm_xmycgl_tgyybm.equals("")))	wheresql+=" and  (crm_xmycgl.tgyybm='"+crm_xmycgl_tgyybm+"')";
	}
	crm_xmycgl_tgkssj=request.getParameter("crm_xmycgl_tgkssj");
	if (crm_xmycgl_tgkssj!=null)
	{
		crm_xmycgl_tgkssj=crm_xmycgl_tgkssj.trim();
		if (!(crm_xmycgl_tgkssj.equals("")))	wheresql+="  and (crm_xmycgl.tgkssj>=TO_DATE('"+crm_xmycgl_tgkssj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tgkssj=request.getParameter("crm_xmycgl_tgkssj2");
	if (crm_xmycgl_tgkssj!=null)
	{
		crm_xmycgl_tgkssj=crm_xmycgl_tgkssj.trim();
		if (!(crm_xmycgl_tgkssj.equals("")))	wheresql+="  and (crm_xmycgl.tgkssj<=TO_DATE('"+crm_xmycgl_tgkssj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_gjfgsj=request.getParameter("crm_xmycgl_gjfgsj");
	if (crm_xmycgl_gjfgsj!=null)
	{
		crm_xmycgl_gjfgsj=crm_xmycgl_gjfgsj.trim();
		if (!(crm_xmycgl_gjfgsj.equals("")))	wheresql+="  and (crm_xmycgl.gjfgsj>=TO_DATE('"+crm_xmycgl_gjfgsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_gjfgsj=request.getParameter("crm_xmycgl_gjfgsj2");
	if (crm_xmycgl_gjfgsj!=null)
	{
		crm_xmycgl_gjfgsj=crm_xmycgl_gjfgsj.trim();
		if (!(crm_xmycgl_gjfgsj.equals("")))	wheresql+="  and (crm_xmycgl.gjfgsj<=TO_DATE('"+crm_xmycgl_gjfgsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tglrr=request.getParameter("crm_xmycgl_tglrr");
	if (crm_xmycgl_tglrr!=null)
	{
		crm_xmycgl_tglrr=cf.GB2Uni(crm_xmycgl_tglrr);
		if (!(crm_xmycgl_tglrr.equals("")))	wheresql+=" and  (crm_xmycgl.tglrr='"+crm_xmycgl_tglrr+"')";
	}
	crm_xmycgl_tglrsj=request.getParameter("crm_xmycgl_tglrsj");
	if (crm_xmycgl_tglrsj!=null)
	{
		crm_xmycgl_tglrsj=crm_xmycgl_tglrsj.trim();
		if (!(crm_xmycgl_tglrsj.equals("")))	wheresql+="  and (crm_xmycgl.tglrsj>=TO_DATE('"+crm_xmycgl_tglrsj+"','YYYY/MM/DD'))";
	}
	crm_xmycgl_tglrsj=request.getParameter("crm_xmycgl_tglrsj2");
	if (crm_xmycgl_tglrsj!=null)
	{
		crm_xmycgl_tglrsj=crm_xmycgl_tglrsj.trim();
		if (!(crm_xmycgl_tglrsj.equals("")))	wheresql+="  and (crm_xmycgl.tglrsj<=TO_DATE('"+crm_xmycgl_tglrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_xmycgl.djbh,crm_xmycgl.tgkssj,crm_xmycgl.gjfgsj,tgyymc,crm_xmycgl.tglrr,crm_xmycgl.tglrsj,crm_khxx.khxm,crm_khxx.fwdz,crm_xmycgl.tgshsm,crm_xmycgl.cxwtsj,crm_xmycgl.dsr,crm_xmycgl.cxwt,crm_xmycgl.jjfashr,crm_xmycgl.jjfashsj,crm_xmycgl.clqklrr,crm_xmycgl.clqklrsj,crm_xmycgl.sjclqk,crm_xmycgl.tgsqr,crm_xmycgl.tgsqsj,crm_xmycgl.tgsqyy,crm_xmycgl.lrsj,dwmc,crm_xmycgl.bz,crm_xmycgl.khbh, DECODE(crm_xmycgl.zt,'1','�쳣¼��','2','�ƶ�����','3','�������','4','�Ѵ���','5','ͣ������','6','ͣ������','7','����ͣ��','8','������')  ";
	ls_sql+=" FROM crm_khxx,crm_xmycgl,dm_tgyybm,sq_dwxx  ";
    ls_sql+=" where crm_xmycgl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_xmycgl.tgyybm=dm_tgyybm.tgyybm(+)";
    ls_sql+=" and crm_xmycgl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_xmycgl.sjcljg='N'";
 
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_xmycgl.tglrsj desc ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_xmycglFgList.jsp","","","FgCrm_xmycgl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"djbh","crm_xmycgl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_xmycgl_cxwtsj","crm_xmycgl_dsr","crm_xmycgl_cxwt","crm_xmycgl_jjfazdr","crm_xmycgl_jjfazdsj","crm_xmycgl_jjfa","crm_xmycgl_jjfashr","crm_xmycgl_jjfashsj","crm_xmycgl_clqklrr","crm_xmycgl_clqklrsj","crm_xmycgl_sjcljg","crm_xmycgl_sjclqk","crm_xmycgl_tgsqr","crm_xmycgl_tgsqsj","crm_xmycgl_tgsqyy","crm_xmycgl_tgshr","crm_xmycgl_tgshsj","crm_xmycgl_tgshjg","crm_xmycgl_tgshsm","crm_xmycgl_tgyybm","crm_xmycgl_tgkssj","crm_xmycgl_gjfgsj","crm_xmycgl_tglrr","crm_xmycgl_tglrsj","crm_xmycgl_sjfgsj","crm_xmycgl_fglrr","crm_xmycgl_fglrsj","crm_xmycgl_fgsm","crm_xmycgl_zt","crm_xmycgl_lrr","crm_xmycgl_lrsj","crm_xmycgl_lrbm","crm_xmycgl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"djbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("����");


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"djbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="ViewCrm_xmycgl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("djbh",coluParm);//�в����������Hash��
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
  <B><font size="3">��Ŀ����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">�ǼǱ��</td>
	<td  width="3%">ͣ����ʼʱ��</td>
	<td  width="3%">���Ƹ�������</td>
	<td  width="4%">ͣ��ԭ��</td>
	<td  width="2%">ͣ��¼����</td>
	<td  width="3%">ͣ��¼��ʱ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="6%">���ݵ�ַ</td>
	<td  width="8%">ͣ�����˵��</td>
	<td  width="3%">��������ʱ��</td>
	<td  width="2%">������</td>
	<td  width="10%">��������</td>
	<td  width="2%">���������</td>
	<td  width="3%">�������ʱ��</td>
	<td  width="2%">�������¼����</td>
	<td  width="3%">�������¼��ʱ��</td>
	<td  width="10%">ʵ�ʴ������</td>
	<td  width="2%">ͣ��������</td>
	<td  width="3%">ͣ������ʱ��</td>
	<td  width="9%">ͣ������ԭ��</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="6%">��ע</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">״̬</td>
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