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
	String hy_khhdpt_khbh=null;
	String hy_khhdpt_gmrq=null;
	String hy_khhdpt_lrr=null;
	String hy_khhdpt_lrsj=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sjs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sgd=null;
	String jc_zcjgb_zcmc=null;
	String crm_khxx_dwbh=null;
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	hy_khhdpt_khbh=request.getParameter("hy_khhdpt_khbh");
	if (hy_khhdpt_khbh!=null)
	{
		hy_khhdpt_khbh=cf.GB2Uni(hy_khhdpt_khbh);
		if (!(hy_khhdpt_khbh.equals("")))	wheresql+=" and  (hy_khhdpt.khbh='"+hy_khhdpt_khbh+"')";
	}
	hy_khhdpt_gmrq=request.getParameter("hy_khhdpt_gmrq");
	if (hy_khhdpt_gmrq!=null)
	{
		hy_khhdpt_gmrq=hy_khhdpt_gmrq.trim();
		if (!(hy_khhdpt_gmrq.equals("")))	wheresql+="  and (hy_khhdpt.gmrq=TO_DATE('"+hy_khhdpt_gmrq+"','YYYY/MM/DD'))";
	}
	hy_khhdpt_lrr=request.getParameter("hy_khhdpt_lrr");
	if (hy_khhdpt_lrr!=null)
	{
		hy_khhdpt_lrr=cf.GB2Uni(hy_khhdpt_lrr);
		if (!(hy_khhdpt_lrr.equals("")))	wheresql+=" and  (hy_khhdpt.lrr='"+hy_khhdpt_lrr+"')";
	}
	hy_khhdpt_lrsj=request.getParameter("hy_khhdpt_lrsj");
	if (hy_khhdpt_lrsj!=null)
	{
		hy_khhdpt_lrsj=hy_khhdpt_lrsj.trim();
		if (!(hy_khhdpt_lrsj.equals("")))	wheresql+="  and (hy_khhdpt.lrsj=TO_DATE('"+hy_khhdpt_lrsj+"','YYYY/MM/DD'))";
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
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	jc_zcjgb_zcmc=request.getParameter("jc_zcjgb_zcmc");
	if (jc_zcjgb_zcmc!=null)
	{
		jc_zcjgb_zcmc=cf.GB2Uni(jc_zcjgb_zcmc);
		if (!(jc_zcjgb_zcmc.equals("")))	wheresql+=" and  (jc_zcjgb.zcmc='"+jc_zcjgb_zcmc+"')";
	}
	ls_sql="SELECT hy_khhdpt.khbh,crm_khxx.khxm,jc_zcjgb.zcmc,jc_zcjgb.dwbh ,hy_khhdpt.gmrq,hy_khhdpt.gmsl,hy_khhdpt.gmje,decode(hy_khhdpt.khwjbz,'N','���ڹ���','�����') XX ,decode(hy_khhdpt.gswjbz,'Y','δ���','�����') SS,hy_khhdpt.lrr,hy_khhdpt.lrsj,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.sjs,crm_khxx.hth,sgdmc";
	ls_sql+=" FROM jc_zcjgb,hy_khhdpt,crm_khxx,sq_sgd ";
    ls_sql+=" where hy_khhdpt.zcbm=jc_zcjgb.zcbm and hy_khhdpt.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
		 ls_sql+=" order by crm_khxx.khxm ";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hy_khhdptCxList.jsp","SelectCxHy_khhdpt.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������ʾ��
	String[] disColName={"khbh","hy_khhdpt_gmrq","hy_khhdpt_gmsl","hy_khhdpt_gmje","hy_khhdpt_khwjbz","hy_khhdpt_gswjbz","hy_khhdpt_lrr","hy_khhdpt_lrsj","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_sjs","crm_khxx_hth","crm_khxx_sgd","jc_zcjgb_zcmc","jc_zcjgb_dwbh"};
	pageObj.setDisColName(disColName);
*/
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("hth","1");//�в����������Hash��
	spanColHash.put("zcmc","1");//�в����������Hash��
	spanColHash.put("dwbh","1");//�в����������Hash��
	spanColHash.put("lxfs","1");//�в����������Hash��
	spanColHash.put("sgdmc","1");//�в����������Hash��
	spanColHash.put("sjs","1");//�в����������Hash��
	
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
//��������
/*
	String[] keyName={};
	pageObj.setKey(keyName);
*/
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	
	<td  width="4%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="13%">��������</td>
	<td  width="13%">Ʒ��</td>
	<td  width="5%">��������</td>
	<td  width="4%">��������</td>
	<td  width="4%">������</td>
	<td  width="5%">�ͻ�����־</td>
	<td  width="5%">��˾����־</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	
	<td  width="13%">���ݵ�ַ</td>
	<td  width="5%">��ϵ��ʽ</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">��ͬ��</td>
	<td  width="5%">ʩ����</td>

	
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