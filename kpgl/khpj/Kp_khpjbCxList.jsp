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
	String kp_khpjb_khbh=null;
	String kp_khpjb_sgzl=null;
	String kp_khpjb_gcjd=null;
	String kp_khpjb_wmsgcd=null;
	String kp_khpjb_ctfw=null;
	String kp_khpjb_pscl=null;
	String kp_khpjb_dmcl=null;
	String kp_khpjb_sjxg=null;
	String kp_khpjb_sjfw=null;
	String kp_khpjb_jlfw=null;
	String kp_khpjb_lrr=null;
	String kp_khpjb_lrsj=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	kp_khpjb_khbh=request.getParameter("kp_khpjb_khbh");
	if (kp_khpjb_khbh!=null)
	{
		kp_khpjb_khbh=cf.GB2Uni(kp_khpjb_khbh);
		if (!(kp_khpjb_khbh.equals("")))	wheresql+=" and  (kp_khpjb.khbh='"+kp_khpjb_khbh+"')";
	}
	kp_khpjb_sgzl=request.getParameter("kp_khpjb_sgzl");
	if (kp_khpjb_sgzl!=null)
	{
		kp_khpjb_sgzl=cf.GB2Uni(kp_khpjb_sgzl);
		if (!(kp_khpjb_sgzl.equals("")))	wheresql+=" and  (kp_khpjb.sgzl='"+kp_khpjb_sgzl+"')";
	}
	kp_khpjb_gcjd=request.getParameter("kp_khpjb_gcjd");
	if (kp_khpjb_gcjd!=null)
	{
		kp_khpjb_gcjd=cf.GB2Uni(kp_khpjb_gcjd);
		if (!(kp_khpjb_gcjd.equals("")))	wheresql+=" and  (kp_khpjb.gcjd='"+kp_khpjb_gcjd+"')";
	}
	kp_khpjb_wmsgcd=request.getParameter("kp_khpjb_wmsgcd");
	if (kp_khpjb_wmsgcd!=null)
	{
		kp_khpjb_wmsgcd=cf.GB2Uni(kp_khpjb_wmsgcd);
		if (!(kp_khpjb_wmsgcd.equals("")))	wheresql+=" and  (kp_khpjb.wmsgcd='"+kp_khpjb_wmsgcd+"')";
	}
	kp_khpjb_ctfw=request.getParameter("kp_khpjb_ctfw");
	if (kp_khpjb_ctfw!=null)
	{
		kp_khpjb_ctfw=cf.GB2Uni(kp_khpjb_ctfw);
		if (!(kp_khpjb_ctfw.equals("")))	wheresql+=" and  (kp_khpjb.ctfw='"+kp_khpjb_ctfw+"')";
	}
	kp_khpjb_pscl=request.getParameter("kp_khpjb_pscl");
	if (kp_khpjb_pscl!=null)
	{
		kp_khpjb_pscl=cf.GB2Uni(kp_khpjb_pscl);
		if (!(kp_khpjb_pscl.equals("")))	wheresql+=" and  (kp_khpjb.pscl='"+kp_khpjb_pscl+"')";
	}
	kp_khpjb_dmcl=request.getParameter("kp_khpjb_dmcl");
	if (kp_khpjb_dmcl!=null)
	{
		kp_khpjb_dmcl=cf.GB2Uni(kp_khpjb_dmcl);
		if (!(kp_khpjb_dmcl.equals("")))	wheresql+=" and  (kp_khpjb.dmcl='"+kp_khpjb_dmcl+"')";
	}
	kp_khpjb_sjxg=request.getParameter("kp_khpjb_sjxg");
	if (kp_khpjb_sjxg!=null)
	{
		kp_khpjb_sjxg=cf.GB2Uni(kp_khpjb_sjxg);
		if (!(kp_khpjb_sjxg.equals("")))	wheresql+=" and  (kp_khpjb.sjxg='"+kp_khpjb_sjxg+"')";
	}
	kp_khpjb_sjfw=request.getParameter("kp_khpjb_sjfw");
	if (kp_khpjb_sjfw!=null)
	{
		kp_khpjb_sjfw=cf.GB2Uni(kp_khpjb_sjfw);
		if (!(kp_khpjb_sjfw.equals("")))	wheresql+=" and  (kp_khpjb.sjfw='"+kp_khpjb_sjfw+"')";
	}
	kp_khpjb_jlfw=request.getParameter("kp_khpjb_jlfw");
	if (kp_khpjb_jlfw!=null)
	{
		kp_khpjb_jlfw=cf.GB2Uni(kp_khpjb_jlfw);
		if (!(kp_khpjb_jlfw.equals("")))	wheresql+=" and  (kp_khpjb.jlfw='"+kp_khpjb_jlfw+"')";
	}
	kp_khpjb_lrr=request.getParameter("kp_khpjb_lrr");
	if (kp_khpjb_lrr!=null)
	{
		kp_khpjb_lrr=cf.GB2Uni(kp_khpjb_lrr);
		if (!(kp_khpjb_lrr.equals("")))	wheresql+=" and  (kp_khpjb.lrr='"+kp_khpjb_lrr+"')";
	}
	kp_khpjb_lrsj=request.getParameter("kp_khpjb_lrsj");
	if (kp_khpjb_lrsj!=null)
	{
		kp_khpjb_lrsj=kp_khpjb_lrsj.trim();
		if (!(kp_khpjb_lrsj.equals("")))	wheresql+="  and (kp_khpjb.lrsj>=TO_DATE('"+kp_khpjb_lrsj+"','YYYY/MM/DD'))";
	}
	kp_khpjb_lrsj=request.getParameter("kp_khpjb_lrsj2");
	if (kp_khpjb_lrsj!=null)
	{
		kp_khpjb_lrsj=kp_khpjb_lrsj.trim();
		if (!(kp_khpjb_lrsj.equals("")))	wheresql+="  and (kp_khpjb.lrsj<=TO_DATE('"+kp_khpjb_lrsj+"','YYYY/MM/DD'))";
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
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	ls_sql="SELECT kp_khpjb.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.qyrq,crm_khxx.dwbh,crm_khxx.sgd,crm_khxx.zjxm  , DECODE(kp_khpjb.sgzl,'1','����','2','��������','3','������'), DECODE(kp_khpjb.gcjd,'1','����','2','��������','3','������'), DECODE(kp_khpjb.wmsgcd,'1','����','2','��������','3','������'), DECODE(kp_khpjb.ctfw,'1','����','2','��������','3','������'), DECODE(kp_khpjb.pscl,'1','����','2','��������','3','������'), DECODE(kp_khpjb.dmcl,'1','����','2','��������','3','������'), DECODE(kp_khpjb.sjxg,'1','����','2','��������','3','������'), DECODE(kp_khpjb.sjfw,'1','����','2','��������','3','������'), DECODE(kp_khpjb.jlfw,'1','����','2','��������','3','������'),kp_khpjb.lrr,kp_khpjb.lrsj,kp_khpjb.bz";
	ls_sql+=" FROM crm_khxx,kp_khpjb  ";
    ls_sql+=" where kp_khpjb.khbh=crm_khxx.khbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_khpjbCxList.jsp","SelectCxKp_khpjb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","kp_khpjb_sgzl","kp_khpjb_gcjd","kp_khpjb_wmsgcd","kp_khpjb_ctfw","kp_khpjb_pscl","kp_khpjb_dmcl","kp_khpjb_sjxg","kp_khpjb_sjfw","kp_khpjb_jlfw","kp_khpjb_lrr","kp_khpjb_lrsj","kp_khpjb_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_dwbh","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
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
	<td  width="3%">�ͻ�����</td>
	<td  width="12%">���ݵ�ַ</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">���ʦ</td>
	<td  width="5%">ǩԼ����</td>
	<td  width="4%">ǩԼ����</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">�ʼ�</td>
	<td  width="4%">ʩ������</td>
	<td  width="4%">���̽���</td>
	<td  width="4%">��������ʩ���̶�</td>
	<td  width="4%">ʩ�����������</td>
	<td  width="4%">��˾���Ͳ���</td>
	<td  width="4%">ʩ���Ӵ������</td>
	<td  width="4%">���Ч��</td>
	<td  width="4%">��Ʒ���</td>
	<td  width="4%">�������</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="15%">��ע</td>
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