<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String crm_zxkhxx_lfsj=null;
	String crm_zxkhxx_zxdm=null;
	String crm_zxkhxx_ywy=null;
	String crm_zxkhxx_zxdjbm=null;
	String sq_dwxx_dwmc=null;
	crm_zxkhxx_lfsj=request.getParameter("crm_zxkhxx_lfsj");
	if (crm_zxkhxx_lfsj!=null)
	{
		crm_zxkhxx_lfsj=crm_zxkhxx_lfsj.trim();
		if (!(crm_zxkhxx_lfsj.equals("")))	wheresql+="  and (crm_zxkhxx.lfsj>=TO_DATE('"+crm_zxkhxx_lfsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_lfsj=request.getParameter("crm_zxkhxx_lfsj2");
	if (crm_zxkhxx_lfsj!=null)
	{
		crm_zxkhxx_lfsj=crm_zxkhxx_lfsj.trim();
		if (!(crm_zxkhxx_lfsj.equals("")))	wheresql+="  and (crm_zxkhxx.lfsj<=TO_DATE('"+crm_zxkhxx_lfsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_zxdm=request.getParameter("crm_zxkhxx_zxdm");
	if (crm_zxkhxx_zxdm!=null)
	{
		crm_zxkhxx_zxdm=cf.GB2Uni(crm_zxkhxx_zxdm);
		if (!(crm_zxkhxx_zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+crm_zxkhxx_zxdm+"')";
	}
	crm_zxkhxx_ywy=request.getParameter("crm_zxkhxx_ywy");
	if (crm_zxkhxx_ywy!=null)
	{
		crm_zxkhxx_ywy=cf.GB2Uni(crm_zxkhxx_ywy);
		if (!(crm_zxkhxx_ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+crm_zxkhxx_ywy+"')";
	}
	crm_zxkhxx_zxdjbm=request.getParameter("crm_zxkhxx_zxdjbm");
	if (crm_zxkhxx_zxdjbm!=null)
	{
		crm_zxkhxx_zxdjbm=cf.GB2Uni(crm_zxkhxx_zxdjbm);
		if (!(crm_zxkhxx_zxdjbm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdjbm='"+crm_zxkhxx_zxdjbm+"')";
	}
	sq_dwxx_dwmc=request.getParameter("sq_dwxx_dwmc");
	if (sq_dwxx_dwmc!=null)
	{
		sq_dwxx_dwmc=cf.GB2Uni(sq_dwxx_dwmc);
		if (!(sq_dwxx_dwmc.equals("")))	wheresql+=" and  (sq_dwxx.dwmc='"+sq_dwxx_dwmc+"')";
	}
		//**********************************
	//�����û����ԣ����ӷֹ�˾��ѯ����
	//********************************

	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+=" and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="  and ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+=" and (sq_dwxx.dwbh='"+dwbh+"') ";
	}
	ls_sql="SELECT ROWNUM,crm_zxkhxx.ywy as crm_zxkhxx_ywy,crm_zxkhxx.sjs as crm_zxkhxx_sjs,sq_dwxx.dwmc as sq_dwxx_dwmc,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,crm_zxkhxx.lfsj as crm_zxkhxx_lfsj,crm_zxkhxx.bz as crm_zxkhxx_bz";
	
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx  ";
    ls_sql+=" where crm_zxkhxx.zxdjbm=sq_dwxx.dwbh and crm_zxkhxx.ywy is not null";
    ls_sql+=wheresql;
	ls_sql+="   order by ROWNUM";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(4000);
/*
//������ʾ��
	String[] disColName={"khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_sjs","crm_zxkhxx_lfsj","crm_zxkhxx_zxdm","crm_zxkhxx_zxdjbm","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
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
  <B><font size="3">Ӫ������Ա����ͳ�Ʊ�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	
	
	<td  width="3%">���</td>
	<td  width="4%">Ӫ������</td>
	<td  width="3%">���ʦ</td>
	<td  width="5%">���ڵ���</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="11%">�¾ӵ�ַ</td>
	<td  width="3%">��ϵ�绰</td>
	<td  width="4%">����ʱ��</td>
	<td  width="9%">��ע</td>
	
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