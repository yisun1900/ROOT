<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");

%>
<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String qh_mtjk_jkbbh=null;
	String qh_mtjk_bjkgsbh=null;
	String qh_mtjk_xxlybm=null;
	String qh_mtjk_bcsj=null;
	String qh_mtjk_gggs=null;
	String qh_mtjk_dwbh=null;
	qh_mtjk_jkbbh=request.getParameter("qh_mtjk_jkbbh");
	if (qh_mtjk_jkbbh!=null)
	{
		qh_mtjk_jkbbh=cf.GB2Uni(qh_mtjk_jkbbh);
		if (!(qh_mtjk_jkbbh.equals("")))	wheresql+=" and  (qh_mtjk.jkbbh='"+qh_mtjk_jkbbh+"')";
	}
	qh_mtjk_bjkgsbh=request.getParameter("qh_mtjk_bjkgsbh");
	if (qh_mtjk_bjkgsbh!=null)
	{
		qh_mtjk_bjkgsbh=cf.GB2Uni(qh_mtjk_bjkgsbh);
		if (!(qh_mtjk_bjkgsbh.equals("")))	wheresql+=" and  (qh_mtjk.bjkgsbh='"+qh_mtjk_bjkgsbh+"')";
	}
	qh_mtjk_xxlybm=request.getParameter("qh_mtjk_xxlybm");
	if (qh_mtjk_xxlybm!=null)
	{
		qh_mtjk_xxlybm=cf.GB2Uni(qh_mtjk_xxlybm);
		if (!(qh_mtjk_xxlybm.equals("")))	wheresql+=" and  (qh_mtjk.xxlybm='"+qh_mtjk_xxlybm+"')";
	}
	qh_mtjk_bcsj=request.getParameter("qh_mtjk_bcsj");
	if (qh_mtjk_bcsj!=null)
	{
		qh_mtjk_bcsj=qh_mtjk_bcsj.trim();
		if (!(qh_mtjk_bcsj.equals("")))	wheresql+="  and (qh_mtjk.bcsj>=TO_DATE('"+qh_mtjk_bcsj+"','YYYY/MM/DD'))";
	}
	qh_mtjk_bcsj=request.getParameter("qh_mtjk_bcsj2");
	if (qh_mtjk_bcsj!=null)
	{
		qh_mtjk_bcsj=qh_mtjk_bcsj.trim();
		if (!(qh_mtjk_bcsj.equals("")))	wheresql+="  and (qh_mtjk.bcsj<=TO_DATE('"+qh_mtjk_bcsj+"','YYYY/MM/DD'))";
	}
	qh_mtjk_gggs=request.getParameter("qh_mtjk_gggs");
	if (qh_mtjk_gggs!=null)
	{
		qh_mtjk_gggs=cf.GB2Uni(qh_mtjk_gggs);
		if (!(qh_mtjk_gggs.equals("")))	wheresql+=" and  (qh_mtjk.gggs='"+qh_mtjk_gggs+"')";
	}
	qh_mtjk_dwbh=request.getParameter("qh_mtjk_dwbh");
	if (qh_mtjk_dwbh!=null)
	{
		qh_mtjk_dwbh=cf.GB2Uni(qh_mtjk_dwbh);
		if (!(qh_mtjk_dwbh.equals("")))	wheresql+=" and  (qh_mtjk.dwbh='"+qh_mtjk_dwbh+"')";
	}

	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{ 
		wheresql+=" and (1=1) ";
	 }
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+=" and (sq_dwxx.ssdw='"+ssfgs+"') ";
	 }
	 else
	 {
		wheresql+=" and (sq_dwxx.dwbh='"+dwbh+"') ";
	 }
	ls_sql="SELECT qh_mtjk.jkbbh as jkbbh,qh_bjkgsdm.bjkgsmc as qh_bjkgsdm_bjkgsmc,dm_xxlybm.xxlymc,to_char(qh_mtjk.bcsj,'YYYY-MM-DD')||'('||decode(to_char(qh_mtjk.bcsj,'D'),'1','����','2','��һ','3','�ܶ�','4','����','5','����','6','����','7','����','���ڰ�')||')' as qh_mtjk_bcsj,qh_mtjk.gggs as qh_mtjk_gggs,qh_mtjk.yjjg as qh_mtjk_yjjg,sq_dwxx.dwmc as sq_dwxx_dwmc ,qh_mtjk.bz as qh_mtjk_bz ";
	ls_sql+=" FROM qh_mtjk,qh_bjkgsdm,sq_dwxx,dm_xxlybm  ";
    ls_sql+=" where qh_mtjk.bjkgsbh=qh_bjkgsdm.bjkgsbh and qh_mtjk.dwbh=sq_dwxx.dwbh and dm_xxlybm.xxlybm=qh_mtjk.xxlybm";
    ls_sql+=wheresql;
    ls_sql+=" order by qh_mtjk.bcsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Qh_mtjkCxList.jsp","SelectCxQh_mtjk.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jkbbh","qh_mtjk_bcsj","qh_mtjk_gggs","qh_mtjk_yjjg","qh_mtjk_bz","qh_mtjk_dwbh","sq_dwxx_dwmc","qh_bjkgsdm_bjkgsmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jkbbh"};
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">��ر���</td>
	<td  width="12%">����ع�˾����</td>
	<td  width="8%">�����ʽ</td>
	<td  width="7%">����ʱ��</td>
	<td  width="12%">��湫˾</td>
	<td  width="6%">Ԥ�Ƽ۸�</td>
	<td  width="12%">��ص�λ</td>
	<td  width="37%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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