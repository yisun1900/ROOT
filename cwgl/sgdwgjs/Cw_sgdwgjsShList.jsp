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
	String cw_sgdwgjs_jsjlh=null;
	String cw_sgdwgjs_khbh=null;
	String cw_sgdwgjs_sgd=null;
	String sq_sgd_sgdmc=null;
	String cw_sgdwgjs_sgbz=null;
	String cw_sgdwgjs_htjcbj=null;
	String cw_sgdwgjs_zjxjcbj=null;
	String cw_sgdwgjs_ljqyf=null;
	String cw_sgdwgjs_djazf=null;
	String cw_sgdwgjs_jsjs=null;
	String cw_sgdwgjs_jsbl=null;
	String cw_sgdwgjs_tzjsbl=null;
	String cw_sgdwgjs_sdlje=null;
	String cw_sgdwgjs_sdljsbl=null;
	String cw_sgdwgjs_jsje=null;
	String cw_sgdwgjs_clf=null;
	String cw_sgdwgjs_clyf=null;
	String cw_sgdwgjs_gdyp=null;
	String cw_sgdwgjs_yfgck=null;
	String cw_sgdwgjs_kzbjjbl=null;
	String cw_sgdwgjs_kzbj=null;
	String cw_sgdwgjs_clfk=null;
	String cw_sgdwgjs_jfje=null;
	String cw_sgdwgjs_yfje=null;
	String cw_sgdwgjs_jsrq=null;
	String cw_sgdwgjs_clzt=null;
	String cw_sgdwgjs_lrr=null;
	String cw_sgdwgjs_lrsj=null;
	String cw_sgdwgjs_lrbm=null;
	cw_sgdwgjs_jsjlh=request.getParameter("cw_sgdwgjs_jsjlh");
	if (cw_sgdwgjs_jsjlh!=null)
	{
		cw_sgdwgjs_jsjlh=cf.GB2Uni(cw_sgdwgjs_jsjlh);
		if (!(cw_sgdwgjs_jsjlh.equals("")))	wheresql+=" and  (cw_sgdwgjs.jsjlh='"+cw_sgdwgjs_jsjlh+"')";
	}
	cw_sgdwgjs_khbh=request.getParameter("cw_sgdwgjs_khbh");
	if (cw_sgdwgjs_khbh!=null)
	{
		cw_sgdwgjs_khbh=cf.GB2Uni(cw_sgdwgjs_khbh);
		if (!(cw_sgdwgjs_khbh.equals("")))	wheresql+=" and  (cw_sgdwgjs.khbh='"+cw_sgdwgjs_khbh+"')";
	}
	cw_sgdwgjs_sgd=request.getParameter("cw_sgdwgjs_sgd");
	if (cw_sgdwgjs_sgd!=null)
	{
		cw_sgdwgjs_sgd=cf.GB2Uni(cw_sgdwgjs_sgd);
		if (!(cw_sgdwgjs_sgd.equals("")))	wheresql+=" and  (cw_sgdwgjs.sgd='"+cw_sgdwgjs_sgd+"')";
	}
	sq_sgd_sgdmc=request.getParameter("sq_sgd_sgdmc");
	if (sq_sgd_sgdmc!=null)
	{
		sq_sgd_sgdmc=cf.GB2Uni(sq_sgd_sgdmc);
		if (!(sq_sgd_sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sq_sgd_sgdmc+"')";
	}
	cw_sgdwgjs_sgbz=request.getParameter("cw_sgdwgjs_sgbz");
	if (cw_sgdwgjs_sgbz!=null)
	{
		cw_sgdwgjs_sgbz=cf.GB2Uni(cw_sgdwgjs_sgbz);
		if (!(cw_sgdwgjs_sgbz.equals("")))	wheresql+=" and  (cw_sgdwgjs.sgbz='"+cw_sgdwgjs_sgbz+"')";
	}
	cw_sgdwgjs_htjcbj=request.getParameter("cw_sgdwgjs_htjcbj");
	if (cw_sgdwgjs_htjcbj!=null)
	{
		cw_sgdwgjs_htjcbj=cw_sgdwgjs_htjcbj.trim();
		if (!(cw_sgdwgjs_htjcbj.equals("")))	wheresql+=" and  (cw_sgdwgjs.htjcbj="+cw_sgdwgjs_htjcbj+") ";
	}
	cw_sgdwgjs_zjxjcbj=request.getParameter("cw_sgdwgjs_zjxjcbj");
	if (cw_sgdwgjs_zjxjcbj!=null)
	{
		cw_sgdwgjs_zjxjcbj=cw_sgdwgjs_zjxjcbj.trim();
		if (!(cw_sgdwgjs_zjxjcbj.equals("")))	wheresql+=" and  (cw_sgdwgjs.zjxjcbj="+cw_sgdwgjs_zjxjcbj+") ";
	}
	cw_sgdwgjs_ljqyf=request.getParameter("cw_sgdwgjs_ljqyf");
	if (cw_sgdwgjs_ljqyf!=null)
	{
		cw_sgdwgjs_ljqyf=cw_sgdwgjs_ljqyf.trim();
		if (!(cw_sgdwgjs_ljqyf.equals("")))	wheresql+=" and  (cw_sgdwgjs.ljqyf="+cw_sgdwgjs_ljqyf+") ";
	}
	cw_sgdwgjs_djazf=request.getParameter("cw_sgdwgjs_djazf");
	if (cw_sgdwgjs_djazf!=null)
	{
		cw_sgdwgjs_djazf=cw_sgdwgjs_djazf.trim();
		if (!(cw_sgdwgjs_djazf.equals("")))	wheresql+=" and  (cw_sgdwgjs.djazf="+cw_sgdwgjs_djazf+") ";
	}
	cw_sgdwgjs_jsjs=request.getParameter("cw_sgdwgjs_jsjs");
	if (cw_sgdwgjs_jsjs!=null)
	{
		cw_sgdwgjs_jsjs=cw_sgdwgjs_jsjs.trim();
		if (!(cw_sgdwgjs_jsjs.equals("")))	wheresql+=" and  (cw_sgdwgjs.jsjs="+cw_sgdwgjs_jsjs+") ";
	}
	cw_sgdwgjs_jsbl=request.getParameter("cw_sgdwgjs_jsbl");
	if (cw_sgdwgjs_jsbl!=null)
	{
		cw_sgdwgjs_jsbl=cw_sgdwgjs_jsbl.trim();
		if (!(cw_sgdwgjs_jsbl.equals("")))	wheresql+=" and  (cw_sgdwgjs.jsbl="+cw_sgdwgjs_jsbl+") ";
	}
	cw_sgdwgjs_tzjsbl=request.getParameter("cw_sgdwgjs_tzjsbl");
	if (cw_sgdwgjs_tzjsbl!=null)
	{
		cw_sgdwgjs_tzjsbl=cw_sgdwgjs_tzjsbl.trim();
		if (!(cw_sgdwgjs_tzjsbl.equals("")))	wheresql+=" and  (cw_sgdwgjs.tzjsbl="+cw_sgdwgjs_tzjsbl+") ";
	}
	cw_sgdwgjs_sdlje=request.getParameter("cw_sgdwgjs_sdlje");
	if (cw_sgdwgjs_sdlje!=null)
	{
		cw_sgdwgjs_sdlje=cw_sgdwgjs_sdlje.trim();
		if (!(cw_sgdwgjs_sdlje.equals("")))	wheresql+=" and  (cw_sgdwgjs.sdlje="+cw_sgdwgjs_sdlje+") ";
	}
	cw_sgdwgjs_sdljsbl=request.getParameter("cw_sgdwgjs_sdljsbl");
	if (cw_sgdwgjs_sdljsbl!=null)
	{
		cw_sgdwgjs_sdljsbl=cw_sgdwgjs_sdljsbl.trim();
		if (!(cw_sgdwgjs_sdljsbl.equals("")))	wheresql+=" and  (cw_sgdwgjs.sdljsbl="+cw_sgdwgjs_sdljsbl+") ";
	}
	cw_sgdwgjs_jsje=request.getParameter("cw_sgdwgjs_jsje");
	if (cw_sgdwgjs_jsje!=null)
	{
		cw_sgdwgjs_jsje=cw_sgdwgjs_jsje.trim();
		if (!(cw_sgdwgjs_jsje.equals("")))	wheresql+=" and  (cw_sgdwgjs.jsje="+cw_sgdwgjs_jsje+") ";
	}
	cw_sgdwgjs_clf=request.getParameter("cw_sgdwgjs_clf");
	if (cw_sgdwgjs_clf!=null)
	{
		cw_sgdwgjs_clf=cw_sgdwgjs_clf.trim();
		if (!(cw_sgdwgjs_clf.equals("")))	wheresql+=" and  (cw_sgdwgjs.clf="+cw_sgdwgjs_clf+") ";
	}
	cw_sgdwgjs_clyf=request.getParameter("cw_sgdwgjs_clyf");
	if (cw_sgdwgjs_clyf!=null)
	{
		cw_sgdwgjs_clyf=cw_sgdwgjs_clyf.trim();
		if (!(cw_sgdwgjs_clyf.equals("")))	wheresql+=" and  (cw_sgdwgjs.clyf="+cw_sgdwgjs_clyf+") ";
	}
	cw_sgdwgjs_gdyp=request.getParameter("cw_sgdwgjs_gdyp");
	if (cw_sgdwgjs_gdyp!=null)
	{
		cw_sgdwgjs_gdyp=cw_sgdwgjs_gdyp.trim();
		if (!(cw_sgdwgjs_gdyp.equals("")))	wheresql+=" and  (cw_sgdwgjs.gdyp="+cw_sgdwgjs_gdyp+") ";
	}
	cw_sgdwgjs_yfgck=request.getParameter("cw_sgdwgjs_yfgck");
	if (cw_sgdwgjs_yfgck!=null)
	{
		cw_sgdwgjs_yfgck=cw_sgdwgjs_yfgck.trim();
		if (!(cw_sgdwgjs_yfgck.equals("")))	wheresql+=" and  (cw_sgdwgjs.yfgck="+cw_sgdwgjs_yfgck+") ";
	}
	cw_sgdwgjs_kzbjjbl=request.getParameter("cw_sgdwgjs_kzbjjbl");
	if (cw_sgdwgjs_kzbjjbl!=null)
	{
		cw_sgdwgjs_kzbjjbl=cw_sgdwgjs_kzbjjbl.trim();
		if (!(cw_sgdwgjs_kzbjjbl.equals("")))	wheresql+=" and  (cw_sgdwgjs.kzbjbl="+cw_sgdwgjs_kzbjjbl+") ";
	}
	cw_sgdwgjs_kzbj=request.getParameter("cw_sgdwgjs_kzbj");
	if (cw_sgdwgjs_kzbj!=null)
	{
		cw_sgdwgjs_kzbj=cw_sgdwgjs_kzbj.trim();
		if (!(cw_sgdwgjs_kzbj.equals("")))	wheresql+=" and  (cw_sgdwgjs.kzbj="+cw_sgdwgjs_kzbj+") ";
	}
	cw_sgdwgjs_clfk=request.getParameter("cw_sgdwgjs_clfk");
	if (cw_sgdwgjs_clfk!=null)
	{
		cw_sgdwgjs_clfk=cw_sgdwgjs_clfk.trim();
		if (!(cw_sgdwgjs_clfk.equals("")))	wheresql+=" and  (cw_sgdwgjs.clfk="+cw_sgdwgjs_clfk+") ";
	}
	cw_sgdwgjs_jfje=request.getParameter("cw_sgdwgjs_jfje");
	if (cw_sgdwgjs_jfje!=null)
	{
		cw_sgdwgjs_jfje=cw_sgdwgjs_jfje.trim();
		if (!(cw_sgdwgjs_jfje.equals("")))	wheresql+=" and  (cw_sgdwgjs.jfje="+cw_sgdwgjs_jfje+") ";
	}
	cw_sgdwgjs_yfje=request.getParameter("cw_sgdwgjs_yfje");
	if (cw_sgdwgjs_yfje!=null)
	{
		cw_sgdwgjs_yfje=cw_sgdwgjs_yfje.trim();
		if (!(cw_sgdwgjs_yfje.equals("")))	wheresql+=" and  (cw_sgdwgjs.yfje="+cw_sgdwgjs_yfje+") ";
	}
	cw_sgdwgjs_jsrq=request.getParameter("cw_sgdwgjs_jsrq");
	if (cw_sgdwgjs_jsrq!=null)
	{
		cw_sgdwgjs_jsrq=cw_sgdwgjs_jsrq.trim();
		if (!(cw_sgdwgjs_jsrq.equals("")))	wheresql+="  and (cw_sgdwgjs.jsrq=TO_DATE('"+cw_sgdwgjs_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdwgjs_clzt=request.getParameter("cw_sgdwgjs_clzt");
	if (cw_sgdwgjs_clzt!=null)
	{
		cw_sgdwgjs_clzt=cf.GB2Uni(cw_sgdwgjs_clzt);
		if (!(cw_sgdwgjs_clzt.equals("")))	wheresql+=" and  (cw_sgdwgjs.clzt='"+cw_sgdwgjs_clzt+"')";
	}
	cw_sgdwgjs_lrr=request.getParameter("cw_sgdwgjs_lrr");
	if (cw_sgdwgjs_lrr!=null)
	{
		cw_sgdwgjs_lrr=cf.GB2Uni(cw_sgdwgjs_lrr);
		if (!(cw_sgdwgjs_lrr.equals("")))	wheresql+=" and  (cw_sgdwgjs.lrr='"+cw_sgdwgjs_lrr+"')";
	}
	cw_sgdwgjs_lrsj=request.getParameter("cw_sgdwgjs_lrsj");
	if (cw_sgdwgjs_lrsj!=null)
	{
		cw_sgdwgjs_lrsj=cw_sgdwgjs_lrsj.trim();
		if (!(cw_sgdwgjs_lrsj.equals("")))	wheresql+="  and (cw_sgdwgjs.lrsj=TO_DATE('"+cw_sgdwgjs_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdwgjs_lrbm=request.getParameter("cw_sgdwgjs_lrbm");
	if (cw_sgdwgjs_lrbm!=null)
	{
		cw_sgdwgjs_lrbm=cf.GB2Uni(cw_sgdwgjs_lrbm);
		if (!(cw_sgdwgjs_lrbm.equals("")))	wheresql+=" and  (cw_sgdwgjs.lrbm='"+cw_sgdwgjs_lrbm+"')";
	}
	ls_sql="SELECT cw_sgdwgjs.jsjlh,DECODE(cw_sgdwgjs.clzt,'1','δ����','2','����'),cw_sgdwgjs.jsrq,cw_sgdwgjs.khbh,crm_khxx.khxm,sq_sgd.sgdmc,cw_sgdwgjs.sgbz, DECODE(cw_sgdwgjs.jsjs,'1','���̷�','2','���̷ѣ�������','3','ʵ�տ��ܶ�','4','һ�ڿ�','5','���ڿ�','6','���ڿ�','7','���̻�������','8','���̻������ۣ������ѻ�������','9','����ʩ���ɱ���','A','����ʩ���ɱ��ۣ�������ʩ���ɱ�','B','���̳ɱ���','C','���̳ɱ��ۣ������ѳɱ�'),cw_sgdwgjs.jsjsze,cw_sgdwgjs.jsbl||'%',cw_sgdwgjs.tzjsbl||'%',DECODE(cw_sgdwgjs.sdljsfs,'1','ͳһ��������','2','������������','3','�ֹ�¼�������','9','������'),cw_sgdwgjs.sdlje,cw_sgdwgjs.sdljsbl||'%',cw_sgdwgjs.sdljsje,cw_sgdwgjs.jsje, DECODE(cw_sgdwgjs.sfkclk,'Y','��','N','��'),cw_sgdwgjs.clf,cw_sgdwgjs.clyf,cw_sgdwgjs.clfk, DECODE(cw_sgdwgjs.sfkgdyp,'Y','��','N','��'),cw_sgdwgjs.gdyp, DECODE(cw_sgdwgjs.sfkyfgf,'Y','��','N','��'),cw_sgdwgjs.yfgck, DECODE(cw_sgdwgjs.sfkzbj,'Y','��','N','��'), DECODE(cw_sgdwgjs.kzbjjs,'1','�������','2','�����ܶ�'),cw_sgdwgjs.kzbjbl||'%',cw_sgdwgjs.kzbj,cw_sgdwgjs.fkje,cw_sgdwgjs.jlje,cw_sgdwgjs.qtje,cw_sgdwgjs.yfje,cw_sgdwgjs.htje,cw_sgdwgjs.zjxje,cw_sgdwgjs.qtf,cw_sgdwgjs.qtfsm,cw_sgdwgjs.ssk, cw_sgdwgjs.lrr,cw_sgdwgjs.lrsj,dwmc,cw_sgdwgjs.bz  ";
	ls_sql+=" FROM sq_sgd,cw_sgdwgjs,crm_khxx,sq_dwxx  ";
    ls_sql+=" where cw_sgdwgjs.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_sgdwgjs.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_sgdwgjs.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_sgdwgjs.clzt='1'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sgdwgjs.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_sgdwgjsList.jsp","","","ShCw_sgdwgjs.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jsjlh","cw_sgdwgjs_khbh","sq_sgd_sgdmc","cw_sgdwgjs_sgbz","cw_sgdwgjs_htjcbj","cw_sgdwgjs_zjxjcbj","cw_sgdwgjs_ljqyf","cw_sgdwgjs_djazf","cw_sgdwgjs_jsjs","cw_sgdwgjs_jsbl","cw_sgdwgjs_tzjsbl","cw_sgdwgjs_sdlje","cw_sgdwgjs_sdljsbl","cw_sgdwgjs_jsje","cw_sgdwgjs_clf","cw_sgdwgjs_clyf","cw_sgdwgjs_gdyp","cw_sgdwgjs_yfgck","cw_sgdwgjs_kzbjjbl","cw_sgdwgjs_kzbj","cw_sgdwgjs_clfk","cw_sgdwgjs_jfje","cw_sgdwgjs_yfje","cw_sgdwgjs_jsrq","cw_sgdwgjs_clzt","cw_sgdwgjs_lrr","cw_sgdwgjs_lrsj","cw_sgdwgjs_lrbm","cw_sgdwgjs_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("���");
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_sgdwgjs.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">ʩ�����깤���㣭���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(380);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">�����¼��</td>
	<td  width="2%">����״̬</td>
	<td  width="3%">��������</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ֳ�������</td>
	<td  width="4%">�������</td>
	<td  width="2%">��������ܶ�</td>
	<td  width="2%">�������</td>
	<td  width="2%">�����������</td>
	<td  width="3%">ˮ��·���㷽ʽ</td>
	<td  width="2%">ˮ��·���</td>
	<td  width="2%">ˮ��·�������</td>
	<td  width="2%">ˮ��·������</td>
	<td  width="2%">�����ܶ�</td>
	<td  width="2%">�Ƿ�۲��Ͽ�</td>
	<td  width="2%">���Ϸ�</td>
	<td  width="2%">�����˷�</td>
	<td  width="2%">���Ϸ���</td>
	<td  width="2%">�Ƿ�۹�����Ʒ</td>
	<td  width="2%">������Ʒ</td>
	<td  width="2%">�Ƿ���Ѹ�����</td>
	<td  width="2%">�Ѹ����̿�</td>
	<td  width="2%">�Ƿ���ʱ���</td>
	<td  width="2%">���ʱ������</td>
	<td  width="2%">Ӧ���ʱ������</td>
	<td  width="2%">���ʱ���</td>
	<td  width="2%">������</td>
	<td  width="2%">�������</td>
	<td  width="2%">�������</td>
	<td  width="2%">Ӧ�����</td>
	<td  width="2%">���̺�ͬ��</td>
	<td  width="2%">����������</td>
	<td  width="2%">������</td>
	<td  width="7%">������˵��</td>
	<td  width="2%">ʵ�տ�</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="3%">¼�벿��</td>
	<td  width="118%">��ע</td>
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