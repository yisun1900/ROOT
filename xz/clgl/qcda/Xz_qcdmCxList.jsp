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
	String xz_qcdm_qcph=null;
	String xz_qcdm_qcxh=null;
	String xz_qcdm_sjxm=null;
	String xz_qcdm_gcsj=null;
	String xz_qcdm_njrq=null;
	String xz_qcdm_yxsgls=null;
	String xz_qcdm_ssfgs=null;
	String xz_qcdm_lrr=null;
	String xz_qcdm_lrsj=null;
	xz_qcdm_qcph=request.getParameter("xz_qcdm_qcph");
	if (xz_qcdm_qcph!=null)
	{
		xz_qcdm_qcph=cf.GB2Uni(xz_qcdm_qcph);
		if (!(xz_qcdm_qcph.equals("")))	wheresql+=" and  (xz_qcdm.qcph='"+xz_qcdm_qcph+"')";
	}
	xz_qcdm_qcxh=request.getParameter("xz_qcdm_qcxh");
	if (xz_qcdm_qcxh!=null)
	{
		xz_qcdm_qcxh=cf.GB2Uni(xz_qcdm_qcxh);
		if (!(xz_qcdm_qcxh.equals("")))	wheresql+=" and  (xz_qcdm.qcxh='"+xz_qcdm_qcxh+"')";
	}
	xz_qcdm_sjxm=request.getParameter("xz_qcdm_sjxm");
	if (xz_qcdm_sjxm!=null)
	{
		xz_qcdm_sjxm=cf.GB2Uni(xz_qcdm_sjxm);
		if (!(xz_qcdm_sjxm.equals("")))	wheresql+=" and  (xz_qcdm.sjxm='"+xz_qcdm_sjxm+"')";
	}
	xz_qcdm_gcsj=request.getParameter("xz_qcdm_gcsj");
	if (xz_qcdm_gcsj!=null)
	{
		xz_qcdm_gcsj=xz_qcdm_gcsj.trim();
		if (!(xz_qcdm_gcsj.equals("")))	wheresql+="  and (xz_qcdm.gcsj>=TO_DATE('"+xz_qcdm_gcsj+"','YYYY/MM/DD'))";
	}
	xz_qcdm_gcsj=request.getParameter("xz_qcdm_gcsj2");
	if (xz_qcdm_gcsj!=null)
	{
		xz_qcdm_gcsj=xz_qcdm_gcsj.trim();
		if (!(xz_qcdm_gcsj.equals("")))	wheresql+="  and (xz_qcdm.gcsj<=TO_DATE('"+xz_qcdm_gcsj+"','YYYY/MM/DD'))";
	}
	xz_qcdm_njrq=request.getParameter("xz_qcdm_njrq");
	if (xz_qcdm_njrq!=null)
	{
		xz_qcdm_njrq=xz_qcdm_njrq.trim();
		if (!(xz_qcdm_njrq.equals("")))	wheresql+="  and (xz_qcdm.njrq>=TO_DATE('"+xz_qcdm_njrq+"','YYYY/MM/DD'))";
	}
	xz_qcdm_njrq=request.getParameter("xz_qcdm_njrq2");
	if (xz_qcdm_njrq!=null)
	{
		xz_qcdm_njrq=xz_qcdm_njrq.trim();
		if (!(xz_qcdm_njrq.equals("")))	wheresql+="  and (xz_qcdm.njrq<=TO_DATE('"+xz_qcdm_njrq+"','YYYY/MM/DD'))";
	}
	xz_qcdm_yxsgls=request.getParameter("xz_qcdm_yxsgls");
	if (xz_qcdm_yxsgls!=null)
	{
		xz_qcdm_yxsgls=xz_qcdm_yxsgls.trim();
		if (!(xz_qcdm_yxsgls.equals("")))	wheresql+=" and  (xz_qcdm.yxsgls>="+xz_qcdm_yxsgls+") ";
	}
	xz_qcdm_yxsgls=request.getParameter("xz_qcdm_yxsgls2");
	if (xz_qcdm_yxsgls!=null)
	{
		xz_qcdm_yxsgls=xz_qcdm_yxsgls.trim();
		if (!(xz_qcdm_yxsgls.equals("")))	wheresql+=" and  (xz_qcdm.yxsgls<="+xz_qcdm_yxsgls+") ";
	}
	xz_qcdm_ssfgs=request.getParameter("xz_qcdm_ssfgs");
	if (xz_qcdm_ssfgs!=null)
	{
		xz_qcdm_ssfgs=cf.GB2Uni(xz_qcdm_ssfgs);
		if (!(xz_qcdm_ssfgs.equals("")))	wheresql+=" and  (xz_qcdm.ssfgs='"+xz_qcdm_ssfgs+"')";
	}
	xz_qcdm_lrr=request.getParameter("xz_qcdm_lrr");
	if (xz_qcdm_lrr!=null)
	{
		xz_qcdm_lrr=cf.GB2Uni(xz_qcdm_lrr);
		if (!(xz_qcdm_lrr.equals("")))	wheresql+=" and  (xz_qcdm.lrr='"+xz_qcdm_lrr+"')";
	}
	xz_qcdm_lrsj=request.getParameter("xz_qcdm_lrsj");
	if (xz_qcdm_lrsj!=null)
	{
		xz_qcdm_lrsj=xz_qcdm_lrsj.trim();
		if (!(xz_qcdm_lrsj.equals("")))	wheresql+="  and (xz_qcdm.lrsj>=TO_DATE('"+xz_qcdm_lrsj+"','YYYY/MM/DD'))";
	}
	xz_qcdm_lrsj=request.getParameter("xz_qcdm_lrsj2");
	if (xz_qcdm_lrsj!=null)
	{
		xz_qcdm_lrsj=xz_qcdm_lrsj.trim();
		if (!(xz_qcdm_lrsj.equals("")))	wheresql+="  and (xz_qcdm.lrsj<=TO_DATE('"+xz_qcdm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT xz_qcdm.qcph,xz_qcdm.qcxh,xz_qcdm.sjxm,xz_qcdm.gcsj,xz_qcdm.njrq,xz_qcdm.yxsgls,sq_dwxx.dwmc,xz_qcdm.lrr,xz_qcdm.lrsj,xz_qcdm.bz  ";
	ls_sql+=" FROM sq_dwxx,xz_qcdm  ";
    ls_sql+=" where sq_dwxx.dwbh=xz_qcdm.ssfgs";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_qcdmCxList.jsp","SelectCxXz_qcdm.jsp","ViewXz_qcdm.jsp","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"qcph","xz_qcdm_qcxh","xz_qcdm_sjxm","xz_qcdm_gcsj","xz_qcdm_njrq","xz_qcdm_yxsgls","sq_dwxx_dwmc","xz_qcdm_lrr","xz_qcdm_lrsj","xz_qcdm_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"qcph"};
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="8%">�����ƺ�</td>
	<td  width="8%">�����ͺ�</td>
	<td  width="8%">˾������</td>
	<td  width="8%">����ʱ��</td>
	<td  width="8%">�������</td>
	<td  width="8%">����ʹ������</td>
	<td  width="8%">�����ֹ�˾</td>
	<td  width="8%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="8%">��ע</td>
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