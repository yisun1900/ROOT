<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_tddj_tdxh=null;
	String crm_tddj_khbh=null;
	String crm_tddj_khxm=null;
	String crm_tddj_fwdz=null;
	String crm_tddj_dh=null;
	String crm_tddj_sjs=null;
	String crm_tddj_zjxm=null;
	String crm_tddj_sgd=null;
	String crm_tddj_sgbz=null;
	String crm_tddj_dwbh=null;
	String crm_tddj_tdyybm=null;
	String crm_tddj_tdyysm=null;
	String crm_tddj_sffj=null;
	String crm_tddj_sfyrz=null;
	String crm_tddj_ytje=null;
	String crm_tddj_stje=null;
	String crm_tddj_lrdw=null;
	String crm_tddj_lrr=null;
	String crm_tddj_lrsj=null;

	String sfthlp=null;
	sfthlp=request.getParameter("sfthlp");
	if (sfthlp!=null)
	{
		if (!(sfthlp.equals("")))	wheresql+=" and  (crm_tddj.sfthlp='"+sfthlp+"')";
	}
	
	crm_tddj_tdxh=request.getParameter("crm_tddj_tdxh");
	if (crm_tddj_tdxh!=null)
	{
		crm_tddj_tdxh=cf.GB2Uni(crm_tddj_tdxh);
		if (!(crm_tddj_tdxh.equals("")))	wheresql+=" and  (crm_tddj.tdxh='"+crm_tddj_tdxh+"')";
	}
	crm_tddj_khbh=request.getParameter("crm_tddj_khbh");
	if (crm_tddj_khbh!=null)
	{
		crm_tddj_khbh=cf.GB2Uni(crm_tddj_khbh);
		if (!(crm_tddj_khbh.equals("")))	wheresql+=" and  (crm_tddj.khbh='"+crm_tddj_khbh+"')";
	}
	crm_tddj_khxm=request.getParameter("crm_tddj_khxm");
	if (crm_tddj_khxm!=null)
	{
		crm_tddj_khxm=cf.GB2Uni(crm_tddj_khxm);
		if (!(crm_tddj_khxm.equals("")))	wheresql+=" and  (crm_tddj.khxm like '%"+crm_tddj_khxm+"%')";
	}
	crm_tddj_fwdz=request.getParameter("crm_tddj_fwdz");
	if (crm_tddj_fwdz!=null)
	{
		crm_tddj_fwdz=cf.GB2Uni(crm_tddj_fwdz);
		if (!(crm_tddj_fwdz.equals("")))	wheresql+=" and  (crm_tddj.fwdz like '%"+crm_tddj_fwdz+"%')";
	}
	crm_tddj_dh=request.getParameter("crm_tddj_dh");
	if (crm_tddj_dh!=null)
	{
		crm_tddj_dh=cf.GB2Uni(crm_tddj_dh);
		if (!(crm_tddj_dh.equals("")))	wheresql+=" and  (crm_tddj.dh='"+crm_tddj_dh+"')";
	}
	crm_tddj_sjs=request.getParameter("crm_tddj_sjs");
	if (crm_tddj_sjs!=null)
	{
		crm_tddj_sjs=cf.GB2Uni(crm_tddj_sjs);
		if (!(crm_tddj_sjs.equals("")))	wheresql+=" and  (crm_tddj.sjs='"+crm_tddj_sjs+"')";
	}
	crm_tddj_zjxm=request.getParameter("crm_tddj_zjxm");
	if (crm_tddj_zjxm!=null)
	{
		crm_tddj_zjxm=cf.GB2Uni(crm_tddj_zjxm);
		if (!(crm_tddj_zjxm.equals("")))	wheresql+=" and  (crm_tddj.zjxm='"+crm_tddj_zjxm+"')";
	}
	crm_tddj_sgd=request.getParameter("crm_tddj_sgd");
	if (crm_tddj_sgd!=null)
	{
		crm_tddj_sgd=cf.GB2Uni(crm_tddj_sgd);
		if (!(crm_tddj_sgd.equals("")))	wheresql+=" and  (crm_tddj.sgd='"+crm_tddj_sgd+"')";
	}
	crm_tddj_sgbz=request.getParameter("crm_tddj_sgbz");
	if (crm_tddj_sgbz!=null)
	{
		crm_tddj_sgbz=cf.GB2Uni(crm_tddj_sgbz);
		if (!(crm_tddj_sgbz.equals("")))	wheresql+=" and  (crm_tddj.sgbz='"+crm_tddj_sgbz+"')";
	}
	crm_tddj_dwbh=request.getParameter("crm_tddj_dwbh");
	if (crm_tddj_dwbh!=null)
	{
		crm_tddj_dwbh=cf.GB2Uni(crm_tddj_dwbh);
		if (!(crm_tddj_dwbh.equals("")))	wheresql+=" and  (crm_tddj.dwbh='"+crm_tddj_dwbh+"')";
	}
	crm_tddj_tdyybm=request.getParameter("crm_tddj_tdyybm");
	if (crm_tddj_tdyybm!=null)
	{
		crm_tddj_tdyybm=cf.GB2Uni(crm_tddj_tdyybm);
		if (!(crm_tddj_tdyybm.equals("")))	wheresql+=" and  (crm_tddj.tdyybm='"+crm_tddj_tdyybm+"')";
	}
	crm_tddj_tdyysm=request.getParameter("crm_tddj_tdyysm");
	if (crm_tddj_tdyysm!=null)
	{
		crm_tddj_tdyysm=cf.GB2Uni(crm_tddj_tdyysm);
		if (!(crm_tddj_tdyysm.equals("")))	wheresql+=" and  (crm_tddj.tdyysm='"+crm_tddj_tdyysm+"')";
	}
	crm_tddj_sffj=request.getParameter("crm_tddj_sffj");
	if (crm_tddj_sffj!=null)
	{
		crm_tddj_sffj=cf.GB2Uni(crm_tddj_sffj);
		if (!(crm_tddj_sffj.equals("")))	wheresql+=" and  (crm_tddj.sffj='"+crm_tddj_sffj+"')";
	}
	crm_tddj_sfyrz=request.getParameter("crm_tddj_sfyrz");
	if (crm_tddj_sfyrz!=null)
	{
		crm_tddj_sfyrz=cf.GB2Uni(crm_tddj_sfyrz);
		if (!(crm_tddj_sfyrz.equals("")))	wheresql+=" and  (crm_tddj.sfyrz='"+crm_tddj_sfyrz+"')";
	}
	crm_tddj_ytje=request.getParameter("crm_tddj_ytje");
	if (crm_tddj_ytje!=null)
	{
		crm_tddj_ytje=crm_tddj_ytje.trim();
		if (!(crm_tddj_ytje.equals("")))	wheresql+=" and  (crm_tddj.ytje="+crm_tddj_ytje+") ";
	}
	crm_tddj_stje=request.getParameter("crm_tddj_stje");
	if (crm_tddj_stje!=null)
	{
		crm_tddj_stje=crm_tddj_stje.trim();
		if (!(crm_tddj_stje.equals("")))	wheresql+=" and  (crm_tddj.stje="+crm_tddj_stje+") ";
	}
	crm_tddj_lrdw=request.getParameter("crm_tddj_lrdw");
	if (crm_tddj_lrdw!=null)
	{
		crm_tddj_lrdw=cf.GB2Uni(crm_tddj_lrdw);
		if (!(crm_tddj_lrdw.equals("")))	wheresql+=" and  (crm_tddj.lrdw='"+crm_tddj_lrdw+"')";
	}
	crm_tddj_lrr=request.getParameter("crm_tddj_lrr");
	if (crm_tddj_lrr!=null)
	{
		crm_tddj_lrr=cf.GB2Uni(crm_tddj_lrr);
		if (!(crm_tddj_lrr.equals("")))	wheresql+=" and  (crm_tddj.lrr='"+crm_tddj_lrr+"')";
	}
	crm_tddj_lrsj=request.getParameter("crm_tddj_lrsj");
	if (crm_tddj_lrsj!=null)
	{
		crm_tddj_lrsj=crm_tddj_lrsj.trim();
		if (!(crm_tddj_lrsj.equals("")))	wheresql+="  and (crm_tddj.lrsj>=TO_DATE('"+crm_tddj_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tddj_lrsj=request.getParameter("crm_tddj_lrsj2");
	if (crm_tddj_lrsj!=null)
	{
		crm_tddj_lrsj=crm_tddj_lrsj.trim();
		if (!(crm_tddj_lrsj.equals("")))	wheresql+="  and (crm_tddj.lrsj<=TO_DATE('"+crm_tddj_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_tddj.tdxh as tdxh,DECODE(crm_tddj.sfthlp,'Y','�˻�','N','δ�˻�','W','δ����Ʒ') sfthlp,crm_tddj.tdsj,crm_tddj.lrr,crm_tddj.lrsj,crm_tddj.khbh as khbh,crm_tddj.khxm as crm_tddj_khxm,crm_tddj.fwdz as crm_tddj_fwdz,crm_tddj.sjs as crm_tddj_sjs,crm_tddj.zjxm as crm_tddj_zjxm,sgdmc as crm_tddj_sgd,qye,qyrq,a.dwmc as sq_dwxx_dwmc,dm_tdyybm.tdyymc as dm_tdyybm_tdyymc,crm_tddj.ytje as crm_tddj_ytje,crm_tddj.stje as crm_tddj_stje  ";
	ls_sql+=" FROM sq_dwxx a,sq_sgd,dm_tdyybm,crm_tddj,crm_khxx  ";
    ls_sql+=" where crm_tddj.dwbh=a.dwbh and crm_tddj.sgd=sq_sgd.sgd(+) and crm_tddj.tdyybm=dm_tdyybm.tdyybm";
    ls_sql+=" and crm_tddj.khbh=crm_khxx.khbh";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_tddj.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_tddjList.jsp","SelectCrm_tddj.jsp","","EditCrm_tddj.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"tdxh","sfthlp","crm_tddj_khxm","crm_tddj_fwdz","crm_tddj_sjs","crm_tddj_zjxm","crm_tddj_sgd","qye","qyrq","tdsj","lrr","lrsj","sq_dwxx_dwmc","dm_tdyybm_tdyymc","crm_tddj_ytje","crm_tddj_stje"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"tdxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCrm_tddj.jsp"};//��ť�������õ���ҳ���������Ӳ���
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
	coluParmHash.put("crm_tddj_khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"tdxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="ViewCrm_tddj.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tdxh",coluParm);//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">�˵����</td>
	<td  width="5%">�Ƿ��˻�ȫ����Ʒ</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="14%">���ݵ�ַ</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">���̵���</td>
	<td  width="4%">ʩ����</td>
	<td  width="5%">ǩԼ��</td>
	<td  width="5%">ǩ��ʱ��</td>
	<td  width="5%">�˵�ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="8%">ǩ������</td>
	<td  width="11%">�˵�ԭ��</td>
	<td  width="6%">Ӧ�˽��</td>
	<td  width="6%">ʵ�˽��</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printSum();
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