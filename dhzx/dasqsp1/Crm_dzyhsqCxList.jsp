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
	String crm_dzyhsq_khbh=null;
	String crm_zxkhxx_khxm=null;
	String crm_zxkhxx_fwdz=null;
	String crm_zxkhxx_sjs=null;
	String crm_dzyhsq_sqr=null;
	String crm_dzyhsq_sqsj=null;
	String crm_dzyhsq_sfsqqtyh=null;
	String crm_dzyhsq_lrr=null;
	String crm_dzyhsq_lrsj=null;
	String crm_dzyhsq_spbz=null;
	String crm_dzyhsq_spr=null;
	String crm_dzyhsq_spsj=null;
	String crm_dzyhsq_spjg=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";
	String crm_zxkhxx_zxdm=null;
	crm_zxkhxx_zxdm=request.getParameter("crm_zxkhxx_zxdm");
	if (crm_zxkhxx_zxdm!=null)
	{
		crm_zxkhxx_zxdm=cf.GB2Uni(crm_zxkhxx_zxdm);
		if (!(crm_zxkhxx_zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+crm_zxkhxx_zxdm+"')";
	}
	
	
	crm_dzyhsq_khbh=request.getParameter("crm_dzyhsq_khbh");
	if (crm_dzyhsq_khbh!=null)
	{
		crm_dzyhsq_khbh=cf.GB2Uni(crm_dzyhsq_khbh);
		if (!(crm_dzyhsq_khbh.equals("")))	wheresql+=" and  (crm_dzyhsq.khbh='"+crm_dzyhsq_khbh+"')";
	}
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+crm_zxkhxx_khxm+"%')";
	}
	crm_zxkhxx_fwdz=request.getParameter("crm_zxkhxx_fwdz");
	if (crm_zxkhxx_fwdz!=null)
	{
		crm_zxkhxx_fwdz=cf.GB2Uni(crm_zxkhxx_fwdz);
		if (!(crm_zxkhxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+crm_zxkhxx_fwdz+"%')";
	}
	crm_zxkhxx_sjs=request.getParameter("crm_zxkhxx_sjs");
	if (crm_zxkhxx_sjs!=null)
	{
		crm_zxkhxx_sjs=cf.GB2Uni(crm_zxkhxx_sjs);
		if (!(crm_zxkhxx_sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+crm_zxkhxx_sjs+"')";
	}
	crm_dzyhsq_sqr=request.getParameter("crm_dzyhsq_sqr");
	if (crm_dzyhsq_sqr!=null)
	{
		crm_dzyhsq_sqr=cf.GB2Uni(crm_dzyhsq_sqr);
		if (!(crm_dzyhsq_sqr.equals("")))	wheresql+=" and  (crm_dzyhsq.sqr='"+crm_dzyhsq_sqr+"')";
	}
	crm_dzyhsq_sqsj=request.getParameter("crm_dzyhsq_sqsj");
	if (crm_dzyhsq_sqsj!=null)
	{
		crm_dzyhsq_sqsj=crm_dzyhsq_sqsj.trim();
		if (!(crm_dzyhsq_sqsj.equals("")))	wheresql+="  and (crm_dzyhsq.sqsj>=TO_DATE('"+crm_dzyhsq_sqsj+"','YYYY/MM/DD'))";
	}
	crm_dzyhsq_sqsj=request.getParameter("crm_dzyhsq_sqsj2");
	if (crm_dzyhsq_sqsj!=null)
	{
		crm_dzyhsq_sqsj=crm_dzyhsq_sqsj.trim();
		if (!(crm_dzyhsq_sqsj.equals("")))	wheresql+="  and (crm_dzyhsq.sqsj<=TO_DATE('"+crm_dzyhsq_sqsj+"','YYYY/MM/DD'))";
	}
	crm_dzyhsq_sfsqqtyh=request.getParameter("crm_dzyhsq_sfsqqtyh");
	if (crm_dzyhsq_sfsqqtyh!=null)
	{
		crm_dzyhsq_sfsqqtyh=cf.GB2Uni(crm_dzyhsq_sfsqqtyh);
		if (!(crm_dzyhsq_sfsqqtyh.equals("")))	wheresql+=" and  (crm_dzyhsq.sfsqqtyh='"+crm_dzyhsq_sfsqqtyh+"')";
	}
	crm_dzyhsq_lrr=request.getParameter("crm_dzyhsq_lrr");
	if (crm_dzyhsq_lrr!=null)
	{
		crm_dzyhsq_lrr=cf.GB2Uni(crm_dzyhsq_lrr);
		if (!(crm_dzyhsq_lrr.equals("")))	wheresql+=" and  (crm_dzyhsq.lrr='"+crm_dzyhsq_lrr+"')";
	}
	crm_dzyhsq_lrsj=request.getParameter("crm_dzyhsq_lrsj");
	if (crm_dzyhsq_lrsj!=null)
	{
		crm_dzyhsq_lrsj=crm_dzyhsq_lrsj.trim();
		if (!(crm_dzyhsq_lrsj.equals("")))	wheresql+="  and (crm_dzyhsq.lrsj>=TO_DATE('"+crm_dzyhsq_lrsj+"','YYYY/MM/DD'))";
	}
	crm_dzyhsq_lrsj=request.getParameter("crm_dzyhsq_lrsj2");
	if (crm_dzyhsq_lrsj!=null)
	{
		crm_dzyhsq_lrsj=crm_dzyhsq_lrsj.trim();
		if (!(crm_dzyhsq_lrsj.equals("")))	wheresql+="  and (crm_dzyhsq.lrsj<=TO_DATE('"+crm_dzyhsq_lrsj+"','YYYY/MM/DD'))";
	}
	crm_dzyhsq_spbz=request.getParameter("crm_dzyhsq_spbz");
	if (crm_dzyhsq_spbz!=null)
	{
		crm_dzyhsq_spbz=cf.GB2Uni(crm_dzyhsq_spbz);
		if (!(crm_dzyhsq_spbz.equals("")))	wheresql+=" and  (crm_dzyhsq.spbz='"+crm_dzyhsq_spbz+"')";
	}
	crm_dzyhsq_spr=request.getParameter("crm_dzyhsq_spr");
	if (crm_dzyhsq_spr!=null)
	{
		crm_dzyhsq_spr=cf.GB2Uni(crm_dzyhsq_spr);
		if (!(crm_dzyhsq_spr.equals("")))	wheresql+=" and  (crm_dzyhsq.spr='"+crm_dzyhsq_spr+"')";
	}
	crm_dzyhsq_spsj=request.getParameter("crm_dzyhsq_spsj");
	if (crm_dzyhsq_spsj!=null)
	{
		crm_dzyhsq_spsj=crm_dzyhsq_spsj.trim();
		if (!(crm_dzyhsq_spsj.equals("")))	wheresql+="  and (crm_dzyhsq.spsj>=TO_DATE('"+crm_dzyhsq_spsj+"','YYYY/MM/DD'))";
	}
	crm_dzyhsq_spsj=request.getParameter("crm_dzyhsq_spsj2");
	if (crm_dzyhsq_spsj!=null)
	{
		crm_dzyhsq_spsj=crm_dzyhsq_spsj.trim();
		if (!(crm_dzyhsq_spsj.equals("")))	wheresql+="  and (crm_dzyhsq.spsj<=TO_DATE('"+crm_dzyhsq_spsj+"','YYYY/MM/DD'))";
	}
	crm_dzyhsq_spjg=request.getParameter("crm_dzyhsq_spjg");
	if (crm_dzyhsq_spjg!=null)
	{
		crm_dzyhsq_spjg=cf.GB2Uni(crm_dzyhsq_spjg);
		if (!(crm_dzyhsq_spjg.equals("")))	wheresql+=" and  (crm_dzyhsq.spjg='"+crm_dzyhsq_spjg+"')";
	}
	ls_sql="SELECT crm_zxkhxx.khxm, DECODE(crm_dzyhsq.spbz,'1','δ����','2','������'), DECODE(crm_dzyhsq.spjg,'1','ͬ��','2','��ͬ��'),crm_dzyhsq.sqzkl,crm_dzyhsq.sqzjxzkl,DECODE(crm_dzyhsq.zklx,'1','ȫ��','2','����'), DECODE(crm_dzyhsq.sfsqqtyh,'Y','��','N','��'),crm_dzyhsq.spzkl,crm_dzyhsq.spzjxzkl, DECODE(crm_dzyhsq.sfpzqtyh,'Y','��','N','��'),crm_dzyhsq.sqqtyhnr,crm_dzyhsq.sqyysm,crm_dzyhsq.sqr,crm_dzyhsq.sqsj,crm_dzyhsq.spr,crm_dzyhsq.spsj,crm_dzyhsq.spsm,crm_dzyhsq.pzqtyhnr,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,b.dwmc zxdm,crm_dzyhsq.lrr,crm_dzyhsq.lrsj,a.dwmc lrbm,crm_dzyhsq.khbh  ";
	ls_sql+=" FROM crm_dzyhsq,crm_zxkhxx,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where crm_dzyhsq.khbh=crm_zxkhxx.khbh and crm_dzyhsq.lrbm=a.dwbh and crm_zxkhxx.zxdm=b.dwbh(+)";
    ls_sql+=" and crm_dzyhsq.zklx='2'";//1��ȫ���ۿۣ�2�������ۿ�
    ls_sql+=wheresql;
    ls_sql+=" order by crm_dzyhsq.sqsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_dzyhsqCxList.jsp","SelectCxCrm_dzyhsq.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_sjs","crm_zxkhxx_zxdm","crm_dzyhsq_sqr","crm_dzyhsq_sqsj","crm_dzyhsq_sqzkl","crm_dzyhsq_sfsqqtyh","crm_dzyhsq_sqqtyhnr","crm_dzyhsq_sqyysm","crm_dzyhsq_lrr","crm_dzyhsq_lrsj","sq_dwxx_dwmc","crm_dzyhsq_spbz","crm_dzyhsq_spr","crm_dzyhsq_spsj","crm_dzyhsq_spjg","crm_dzyhsq_spsm","crm_dzyhsq_spzkl","crm_dzyhsq_sfpzqtyh","crm_dzyhsq_pzqtyhnr"};
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
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.alignStr[10]="align='left'";
	pageObj.alignStr[11]="align='left'";
	pageObj.alignStr[16]="align='left'";
	pageObj.alignStr[17]="align='left'";
	pageObj.alignStr[18]="align='left'";
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
  <B><font size="3">�����Ż�����--��ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(370);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">������־</td>
	<td  width="2%">�������</td>
	<td  width="2%" bgcolor="#CCCCFF">���룭ֱ�ӷѺ�ͬ�ۿ�</td>
	<td  width="2%" bgcolor="#CCCCFF">���룭ֱ�ӷ��������ۿ�</td>
	<td  width="2%">�ۿ�����</td>
	<td  width="2%" bgcolor="#CCCCFF">�Ƿ����������Ż�</td>
	<td  width="2%" bgcolor="#FFCCFF">������ֱ�ӷѺ�ͬ�ۿ�</td>
	<td  width="2%" bgcolor="#FFCCFF">������ֱ�ӷ��������ۿ�</td>
	<td  width="2%" bgcolor="#FFCCFF">�Ƿ���׼�����Ż�</td>
	<td  width="11%" bgcolor="#CCCCFF">���������Ż�����</td>
	<td  width="13%" bgcolor="#CCCCFF">����ԭ��˵��</td>
	<td  width="2%" bgcolor="#CCCCFF">������</td>
	<td  width="3%" bgcolor="#CCCCFF">����ʱ��</td>
	<td  width="2%" bgcolor="#FFCCFF">������</td>
	<td  width="3%" bgcolor="#FFCCFF">����ʱ��</td>
	<td  width="10%" bgcolor="#FFCCFF">����˵��</td>
	<td  width="11%" bgcolor="#FFCCFF">��׼�����Ż�����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="2%">���ʦ</td>
	<td  width="4%">��ѯ����</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="2%">�ͻ����</td>
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