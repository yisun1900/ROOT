<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String dwlx=(String)session.getAttribute("dwlx");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
//where dqbm='"+dqbm+"'
//and (dwlx='F1'  or dwlx='F2')
%>
<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String qh_lfcxdjb_zpnr=null;
	String crm_zxkhxx_khxm=null;
	String crm_zxkhxx_sjs=null;
	String qh_lfcxdjb_djrq=null;
	qh_lfcxdjb_zpnr=request.getParameter("qh_lfcxdjb_zpnr");
	if (qh_lfcxdjb_zpnr!=null)
	{
		qh_lfcxdjb_zpnr=cf.GB2Uni(qh_lfcxdjb_zpnr);
		if (!(qh_lfcxdjb_zpnr.equals("")))	wheresql+=" and  (qh_lfcxdjb.zpnr='"+qh_lfcxdjb_zpnr+"')";
	}
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	crm_zxkhxx_sjs=request.getParameter("crm_zxkhxx_sjs");
	if (crm_zxkhxx_sjs!=null)
	{
		crm_zxkhxx_sjs=cf.GB2Uni(crm_zxkhxx_sjs);
		if (!(crm_zxkhxx_sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+crm_zxkhxx_sjs+"')";
	}
	qh_lfcxdjb_djrq=request.getParameter("qh_lfcxdjb_djrq");
	if (qh_lfcxdjb_djrq!=null)
	{
		qh_lfcxdjb_djrq=qh_lfcxdjb_djrq.trim();
		if (!(qh_lfcxdjb_djrq.equals("")))	wheresql+="  and (qh_lfcxdjb.djrq>=TO_DATE('"+qh_lfcxdjb_djrq+"','YYYY/MM/DD'))";
	}
	qh_lfcxdjb_djrq=request.getParameter("qh_lfcxdjb_djrq2");
	if (qh_lfcxdjb_djrq!=null)
	{
		qh_lfcxdjb_djrq=qh_lfcxdjb_djrq.trim();
		if (!(qh_lfcxdjb_djrq.equals("")))	wheresql+="  and (qh_lfcxdjb.djrq<=TO_DATE('"+qh_lfcxdjb_djrq+"','YYYY/MM/DD'))";
	}
		 if (yhjs.equals("A0")||yhjs.equals("A1"))
	{ 
		wheresql+=" and (1=1)";
	 }
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="and (sq_dwxx.ssdw='"+ssfgs+"')";
	 }
	 else
	 {
		wheresql+="and (sq_dwxx.dwbh='"+dwbh+"')";
	 }
	ls_sql="SELECT ROWNUM,crm_zxkhxx.lfsj as qh_lfcxdjb_djrq,crm_zxkhxx.sjs as crm_zxkhxx_sjs ,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,crm_jdjdj.lfdj,qh_lfcxdjb.zpnr as qh_lfcxdjb_zpnr ,qh_lfcxdjb.jsr as qh_lfcxdjb_jsr,qh_lfcxdjb.bz as qh_lfcxdjb_bz ";
	ls_sql+=" FROM crm_zxkhxx,crm_jdjdj,qh_lfcxdjb,sq_dwxx  ";
    ls_sql+=" where crm_zxkhxx.khbh=crm_jdjdj.khbh(+) and qh_lfcxdjb.khbh=crm_zxkhxx.khbh and (sq_dwxx.dwbh(+)=crm_zxkhxx.zxdm)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
/*
//������ʾ��
	String[] disColName={"djxh","qh_lfcxdjb_khbh","qh_lfcxdjb_zpnr","qh_lfcxdjb_jsr","crm_zxkhxx_khxm","crm_zxkhxx_lxfs","crm_zxkhxx_sjs","qh_lfcxdjb_djrq"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"djxh"};
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
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��������Ʒ����ͳ�Ʊ�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="5%">��������</td>
	<td  width="6%">���ʦ</td>
	<td  width="6%">�ͻ�</td>
	<td  width="8%">��ϵ�绰</td>
	<td  width="8%">����</td>
	<td  width="10%">��Ʒ����</td>
	<td  width="7%">������</td>
	<td  width="12%">��ע</td>
	
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