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
	String ybj_ybjqx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String fgs=null;
	String ybj_ybjqx_qxr=null;
	String ybj_ybjqx_qxsj=null;
	String ybj_ybjqx_lrr=null;
	String ybj_ybjqx_lrsj=null;
	String ybj_ybjqx_lrbm=null;

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	
	
	ybj_ybjqx_khbh=request.getParameter("ybj_ybjqx_khbh");
	if (ybj_ybjqx_khbh!=null)
	{
		ybj_ybjqx_khbh=cf.GB2Uni(ybj_ybjqx_khbh);
		if (!(ybj_ybjqx_khbh.equals("")))	wheresql+=" and  (ybj_ybjqx.khbh='"+ybj_ybjqx_khbh+"')";
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
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
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
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (ybj_ybjqx.ssfgs='"+fgs+"')";
	}
	ybj_ybjqx_qxr=request.getParameter("ybj_ybjqx_qxr");
	if (ybj_ybjqx_qxr!=null)
	{
		ybj_ybjqx_qxr=cf.GB2Uni(ybj_ybjqx_qxr);
		if (!(ybj_ybjqx_qxr.equals("")))	wheresql+=" and  (ybj_ybjqx.qxr='"+ybj_ybjqx_qxr+"')";
	}
	ybj_ybjqx_qxsj=request.getParameter("ybj_ybjqx_qxsj");
	if (ybj_ybjqx_qxsj!=null)
	{
		ybj_ybjqx_qxsj=ybj_ybjqx_qxsj.trim();
		if (!(ybj_ybjqx_qxsj.equals("")))	wheresql+="  and (ybj_ybjqx.qxsj>=TO_DATE('"+ybj_ybjqx_qxsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjqx_qxsj=request.getParameter("ybj_ybjqx_qxsj2");
	if (ybj_ybjqx_qxsj!=null)
	{
		ybj_ybjqx_qxsj=ybj_ybjqx_qxsj.trim();
		if (!(ybj_ybjqx_qxsj.equals("")))	wheresql+="  and (ybj_ybjqx.qxsj<=TO_DATE('"+ybj_ybjqx_qxsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjqx_lrr=request.getParameter("ybj_ybjqx_lrr");
	if (ybj_ybjqx_lrr!=null)
	{
		ybj_ybjqx_lrr=cf.GB2Uni(ybj_ybjqx_lrr);
		if (!(ybj_ybjqx_lrr.equals("")))	wheresql+=" and  (ybj_ybjqx.lrr='"+ybj_ybjqx_lrr+"')";
	}
	ybj_ybjqx_lrsj=request.getParameter("ybj_ybjqx_lrsj");
	if (ybj_ybjqx_lrsj!=null)
	{
		ybj_ybjqx_lrsj=ybj_ybjqx_lrsj.trim();
		if (!(ybj_ybjqx_lrsj.equals("")))	wheresql+="  and (ybj_ybjqx.lrsj>=TO_DATE('"+ybj_ybjqx_lrsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjqx_lrsj=request.getParameter("ybj_ybjqx_lrsj2");
	if (ybj_ybjqx_lrsj!=null)
	{
		ybj_ybjqx_lrsj=ybj_ybjqx_lrsj.trim();
		if (!(ybj_ybjqx_lrsj.equals("")))	wheresql+="  and (ybj_ybjqx.lrsj<=TO_DATE('"+ybj_ybjqx_lrsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjqx_lrbm=request.getParameter("ybj_ybjqx_lrbm");
	if (ybj_ybjqx_lrbm!=null)
	{
		ybj_ybjqx_lrbm=cf.GB2Uni(ybj_ybjqx_lrbm);
		if (!(ybj_ybjqx_lrbm.equals("")))	wheresql+=" and  (ybj_ybjqx.lrbm='"+ybj_ybjqx_lrbm+"')";
	}
	ls_sql="SELECT ybj_ybjqx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.qyrq,sgdmc,crm_khxx.zjxm,ybj_ybjqx.qxr,ybj_ybjqx.qxsj,ybj_ybjqx.lrr,ybj_ybjqx.lrsj,b.dwmc lrbm,a.dwmc ssfgs,ybj_ybjqx.bz  ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,ybj_ybjqx,sq_sgd  ";
    ls_sql+=" where ybj_ybjqx.khbh=crm_khxx.khbh and ybj_ybjqx.ssfgs=a.dwbh and ybj_ybjqx.lrbm=b.dwbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Ybj_ybjqxCxList.jsp","SelectCxYbj_ybjqx.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_sgd","crm_khxx_zjxm","sq_dwxx_dwmc","ybj_ybjqx_qxr","ybj_ybjqx_qxsj","ybj_ybjqx_lrr","ybj_ybjqx_lrsj","ybj_ybjqx_lrbm","ybj_ybjqx_bz"};
	pageObj.setDisColName(disColName);
*/

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
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="15%">���ݵ�ַ</td>
	<td  width="5%">��ͬ��</td>
	<td  width="4%">���ʦ</td>
	<td  width="6%">ǩԼ����</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">�ʼ�</td>
	<td  width="4%">ȡ����</td>
	<td  width="6%">ȡ��ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="8%">¼�벿��</td>
	<td  width="7%">�����ֹ�˾</td>
	<td  width="17%">��ע</td>
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