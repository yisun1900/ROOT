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
	
	
	
	String crm_wghfjl_hfjlh=null;
	String crm_wghfjl_hfsfcg=null;
	String crm_wghfjl_hfr=null;
	String crm_wghfjl_hfsj=null;
	String crm_wghfjl_lrr=null;
	String crm_wghfjl_lrsj=null;
	String crm_wghfjl_lrbm=null;
	crm_wghfjl_hfjlh=request.getParameter("crm_wghfjl_hfjlh");
	if (crm_wghfjl_hfjlh!=null)
	{
		crm_wghfjl_hfjlh=cf.GB2Uni(crm_wghfjl_hfjlh);
		if (!(crm_wghfjl_hfjlh.equals("")))	wheresql+=" and  (crm_wghfjl.hfjlh='"+crm_wghfjl_hfjlh+"')";
	}
	crm_wghfjl_hfsfcg=request.getParameter("crm_wghfjl_hfsfcg");
	if (crm_wghfjl_hfsfcg!=null)
	{
		crm_wghfjl_hfsfcg=cf.GB2Uni(crm_wghfjl_hfsfcg);
		if (!(crm_wghfjl_hfsfcg.equals("")))	wheresql+=" and  (crm_wghfjl.hfsfcg='"+crm_wghfjl_hfsfcg+"')";
	}
	crm_wghfjl_hfr=request.getParameter("crm_wghfjl_hfr");
	if (crm_wghfjl_hfr!=null)
	{
		crm_wghfjl_hfr=cf.GB2Uni(crm_wghfjl_hfr);
		if (!(crm_wghfjl_hfr.equals("")))	wheresql+=" and  (crm_wghfjl.hfr='"+crm_wghfjl_hfr+"')";
	}
	crm_wghfjl_hfsj=request.getParameter("crm_wghfjl_hfsj");
	if (crm_wghfjl_hfsj!=null)
	{
		crm_wghfjl_hfsj=crm_wghfjl_hfsj.trim();
		if (!(crm_wghfjl_hfsj.equals("")))	wheresql+="  and (crm_wghfjl.hfsj>=TO_DATE('"+crm_wghfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_wghfjl_hfsj=request.getParameter("crm_wghfjl_hfsj2");
	if (crm_wghfjl_hfsj!=null)
	{
		crm_wghfjl_hfsj=crm_wghfjl_hfsj.trim();
		if (!(crm_wghfjl_hfsj.equals("")))	wheresql+="  and (crm_wghfjl.hfsj<=TO_DATE('"+crm_wghfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_wghfjl_lrr=request.getParameter("crm_wghfjl_lrr");
	if (crm_wghfjl_lrr!=null)
	{
		crm_wghfjl_lrr=cf.GB2Uni(crm_wghfjl_lrr);
		if (!(crm_wghfjl_lrr.equals("")))	wheresql+=" and  (crm_wghfjl.lrr='"+crm_wghfjl_lrr+"')";
	}
	crm_wghfjl_lrsj=request.getParameter("crm_wghfjl_lrsj");
	if (crm_wghfjl_lrsj!=null)
	{
		crm_wghfjl_lrsj=crm_wghfjl_lrsj.trim();
		if (!(crm_wghfjl_lrsj.equals("")))	wheresql+="  and (crm_wghfjl.lrsj>=TO_DATE('"+crm_wghfjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_wghfjl_lrsj=request.getParameter("crm_wghfjl_lrsj2");
	if (crm_wghfjl_lrsj!=null)
	{
		crm_wghfjl_lrsj=crm_wghfjl_lrsj.trim();
		if (!(crm_wghfjl_lrsj.equals("")))	wheresql+="  and (crm_wghfjl.lrsj<=TO_DATE('"+crm_wghfjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_wghfjl_lrbm=request.getParameter("crm_wghfjl_lrbm");
	if (crm_wghfjl_lrbm!=null)
	{
		crm_wghfjl_lrbm=cf.GB2Uni(crm_wghfjl_lrbm);
		if (!(crm_wghfjl_lrbm.equals("")))	wheresql+=" and  (crm_wghfjl.lrbm='"+crm_wghfjl_lrbm+"')";
	}
	ls_sql="SELECT crm_wghfjl.hfjlh,hfjgmc,hfwtmc,DECODE(crm_wghfjl.wtclzt,'1','δ����','2','�ڴ���','3','�ѽ��'),crm_wghfjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_khxx.gj,crm_khxx.dd,crm_wghfjl.hfr,crm_wghfjl.hfsj,crm_wghfjl.hfsm, crm_wghfjl.lrr,crm_wghfjl.lrsj,dwmc ";
	ls_sql+=" FROM crm_khxx,crm_wghfjl,dm_hfjgbm,dm_hfwtbm,sq_sgd,sq_dwxx  ";
    ls_sql+=" where crm_wghfjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_wghfjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_wghfjl.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and crm_wghfjl.hfwtbm=dm_hfwtbm.hfwtbm(+)";
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
	pageObj.initPage("Crm_wghfjlList.jsp","","","EditCrm_wghfjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hfjlh","crm_wghfjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_wghfjl_hfr","crm_wghfjl_hfsj","crm_wghfjl_hfsm","crm_wghfjl_hfsfcg","crm_wghfjl_hfr","crm_wghfjl_hfsj","crm_wghfjl_hfsm","crm_wghfjl_xmjfr","crm_wghfjl_xmjfsj","crm_wghfjl_xmjfsm","crm_wghfjl_clzt","crm_wghfjl_lrr","crm_wghfjl_lrsj","crm_wghfjl_lrbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hfjlh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCrm_wghfjl.jsp"};//��ť�������õ���ҳ���������Ӳ���
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
	coluParm.link="ViewCrm_wghfjl.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">�깤�طã�ά��</font></B>
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