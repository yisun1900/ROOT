<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_zxkhywyxhjl_khbh=null;
	String crm_zxkhywyxhjl_ssfgs=null;
	String crm_zxkhywyxhjl_khxm=null;
	String crm_zxkhywyxhjl_oldywy=null;
	String crm_zxkhywyxhjl_newywy=null;
	String crm_zxkhywyxhjl_xgr=null;
	String crm_zxkhywyxhjl_xgsj=null;
	crm_zxkhywyxhjl_khbh=request.getParameter("crm_zxkhywyxhjl_khbh");
	if (crm_zxkhywyxhjl_khbh!=null)
	{
		crm_zxkhywyxhjl_khbh=cf.GB2Uni(crm_zxkhywyxhjl_khbh);
		if (!(crm_zxkhywyxhjl_khbh.equals("")))	wheresql+=" and  (crm_zxkhywyxhjl.khbh='"+crm_zxkhywyxhjl_khbh+"')";
	}
	crm_zxkhywyxhjl_ssfgs=request.getParameter("crm_zxkhywyxhjl_ssfgs");
	if (crm_zxkhywyxhjl_ssfgs!=null)
	{
		crm_zxkhywyxhjl_ssfgs=cf.GB2Uni(crm_zxkhywyxhjl_ssfgs);
		if (!(crm_zxkhywyxhjl_ssfgs.equals("")))	wheresql+=" and  (crm_zxkhywyxhjl.ssfgs='"+crm_zxkhywyxhjl_ssfgs+"')";
	}
	crm_zxkhywyxhjl_khxm=request.getParameter("crm_zxkhywyxhjl_khxm");
	if (crm_zxkhywyxhjl_khxm!=null)
	{
		crm_zxkhywyxhjl_khxm=cf.GB2Uni(crm_zxkhywyxhjl_khxm);
		if (!(crm_zxkhywyxhjl_khxm.equals("")))	wheresql+=" and  (crm_zxkhywyxhjl.khxm='"+crm_zxkhywyxhjl_khxm+"')";
	}
	crm_zxkhywyxhjl_oldywy=request.getParameter("crm_zxkhywyxhjl_oldywy");
	if (crm_zxkhywyxhjl_oldywy!=null)
	{
		crm_zxkhywyxhjl_oldywy=cf.GB2Uni(crm_zxkhywyxhjl_oldywy);
		if (!(crm_zxkhywyxhjl_oldywy.equals("")))	wheresql+=" and  (crm_zxkhywyxhjl.oldywy='"+crm_zxkhywyxhjl_oldywy+"')";
	}
	crm_zxkhywyxhjl_newywy=request.getParameter("crm_zxkhywyxhjl_newywy");
	if (crm_zxkhywyxhjl_newywy!=null)
	{
		crm_zxkhywyxhjl_newywy=cf.GB2Uni(crm_zxkhywyxhjl_newywy);
		if (!(crm_zxkhywyxhjl_newywy.equals("")))	wheresql+=" and  (crm_zxkhywyxhjl.newywy='"+crm_zxkhywyxhjl_newywy+"')";
	}
	crm_zxkhywyxhjl_xgr=request.getParameter("crm_zxkhywyxhjl_xgr");
	if (crm_zxkhywyxhjl_xgr!=null)
	{
		crm_zxkhywyxhjl_xgr=cf.GB2Uni(crm_zxkhywyxhjl_xgr);
		if (!(crm_zxkhywyxhjl_xgr.equals("")))	wheresql+=" and  (crm_zxkhywyxhjl.xgr='"+crm_zxkhywyxhjl_xgr+"')";
	}
	crm_zxkhywyxhjl_xgsj=request.getParameter("crm_zxkhywyxhjl_xgsj");
	if (crm_zxkhywyxhjl_xgsj!=null)
	{
		crm_zxkhywyxhjl_xgsj=crm_zxkhywyxhjl_xgsj.trim();
		if (!(crm_zxkhywyxhjl_xgsj.equals("")))	wheresql+="  and (crm_zxkhywyxhjl.xgsj>=TO_DATE('"+crm_zxkhywyxhjl_xgsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhywyxhjl_xgsj=request.getParameter("crm_zxkhywyxhjl_xgsj2");
	if (crm_zxkhywyxhjl_xgsj!=null)
	{
		crm_zxkhywyxhjl_xgsj=crm_zxkhywyxhjl_xgsj.trim();
		if (!(crm_zxkhywyxhjl_xgsj.equals("")))	wheresql+="  and (crm_zxkhywyxhjl.xgsj<=TO_DATE('"+crm_zxkhywyxhjl_xgsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_zxkhywyxhjl.khbh,crm_zxkhywyxhjl.khxm,sq_dwxx.dwmc,crm_zxkhywyxhjl.oldywy,crm_zxkhywyxhjl.newywy,crm_zxkhywyxhjl.xgr,crm_zxkhywyxhjl.xgsj,crm_zxkhywyxhjl.xgsm  ";
	ls_sql+=" FROM sq_dwxx,crm_zxkhywyxhjl  ";
    ls_sql+=" where crm_zxkhywyxhjl.ssfgs=sq_dwxx.dwbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_zxkhywyxhjl.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhywyxhjl.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_zxkhywyxhjl.xgsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_zxkhywyxhjlCxList.jsp","SelectCxCrm_zxkhywyxhjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");
/*
//������ʾ��
	String[] disColName={"khbh","sq_dwxx_dwmc","crm_zxkhywyxhjl_khxm","crm_zxkhywyxhjl_oldywy","crm_zxkhywyxhjl_newywy","crm_zxkhywyxhjl_xgr","xgsj","crm_zxkhywyxhjl_xgsm"};
	pageObj.setDisColName(disColName);
*/

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
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
  <B><font size="3">��ѯ�޸ļ�¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�ͻ����</td>
	<td  width="7%">�ͻ�����</td>
	<td  width="9%">�����ֹ�˾</td>
	<td  width="7%">ԭҵ��Ա</td>
	<td  width="7%">��ҵ��Ա</td>
	<td  width="7%">�޸���</td>
	<td  width="15%">�޸�ʱ��</td>
	<td  width="41%">�޸�˵��</td>
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