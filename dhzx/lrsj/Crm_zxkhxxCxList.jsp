<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>



<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	

	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_zxkhxx.khjl='"+khjl+"')";
	}

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}

	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	String zxdjbm=null;
	zxdjbm=request.getParameter("zxdjbm");
	if (zxdjbm!=null)
	{
		if (!(zxdjbm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdjbm='"+zxdjbm+"')";
	}
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_zxkhxx.lrr='"+lrr+"')";
	}

	String mxxlrsj=null;
	mxxlrsj=request.getParameter("mxxlrsj");
	if (mxxlrsj!=null)
	{
		mxxlrsj=mxxlrsj.trim();
		if (!(mxxlrsj.equals("")))	wheresql+="  and (crm_scbkhxx.lrsj>=TO_DATE('"+mxxlrsj+"','YYYY-MM-DD'))";
	}
	mxxlrsj=request.getParameter("mxxlrsj2");
	if (mxxlrsj!=null)
	{
		mxxlrsj=mxxlrsj.trim();
		if (!(mxxlrsj.equals("")))	wheresql+="  and (crm_scbkhxx.lrsj<=TO_DATE('"+mxxlrsj+"','YYYY-MM-DD'))";
	}

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}


	String mxxts=null;
	mxxts=request.getParameter("mxxts");
	if (mxxts!=null)
	{
		mxxts=mxxts.trim();
		if (!(mxxts.equals("")))	wheresql+="  and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)>="+mxxts+")";
	}
	mxxts=request.getParameter("mxxts2");
	if (mxxts!=null)
	{
		mxxts=mxxts.trim();
		if (!(mxxts.equals("")))	wheresql+="  and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)<="+mxxts+")";
	}

	String zxts=null;
	zxts=request.getParameter("zxts");
	if (zxts!=null)
	{
		zxts=zxts.trim();
		if (!(zxts.equals("")))	wheresql+="  and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)>="+zxts+")";
	}
	zxts=request.getParameter("zxts2");
	if (zxts!=null)
	{
		zxts=zxts.trim();
		if (!(zxts.equals("")))	wheresql+="  and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)<="+zxts+")";
	}




	String myxssl=null;

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	myxssl=request.getParameter("myxssl");



	ls_sql="SELECT crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,crm_zxkhxx.ywy,crm_zxkhxx.lrr";
	ls_sql+=" ,crm_scbkhxx.lrsj,round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0) mxxts,crm_zxkhxx.lrsj zxlrsj,round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0) zxts,crm_khxx.qyrq ";
	ls_sql+=" ,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') ";
	ls_sql+=" ,b.dwmc as zxdm,a.dwmc zxdjbm,crm_zxkhxx.khjl";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b,crm_khxx,crm_scbkhxx";
	ls_sql+=" where crm_zxkhxx.zxdjbm=a.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_zxkhxx.scbkhbh=crm_scbkhxx.scbkhbh(+) ";
	ls_sql+=" and crm_khxx.zt='2' ";
	
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql;
	ls_sql+=" order by mxxts,zxts";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_zxkhxxCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));


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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

<CENTER >
  <B><font size="3">��ѯ�ͻ�--��ѯ</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ͻ����</td>
	<td  width="5%">����</td>
	<td  width="16%">���ݵ�ַ</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">ҵ��Ա</td>
	<td  width="5%">��ѯ�ͻ�¼����</td>

	<td  width="7%">ë��Ϣ¼��ʱ��</td>
	<td  width="5%">ë��Ϣ¼��ǩ������</td>
	<td  width="7%">��ѯ�ͻ�¼��ʱ��</td>
	<td  width="5%">��ѯ�ͻ�¼��ǩ������</td>
	<td  width="7%">ǩԼ����</td>
	<td  width="8%">��ѯ״̬</td>
	<td  width="8%">��ѯ����</td>
	<td  width="8%">��ѯ�ͻ�¼�벿��</td>
	<td  width="4%">�ͻ�����</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">

<%
	pageObj.printScript();
%> 

//-->
</script>
</html>