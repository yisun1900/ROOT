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
	
	
	
	String hf_bxkhhfjl_hfjlh=null;
	String hf_bxkhhfjl_hfsfcg=null;
	String hf_bxkhhfjl_hfr=null;
	String hf_bxkhhfjl_hfsj=null;
	String hf_bxkhhfjl_lrr=null;
	String hf_bxkhhfjl_lrsj=null;
	String hf_bxkhhfjl_lrbm=null;
	hf_bxkhhfjl_hfjlh=request.getParameter("hf_bxkhhfjl_hfjlh");
	if (hf_bxkhhfjl_hfjlh!=null)
	{
		hf_bxkhhfjl_hfjlh=cf.GB2Uni(hf_bxkhhfjl_hfjlh);
		if (!(hf_bxkhhfjl_hfjlh.equals("")))	wheresql+=" and  (hf_bxkhhfjl.hfjlh='"+hf_bxkhhfjl_hfjlh+"')";
	}
	hf_bxkhhfjl_hfsfcg=request.getParameter("hf_bxkhhfjl_hfsfcg");
	if (hf_bxkhhfjl_hfsfcg!=null)
	{
		hf_bxkhhfjl_hfsfcg=cf.GB2Uni(hf_bxkhhfjl_hfsfcg);
		if (!(hf_bxkhhfjl_hfsfcg.equals("")))	wheresql+=" and  (hf_bxkhhfjl.hfsfcg='"+hf_bxkhhfjl_hfsfcg+"')";
	}
	hf_bxkhhfjl_hfr=request.getParameter("hf_bxkhhfjl_hfr");
	if (hf_bxkhhfjl_hfr!=null)
	{
		hf_bxkhhfjl_hfr=cf.GB2Uni(hf_bxkhhfjl_hfr);
		if (!(hf_bxkhhfjl_hfr.equals("")))	wheresql+=" and  (hf_bxkhhfjl.hfr='"+hf_bxkhhfjl_hfr+"')";
	}
	hf_bxkhhfjl_hfsj=request.getParameter("hf_bxkhhfjl_hfsj");
	if (hf_bxkhhfjl_hfsj!=null)
	{
		hf_bxkhhfjl_hfsj=hf_bxkhhfjl_hfsj.trim();
		if (!(hf_bxkhhfjl_hfsj.equals("")))	wheresql+="  and (hf_bxkhhfjl.hfsj>=TO_DATE('"+hf_bxkhhfjl_hfsj+"','YYYY/MM/DD'))";
	}
	hf_bxkhhfjl_hfsj=request.getParameter("hf_bxkhhfjl_hfsj2");
	if (hf_bxkhhfjl_hfsj!=null)
	{
		hf_bxkhhfjl_hfsj=hf_bxkhhfjl_hfsj.trim();
		if (!(hf_bxkhhfjl_hfsj.equals("")))	wheresql+="  and (hf_bxkhhfjl.hfsj<=TO_DATE('"+hf_bxkhhfjl_hfsj+"','YYYY/MM/DD'))";
	}
	hf_bxkhhfjl_lrr=request.getParameter("hf_bxkhhfjl_lrr");
	if (hf_bxkhhfjl_lrr!=null)
	{
		hf_bxkhhfjl_lrr=cf.GB2Uni(hf_bxkhhfjl_lrr);
		if (!(hf_bxkhhfjl_lrr.equals("")))	wheresql+=" and  (hf_bxkhhfjl.lrr='"+hf_bxkhhfjl_lrr+"')";
	}
	hf_bxkhhfjl_lrsj=request.getParameter("hf_bxkhhfjl_lrsj");
	if (hf_bxkhhfjl_lrsj!=null)
	{
		hf_bxkhhfjl_lrsj=hf_bxkhhfjl_lrsj.trim();
		if (!(hf_bxkhhfjl_lrsj.equals("")))	wheresql+="  and (hf_bxkhhfjl.lrsj>=TO_DATE('"+hf_bxkhhfjl_lrsj+"','YYYY/MM/DD'))";
	}
	hf_bxkhhfjl_lrsj=request.getParameter("hf_bxkhhfjl_lrsj2");
	if (hf_bxkhhfjl_lrsj!=null)
	{
		hf_bxkhhfjl_lrsj=hf_bxkhhfjl_lrsj.trim();
		if (!(hf_bxkhhfjl_lrsj.equals("")))	wheresql+="  and (hf_bxkhhfjl.lrsj<=TO_DATE('"+hf_bxkhhfjl_lrsj+"','YYYY/MM/DD'))";
	}
	hf_bxkhhfjl_lrbm=request.getParameter("hf_bxkhhfjl_lrbm");
	if (hf_bxkhhfjl_lrbm!=null)
	{
		hf_bxkhhfjl_lrbm=cf.GB2Uni(hf_bxkhhfjl_lrbm);
		if (!(hf_bxkhhfjl_lrbm.equals("")))	wheresql+=" and  (hf_bxkhhfjl.lrbm='"+hf_bxkhhfjl_lrbm+"')";
	}
	ls_sql="SELECT hf_bxkhhfjl.hfjlh,hfjgmc,hfwtmc,DECODE(hf_bxkhhfjl.wtclzt,'1','δ����','2','�ڴ���','3','�ѽ��'),hf_bxkhhfjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_khxx.gj,crm_khxx.dd,hf_bxkhhfjl.hfr,hf_bxkhhfjl.hfsj,hf_bxkhhfjl.hfsm, hf_bxkhhfjl.lrr,hf_bxkhhfjl.lrsj,dwmc ";
	ls_sql+=" FROM crm_khxx,hf_bxkhhfjl,dm_hfjgbm,dm_hfwtbm,sq_sgd,sq_dwxx  ";
    ls_sql+=" where hf_bxkhhfjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and hf_bxkhhfjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and hf_bxkhhfjl.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and hf_bxkhhfjl.hfwtbm=dm_hfwtbm.hfwtbm(+)";
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
	pageObj.initPage("Hf_bxkhhfjlList.jsp","","","EditHf_bxkhhfjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hfjlh","hf_bxkhhfjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","hf_bxkhhfjl_hfr","hf_bxkhhfjl_hfsj","hf_bxkhhfjl_hfsm","hf_bxkhhfjl_hfsfcg","hf_bxkhhfjl_hfr","hf_bxkhhfjl_hfsj","hf_bxkhhfjl_hfsm","hf_bxkhhfjl_xmjfr","hf_bxkhhfjl_xmjfsj","hf_bxkhhfjl_xmjfsm","hf_bxkhhfjl_clzt","hf_bxkhhfjl_lrr","hf_bxkhhfjl_lrsj","hf_bxkhhfjl_lrbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hfjlh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteHf_bxkhhfjl.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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
	coluParm.link="ViewHf_bxkhhfjl.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">�깤��ػ��طã�ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">�طü�¼��</td>
	<td  width="3%">�طý��</td>
	<td  width="7%">�ط�����</td>
	<td  width="3%">���⴦��״̬</td>
	<td  width="3%">�ͻ����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="12%">���ݵ�ַ</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">�ܼ�</td>
	<td  width="3%">����</td>
	<td  width="3%">�ط���</td>
	<td  width="4%">�ط�ʱ��</td>
	<td  width="23%">�ط�˵��</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="7%">¼�벿��</td>
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