<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
	String sjs=cf.GB2Uni(cf.getParameter(request,"sjs"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String wheresql="";

	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ʦ��<%=sjs%>��(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>

1������ǩԼ��ϸ
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">���ʦ</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">����</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="3%">��װ��־</td>
	<td  width="5%">�����</td>
	<td  width="6%">����ԭ����</td>
	<td  width="3%">�ۿ���</td>
	<td  width="6%">����ǩԼ��</td>
	<td  width="5%">������</td>
	<td  width="6%">�������ܶ� </td>
	<td  width="5%">��Ʒ�</td>
	<td  width="2%">�Ƿ񷵾�</td>
	<td  width="4%">�����ܽ��</td>
	<td  width="4%">��˾�е������</td>
	<td  width="2%">�Ƿ���֤</td>
	<td  width="5%">��֤�г�</td>
	<td  width="6%">ǩԼ����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="4%">ǩԼ����</td>
	<td  width="2%">����¼��</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">�ʼ�Ա</td>
</tr>
<%
	ls_sql="SELECT '',sjs,hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),cxhdbm,wdzgce,TO_CHAR(zkl),qye,zjxje,NVL(zjxje,0)+qye,sjf,DECODE(crm_khxx.sffj,'Y','����','N','��'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','��֤','N','��'),b.dwmc rzsc,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>'),sgdmc sgd,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.sjs='"+sjs+"' and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("fwdz",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>


2��ľ��ǩԼ��ϸ
<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="1%">���</td>
	<td  width="2%">Ԥ�������</td>
	<td  width="3%">����״̬</td>
	<td  width="3%">���̽���</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="4%">ǩԼ����</td>
	<td  width="2%">��װ���ʦ</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="5%">��ϵ�绰</td>
	<td  width="8%">���ݵ�ַ</td>
    <td  width="4%">�����</td>
	<td  width="3%">��������</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">��ͬ��װ����</td>
	<td  width="3%">Э�̰�װʱ��</td>
	<td  width="3%">֪ͨ��װʱ��</td>
	<td  width="3%">��װ��ʼ����</td>
	<td  width="3%">��װ��������</td>
	<td  width="3%">ȷ���˵�����</td>
	<td  width="4%">�ɵ�����</td>
	<td  width="3%">��ȡ����</td>
	<td  width="4%">��ͬ���</td>
	<td  width="4%">�������ܶ�</td>
	<td  width="3%">������</td>
	<td  width="3%">�Թ������͵���˾</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="2%">�ͻ����</td>
</tr>
<%
	ls_sql="SELECT '', yddbh,clztmc,ysgcjdmc,crm_khxx.khxm,DECODE(jc_mmydd.khlx,'2','��װ','4','�Ǽ�װ') khlx,c.dwmc,crm_khxx.sjs,crm_khxx.hth,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,crm_khxx.lxfs,crm_khxx.fwdz,cxhdbm,jc_mmydd.sccsj,jc_mmydd.htrq,jc_mmydd.jhazsj,kazsj,aztzsj,jc_mmydd.azkssj,jc_mmydd.azjssj,jc_mmydd.tdsj,gysmc pdgc,jc_mmydd.sqdj,jc_mmydd.htje,jc_mmydd.zjhze,DECODE(jc_mmydd.wjqk,'1','�ͻ��Թ�','2','��˾����') wjqk,DECODE(jc_mmydd.wjsgsbz,'Y','���͹�˾','N','δ�͹�˾') wjsgsbz,jc_mmydd.lrsj,a.dwmc lrdw,jc_mmydd.khbh ";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_dwxx a,sq_gysxx,sq_dwxx c,jdm_mmyddzt,dm_gcjdbm  ";
    ls_sql+=" where jc_mmydd.dwbh=a.dwbh(+) and jc_mmydd.pdgc=sq_gysxx.gysbh(+) and jc_mmydd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_khxx.dwbh=c.dwbh(+) and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";

	ls_sql+=wheresql;
	ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by jc_mmydd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"yddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>


3������ǩԼ��ϸ
<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">���</td>
	<td  width="2%">�������</td>
	<td  width="2%">����״̬</td>
	<td  width="2%">���̽���</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">��ͬ��</td>
	<td  width="3%">��ϵ�绰</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="2%">�೤</td>
	<td  width="3%">�೤�绰</td>
	<td  width="2%">��װ���ʦ</td>
	<td  width="2%">�Ƿ��������ʦ </td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="3%">ǩԼ����</td>
    <td  width="2%">�����</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">��������</td>
	<td  width="2%">��������</td>
	<td  width="2%">ǩԼ����</td>
	<td  width="2%">��ͬ��װ����</td>
	<td  width="2%">��װ��ʼ����</td>
	<td  width="2%">��װ�������</td>
	<td  width="2%">ȷ���˵�����</td>
    <td  width="3%">���ɹ���</td>
    <td  width="2%">�����ʽ</td>
    <td  width="2%">������</td>
    <td  width="2%">����ɫ</td>
    <td  width="2%">̨��Ʒ��</td>
    <td  width="2%">̨�滨ɫ</td>
    <td  width="2%">��������</td>
    <td  width="2%">����</td>
	<td  width="2%">��ȡ����</td>
	<td  width="2%">�������ܶ�</td>
	<td  width="2%">��ͬ�ܶ�</td>
	<td  width="2%">�����ͬ���</td>
	<td  width="2%">̨���ͬ���</td>
	<td  width="2%">����ͬ���</td>
	<td  width="2%">������ͬ���</td>
	<td  width="2%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="3%">¼�벿��</td>
	<td  width="2%">�ͻ����</td>
</tr>
<%
	ls_sql="SELECT '',jc_cgdd.ddbh,clztmc,ysgcjdmc,DECODE(jc_cgdd.khlx,'2','��װ�ͻ�','4','�Ǽ�װ�ͻ�'),crm_khxx.khxm,crm_khxx.hth,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.sgbz,sq_bzxx.dh,crm_khxx.sjs,DECODE(jc_cgdd.sfpsjs,'1','��','2','��') sfpsjs, jc_cgdd.cgsjs,c.dwmc dm,cxhdbm,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.sccsj,jc_cgdd.sfcsj,jc_cgdd.qhtsj,jc_cgdd.jhazrq,jc_cgdd.ksazsj,jc_cgdd.sazrq,jc_cgdd.tdsj,gysmc,sdks,xtbc,cghs,tmpp,tmhs,blcz,jiaolian,jc_cgdd.dj,jc_cgdd.zjhze,jc_cgdd.htze,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,jc_cgdd.lrr,jc_cgdd.lrsj,a.dwmc lrdw,jc_cgdd.khbh ";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,sq_dwxx a ,sq_dwxx c ,crm_khxx,sq_gysxx,dm_gcjdbm,sq_bzxx";
    ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) and jc_cgdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=c.dwbh(+)  ";
	ls_sql+=" and jc_cgdd.pdgc=sq_gysxx.gysbh(+)  and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
    ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";

	ls_sql+=wheresql;
	ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by jc_cgdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>


4���Ҿ�ǩԼ��ϸ
<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">���</td>
	<td  width="2%">�������</td>
	<td  width="3%">����״̬</td>
	<td  width="2%">���̽���</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">��ͬ��</td>
	<td  width="4%">��ϵ�绰</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="2%">�೤</td>
	<td  width="4%">�೤�绰</td>
	<td  width="2%">��װ���ʦ</td>
	<td  width="2%">�������ʦ</td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
    <td  width="3%">�����</td>
	<td  width="4%">�Ҿ߹���</td>
	<td  width="4%">�Ͳ��Ź���</td>
	<td  width="2%">ǩԼ����</td>
	<td  width="2%">��������</td>
	<td  width="2%">��ͬ��װ����</td>
	<td  width="2%">��ʼ��װʱ��</td>
	<td  width="2%">��װ�������</td>
	<td  width="2%">ȷ���˵�����</td>
	<td  width="2%">����</td>
	<td  width="3%">��ͬ�ܶ�</td>
	<td  width="3%">�Ҿߺ�ͬ���</td>
	<td  width="3%">�Ͳ��ź�ͬ���</td>
	<td  width="3%">�������ܶ�</td>
	<td  width="3%">�Ҿ���������</td>
	<td  width="3%">�Ͳ�����������</td>
	<td  width="2%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="3%">¼�벿��</td>
	<td  width="2%">�ͻ����</td>
</tr>
<%
	ls_sql="SELECT '',jc_jjdd.ddbh,clztmc,ysgcjdmc,DECODE(jc_jjdd.khlx,'2','��װ�ͻ�','4','�Ǽ�װ�ͻ�') as jc_jjdd_khlx ,crm_khxx.khxm khxm,crm_khxx.hth,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.sgbz,sq_bzxx.dh ,crm_khxx.sjs,DECODE(jc_jjdd.sfpsjs,'1','��Ҫ','2','��') sfpsjs,jc_jjdd.jjsjs,b.dwmc dm ,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,cxhdbm,c.gysmc pdgc,d.gysmc xcmgc,jc_jjdd.qhtsj,jc_jjdd.sccsj,jc_jjdd.jhazrq,jc_jjdd.ksazsj,jc_jjdd.sazrq,jc_jjdd.tdsj,jc_jjdd.dj,jc_jjdd.htze,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.zjhze,jc_jjdd.jjzjje,jc_jjdd.xcmzjje,jc_jjdd.lrr,jc_jjdd.lrsj,a.dwmc as lrbm,jc_jjdd.khbh  ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,sq_dwxx a,sq_dwxx b,crm_khxx,sq_gysxx c,sq_gysxx d,sq_bzxx,dm_gcjdbm";
    ls_sql+=" where jc_jjdd.dwbh=a.dwbh(+) and jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_khxx.dwbh=b.dwbh(+) and jc_jjdd.pdgc=c.gysbh(+)and jc_jjdd.xcmgc=d.gysbh(+)";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
    ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";

	ls_sql+=wheresql;
	ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by jc_jjdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey3={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey3;//�����в�����coluParm.key������
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>


5������ǩԼ��ϸ
<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%"> ���</td>
   	<td  width="2%">�������</td>
   	<td  width="3%">��������</td>
	<td  width="2%">����״̬</td>
	<td  width="2%">���̽���</td>
	<td  width="3%">���Ĵ���</td>
	<td  width="2%">����С��</td>
	<td  width="4%">Ʒ��</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="5%">��ϵ��ʽ</td>
	<td  width="6%">���ݵ�ַ</td>
	<td  width="3%">�μӴ����</td>
	<td  width="2%">��װ���ʦ</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="2%">ʩ���೤</td>
	<td  width="3%">�೤�绰</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="3%">��ͬ�ܶ�</td>
	<td  width="3%">��������</td>
	<td  width="3%">�����������</td>
	<td  width="2%">�ͻ���������</td>
	<td  width="3%">����ص�</td>
	<td  width="2%">��������</td>
	<td  width="2%">��ͬ�ͻ�ʱ��</td>
	<td  width="2%">�ƻ��ͻ�ʱ��</td>
	<td  width="2%">���ͻ�֪ͨʱ��</td>
	<td  width="2%">ʵ�ͻ�ʱ��</td>
	<td  width="2%">���ʱ��</td>
	<td  width="2%">֪ͨ��Ա</td>
	<td  width="3%">�ͻ����</td>
	<td  width="2%">�ȴ��ͻ�֪ͨ</td>
	<td  width="2%">��Ʒ����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="3%">¼�벿��</td>
	<td  width="4%">��ע</td>
</tr>
<%
	ls_sql="SELECT '',jc_zcdd.ddbh,DECODE(jc_zcdd.ddlx,'1','ϵͳ����Ʒ�ƶ���','2','������Ʒ�ƶ���'),clztmc,ysgcjdmc,zcdlbm,zcxlbm,ppbm,crm_khxx.hth,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,cxhdbm,crm_khxx.sjs,c.dwmc dm,crm_khxx.sgbz,sq_bzxx.dh,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.htcxhdje, DECODE(jc_zcdd.jkxz,'1','δ����','2','ȫ��','3','�����������','4','Ԥ�������'), DECODE(jc_zcdd.jkdd,'1','�������ֳ������','2','�����տ�','3','��˾�����տ�'),jc_zcdd.qhtsj,jc_zcdd.htshsj,jc_zcdd.jhshsj,jc_zcdd.tzshsj,jc_zcdd.sshsj,jc_zcdd.wjsj,tzry,shqk, DECODE(jc_zcdd.ddshbz,'1','�������','2','����δ֪ͨ','3','������֪ͨ'),DECODE(jc_zcdd.xclbz,'1','�Ƕ���','2','����ʽ��Ʒ'),jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,sq_dwxx c ,jdm_zcddzt,sq_bzxx,dm_gcjdbm ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and jc_zcdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=c.dwbh(+)";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";

	ls_sql+=wheresql;
	ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by jc_zcdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey4={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey4;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>



</body>
</html>