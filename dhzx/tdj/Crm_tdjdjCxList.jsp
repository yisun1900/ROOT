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
	String crm_tdjdj_tdjxh=null;
	String crm_tdjdj_khbh=null;
	String crm_tdjdj_khxm=null;
	String crm_tdjdj_fwdz=null;
	String crm_tdjdj_dh=null;
	String crm_tdjdj_sjs=null;
	String crm_tdjdj_tdjyybm=null;
	String crm_tdjdj_tdjyysm=null;
	String crm_tdjdj_ytje=null;
	String crm_tdjdj_stje=null;
	String crm_tdjdj_dwbh=null;
	String crm_tdjdj_lrr=null;
	String crm_tdjdj_lrsj=null;
	crm_tdjdj_tdjxh=request.getParameter("crm_tdjdj_tdjxh");
	if (crm_tdjdj_tdjxh!=null)
	{
		crm_tdjdj_tdjxh=cf.GB2Uni(crm_tdjdj_tdjxh);
		if (!(crm_tdjdj_tdjxh.equals("")))	wheresql+=" and  (crm_tdjdj.tdjxh='"+crm_tdjdj_tdjxh+"')";
	}
	crm_tdjdj_khbh=request.getParameter("crm_tdjdj_khbh");
	if (crm_tdjdj_khbh!=null)
	{
		crm_tdjdj_khbh=cf.GB2Uni(crm_tdjdj_khbh);
		if (!(crm_tdjdj_khbh.equals("")))	wheresql+=" and  (crm_tdjdj.khbh='"+crm_tdjdj_khbh+"')";
	}
	crm_tdjdj_khxm=request.getParameter("crm_tdjdj_khxm");
	if (crm_tdjdj_khxm!=null)
	{
		crm_tdjdj_khxm=cf.GB2Uni(crm_tdjdj_khxm);
		if (!(crm_tdjdj_khxm.equals("")))	wheresql+=" and  (crm_tdjdj.khxm='"+crm_tdjdj_khxm+"')";
	}
	crm_tdjdj_fwdz=request.getParameter("crm_tdjdj_fwdz");
	if (crm_tdjdj_fwdz!=null)
	{
		crm_tdjdj_fwdz=cf.GB2Uni(crm_tdjdj_fwdz);
		if (!(crm_tdjdj_fwdz.equals("")))	wheresql+=" and  (crm_tdjdj.fwdz='"+crm_tdjdj_fwdz+"')";
	}
	crm_tdjdj_dh=request.getParameter("crm_tdjdj_dh");
	if (crm_tdjdj_dh!=null)
	{
		crm_tdjdj_dh=cf.GB2Uni(crm_tdjdj_dh);
		if (!(crm_tdjdj_dh.equals("")))	wheresql+=" and  (crm_tdjdj.dh='"+crm_tdjdj_dh+"')";
	}
	crm_tdjdj_sjs=request.getParameter("crm_tdjdj_sjs");
	if (crm_tdjdj_sjs!=null)
	{
		crm_tdjdj_sjs=cf.GB2Uni(crm_tdjdj_sjs);
		if (!(crm_tdjdj_sjs.equals("")))	wheresql+=" and  (crm_tdjdj.sjs='"+crm_tdjdj_sjs+"')";
	}
	crm_tdjdj_tdjyybm=request.getParameter("crm_tdjdj_tdjyybm");
	if (crm_tdjdj_tdjyybm!=null)
	{
		crm_tdjdj_tdjyybm=cf.GB2Uni(crm_tdjdj_tdjyybm);
		if (!(crm_tdjdj_tdjyybm.equals("")))	wheresql+=" and  (crm_tdjdj.tdjyybm='"+crm_tdjdj_tdjyybm+"')";
	}
	crm_tdjdj_tdjyysm=request.getParameter("crm_tdjdj_tdjyysm");
	if (crm_tdjdj_tdjyysm!=null)
	{
		crm_tdjdj_tdjyysm=cf.GB2Uni(crm_tdjdj_tdjyysm);
		if (!(crm_tdjdj_tdjyysm.equals("")))	wheresql+=" and  (crm_tdjdj.tdjyysm='"+crm_tdjdj_tdjyysm+"')";
	}
	crm_tdjdj_ytje=request.getParameter("crm_tdjdj_ytje");
	if (crm_tdjdj_ytje!=null)
	{
		crm_tdjdj_ytje=crm_tdjdj_ytje.trim();
		if (!(crm_tdjdj_ytje.equals("")))	wheresql+=" and  (crm_tdjdj.ytje="+crm_tdjdj_ytje+") ";
	}
	crm_tdjdj_stje=request.getParameter("crm_tdjdj_stje");
	if (crm_tdjdj_stje!=null)
	{
		crm_tdjdj_stje=crm_tdjdj_stje.trim();
		if (!(crm_tdjdj_stje.equals("")))	wheresql+=" and  (crm_tdjdj.stje="+crm_tdjdj_stje+") ";
	}
	crm_tdjdj_dwbh=request.getParameter("crm_tdjdj_dwbh");
	if (crm_tdjdj_dwbh!=null)
	{
		crm_tdjdj_dwbh=cf.GB2Uni(crm_tdjdj_dwbh);
		if (!(crm_tdjdj_dwbh.equals("")))	wheresql+=" and  (crm_tdjdj.dwbh='"+crm_tdjdj_dwbh+"')";
	}
	crm_tdjdj_lrr=request.getParameter("crm_tdjdj_lrr");
	if (crm_tdjdj_lrr!=null)
	{
		crm_tdjdj_lrr=cf.GB2Uni(crm_tdjdj_lrr);
		if (!(crm_tdjdj_lrr.equals("")))	wheresql+=" and  (crm_tdjdj.lrr='"+crm_tdjdj_lrr+"')";
	}
	crm_tdjdj_lrsj=request.getParameter("crm_tdjdj_lrsj");
	if (crm_tdjdj_lrsj!=null)
	{
		crm_tdjdj_lrsj=crm_tdjdj_lrsj.trim();
		if (!(crm_tdjdj_lrsj.equals("")))	wheresql+="  and (crm_tdjdj.lrsj>=TO_DATE('"+crm_tdjdj_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tdjdj_lrsj=request.getParameter("crm_tdjdj_lrsj2");
	if (crm_tdjdj_lrsj!=null)
	{
		crm_tdjdj_lrsj=crm_tdjdj_lrsj.trim();
		if (!(crm_tdjdj_lrsj.equals("")))	wheresql+="  and (crm_tdjdj.lrsj<=TO_DATE('"+crm_tdjdj_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_tdjdj.tdjxh,crm_tdjdj.khbh,crm_tdjdj.khxm,crm_tdjdj.fwdz,crm_tdjdj.dh,crm_tdjdj.sjs,dm_tdjyybm.tdjyymc,crm_tdjdj.tdjyysm,crm_tdjdj.ytje,crm_tdjdj.stje,crm_tdjdj.dwbh,crm_tdjdj.lrr,crm_tdjdj.lrsj  ";
	ls_sql+=" FROM crm_tdjdj,dm_tdjyybm  ";
    ls_sql+=" where crm_tdjdj.tdjyybm=dm_tdjyybm.tdjyybm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_tdjdjCxList.jsp","SelectCxCrm_tdjdj.jsp","ViewCrm_tdjdj.jsp","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"tdjxh","crm_tdjdj_khbh","crm_tdjdj_khxm","crm_tdjdj_fwdz","crm_tdjdj_dh","crm_tdjdj_sjs","dm_tdjyybm_tdjyymc","crm_tdjdj_tdjyysm","crm_tdjdj_ytje","crm_tdjdj_stje","crm_tdjdj_dwbh","crm_tdjdj_lrr","crm_tdjdj_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"tdjxh"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
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
	<td  width="6%">�˶������</td>
	<td  width="6%">�ͻ����</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="6%">���ݵ�ַ</td>
	<td  width="6%">�绰</td>
	<td  width="6%">���ʦ</td>
	<td  width="6%">�˶���ԭ��</td>
	<td  width="6%">�˶���ԭ��˵��</td>
	<td  width="6%">Ӧ�˽��</td>
	<td  width="6%">ʵ�˽��</td>
	<td  width="6%">¼�뵥λ</td>
	<td  width="6%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
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