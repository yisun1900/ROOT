<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_hthxx_hth=null;
	String crm_hthxx_dwbh=null;
	String crm_hthxx_sqr=null;
	String crm_hthxx_sqsj=null;
	String crm_hthxx_khbh=null;
	String crm_zxkhxx_khxm=null;
	String crm_zxkhxx_fwdz=null;
	String crm_zxkhxx_sjs=null;
	String crm_hthxx_sybz=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_hthxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssfgs='"+fgs+"'))";

	crm_hthxx_hth=request.getParameter("crm_hthxx_hth");
	if (crm_hthxx_hth!=null)
	{
		crm_hthxx_hth=cf.GB2Uni(crm_hthxx_hth);
		if (!(crm_hthxx_hth.equals("")))	wheresql+=" and  (crm_hthxx.hth='"+crm_hthxx_hth+"')";
	}

	crm_hthxx_dwbh=request.getParameter("crm_hthxx_dwbh");
	if (!(crm_hthxx_dwbh.equals("")))	wheresql+=" and  (crm_hthxx.dwbh='"+crm_hthxx_dwbh+"')";

	crm_hthxx_sqr=request.getParameter("crm_hthxx_sqr");
	if (crm_hthxx_sqr!=null)
	{
		crm_hthxx_sqr=cf.GB2Uni(crm_hthxx_sqr);
		if (!(crm_hthxx_sqr.equals("")))	wheresql+=" and  (crm_hthxx.sqr='"+crm_hthxx_sqr+"')";
	}
	crm_hthxx_sqsj=request.getParameter("crm_hthxx_sqsj");
	if (crm_hthxx_sqsj!=null)
	{
		crm_hthxx_sqsj=crm_hthxx_sqsj.trim();
		if (!(crm_hthxx_sqsj.equals("")))	wheresql+="  and (crm_hthxx.sqsj>=TO_DATE('"+crm_hthxx_sqsj+"','YYYY/MM/DD'))";
	}
	crm_hthxx_sqsj=request.getParameter("crm_hthxx_sqsj2");
	if (crm_hthxx_sqsj!=null)
	{
		crm_hthxx_sqsj=crm_hthxx_sqsj.trim();
		if (!(crm_hthxx_sqsj.equals("")))	wheresql+="  and (crm_hthxx.sqsj<=TO_DATE('"+crm_hthxx_sqsj+"','YYYY/MM/DD'))";
	}
	crm_hthxx_khbh=request.getParameter("crm_hthxx_khbh");
	if (crm_hthxx_khbh!=null)
	{
		crm_hthxx_khbh=cf.GB2Uni(crm_hthxx_khbh);
		if (!(crm_hthxx_khbh.equals("")))	wheresql+=" and  (crm_hthxx.khbh='"+crm_hthxx_khbh+"')";
	}
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	crm_zxkhxx_fwdz=request.getParameter("crm_zxkhxx_fwdz");
	if (crm_zxkhxx_fwdz!=null)
	{
		crm_zxkhxx_fwdz=cf.GB2Uni(crm_zxkhxx_fwdz);
		if (!(crm_zxkhxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+crm_zxkhxx_fwdz+"')";
	}
	crm_zxkhxx_sjs=request.getParameter("crm_zxkhxx_sjs");
	if (crm_zxkhxx_sjs!=null)
	{
		crm_zxkhxx_sjs=cf.GB2Uni(crm_zxkhxx_sjs);
		if (!(crm_zxkhxx_sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+crm_zxkhxx_sjs+"')";
	}
	crm_hthxx_sybz=request.getParameter("crm_hthxx_sybz");
	if (crm_hthxx_sybz!=null)
	{
		crm_hthxx_sybz=cf.GB2Uni(crm_hthxx_sybz);
		if (!(crm_hthxx_sybz.equals("")))	wheresql+=" and  (crm_hthxx.sybz='"+crm_hthxx_sybz+"')";
	}
	ls_sql="SELECT crm_hthxx.hth,sq_dwxx.dwmc,crm_hthxx.sqr,crm_hthxx.sqsj,crm_hthxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs, DECODE(crm_hthxx.sybz,'Y','��ʹ��','N','δʹ��')  ";
	ls_sql+=" FROM sq_dwxx,crm_zxkhxx,crm_hthxx  ";
    ls_sql+=" where crm_hthxx.dwbh=sq_dwxx.dwbh and crm_hthxx.khbh=crm_zxkhxx.khbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_hthxx.dwbh in(select dwbh from sq_dwxx where ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') )";
	}
	else
	{
		ls_sql+=" and crm_hthxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_hthxx.sqsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_hthxxCxList.jsp","SelectCxCrm_hthxx.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hth","sq_dwxx_dwmc","crm_hthxx_sqr","crm_hthxx_sqsj","crm_hthxx_khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_sjs","crm_hthxx_sybz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hth"};
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
	<td  width="9%">��ͬ��</td>
	<td  width="12%">���뵥λ</td>
	<td  width="6%">������</td>
	<td  width="11%">����ʱ��</td>
	<td  width="9%">�ͻ����</td>
	<td  width="8%">�ͻ�����</td>
	<td  width="28%">���ݵ�ַ</td>
	<td  width="8%">���ʦ</td>
	<td  width="9%">ʹ�ñ�־</td>
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