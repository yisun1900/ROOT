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
	
	String sgd=null;
	String sgbz=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.sgd='"+sgd+"')";
	}
	sgbz=request.getParameter("sgbz");
	if (sgbz!=null)
	{
		sgbz=cf.GB2Uni(sgbz);
		if (!(sgbz.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.sgbz='"+sgbz+"')";
	}
	
	
	String gdjsjd=null;
	gdjsjd=request.getParameter("gdjsjd");
	if (gdjsjd!=null)
	{
		gdjsjd=cf.GB2Uni(gdjsjd);
		if (!(gdjsjd.equals("")))	wheresql+=" and  (crm_khxx.gdjsjd='"+gdjsjd+"')";
	}

	String cw_sgdzqjsjlkb_jsjlh=null;
	String cw_sgdzqjsjlkb_jsrq=null;
	String cw_sgdzqjsjlkb_jsbl=null;
	String cw_sgdzqjsjlkb_lrr=null;
	String cw_sgdzqjsjlkb_lrsj=null;
	cw_sgdzqjsjlkb_jsjlh=request.getParameter("cw_sgdzqjsjlkb_jsjlh");
	if (cw_sgdzqjsjlkb_jsjlh!=null)
	{
		cw_sgdzqjsjlkb_jsjlh=cf.GB2Uni(cw_sgdzqjsjlkb_jsjlh);
		if (!(cw_sgdzqjsjlkb_jsjlh.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.jsjlh='"+cw_sgdzqjsjlkb_jsjlh+"')";
	}
	cw_sgdzqjsjlkb_jsrq=request.getParameter("cw_sgdzqjsjlkb_jsrq");
	if (cw_sgdzqjsjlkb_jsrq!=null)
	{
		cw_sgdzqjsjlkb_jsrq=cw_sgdzqjsjlkb_jsrq.trim();
		if (!(cw_sgdzqjsjlkb_jsrq.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.jsrq>=TO_DATE('"+cw_sgdzqjsjlkb_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_jsrq=request.getParameter("cw_sgdzqjsjlkb_jsrq2");
	if (cw_sgdzqjsjlkb_jsrq!=null)
	{
		cw_sgdzqjsjlkb_jsrq=cw_sgdzqjsjlkb_jsrq.trim();
		if (!(cw_sgdzqjsjlkb_jsrq.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.jsrq<=TO_DATE('"+cw_sgdzqjsjlkb_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_jsbl=request.getParameter("cw_sgdzqjsjlkb_jsbl");
	if (cw_sgdzqjsjlkb_jsbl!=null)
	{
		cw_sgdzqjsjlkb_jsbl=cw_sgdzqjsjlkb_jsbl.trim();
		if (!(cw_sgdzqjsjlkb_jsbl.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.jsbl>="+cw_sgdzqjsjlkb_jsbl+") ";
	}
	cw_sgdzqjsjlkb_jsbl=request.getParameter("cw_sgdzqjsjlkb_jsbl");
	if (cw_sgdzqjsjlkb_jsbl!=null)
	{
		cw_sgdzqjsjlkb_jsbl=cw_sgdzqjsjlkb_jsbl.trim();
		if (!(cw_sgdzqjsjlkb_jsbl.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.jsbl<="+cw_sgdzqjsjlkb_jsbl+") ";
	}
	cw_sgdzqjsjlkb_lrsj=request.getParameter("cw_sgdzqjsjlkb_lrsj");
	if (cw_sgdzqjsjlkb_lrsj!=null)
	{
		cw_sgdzqjsjlkb_lrsj=cw_sgdzqjsjlkb_lrsj.trim();
		if (!(cw_sgdzqjsjlkb_lrsj.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.lrsj>=TO_DATE('"+cw_sgdzqjsjlkb_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_lrsj=request.getParameter("cw_sgdzqjsjlkb_lrsj2");
	if (cw_sgdzqjsjlkb_lrsj!=null)
	{
		cw_sgdzqjsjlkb_lrsj=cw_sgdzqjsjlkb_lrsj.trim();
		if (!(cw_sgdzqjsjlkb_lrsj.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.lrsj<=TO_DATE('"+cw_sgdzqjsjlkb_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_lrr=request.getParameter("cw_sgdzqjsjlkb_lrr");
	if (cw_sgdzqjsjlkb_lrr!=null)
	{
		cw_sgdzqjsjlkb_lrr=cf.GB2Uni(cw_sgdzqjsjlkb_lrr);
		if (!(cw_sgdzqjsjlkb_lrr.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.lrr='"+cw_sgdzqjsjlkb_lrr+"')";
	}

	ls_sql="SELECT '',crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,cw_sgdzqjsjlkb.jsrq,cw_sgdzqjsjlkb.jsje,cw_sgdzqjsjlkb.jsbl||'%',cw_sgdzqjsjlkb.jskjs,'' qz";
	ls_sql+=" FROM crm_khxx,cw_sgdzqjsjlkb,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_sgdzqjsjlkb.khbh=crm_khxx.khbh(+) and cw_sgdzqjsjlkb.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_sgdzqjsjlkb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_sgdzqjsjlkb.lx='B'";//B:����ն��ν���

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

    ls_sql+=wheresql;
	ls_sql+=" order by cw_sgdzqjsjlkb.jsrq desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_sgdzqjsjlkbJsHzList.jsp","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

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
  <B><font size="3">������ܵ�</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="10%">��ͬ��</td>
	<td  width="8%">�ͻ�����</td>
	<td  width="23%">���ݵ�ַ</td>
	<td  width="8%">ʩ����</td>
	<td  width="10%">��������</td>
	<td  width="11%">������</td>
	<td  width="8%">�������</td>
	<td  width="11%">��������</td>
	<td  width="7%">ǩ��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>

</body>
</html>