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

	String jxc_ckd_ckph=null;
	String jxc_ckd_dqbm=null;
	String jxc_ckd_fgsbh=null;
	String jxc_ckd_ckbh=null;
	String jxc_ckd_ckcllx=null;
	String jxc_ckd_cklx=null;
	String jxc_ckd_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String jxc_ckd_ckfs=null;
	String jxc_ckd_psfs=null;
	String jxc_ckd_jhshsj=null;
	String jxc_ckd_lydh=null;
	String jxc_ckd_ddbh=null;
	String jxc_ckd_thdbh=null;
	String jxc_ckd_sgph=null;
	String jxc_ckd_psph=null;
	String jxc_ckd_czxh=null;
	String jxc_ckd_xsph=null;
	String jxc_ckd_dbph=null;
	String jxc_ckd_rkph=null;
	String jxc_ckd_ckr=null;
	String jxc_ckd_cksj=null;
	String jxc_ckd_ckdzt=null;
	String jxc_ckd_sfth=null;
	String jxc_ckd_sfjz=null;
	String jxc_ckd_sfyfkc=null;
	String jxc_ckd_lrr=null;
	String jxc_ckd_lrsj=null;
	String jxc_ckd_lrbm=null;
	jxc_ckd_ckph=request.getParameter("jxc_ckd_ckph");
	if (jxc_ckd_ckph!=null)
	{
		jxc_ckd_ckph=cf.GB2Uni(jxc_ckd_ckph);
		if (!(jxc_ckd_ckph.equals("")))	wheresql+=" and  (jxc_ckd.ckph='"+jxc_ckd_ckph+"')";
	}
	jxc_ckd_dqbm=request.getParameter("jxc_ckd_dqbm");
	if (jxc_ckd_dqbm!=null)
	{
		jxc_ckd_dqbm=cf.GB2Uni(jxc_ckd_dqbm);
		if (!(jxc_ckd_dqbm.equals("")))	wheresql+=" and  (jxc_ckd.dqbm='"+jxc_ckd_dqbm+"')";
	}
	jxc_ckd_fgsbh=request.getParameter("jxc_ckd_fgsbh");
	if (jxc_ckd_fgsbh!=null)
	{
		jxc_ckd_fgsbh=cf.GB2Uni(jxc_ckd_fgsbh);
		if (!(jxc_ckd_fgsbh.equals("")))	wheresql+=" and  (jxc_ckd.fgsbh='"+jxc_ckd_fgsbh+"')";
	}
	jxc_ckd_ckbh=request.getParameter("jxc_ckd_ckbh");
	if (jxc_ckd_ckbh!=null)
	{
		jxc_ckd_ckbh=cf.GB2Uni(jxc_ckd_ckbh);
		if (!(jxc_ckd_ckbh.equals("")))	wheresql+=" and  (jxc_ckd.ckbh='"+jxc_ckd_ckbh+"')";
	}
	jxc_ckd_ckcllx=request.getParameter("jxc_ckd_ckcllx");
	if (jxc_ckd_ckcllx!=null)
	{
		jxc_ckd_ckcllx=cf.GB2Uni(jxc_ckd_ckcllx);
		if (!(jxc_ckd_ckcllx.equals("")))	wheresql+=" and  (jxc_ckd.ckcllx='"+jxc_ckd_ckcllx+"')";
	}
	jxc_ckd_cklx=request.getParameter("jxc_ckd_cklx");
	if (jxc_ckd_cklx!=null)
	{
		jxc_ckd_cklx=cf.GB2Uni(jxc_ckd_cklx);
		if (!(jxc_ckd_cklx.equals("")))	wheresql+=" and  (jxc_ckd.cklx='"+jxc_ckd_cklx+"')";
	}
	jxc_ckd_khbh=request.getParameter("jxc_ckd_khbh");
	if (jxc_ckd_khbh!=null)
	{
		jxc_ckd_khbh=cf.GB2Uni(jxc_ckd_khbh);
		if (!(jxc_ckd_khbh.equals("")))	wheresql+=" and  (jxc_ckd.khbh='"+jxc_ckd_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
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
	jxc_ckd_ckfs=request.getParameter("jxc_ckd_ckfs");
	if (jxc_ckd_ckfs!=null)
	{
		jxc_ckd_ckfs=cf.GB2Uni(jxc_ckd_ckfs);
		if (!(jxc_ckd_ckfs.equals("")))	wheresql+=" and  (jxc_ckd.ckfs='"+jxc_ckd_ckfs+"')";
	}
	jxc_ckd_psfs=request.getParameter("jxc_ckd_psfs");
	if (jxc_ckd_psfs!=null)
	{
		jxc_ckd_psfs=cf.GB2Uni(jxc_ckd_psfs);
		if (!(jxc_ckd_psfs.equals("")))	wheresql+=" and  (jxc_ckd.psfs='"+jxc_ckd_psfs+"')";
	}
	jxc_ckd_jhshsj=request.getParameter("jxc_ckd_jhshsj");
	if (jxc_ckd_jhshsj!=null)
	{
		jxc_ckd_jhshsj=jxc_ckd_jhshsj.trim();
		if (!(jxc_ckd_jhshsj.equals("")))	wheresql+="  and (jxc_ckd.jhshsj>=TO_DATE('"+jxc_ckd_jhshsj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_jhshsj=request.getParameter("jxc_ckd_jhshsj2");
	if (jxc_ckd_jhshsj!=null)
	{
		jxc_ckd_jhshsj=jxc_ckd_jhshsj.trim();
		if (!(jxc_ckd_jhshsj.equals("")))	wheresql+="  and (jxc_ckd.jhshsj<=TO_DATE('"+jxc_ckd_jhshsj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_lydh=request.getParameter("jxc_ckd_lydh");
	if (jxc_ckd_lydh!=null)
	{
		jxc_ckd_lydh=cf.GB2Uni(jxc_ckd_lydh);
		if (!(jxc_ckd_lydh.equals("")))	wheresql+=" and  (jxc_ckd.lydh='"+jxc_ckd_lydh+"')";
	}
	jxc_ckd_ddbh=request.getParameter("jxc_ckd_ddbh");
	if (jxc_ckd_ddbh!=null)
	{
		jxc_ckd_ddbh=cf.GB2Uni(jxc_ckd_ddbh);
		if (!(jxc_ckd_ddbh.equals("")))	wheresql+=" and  (jxc_ckd.ddbh='"+jxc_ckd_ddbh+"')";
	}
	jxc_ckd_thdbh=request.getParameter("jxc_ckd_thdbh");
	if (jxc_ckd_thdbh!=null)
	{
		jxc_ckd_thdbh=cf.GB2Uni(jxc_ckd_thdbh);
		if (!(jxc_ckd_thdbh.equals("")))	wheresql+=" and  (jxc_ckd.thdbh='"+jxc_ckd_thdbh+"')";
	}
	jxc_ckd_sgph=request.getParameter("jxc_ckd_sgph");
	if (jxc_ckd_sgph!=null)
	{
		jxc_ckd_sgph=cf.GB2Uni(jxc_ckd_sgph);
		if (!(jxc_ckd_sgph.equals("")))	wheresql+=" and  (jxc_ckd.sgph='"+jxc_ckd_sgph+"')";
	}
	jxc_ckd_psph=request.getParameter("jxc_ckd_psph");
	if (jxc_ckd_psph!=null)
	{
		jxc_ckd_psph=cf.GB2Uni(jxc_ckd_psph);
		if (!(jxc_ckd_psph.equals("")))	wheresql+=" and  (jxc_ckd.psph='"+jxc_ckd_psph+"')";
	}
	jxc_ckd_czxh=request.getParameter("jxc_ckd_czxh");
	if (jxc_ckd_czxh!=null)
	{
		jxc_ckd_czxh=cf.GB2Uni(jxc_ckd_czxh);
		if (!(jxc_ckd_czxh.equals("")))	wheresql+=" and  (jxc_ckd.czxh='"+jxc_ckd_czxh+"')";
	}
	jxc_ckd_xsph=request.getParameter("jxc_ckd_xsph");
	if (jxc_ckd_xsph!=null)
	{
		jxc_ckd_xsph=cf.GB2Uni(jxc_ckd_xsph);
		if (!(jxc_ckd_xsph.equals("")))	wheresql+=" and  (jxc_ckd.xsph='"+jxc_ckd_xsph+"')";
	}
	jxc_ckd_dbph=request.getParameter("jxc_ckd_dbph");
	if (jxc_ckd_dbph!=null)
	{
		jxc_ckd_dbph=cf.GB2Uni(jxc_ckd_dbph);
		if (!(jxc_ckd_dbph.equals("")))	wheresql+=" and  (jxc_ckd.dbph='"+jxc_ckd_dbph+"')";
	}
	jxc_ckd_rkph=request.getParameter("jxc_ckd_rkph");
	if (jxc_ckd_rkph!=null)
	{
		jxc_ckd_rkph=cf.GB2Uni(jxc_ckd_rkph);
		if (!(jxc_ckd_rkph.equals("")))	wheresql+=" and  (jxc_ckd.rkph='"+jxc_ckd_rkph+"')";
	}
	jxc_ckd_ckr=request.getParameter("jxc_ckd_ckr");
	if (jxc_ckd_ckr!=null)
	{
		jxc_ckd_ckr=cf.GB2Uni(jxc_ckd_ckr);
		if (!(jxc_ckd_ckr.equals("")))	wheresql+=" and  (jxc_ckd.ckr='"+jxc_ckd_ckr+"')";
	}
	jxc_ckd_cksj=request.getParameter("jxc_ckd_cksj");
	if (jxc_ckd_cksj!=null)
	{
		jxc_ckd_cksj=jxc_ckd_cksj.trim();
		if (!(jxc_ckd_cksj.equals("")))	wheresql+="  and (jxc_ckd.cksj>=TO_DATE('"+jxc_ckd_cksj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_cksj=request.getParameter("jxc_ckd_cksj2");
	if (jxc_ckd_cksj!=null)
	{
		jxc_ckd_cksj=jxc_ckd_cksj.trim();
		if (!(jxc_ckd_cksj.equals("")))	wheresql+="  and (jxc_ckd.cksj<=TO_DATE('"+jxc_ckd_cksj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_ckdzt=request.getParameter("jxc_ckd_ckdzt");
	if (jxc_ckd_ckdzt!=null)
	{
		jxc_ckd_ckdzt=cf.GB2Uni(jxc_ckd_ckdzt);
		if (!(jxc_ckd_ckdzt.equals("")))	wheresql+=" and  (jxc_ckd.ckdzt='"+jxc_ckd_ckdzt+"')";
	}
	jxc_ckd_sfth=request.getParameter("jxc_ckd_sfth");
	if (jxc_ckd_sfth!=null)
	{
		jxc_ckd_sfth=cf.GB2Uni(jxc_ckd_sfth);
		if (!(jxc_ckd_sfth.equals("")))	wheresql+=" and  (jxc_ckd.sfth='"+jxc_ckd_sfth+"')";
	}
	jxc_ckd_sfjz=request.getParameter("jxc_ckd_sfjz");
	if (jxc_ckd_sfjz!=null)
	{
		jxc_ckd_sfjz=cf.GB2Uni(jxc_ckd_sfjz);
		if (!(jxc_ckd_sfjz.equals("")))	wheresql+=" and  (jxc_ckd.sfjz='"+jxc_ckd_sfjz+"')";
	}
	jxc_ckd_sfyfkc=request.getParameter("jxc_ckd_sfyfkc");
	if (jxc_ckd_sfyfkc!=null)
	{
		jxc_ckd_sfyfkc=cf.GB2Uni(jxc_ckd_sfyfkc);
		if (!(jxc_ckd_sfyfkc.equals("")))	wheresql+=" and  (jxc_ckd.sfyfkc='"+jxc_ckd_sfyfkc+"')";
	}
	jxc_ckd_lrr=request.getParameter("jxc_ckd_lrr");
	if (jxc_ckd_lrr!=null)
	{
		jxc_ckd_lrr=cf.GB2Uni(jxc_ckd_lrr);
		if (!(jxc_ckd_lrr.equals("")))	wheresql+=" and  (jxc_ckd.lrr='"+jxc_ckd_lrr+"')";
	}
	jxc_ckd_lrsj=request.getParameter("jxc_ckd_lrsj");
	if (jxc_ckd_lrsj!=null)
	{
		jxc_ckd_lrsj=jxc_ckd_lrsj.trim();
		if (!(jxc_ckd_lrsj.equals("")))	wheresql+="  and (jxc_ckd.lrsj>=TO_DATE('"+jxc_ckd_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_lrsj=request.getParameter("jxc_ckd_lrsj2");
	if (jxc_ckd_lrsj!=null)
	{
		jxc_ckd_lrsj=jxc_ckd_lrsj.trim();
		if (!(jxc_ckd_lrsj.equals("")))	wheresql+="  and (jxc_ckd.lrsj<=TO_DATE('"+jxc_ckd_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_lrbm=request.getParameter("jxc_ckd_lrbm");
	if (jxc_ckd_lrbm!=null)
	{
		jxc_ckd_lrbm=cf.GB2Uni(jxc_ckd_lrbm);
		if (!(jxc_ckd_lrbm.equals("")))	wheresql+=" and  (jxc_ckd.lrbm='"+jxc_ckd_lrbm+"')";
	}
	ls_sql="SELECT jxc_ckd.ckph,DECODE(jxc_ckd.ckdzt,'0','δ�ύ','1','�ȴ��������','2','�ȴ��˻����','3','�ȴ��������','4','�ѽ���','5','�˻����ͨ��','6','�������δͨ��','7','�˻����δͨ��','8','���ܷ������','9','�ύ'), DECODE(jxc_ckd.cklx,'D','��������','B','���ϳ���','T','�˻�����','S','�깺����','P','���ϵ�����','J','���Ĵ���ȯ����','X','���۳���','R','��������'),d.dqmc mddqbm,DECODE(jxc_ckd.sfxnckd,'Y','����','N','��'), jxc_ckd.ckzsl,jxc_ckd.ckzje, DECODE(jxc_ckd.ckfs,'1','�������ȳ���','2','������ȳ���','3','�ֹ�����'), DECODE(jxc_ckd.psfs,'0','��������','1','��˾�ͻ�','2','��ȡ'),jxc_ckd.jhshsj,jxc_ckd.lydh,jxc_ckd.ckr,jxc_ckd.cksj, DECODE(jxc_ckd.sfyfkc,'1','�޸����','2','�����δ���','3','��������'),jxc_ckd.lrr,jxc_ckd.lrsj,b.dwmc lrbm,c.dqmc,a.dwmc fgsbh,ckmc, DECODE(jxc_ckd.ckcllx,'0','����','1','����'),jxc_ckd.bz  ";
	ls_sql+=" FROM jxc_ckd,dm_dqbm c,dm_dqbm d,sq_dwxx a,sq_dwxx b,jxc_ckmc  ";
    ls_sql+=" where jxc_ckd.dqbm=c.dqbm(+) and jxc_ckd.mddqbm=d.dqbm(+)";
    ls_sql+=" and jxc_ckd.fgsbh=a.dwbh(+)";
    ls_sql+=" and jxc_ckd.lrbm=b.dwbh(+)";
    ls_sql+=" and jxc_ckd.ckbh=jxc_ckmc.ckbh(+)";
	ls_sql+=" and jxc_ckd.ckcllx='0'";//0�����ģ�1������
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and jxc_ckd.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jxc_ckd.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_ckd.cksj desc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Jxc_ckdCxList.jsp","","","/jxcdy/printCkd.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ckph","jxc_ckd_dqbm","jxc_ckd_fgsbh","jxc_ckd_ckbh","jxc_ckd_ckzsl","jxc_ckd_ckzje","jxc_ckd_ckzcb","jxc_ckd_ckcllx","jxc_ckd_cklx","jxc_ckd_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","jxc_ckd_ckfs","jxc_ckd_psfs","jxc_ckd_jhshsj","jxc_ckd_lydh","jxc_ckd_ddbh","jxc_ckd_thdbh","jxc_ckd_sgph","jxc_ckd_psph","jxc_ckd_czxh","jxc_ckd_xsph","jxc_ckd_dbph","jxc_ckd_rkph","jxc_ckd_ckr","jxc_ckd_cksj","jxc_ckd_ckdzt","jxc_ckd_sfth","jxc_ckd_sfjz","jxc_ckd_sfyfkc","jxc_ckd_lrr","jxc_ckd_lrsj","jxc_ckd_lrbm","jxc_ckd_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ckph"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("��ӡ");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ckph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJxc_ckd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ckph",coluParm);//�в����������Hash��
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
  <B><font size="3">���ⵥ����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">��������</td>
	<td  width="4%">���ⵥ״̬</td>
	<td  width="4%">��������</td>
	<td  width="3%">Ŀ�ĵ���</td>
	<td  width="3%">�������</td>
	<td  width="4%">����������</td>
	<td  width="4%">�����ܽ��</td>
	<td  width="5%">���ⷽʽ</td>
	<td  width="3%">���ͷ�ʽ</td>
	<td  width="4%">�ƻ��ͻ�ʱ��</td>
	<td  width="4%">��Դ����</td>
	<td  width="3%">������</td>
	<td  width="4%">����ʱ��</td>
	<td  width="4%">�Ƿ��и����</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="6%">¼�벿��</td>
	<td  width="3%">����</td>
	<td  width="5%">�ֹ�˾</td>
	<td  width="5%">����ֿ�</td>
	<td  width="3%">�����������</td>
	<td  width="62%">��ע</td>
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