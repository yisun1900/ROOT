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
	String cmp_cmpjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String cmp_cmpjl_cmpzt=null;
	String cmp_cmpjl_cmpbh=null;
	String cmp_cmpjl_lx=null;
	String cmp_cmpjl_lrr=null;
	String cmp_cmpjl_lrsj=null;
	String cmp_cmpjl_lrbm=null;
	String cmp_cmpjl_sjtxsj=null;
	cmp_cmpjl_khbh=request.getParameter("cmp_cmpjl_khbh");
	if (cmp_cmpjl_khbh!=null)
	{
		cmp_cmpjl_khbh=cf.GB2Uni(cmp_cmpjl_khbh);
		if (!(cmp_cmpjl_khbh.equals("")))	wheresql+=" and  (cmp_cmpjl.khbh='"+cmp_cmpjl_khbh+"')";
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
	cmp_cmpjl_cmpzt=request.getParameter("cmp_cmpjl_cmpzt");
	if (cmp_cmpjl_cmpzt!=null)
	{
		cmp_cmpjl_cmpzt=cf.GB2Uni(cmp_cmpjl_cmpzt);
		if (!(cmp_cmpjl_cmpzt.equals("")))	wheresql+=" and  (cmp_cmpjl.cmpzt='"+cmp_cmpjl_cmpzt+"')";
	}
	cmp_cmpjl_cmpbh=request.getParameter("cmp_cmpjl_cmpbh");
	if (cmp_cmpjl_cmpbh!=null)
	{
		cmp_cmpjl_cmpbh=cf.GB2Uni(cmp_cmpjl_cmpbh);
		if (!(cmp_cmpjl_cmpbh.equals("")))	wheresql+=" and  (cmp_cmpjl.cmpbh='"+cmp_cmpjl_cmpbh+"')";
	}
	cmp_cmpjl_lx=request.getParameter("cmp_cmpjl_lx");
	if (cmp_cmpjl_lx!=null)
	{
		cmp_cmpjl_lx=cf.GB2Uni(cmp_cmpjl_lx);
		if (!(cmp_cmpjl_lx.equals("")))	wheresql+=" and  (cmp_cmpjl.lx='"+cmp_cmpjl_lx+"')";
	}
	cmp_cmpjl_lrr=request.getParameter("cmp_cmpjl_lrr");
	if (cmp_cmpjl_lrr!=null)
	{
		cmp_cmpjl_lrr=cf.GB2Uni(cmp_cmpjl_lrr);
		if (!(cmp_cmpjl_lrr.equals("")))	wheresql+=" and  (cmp_cmpjl.lrr='"+cmp_cmpjl_lrr+"')";
	}
	cmp_cmpjl_lrsj=request.getParameter("cmp_cmpjl_lrsj");
	if (cmp_cmpjl_lrsj!=null)
	{
		cmp_cmpjl_lrsj=cmp_cmpjl_lrsj.trim();
		if (!(cmp_cmpjl_lrsj.equals("")))	wheresql+="  and (cmp_cmpjl.lrsj>=TO_DATE('"+cmp_cmpjl_lrsj+"','YYYY/MM/DD'))";
	}
	cmp_cmpjl_lrsj=request.getParameter("cmp_cmpjl_lrsj2");
	if (cmp_cmpjl_lrsj!=null)
	{
		cmp_cmpjl_lrsj=cmp_cmpjl_lrsj.trim();
		if (!(cmp_cmpjl_lrsj.equals("")))	wheresql+="  and (cmp_cmpjl.lrsj<=TO_DATE('"+cmp_cmpjl_lrsj+"','YYYY/MM/DD'))";
	}
	cmp_cmpjl_lrbm=request.getParameter("cmp_cmpjl_lrbm");
	if (cmp_cmpjl_lrbm!=null)
	{
		cmp_cmpjl_lrbm=cf.GB2Uni(cmp_cmpjl_lrbm);
		if (!(cmp_cmpjl_lrbm.equals("")))	wheresql+=" and  (cmp_cmpjl.lrbm='"+cmp_cmpjl_lrbm+"')";
	}
	cmp_cmpjl_sjtxsj=request.getParameter("cmp_cmpjl_sjtxsj");
	if (cmp_cmpjl_sjtxsj!=null)
	{
		cmp_cmpjl_sjtxsj=cmp_cmpjl_sjtxsj.trim();
		if (!(cmp_cmpjl_sjtxsj.equals("")))	wheresql+="  and (cmp_cmpjl.sjtxsj>=TO_DATE('"+cmp_cmpjl_sjtxsj+"','YYYY/MM/DD'))";
	}
	cmp_cmpjl_sjtxsj=request.getParameter("cmp_cmpjl_sjtxsj2");
	if (cmp_cmpjl_sjtxsj!=null)
	{
		cmp_cmpjl_sjtxsj=cmp_cmpjl_sjtxsj.trim();
		if (!(cmp_cmpjl_sjtxsj.equals("")))	wheresql+="  and (cmp_cmpjl.sjtxsj<=TO_DATE('"+cmp_cmpjl_sjtxsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cmp_cmpjl.khbh,crm_khxx.khxm,crm_khxx.fwdz, DECODE(cmp_cmpjl.cmpzt,'1','δ��д','2','����д'),cmp_cmpjl.cmpbh, DECODE(cmp_cmpjl.lx,'1','�깤����'),cmp_cmpjl.lrr,cmp_cmpjl.lrsj,dwmc lrbm,cmp_cmpjl.sjtxsj,cmp_cmpjl.bz  ";
	ls_sql+=" FROM crm_khxx,cmp_cmpjl,sq_dwxx  ";
    ls_sql+=" where cmp_cmpjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cmp_cmpjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cmp_cmpjl.lrsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cmp_cmpjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","cmp_cmpjl_cmpzt","cmp_cmpjl_cmpbh","cmp_cmpjl_lx","cmp_cmpjl_lrr","lrsj","cmp_cmpjl_lrbm","cmp_cmpjl_sjtxsj","cmp_cmpjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh","lrsj"};
	pageObj.setKey(keyName);
	pageObj.setDateType("long");
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
  <B><font size="3">��Ȩ��¼��ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="14%">���ݵ�ַ</td>
	<td  width="5%">������״̬</td>
	<td  width="5%">���������</td>
	<td  width="5%">����</td>
	<td  width="5%">¼����</td>
	<td  width="12%">¼��ʱ��</td>
	<td  width="9%">¼�벿��</td>
	<td  width="12%">ʵ����дʱ��</td>
	<td  width="38%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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