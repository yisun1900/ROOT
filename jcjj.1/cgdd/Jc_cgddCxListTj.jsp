<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ͳ�Ʊ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<center><B>���񶩵����ͳ�Ʊ�</B></center><BR>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String wheresql="";
	String jc_cgdd_ddbh=null;
	String jc_cgdd_khbh=null;
	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	String jc_cgdd_jhccsj=null;
	String jc_cgdd_cgsjs=null;
	String jc_cgdd_sccsj=null;
	String jc_cgdd_jhfcsj=null;
	String jc_cgdd_sfcsj=null;
	String jc_cgdd_qhtsj=null;
	String jc_cgdd_jhazrq=null;
	String jc_cgdd_sazrq=null;
	String jc_cgdd_clzt=null;
	String jc_cgdd_khlx=null;
	String jc_cgdd_lrr=null;
	String jc_cgdd_lrsj=null;
	String jc_cgdd_lrsj2=null;
	String jc_cgdd_dwbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;

	String crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	jc_cgdd_ddbh=request.getParameter("jc_cgdd_ddbh");
	if (jc_cgdd_ddbh!=null)
	{
		jc_cgdd_ddbh=cf.GB2Uni(jc_cgdd_ddbh);
		if (!(jc_cgdd_ddbh.equals("")))	wheresql+=" and  (jc_cgdd.ddbh='"+jc_cgdd_ddbh+"')";
	}
	jc_cgdd_khbh=request.getParameter("jc_cgdd_khbh");
	if (jc_cgdd_khbh!=null)
	{
		jc_cgdd_khbh=cf.GB2Uni(jc_cgdd_khbh);
		if (!(jc_cgdd_khbh.equals("")))	wheresql+=" and  (jc_cgdd.khbh='"+jc_cgdd_khbh+"')";
	}
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_cgdd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_cgdd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_cgdd.xmzy='"+xmzy+"')";
	}
	jc_cgdd_jhccsj=request.getParameter("jc_cgdd_jhccsj");
	if (jc_cgdd_jhccsj!=null)
	{
		jc_cgdd_jhccsj=jc_cgdd_jhccsj.trim();
		if (!(jc_cgdd_jhccsj.equals("")))	wheresql+="  and (jc_cgdd.jhccsj>=TO_DATE('"+jc_cgdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhccsj=request.getParameter("jc_cgdd_jhccsj2");
	if (jc_cgdd_jhccsj!=null)
	{
		jc_cgdd_jhccsj=jc_cgdd_jhccsj.trim();
		if (!(jc_cgdd_jhccsj.equals("")))	wheresql+="  and (jc_cgdd.jhccsj<=TO_DATE('"+jc_cgdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_cgsjs=request.getParameter("jc_cgdd_cgsjs");
	if (jc_cgdd_cgsjs!=null)
	{
		jc_cgdd_cgsjs=cf.GB2Uni(jc_cgdd_cgsjs);
		if (!(jc_cgdd_cgsjs.equals("")))	wheresql+=" and  (jc_cgdd.cgsjs='"+jc_cgdd_cgsjs+"')";
	}
	jc_cgdd_sccsj=request.getParameter("jc_cgdd_sccsj");
	if (jc_cgdd_sccsj!=null)
	{
		jc_cgdd_sccsj=jc_cgdd_sccsj.trim();
		if (!(jc_cgdd_sccsj.equals("")))	wheresql+="  and (jc_cgdd.sccsj>=TO_DATE('"+jc_cgdd_sccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sccsj=request.getParameter("jc_cgdd_sccsj2");
	if (jc_cgdd_sccsj!=null)
	{
		jc_cgdd_sccsj=jc_cgdd_sccsj.trim();
		if (!(jc_cgdd_sccsj.equals("")))	wheresql+="  and (jc_cgdd.sccsj<=TO_DATE('"+jc_cgdd_sccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhfcsj=request.getParameter("jc_cgdd_jhfcsj");
	if (jc_cgdd_jhfcsj!=null)
	{
		jc_cgdd_jhfcsj=jc_cgdd_jhfcsj.trim();
		if (!(jc_cgdd_jhfcsj.equals("")))	wheresql+="  and (jc_cgdd.jhfcsj>=TO_DATE('"+jc_cgdd_jhfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhfcsj=request.getParameter("jc_cgdd_jhfcsj2");
	if (jc_cgdd_jhfcsj!=null)
	{
		jc_cgdd_jhfcsj=jc_cgdd_jhfcsj.trim();
		if (!(jc_cgdd_jhfcsj.equals("")))	wheresql+="  and (jc_cgdd.jhfcsj<=TO_DATE('"+jc_cgdd_jhfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sfcsj=request.getParameter("jc_cgdd_sfcsj");
	if (jc_cgdd_sfcsj!=null)
	{
		jc_cgdd_sfcsj=jc_cgdd_sfcsj.trim();
		if (!(jc_cgdd_sfcsj.equals("")))	wheresql+="  and (jc_cgdd.sfcsj>=TO_DATE('"+jc_cgdd_sfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sfcsj=request.getParameter("jc_cgdd_sfcsj2");
	if (jc_cgdd_sfcsj!=null)
	{
		jc_cgdd_sfcsj=jc_cgdd_sfcsj.trim();
		if (!(jc_cgdd_sfcsj.equals("")))	wheresql+="  and (jc_cgdd.sfcsj<=TO_DATE('"+jc_cgdd_sfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_qhtsj=request.getParameter("jc_cgdd_qhtsj");
	if (jc_cgdd_qhtsj!=null)
	{
		jc_cgdd_qhtsj=jc_cgdd_qhtsj.trim();
		if (!(jc_cgdd_qhtsj.equals("")))	wheresql+="  and (jc_cgdd.qhtsj>=TO_DATE('"+jc_cgdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_qhtsj=request.getParameter("jc_cgdd_qhtsj2");
	if (jc_cgdd_qhtsj!=null)
	{
		jc_cgdd_qhtsj=jc_cgdd_qhtsj.trim();
		if (!(jc_cgdd_qhtsj.equals("")))	wheresql+="  and (jc_cgdd.qhtsj<=TO_DATE('"+jc_cgdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhazrq=request.getParameter("jc_cgdd_jhazrq");
	if (jc_cgdd_jhazrq!=null)
	{
		jc_cgdd_jhazrq=jc_cgdd_jhazrq.trim();
		if (!(jc_cgdd_jhazrq.equals("")))	wheresql+="  and (jc_cgdd.jhazrq>=TO_DATE('"+jc_cgdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhazrq=request.getParameter("jc_cgdd_jhazrq2");
	if (jc_cgdd_jhazrq!=null)
	{
		jc_cgdd_jhazrq=jc_cgdd_jhazrq.trim();
		if (!(jc_cgdd_jhazrq.equals("")))	wheresql+="  and (jc_cgdd.jhazrq<=TO_DATE('"+jc_cgdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sazrq=request.getParameter("jc_cgdd_sazrq");
	if (jc_cgdd_sazrq!=null)
	{
		jc_cgdd_sazrq=jc_cgdd_sazrq.trim();
		if (!(jc_cgdd_sazrq.equals("")))	wheresql+="  and (jc_cgdd.sazrq>=TO_DATE('"+jc_cgdd_sazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sazrq=request.getParameter("jc_cgdd_sazrq2");
	if (jc_cgdd_sazrq!=null)
	{
		jc_cgdd_sazrq=jc_cgdd_sazrq.trim();
		if (!(jc_cgdd_sazrq.equals("")))	wheresql+="  and (jc_cgdd.sazrq<=TO_DATE('"+jc_cgdd_sazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_clzt=request.getParameter("jc_cgdd_clzt");
	if (jc_cgdd_clzt!=null)
	{
		jc_cgdd_clzt=cf.GB2Uni(jc_cgdd_clzt);
		if (!(jc_cgdd_clzt.equals("")))	wheresql+=" and  (jc_cgdd.clzt='"+jc_cgdd_clzt+"')";
	}
	jc_cgdd_khlx=request.getParameter("jc_cgdd_khlx");
	if (jc_cgdd_khlx!=null)
	{
		jc_cgdd_khlx=cf.GB2Uni(jc_cgdd_khlx);
		if (!(jc_cgdd_khlx.equals("")))	wheresql+=" and  (jc_cgdd.khlx='"+jc_cgdd_khlx+"')";
	}
	jc_cgdd_lrr=request.getParameter("jc_cgdd_lrr");
	if (jc_cgdd_lrr!=null)
	{
		jc_cgdd_lrr=cf.GB2Uni(jc_cgdd_lrr);
		if (!(jc_cgdd_lrr.equals("")))	wheresql+=" and  (jc_cgdd.lrr='"+jc_cgdd_lrr+"')";
	}
	jc_cgdd_lrsj=request.getParameter("jc_cgdd_lrsj");
	if (jc_cgdd_lrsj!=null)
	{
		jc_cgdd_lrsj=jc_cgdd_lrsj.trim();
		if (!(jc_cgdd_lrsj.equals("")))	wheresql+="  and (jc_cgdd.lrsj>=TO_DATE('"+jc_cgdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_lrsj2=request.getParameter("jc_cgdd_lrsj2");
	if (jc_cgdd_lrsj2!=null)
	{
		jc_cgdd_lrsj2=jc_cgdd_lrsj2.trim();
		if (!(jc_cgdd_lrsj2.equals("")))	wheresql+="  and (jc_cgdd.lrsj<=TO_DATE('"+jc_cgdd_lrsj2+"','YYYY/MM/DD'))";
	}
	jc_cgdd_dwbh=request.getParameter("jc_cgdd_dwbh");
	if (jc_cgdd_dwbh!=null)
	{
		jc_cgdd_dwbh=cf.GB2Uni(jc_cgdd_dwbh);
		if (!(jc_cgdd_dwbh.equals("")))	wheresql+=" and  (jc_cgdd.dwbh='"+jc_cgdd_dwbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	%>
	<table style='FONT-SIZE:12px' width='250%' border='1' cellspacing='0' cellpadding='1'>

	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">���</td>
	<td  width="3%">�������</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="4%">ǩԼ����</td>
	<td  width="2%">��װ���ʦ</td>
	<td  width="3%">��ͬ��</td>
	<td  width="8%">��ϵ�绰</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="3%">�೤</td>
	<td  width="5%">�೤�绰</td>
	<td  width="3%">���̽���</td>
    <td  width="4%">�����</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="3%">��������</td>
	<td  width="3%">��������</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">��ͬ��װ����</td>
	<td  width="3%">��װ��ʼ����</td>
	<td  width="3%">��װ�������</td>
	<td  width="3%">ȷ���˵�����</td>
    <td  width="5%">���ɹ���</td>
	<td  width="2%">��ȡ����</td>
	<td  width="3%">�������ܶ�</td>
	<td  width="3%">��ͬ�ܶ�</td>
	<td  width="4%">�����ͬ���</td>
	<td  width="4%">̨���ͬ���</td>
	<td  width="3%">����ͬ���</td>
	<td  width="3%">������ͬ���</td>
	<td  width="4%">����״̬</td>
	<td  width="2%">�Ƿ��������ʦ </td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
</tr>
<%

	ls_sql="SELECT ROWNUM,jc_cgdd.ddbh,jc_cgdd.khbh,crm_khxx.khxm,c.dwmc dm,crm_khxx.sjs,crm_khxx.hth,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.sgbz,sq_bzxx.dh,ysgcjdmc,cxhdbm,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.sccsj,jc_cgdd.sfcsj,jc_cgdd.qhtsj,jc_cgdd.jhazrq,jc_cgdd.ksazsj,jc_cgdd.sazrq,jc_cgdd.tdsj,pdgcmc,jc_cgdd.dj,jc_cgdd.zjhze,jc_cgdd.htze,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,clztmc,DECODE(jc_cgdd.sfpsjs,'1','��','2','��') sfpsjs, jc_cgdd.cgsjs,DECODE(jc_cgdd.khlx,'2','��װ�ͻ�','4','�Ǽ�װ�ͻ�'),jc_cgdd.lrr,jc_cgdd.lrsj,a.dwmc lrdw ";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,sq_dwxx a ,sq_dwxx c ,crm_khxx,dm_gcjdbm,sq_bzxx";
    ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) and jc_cgdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=c.dwbh(+)  ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
    ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by ROWNUM,jc_cgdd.lrsj";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(400);

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%>
</table>
</body>
</html>

