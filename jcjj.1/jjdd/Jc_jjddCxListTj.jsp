<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<center><B>家具订单情况统计表</B></center><BR>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String jc_jjdd_ddbh=null;
	String jc_jjdd_khbh=null;
	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	String jc_jjdd_jhccsj=null;
	String jc_jjdd_jjsjs=null;
	String jc_jjdd_sccsj=null;
	String jc_jjdd_qhtsj=null;
	String jctdyybm=null;
	String jc_jjdd_jhazrq=null;
	String jc_jjdd_sazrq=null;
	String jc_jjdd_clzt=null;
	String jc_jjdd_khlx=null;
	String jc_jjdd_lrr=null;
	String jc_jjdd_lrsj=null;
	String jc_jjdd_tdsj=null;
	String jc_jjdd_dwbh=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	}

	String pdgc=null;
	pdgc=request.getParameter("pdgc");
	if (pdgc!=null)
	{
		if (!(pdgc.equals("")))	wheresql+=" and  (jc_jjdd.pdgc='"+pdgc+"')";
	}
	String sfpsjs=null;
	sfpsjs=request.getParameter("sfpsjs");
	if (sfpsjs!=null)
	{
		if (!(sfpsjs.equals("")))	wheresql+=" and  (jc_jjdd.sfpsjs='"+sfpsjs+"')";
	}

	jc_jjdd_ddbh=request.getParameter("jc_jjdd_ddbh");
	if (jc_jjdd_ddbh!=null)
	{
		jc_jjdd_ddbh=cf.GB2Uni(jc_jjdd_ddbh);
		if (!(jc_jjdd_ddbh.equals("")))	wheresql+=" and  (jc_jjdd.ddbh='"+jc_jjdd_ddbh+"')";
	}
	jc_jjdd_khbh=request.getParameter("jc_jjdd_khbh");
	if (jc_jjdd_khbh!=null)
	{
		jc_jjdd_khbh=cf.GB2Uni(jc_jjdd_khbh);
		if (!(jc_jjdd_khbh.equals("")))	wheresql+=" and  (jc_jjdd.khbh='"+jc_jjdd_khbh+"')";
	}
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_jjdd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_jjdd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_jjdd.xmzy='"+xmzy+"')";
	}
	jc_jjdd_jhccsj=request.getParameter("jc_jjdd_jhccsj");
	if (jc_jjdd_jhccsj!=null)
	{
		jc_jjdd_jhccsj=jc_jjdd_jhccsj.trim();
		if (!(jc_jjdd_jhccsj.equals("")))	wheresql+="  and (jc_jjdd.jhccsj>=TO_DATE('"+jc_jjdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_jhccsj=request.getParameter("jc_jjdd_jhccsj2");
	if (jc_jjdd_jhccsj!=null)
	{
		jc_jjdd_jhccsj=jc_jjdd_jhccsj.trim();
		if (!(jc_jjdd_jhccsj.equals("")))	wheresql+="  and (jc_jjdd.jhccsj<=TO_DATE('"+jc_jjdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_jjsjs=request.getParameter("jc_jjdd_jjsjs");
	if (jc_jjdd_jjsjs!=null)
	{
		jc_jjdd_jjsjs=cf.GB2Uni(jc_jjdd_jjsjs);
		if (!(jc_jjdd_jjsjs.equals("")))	wheresql+=" and  (jc_jjdd.jjsjs='"+jc_jjdd_jjsjs+"')";
	}
	jc_jjdd_sccsj=request.getParameter("jc_jjdd_sccsj");
	if (jc_jjdd_sccsj!=null)
	{
		jc_jjdd_sccsj=jc_jjdd_sccsj.trim();
		if (!(jc_jjdd_sccsj.equals("")))	wheresql+="  and (jc_jjdd.sccsj>=TO_DATE('"+jc_jjdd_sccsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_sccsj=request.getParameter("jc_jjdd_sccsj2");
	if (jc_jjdd_sccsj!=null)
	{
		jc_jjdd_sccsj=jc_jjdd_sccsj.trim();
		if (!(jc_jjdd_sccsj.equals("")))	wheresql+="  and (jc_jjdd.sccsj<=TO_DATE('"+jc_jjdd_sccsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_qhtsj=request.getParameter("jc_jjdd_qhtsj");
	if (jc_jjdd_qhtsj!=null)
	{
		jc_jjdd_qhtsj=jc_jjdd_qhtsj.trim();
		if (!(jc_jjdd_qhtsj.equals("")))	wheresql+="  and (jc_jjdd.qhtsj>=TO_DATE('"+jc_jjdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_qhtsj=request.getParameter("jc_jjdd_qhtsj2");
	if (jc_jjdd_qhtsj!=null)
	{
		jc_jjdd_qhtsj=jc_jjdd_qhtsj.trim();
		if (!(jc_jjdd_qhtsj.equals("")))	wheresql+="  and (jc_jjdd.qhtsj<=TO_DATE('"+jc_jjdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jctdyybm=request.getParameter("jctdyybm");
	if (jctdyybm!=null)
	{
		jctdyybm=cf.GB2Uni(jctdyybm);
		if (!(jctdyybm.equals("")))	wheresql+=" and  (jc_cgdd.jctdyybm='"+jctdyybm+"')";
	}
	jc_jjdd_jhazrq=request.getParameter("jc_jjdd_jhazrq");
	if (jc_jjdd_jhazrq!=null)
	{
		jc_jjdd_jhazrq=jc_jjdd_jhazrq.trim();
		if (!(jc_jjdd_jhazrq.equals("")))	wheresql+="  and (jc_jjdd.jhazrq>=TO_DATE('"+jc_jjdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_jjdd_jhazrq=request.getParameter("jc_jjdd_jhazrq2");
	if (jc_jjdd_jhazrq!=null)
	{
		jc_jjdd_jhazrq=jc_jjdd_jhazrq.trim();
		if (!(jc_jjdd_jhazrq.equals("")))	wheresql+="  and (jc_jjdd.jhazrq<=TO_DATE('"+jc_jjdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_jjdd_sazrq=request.getParameter("jc_jjdd_sazrq");
	if (jc_jjdd_sazrq!=null)
	{
		jc_jjdd_sazrq=jc_jjdd_sazrq.trim();
		if (!(jc_jjdd_sazrq.equals("")))	wheresql+="  and (jc_jjdd.sazrq>=TO_DATE('"+jc_jjdd_sazrq+"','YYYY/MM/DD'))";
	}
	jc_jjdd_sazrq=request.getParameter("jc_jjdd_sazrq2");
	if (jc_jjdd_sazrq!=null)
	{
		jc_jjdd_sazrq=jc_jjdd_sazrq.trim();
		if (!(jc_jjdd_sazrq.equals("")))	wheresql+="  and (jc_jjdd.sazrq<=TO_DATE('"+jc_jjdd_sazrq+"','YYYY/MM/DD'))";
	}
	jc_jjdd_clzt=request.getParameter("jc_jjdd_clzt");
	if (jc_jjdd_clzt!=null)
	{
		jc_jjdd_clzt=cf.GB2Uni(jc_jjdd_clzt);
		if (!(jc_jjdd_clzt.equals("")))	wheresql+=" and  (jc_jjdd.clzt='"+jc_jjdd_clzt+"')";
	}
	jc_jjdd_khlx=request.getParameter("jc_jjdd_khlx");
	if (jc_jjdd_khlx!=null)
	{
		jc_jjdd_khlx=cf.GB2Uni(jc_jjdd_khlx);
		if (!(jc_jjdd_khlx.equals("")))	wheresql+=" and  (jc_jjdd.khlx='"+jc_jjdd_khlx+"')";
	}
	jc_jjdd_lrr=request.getParameter("jc_jjdd_lrr");
	if (jc_jjdd_lrr!=null)
	{
		jc_jjdd_lrr=cf.GB2Uni(jc_jjdd_lrr);
		if (!(jc_jjdd_lrr.equals("")))	wheresql+=" and  (jc_jjdd.lrr='"+jc_jjdd_lrr+"')";
	}
	jc_jjdd_lrsj=request.getParameter("jc_jjdd_lrsj");
	if (jc_jjdd_lrsj!=null)
	{
		jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
		if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj>=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_lrsj=request.getParameter("jc_jjdd_lrsj2");
	if (jc_jjdd_lrsj!=null)
	{
		jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
		if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj<=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_tdsj=request.getParameter("jc_jjdd_tdsj");
	if (jc_jjdd_tdsj!=null)
	{
		jc_jjdd_tdsj=jc_jjdd_tdsj.trim();
		if (!(jc_jjdd_tdsj.equals("")))	wheresql+="  and (jc_jjdd.tdsj>=TO_DATE('"+jc_jjdd_tdsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_tdsj=request.getParameter("jc_jjdd_tdsj2");
	if (jc_jjdd_tdsj!=null)
	{
		jc_jjdd_tdsj=jc_jjdd_tdsj.trim();
		if (!(jc_jjdd_tdsj.equals("")))	wheresql+="  and (jc_jjdd.tdsj<=TO_DATE('"+jc_jjdd_tdsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_dwbh=request.getParameter("jc_jjdd_dwbh");
	if (jc_jjdd_dwbh!=null)
	{
		jc_jjdd_dwbh=cf.GB2Uni(jc_jjdd_dwbh);
		if (!(jc_jjdd_dwbh.equals("")))	wheresql+=" and  (jc_jjdd.dwbh='"+jc_jjdd_dwbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs+"%')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

%>

<table style='FONT-SIZE:12px' width='260%' border='1' cellspacing='0' cellpadding='1'>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">序号</td>
	<td  width="3%">订单编号</td>
	<td  width="2%">客户编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="4%">签约店面</td>
	<td  width="3%">家装设计师</td>
	<td  width="3%">合同号</td>
	<td  width="3%">项目专员</td>
	<td  width="3%">驻店家居顾问</td>
	<td  width="3%">展厅家居顾问</td>
	<td  width="4%">联系电话</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">班长</td>
	<td  width="5%">班长电话</td>
    <td  width="4%">促销活动</td>
	<td  width="3%">初测日期</td>
	<td  width="3%">签约日期</td>
	<td  width="5%">家具工厂</td>
	<td  width="5%">型材门工厂</td>
	<td  width="3%">合同安装日期</td>
	<td  width="3%">开始安装时间</td>
	<td  width="3%">安装完成日期</td>
	<td  width="3%">确认退单日期</td>
	<td  width="3%">订金</td>
	<td  width="4%">合同总额</td>
	<td  width="4%">家具合同金额</td>
	<td  width="4%">型材门合同金额</td>
	<td  width="4%">增减后总额</td>
	<td  width="4%">家具增减后金额</td>
	<td  width="4%">型材门增减后金额</td>
	<td  width="4%">处理状态</td>
	<td  width="2%">需派设计师</td>
	<td  width="3%">家居设计师</td>
	<td  width="4%">客户类型</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
</tr>
<%
	ls_sql="SELECT ROWNUM,jc_jjdd.ddbh ,jc_jjdd.khbh,crm_khxx.khxm khxm,b.dwmc dm,crm_khxx.sjs ,crm_khxx.hth,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.sgbz,sq_bzxx.dh ,cxhdbm,jc_jjdd.sccsj,jc_jjdd.qhtsj,c.gysmc pdgc,d.gysmc xcmgc,jc_jjdd.jhazrq,jc_jjdd.ksazsj,jc_jjdd.sazrq,jc_jjdd.tdsj,jc_jjdd.dj,jc_jjdd.htze,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.zjhze,jc_jjdd.jjzjje,jc_jjdd.xcmzjje,clztmc,DECODE(jc_jjdd.sfpsjs,'1','需要','2','否') sfpsjs,jc_jjdd.jjsjs,DECODE(jc_jjdd.khlx,'2','家装客户','4','非家装客户') as jc_jjdd_khlx,jc_jjdd.lrr,jc_jjdd.lrsj,a.dwmc as lrbm  ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,sq_dwxx a,sq_dwxx b,crm_khxx,sq_gysxx c,sq_gysxx d,sq_bzxx";
    ls_sql+=" where jc_jjdd.dwbh=a.dwbh(+) and jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_khxx.dwbh=b.dwbh(+) and jc_jjdd.pdgc=c.gysbh(+)and jc_jjdd.xcmgc=d.gysbh(+)";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
    ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+)";
    ls_sql+=" and crm_khxx.sgd=sq_bzxx.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by ROWNUM,jc_jjdd.lrsj";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(20000);

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%>
</table>
</body>
</html>
