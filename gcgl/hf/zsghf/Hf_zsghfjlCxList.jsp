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
	
	
	String hflxbm=null;
	hflxbm=request.getParameter("hflxbm");
	if (hflxbm!=null)
	{
		hflxbm=cf.GB2Uni(hflxbm);
		if (!(hflxbm.equals("")))	wheresql+=" and  (hf_zsghfjl.hflxbm='"+hflxbm+"')";
	}
	String xchflxbm=null;
	xchflxbm=request.getParameter("xchflxbm");
	if (xchflxbm!=null)
	{
		xchflxbm=cf.GB2Uni(xchflxbm);
		if (!(xchflxbm.equals("")))	wheresql+=" and  (hf_zsghfjl.xchflxbm='"+xchflxbm+"')";
	}
	String hfjgbm=null;
	hfjgbm=request.getParameter("hfjgbm");
	if (hfjgbm!=null)
	{
		hfjgbm=cf.GB2Uni(hfjgbm);
		if (!(hfjgbm.equals("")))	wheresql+=" and  (hf_zsghfjl.hfjgbm='"+hfjgbm+"')";
	}
	String hfwtbm=null;
	hfwtbm=request.getParameter("hfwtbm");
	if (hfwtbm!=null)
	{
		hfwtbm=cf.GB2Uni(hfwtbm);
		if (!(hfwtbm.equals("")))	wheresql+=" and  (hf_zsghfjl.hfwtbm='"+hfwtbm+"')";
	}
	
	String hf_zsghfjl_hfjlh=null;
	String hf_zsghfjl_hfsfcg=null;
	String hf_zsghfjl_hfr=null;
	String hf_zsghfjl_hfsj=null;
	String hf_zsghfjl_lrr=null;
	String hf_zsghfjl_lrsj=null;
	String hf_zsghfjl_lrbm=null;
	hf_zsghfjl_hfjlh=request.getParameter("hf_zsghfjl_hfjlh");
	if (hf_zsghfjl_hfjlh!=null)
	{
		hf_zsghfjl_hfjlh=cf.GB2Uni(hf_zsghfjl_hfjlh);
		if (!(hf_zsghfjl_hfjlh.equals("")))	wheresql+=" and  (hf_zsghfjl.hfjlh='"+hf_zsghfjl_hfjlh+"')";
	}
	hf_zsghfjl_hfsfcg=request.getParameter("hf_zsghfjl_hfsfcg");
	if (hf_zsghfjl_hfsfcg!=null)
	{
		hf_zsghfjl_hfsfcg=cf.GB2Uni(hf_zsghfjl_hfsfcg);
		if (!(hf_zsghfjl_hfsfcg.equals("")))	wheresql+=" and  (hf_zsghfjl.hfsfcg='"+hf_zsghfjl_hfsfcg+"')";
	}
	hf_zsghfjl_hfr=request.getParameter("hf_zsghfjl_hfr");
	if (hf_zsghfjl_hfr!=null)
	{
		hf_zsghfjl_hfr=cf.GB2Uni(hf_zsghfjl_hfr);
		if (!(hf_zsghfjl_hfr.equals("")))	wheresql+=" and  (hf_zsghfjl.hfr='"+hf_zsghfjl_hfr+"')";
	}
	hf_zsghfjl_hfsj=request.getParameter("hf_zsghfjl_hfsj");
	if (hf_zsghfjl_hfsj!=null)
	{
		hf_zsghfjl_hfsj=hf_zsghfjl_hfsj.trim();
		if (!(hf_zsghfjl_hfsj.equals("")))	wheresql+="  and (hf_zsghfjl.hfsj>=TO_DATE('"+hf_zsghfjl_hfsj+"','YYYY/MM/DD'))";
	}
	hf_zsghfjl_hfsj=request.getParameter("hf_zsghfjl_hfsj2");
	if (hf_zsghfjl_hfsj!=null)
	{
		hf_zsghfjl_hfsj=hf_zsghfjl_hfsj.trim();
		if (!(hf_zsghfjl_hfsj.equals("")))	wheresql+="  and (hf_zsghfjl.hfsj<=TO_DATE('"+hf_zsghfjl_hfsj+"','YYYY/MM/DD'))";
	}
	hf_zsghfjl_lrr=request.getParameter("hf_zsghfjl_lrr");
	if (hf_zsghfjl_lrr!=null)
	{
		hf_zsghfjl_lrr=cf.GB2Uni(hf_zsghfjl_lrr);
		if (!(hf_zsghfjl_lrr.equals("")))	wheresql+=" and  (hf_zsghfjl.lrr='"+hf_zsghfjl_lrr+"')";
	}
	hf_zsghfjl_lrsj=request.getParameter("hf_zsghfjl_lrsj");
	if (hf_zsghfjl_lrsj!=null)
	{
		hf_zsghfjl_lrsj=hf_zsghfjl_lrsj.trim();
		if (!(hf_zsghfjl_lrsj.equals("")))	wheresql+="  and (hf_zsghfjl.lrsj>=TO_DATE('"+hf_zsghfjl_lrsj+"','YYYY/MM/DD'))";
	}
	hf_zsghfjl_lrsj=request.getParameter("hf_zsghfjl_lrsj2");
	if (hf_zsghfjl_lrsj!=null)
	{
		hf_zsghfjl_lrsj=hf_zsghfjl_lrsj.trim();
		if (!(hf_zsghfjl_lrsj.equals("")))	wheresql+="  and (hf_zsghfjl.lrsj<=TO_DATE('"+hf_zsghfjl_lrsj+"','YYYY/MM/DD'))";
	}
	hf_zsghfjl_lrbm=request.getParameter("hf_zsghfjl_lrbm");
	if (hf_zsghfjl_lrbm!=null)
	{
		hf_zsghfjl_lrbm=cf.GB2Uni(hf_zsghfjl_lrbm);
		if (!(hf_zsghfjl_lrbm.equals("")))	wheresql+=" and  (hf_zsghfjl.lrbm='"+hf_zsghfjl_lrbm+"')";
	}
	ls_sql="SELECT hf_zsghfjl.hfjlh,a.hflxmc,hfjgmc,hfwtmc,DECODE(hf_zsghfjl.wtclzt,'1','δ����','2','�ڴ���','3','�ѽ��'),hf_zsghfjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_khxx.gj,crm_khxx.dd,hf_zsghfjl.hfr,hf_zsghfjl.hfsj,hf_zsghfjl.hfsm,b.hflxmc xchflxbm,hf_zsghfjl.xchfrq,hf_zsghfjl.lrr,hf_zsghfjl.lrsj,dwmc ";
	ls_sql+=" FROM crm_khxx,hf_zsghfjl,dm_hfjgbm,dm_hfwtbm,sq_sgd,sq_dwxx,dm_hflxbm a,dm_hflxbm b ";
    ls_sql+=" where hf_zsghfjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and hf_zsghfjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and hf_zsghfjl.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and hf_zsghfjl.hfwtbm=dm_hfwtbm.hfwtbm(+)";
    ls_sql+=" and hf_zsghfjl.hflxbm=a.hflxbm(+)";
    ls_sql+=" and hf_zsghfjl.xchflxbm=b.hflxbm(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hf_zsghfjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hfjlh","hf_zsghfjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","hf_zsghfjl_hfr","hf_zsghfjl_hfsj","hf_zsghfjl_hfsm","hf_zsghfjl_hfsfcg","hf_zsghfjl_hfr","hf_zsghfjl_hfsj","hf_zsghfjl_hfsm","hf_zsghfjl_xmjfr","hf_zsghfjl_xmjfsj","hf_zsghfjl_xmjfsm","hf_zsghfjl_clzt","hf_zsghfjl_lrr","hf_zsghfjl_lrsj","hf_zsghfjl_lrbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hfjlh"};
	pageObj.setKey(keyName);


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

	String[] coluKey1={"hfjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="ViewHf_zsghfjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hfjlh",coluParm);//�в����������Hash��
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
  <B><font size="3">�طü�¼����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">�طü�¼��</td>
	<td  width="5%">�ط�����</td>
	<td  width="3%">�طý��</td>
	<td  width="5%">�ط�����</td>
	<td  width="3%">���⴦��״̬</td>
	<td  width="3%">�ͻ����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="8%">�绰</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">�ܼ�</td>
	<td  width="3%">����</td>
	<td  width="3%">�ط���</td>
	<td  width="4%">�ط�ʱ��</td>
	<td  width="19%">�ط�˵��</td>
	<td  width="4%">�´λط�����</td>
	<td  width="4%">�´λط�����</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="6%">¼�벿��</td>
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