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
	String crm_dmsjsxgjl_xgjlh=null;
	String crm_dmsjsxgjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_dmsjsxgjl_xgqfgsbh=null;
	String crm_dmsjsxgjl_xgqdwbh=null;
	String crm_dmsjsxgjl_xgqsjs=null;
	String crm_dmsjsxgjl_xgqsjsgh=null;
	String crm_dmsjsxgjl_xghfgsbh=null;
	String crm_dmsjsxgjl_xghdwbh=null;
	String crm_dmsjsxgjl_xghsjs=null;
	String crm_dmsjsxgjl_xghsjsgh=null;
	String crm_dmsjsxgjl_lrr=null;
	String crm_dmsjsxgjl_lrsj=null;
	String crm_dmsjsxgjl_lrbm=null;

	String xgqkhjl=null;
	xgqkhjl=request.getParameter("xgqkhjl");
	if (xgqkhjl!=null)
	{
		xgqkhjl=cf.GB2Uni(xgqkhjl);
		if (!(xgqkhjl.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xgqkhjl='"+xgqkhjl+"')";
	}
	String xghkhjl=null;
	xghkhjl=request.getParameter("xghkhjl");
	if (xghkhjl!=null)
	{
		xghkhjl=cf.GB2Uni(xghkhjl);
		if (!(xghkhjl.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xghkhjl='"+xghkhjl+"')";
	}

	
	crm_dmsjsxgjl_xgjlh=request.getParameter("crm_dmsjsxgjl_xgjlh");
	if (crm_dmsjsxgjl_xgjlh!=null)
	{
		crm_dmsjsxgjl_xgjlh=cf.GB2Uni(crm_dmsjsxgjl_xgjlh);
		if (!(crm_dmsjsxgjl_xgjlh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xgjlh='"+crm_dmsjsxgjl_xgjlh+"')";
	}
	crm_dmsjsxgjl_khbh=request.getParameter("crm_dmsjsxgjl_khbh");
	if (crm_dmsjsxgjl_khbh!=null)
	{
		crm_dmsjsxgjl_khbh=cf.GB2Uni(crm_dmsjsxgjl_khbh);
		if (!(crm_dmsjsxgjl_khbh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.khbh='"+crm_dmsjsxgjl_khbh+"')";
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
	crm_dmsjsxgjl_xgqfgsbh=request.getParameter("crm_dmsjsxgjl_xgqfgsbh");
	if (crm_dmsjsxgjl_xgqfgsbh!=null)
	{
		crm_dmsjsxgjl_xgqfgsbh=cf.GB2Uni(crm_dmsjsxgjl_xgqfgsbh);
		if (!(crm_dmsjsxgjl_xgqfgsbh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xgqfgsbh='"+crm_dmsjsxgjl_xgqfgsbh+"')";
	}
	crm_dmsjsxgjl_xgqdwbh=request.getParameter("crm_dmsjsxgjl_xgqdwbh");
	if (crm_dmsjsxgjl_xgqdwbh!=null)
	{
		crm_dmsjsxgjl_xgqdwbh=cf.GB2Uni(crm_dmsjsxgjl_xgqdwbh);
		if (!(crm_dmsjsxgjl_xgqdwbh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xgqdwbh='"+crm_dmsjsxgjl_xgqdwbh+"')";
	}
	crm_dmsjsxgjl_xgqsjs=request.getParameter("crm_dmsjsxgjl_xgqsjs");
	if (crm_dmsjsxgjl_xgqsjs!=null)
	{
		crm_dmsjsxgjl_xgqsjs=cf.GB2Uni(crm_dmsjsxgjl_xgqsjs);
		if (!(crm_dmsjsxgjl_xgqsjs.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xgqsjs='"+crm_dmsjsxgjl_xgqsjs+"')";
	}
	crm_dmsjsxgjl_xgqsjsgh=request.getParameter("crm_dmsjsxgjl_xgqsjsgh");
	if (crm_dmsjsxgjl_xgqsjsgh!=null)
	{
		crm_dmsjsxgjl_xgqsjsgh=cf.GB2Uni(crm_dmsjsxgjl_xgqsjsgh);
		if (!(crm_dmsjsxgjl_xgqsjsgh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xgqsjsgh='"+crm_dmsjsxgjl_xgqsjsgh+"')";
	}
	crm_dmsjsxgjl_xghfgsbh=request.getParameter("crm_dmsjsxgjl_xghfgsbh");
	if (crm_dmsjsxgjl_xghfgsbh!=null)
	{
		crm_dmsjsxgjl_xghfgsbh=cf.GB2Uni(crm_dmsjsxgjl_xghfgsbh);
		if (!(crm_dmsjsxgjl_xghfgsbh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xghfgsbh='"+crm_dmsjsxgjl_xghfgsbh+"')";
	}
	crm_dmsjsxgjl_xghdwbh=request.getParameter("crm_dmsjsxgjl_xghdwbh");
	if (crm_dmsjsxgjl_xghdwbh!=null)
	{
		crm_dmsjsxgjl_xghdwbh=cf.GB2Uni(crm_dmsjsxgjl_xghdwbh);
		if (!(crm_dmsjsxgjl_xghdwbh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xghdwbh='"+crm_dmsjsxgjl_xghdwbh+"')";
	}
	crm_dmsjsxgjl_xghsjs=request.getParameter("crm_dmsjsxgjl_xghsjs");
	if (crm_dmsjsxgjl_xghsjs!=null)
	{
		crm_dmsjsxgjl_xghsjs=cf.GB2Uni(crm_dmsjsxgjl_xghsjs);
		if (!(crm_dmsjsxgjl_xghsjs.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xghsjs='"+crm_dmsjsxgjl_xghsjs+"')";
	}
	crm_dmsjsxgjl_xghsjsgh=request.getParameter("crm_dmsjsxgjl_xghsjsgh");
	if (crm_dmsjsxgjl_xghsjsgh!=null)
	{
		crm_dmsjsxgjl_xghsjsgh=cf.GB2Uni(crm_dmsjsxgjl_xghsjsgh);
		if (!(crm_dmsjsxgjl_xghsjsgh.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.xghsjsgh='"+crm_dmsjsxgjl_xghsjsgh+"')";
	}
	crm_dmsjsxgjl_lrr=request.getParameter("crm_dmsjsxgjl_lrr");
	if (crm_dmsjsxgjl_lrr!=null)
	{
		crm_dmsjsxgjl_lrr=cf.GB2Uni(crm_dmsjsxgjl_lrr);
		if (!(crm_dmsjsxgjl_lrr.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.lrr='"+crm_dmsjsxgjl_lrr+"')";
	}
	crm_dmsjsxgjl_lrsj=request.getParameter("crm_dmsjsxgjl_lrsj");
	if (crm_dmsjsxgjl_lrsj!=null)
	{
		crm_dmsjsxgjl_lrsj=crm_dmsjsxgjl_lrsj.trim();
		if (!(crm_dmsjsxgjl_lrsj.equals("")))	wheresql+="  and (crm_dmsjsxgjl.lrsj>=TO_DATE('"+crm_dmsjsxgjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_dmsjsxgjl_lrsj=request.getParameter("crm_dmsjsxgjl_lrsj2");
	if (crm_dmsjsxgjl_lrsj!=null)
	{
		crm_dmsjsxgjl_lrsj=crm_dmsjsxgjl_lrsj.trim();
		if (!(crm_dmsjsxgjl_lrsj.equals("")))	wheresql+="  and (crm_dmsjsxgjl.lrsj<=TO_DATE('"+crm_dmsjsxgjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_dmsjsxgjl_lrbm=request.getParameter("crm_dmsjsxgjl_lrbm");
	if (crm_dmsjsxgjl_lrbm!=null)
	{
		crm_dmsjsxgjl_lrbm=cf.GB2Uni(crm_dmsjsxgjl_lrbm);
		if (!(crm_dmsjsxgjl_lrbm.equals("")))	wheresql+=" and  (crm_dmsjsxgjl.lrbm='"+crm_dmsjsxgjl_lrbm+"')";
	}
	ls_sql="SELECT crm_dmsjsxgjl.xgjlh,crm_dmsjsxgjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,a.dwmc xgqfgsbh,b.dwmc xgqdwbh,crm_dmsjsxgjl.xgqsjs,crm_dmsjsxgjl.xgqsjsgh,crm_dmsjsxgjl.xgqkhjl,c.dwmc xghfgsbh,d.dwmc xghdwbh,crm_dmsjsxgjl.xghsjs,crm_dmsjsxgjl.xghsjsgh,crm_dmsjsxgjl.xghkhjl,crm_dmsjsxgjl.lrr,crm_dmsjsxgjl.lrsj,crm_dmsjsxgjl.bz  ";
	ls_sql+=" FROM crm_khxx,crm_dmsjsxgjl,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_dwxx d  ";
    ls_sql+=" where crm_dmsjsxgjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_dmsjsxgjl.xgqfgsbh=a.dwbh(+) and crm_dmsjsxgjl.xgqdwbh=b.dwbh(+)";
    ls_sql+=" and crm_dmsjsxgjl.xghfgsbh=c.dwbh(+) and crm_dmsjsxgjl.xghdwbh=d.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_dmsjsxgjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_dmsjsxgjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xgjlh","crm_dmsjsxgjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_dmsjsxgjl_xgqfgsbh","crm_dmsjsxgjl_xgqdwbh","crm_dmsjsxgjl_xgqsjs","crm_dmsjsxgjl_xgqsjsgh","crm_dmsjsxgjl_xghfgsbh","crm_dmsjsxgjl_xghdwbh","crm_dmsjsxgjl_xghsjs","crm_dmsjsxgjl_xghsjsgh","crm_dmsjsxgjl_lrr","crm_dmsjsxgjl_lrsj","crm_dmsjsxgjl_lrbm","crm_dmsjsxgjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xgjlh"};
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
  <B><font size="3">��ѯ���޸����ʦ�����¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�޸ļ�¼��</td>
	<td  width="4%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="12%">���ݵ�ַ</td>
	<td  width="5%">��ͬ��</td>
	<td  width="6%">�޸�ǰ�ֹ�˾</td>
	<td  width="7%">�޸�ǰǩԼ����</td>
	<td  width="4%">�޸�ǰ���ʦ</td>
	<td  width="4%">�޸�ǰ���ʦ����</td>
	<td  width="4%">�޸�ǰ�ͻ�����</td>
	<td  width="6%">�޸ĺ�ֹ�˾</td>
	<td  width="7%">�޸ĺ�ǩԼ����</td>
	<td  width="4%">�޸ĺ����ʦ</td>
	<td  width="4%">�޸ĺ����ʦ����</td>
	<td  width="4%">�޸ĺ�ͻ�����</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="11%">��ע</td>
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