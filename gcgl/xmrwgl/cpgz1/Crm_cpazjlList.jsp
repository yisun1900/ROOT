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
	String crm_cpazjl_azjlh=null;
	String crm_cpazjl_khbh=null;
	String crm_cpazjl_cpflbm=null;
	String crm_cpazjl_azjg=null;
	String crm_cpazjl_smsj=null;
	String crm_cpazjl_smr=null;
	String crm_cpazjl_lrr=null;
	String crm_cpazjl_lrsj=null;
	String crm_cpazjl_lrbm=null;
	crm_cpazjl_azjlh=request.getParameter("crm_cpazjl_azjlh");
	if (crm_cpazjl_azjlh!=null)
	{
		crm_cpazjl_azjlh=cf.GB2Uni(crm_cpazjl_azjlh);
		if (!(crm_cpazjl_azjlh.equals("")))	wheresql+=" and  (crm_cpazjl.azjlh='"+crm_cpazjl_azjlh+"')";
	}
	crm_cpazjl_khbh=request.getParameter("crm_cpazjl_khbh");
	if (crm_cpazjl_khbh!=null)
	{
		crm_cpazjl_khbh=cf.GB2Uni(crm_cpazjl_khbh);
		if (!(crm_cpazjl_khbh.equals("")))	wheresql+=" and  (crm_cpazjl.khbh='"+crm_cpazjl_khbh+"')";
	}
	crm_cpazjl_cpflbm=request.getParameter("crm_cpazjl_cpflbm");
	if (crm_cpazjl_cpflbm!=null)
	{
		crm_cpazjl_cpflbm=cf.GB2Uni(crm_cpazjl_cpflbm);
		if (!(crm_cpazjl_cpflbm.equals("")))	wheresql+=" and  (crm_cpazjl.cpflbm='"+crm_cpazjl_cpflbm+"')";
	}
	crm_cpazjl_azjg=request.getParameter("crm_cpazjl_azjg");
	if (crm_cpazjl_azjg!=null)
	{
		crm_cpazjl_azjg=cf.GB2Uni(crm_cpazjl_azjg);
		if (!(crm_cpazjl_azjg.equals("")))	wheresql+=" and  (crm_cpazjl.azjg='"+crm_cpazjl_azjg+"')";
	}
	crm_cpazjl_smsj=request.getParameter("crm_cpazjl_smsj");
	if (crm_cpazjl_smsj!=null)
	{
		crm_cpazjl_smsj=crm_cpazjl_smsj.trim();
		if (!(crm_cpazjl_smsj.equals("")))	wheresql+="  and (crm_cpazjl.smsj>=TO_DATE('"+crm_cpazjl_smsj+"','YYYY/MM/DD'))";
	}
	crm_cpazjl_smsj=request.getParameter("crm_cpazjl_smsj2");
	if (crm_cpazjl_smsj!=null)
	{
		crm_cpazjl_smsj=crm_cpazjl_smsj.trim();
		if (!(crm_cpazjl_smsj.equals("")))	wheresql+="  and (crm_cpazjl.smsj<=TO_DATE('"+crm_cpazjl_smsj+"','YYYY/MM/DD'))";
	}
	crm_cpazjl_smr=request.getParameter("crm_cpazjl_smr");
	if (crm_cpazjl_smr!=null)
	{
		crm_cpazjl_smr=cf.GB2Uni(crm_cpazjl_smr);
		if (!(crm_cpazjl_smr.equals("")))	wheresql+=" and  (crm_cpazjl.smr='"+crm_cpazjl_smr+"')";
	}
	crm_cpazjl_lrr=request.getParameter("crm_cpazjl_lrr");
	if (crm_cpazjl_lrr!=null)
	{
		crm_cpazjl_lrr=cf.GB2Uni(crm_cpazjl_lrr);
		if (!(crm_cpazjl_lrr.equals("")))	wheresql+=" and  (crm_cpazjl.lrr='"+crm_cpazjl_lrr+"')";
	}
	crm_cpazjl_lrsj=request.getParameter("crm_cpazjl_lrsj");
	if (crm_cpazjl_lrsj!=null)
	{
		crm_cpazjl_lrsj=crm_cpazjl_lrsj.trim();
		if (!(crm_cpazjl_lrsj.equals("")))	wheresql+="  and (crm_cpazjl.lrsj>=TO_DATE('"+crm_cpazjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_cpazjl_lrsj=request.getParameter("crm_cpazjl_lrsj2");
	if (crm_cpazjl_lrsj!=null)
	{
		crm_cpazjl_lrsj=crm_cpazjl_lrsj.trim();
		if (!(crm_cpazjl_lrsj.equals("")))	wheresql+="  and (crm_cpazjl.lrsj<=TO_DATE('"+crm_cpazjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_cpazjl_lrbm=request.getParameter("crm_cpazjl_lrbm");
	if (crm_cpazjl_lrbm!=null)
	{
		crm_cpazjl_lrbm=cf.GB2Uni(crm_cpazjl_lrbm);
		if (!(crm_cpazjl_lrbm.equals("")))	wheresql+=" and  (crm_cpazjl.lrbm='"+crm_cpazjl_lrbm+"')";
	}
	ls_sql="SELECT crm_cpazjl.azjlh,crm_cpazjl.khbh,crm_cpazjl.cpflbm,dm_cpflbm.cpflmc, DECODE(crm_cpazjl.azjg,'1','δ���','2','��װ�ɹ�','3','��װʧ��'),crm_cpazjl.smsj,crm_cpazjl.smr,crm_cpazjl.azsm,crm_cpazjl.lrr,crm_cpazjl.lrsj,crm_cpazjl.lrbm  ";
	ls_sql+=" FROM dm_cpflbm,crm_cpazjl  ";
    ls_sql+=" where crm_cpazjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_cpazjlList.jsp","","","EditCrm_cpazjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"azjlh","crm_cpazjl_khbh","crm_cpazjl_cpflbm","dm_cpflbm_cpflmc","crm_cpazjl_azjg","crm_cpazjl_smsj","crm_cpazjl_smr","crm_cpazjl_azsm","crm_cpazjl_lrr","crm_cpazjl_lrsj","crm_cpazjl_lrbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"azjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Crm_cpazjlList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
	String[] azjlh = request.getParameterValues("azjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(azjlh,"azjlh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from crm_cpazjl where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ά����װ��¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">��װ��¼��</td>
	<td  width="8%">�ͻ����</td>
	<td  width="8%">��Ʒ����</td>
	<td  width="8%">��Ʒ����</td>
	<td  width="8%">��װ���</td>
	<td  width="8%">����ʱ��</td>
	<td  width="8%">������</td>
	<td  width="12%">��װ˵��</td>
	<td  width="8%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="8%">¼�벿��</td>
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