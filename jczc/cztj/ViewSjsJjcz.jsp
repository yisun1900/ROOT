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
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">���ʦ</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">����</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="3%">��װ��־</td>
	<td  width="5%">�����</td>
	<td  width="5%">����ԭ����</td>
	<td  width="3%">�ۿ���</td>
	<td  width="5%">����ǩԼ��</td>
	<td  width="5%">������</td>
	<td  width="5%">�������ܶ� </td>
	<td  width="4%">��Ʒ�</td>
	<td  width="2%">�Ƿ񷵾�</td>
	<td  width="4%">�����ܽ��</td>
	<td  width="4%">��˾�е������</td>
	<td  width="6%">ǩԼ����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="5%">ǩԼ����</td>
	<td  width="2%">����¼��</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">�ʼ�Ա</td>
</tr>
<%
	ls_sql="SELECT '',sjs,hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),cxhdbm,wdzgce,TO_CHAR(zkl),qye,zjxje,NVL(zjxje,0)+qye,sjf,DECODE(crm_khxx.sffj,'Y','����','N','��'),crm_khxx.fjje,crm_khxx.gsfje,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>'),sgdmc sgd,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.sjs='"+sjs+"' and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by lrsj";

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

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

<P>
2��ľ��ǩ����ϸ
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">Ԥ�������</td>
	<td  width="3%">����״̬</td>
	<td  width="4%">�ɵ�����</td>
	<td  width="4%"><font color="#0000CC">��ͬ���</font></td>
	<td  width="4%">�������ܶ�</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="3%"><font color="#0000CC">ǩԼ����</font></td>
	<td  width="3%">ȷ���˵�����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">��װ���ʦ</td>
	<td  width="8%">���ݵ�ַ</td>
    <td  width="4%">�����</td>
	<td  width="3%">��ͬ��װ����</td>
	<td  width="3%">��װ��������</td>
	<td  width="3%">¼��ʱ��</td>
</tr>
<%
	ls_sql =" SELECT yddbh,clztmc,gysmc pdgc,jc_mmydd.htje,jc_mmydd.zjhze,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.htrq,jc_mmydd.tdsj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.sjs,crm_khxx.fwdz,cxhdbm,jc_mmydd.jhazsj,jc_mmydd.azjssj,jc_mmydd.lrsj";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_gysxx,jdm_mmyddzt  ";
    ls_sql+=" where jc_mmydd.pdgc=sq_gysxx.gysbh(+) and jc_mmydd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=wheresql;
	ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.clzt>='04'";
	ls_sql+=" order by jc_mmydd.lrsj";

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey11={"yddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey11;//�����в�����coluParm.key������
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

2��ľ���˵���ϸ
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">Ԥ�������</td>
	<td  width="3%">����״̬</td>
	<td  width="4%">�ɵ�����</td>
	<td  width="4%"><font color="#0000CC">��ͬ���</font></td>
	<td  width="4%">�������ܶ�</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%"><font color="#0000CC">ȷ���˵�����</font></td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">��װ���ʦ</td>
	<td  width="8%">���ݵ�ַ</td>
    <td  width="4%">�����</td>
	<td  width="3%">��ͬ��װ����</td>
	<td  width="3%">��װ��������</td>
	<td  width="3%">¼��ʱ��</td>
</tr>
<%
	ls_sql =" SELECT yddbh,clztmc,gysmc pdgc,jc_mmydd.htje,jc_mmydd.zjhze,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.htrq,jc_mmydd.tdsj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.sjs,crm_khxx.fwdz,cxhdbm,jc_mmydd.jhazsj,jc_mmydd.azjssj,jc_mmydd.lrsj";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_gysxx,jdm_mmyddzt  ";
    ls_sql+=" where jc_mmydd.pdgc=sq_gysxx.gysbh(+) and jc_mmydd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=wheresql;
	ls_sql+=" and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.clzt='99'";
	ls_sql+=" order by jc_mmydd.lrsj";

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey12={"yddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey12;//�����в�����coluParm.key������
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

2��ľ����������ϸ
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���������</td>
	<td  width="3%">�������ܶ�</td>
	<td  width="3%">������¼��ʱ��</td>
	<td  width="3%">Ԥ�������</td>
	<td  width="3%">����״̬</td>
	<td  width="4%">�ɵ�����</td>
	<td  width="4%"><font color="#0000CC">������ͬ���</font></td>
	<td  width="4%">�����������ܶ�</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">��װ���ʦ</td>
	<td  width="8%">���ݵ�ַ</td>
    <td  width="4%">�����</td>
	<td  width="3%">��ͬ��װ����</td>
	<td  width="3%">��װ��������</td>
</tr>
<%
	ls_sql =" SELECT jc_mmzjx.zjxxh,jc_mmzjx.zjxze,jc_mmzjx.lrsj,jc_mmydd.yddbh,clztmc,gysmc pdgc,jc_mmydd.htje,jc_mmydd.zjhze,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.htrq,crm_khxx.hth,crm_khxx.khxm,crm_khxx.sjs,crm_khxx.fwdz,cxhdbm,jc_mmydd.jhazsj,jc_mmydd.azjssj";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_gysxx,jdm_mmyddzt,jc_mmzjx  ";
    ls_sql+=" where jc_mmydd.pdgc=sq_gysxx.gysbh(+) and jc_mmydd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+) and jc_mmydd.yddbh=jc_mmzjx.yddbh";
	ls_sql+=wheresql;
	ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";
	ls_sql+=" and jc_mmzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmzjx.clzt!='00'";
	ls_sql+=" order by jc_mmzjx.lrsj";

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey13={"yddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey13;//�����в�����coluParm.key������
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>


<P>
3������ǩ����ϸ
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�������</td>
	<td  width="3%">����״̬</td>
    <td  width="4%">���ɹ���</td>
    <td  width="3%">�����ʽ</td>
	<td  width="3%">�������ܶ�</td>
	<td  width="3%">��ͬ�ܶ�</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">ȷ���˵�����</td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="2%">��װ���ʦ</td>
    <td  width="4%">�����</td>
	<td  width="3%">¼��ʱ��</td>
</tr>
<%
	ls_sql="SELECT jc_cgdd.ddbh,clztmc,gysmc,sdks,jc_cgdd.zjhze,jc_cgdd.htze,jc_cgdd.qhtsj,jc_cgdd.tdsj, jc_cgdd.cgsjs,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sjs,cxhdbm,jc_cgdd.lrsj";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx,sq_gysxx";
    ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) ";
	ls_sql+=" and jc_cgdd.pdgc=sq_gysxx.gysbh(+)  ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_cgdd.clzt>='13'";
	ls_sql+=" order by jc_cgdd.lrsj";

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey21={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey21;//�����в�����coluParm.key������
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

3�������˵���ϸ
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�������</td>
	<td  width="3%">����״̬</td>
    <td  width="4%">���ɹ���</td>
    <td  width="3%">�����ʽ</td>
	<td  width="3%">�������ܶ�</td>
	<td  width="3%">��ͬ�ܶ�</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">ȷ���˵�����</td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="2%">��װ���ʦ</td>
    <td  width="4%">�����</td>
	<td  width="3%">¼��ʱ��</td>
</tr>
<%
	ls_sql="SELECT jc_cgdd.ddbh,clztmc,gysmc,sdks,jc_cgdd.zjhze,jc_cgdd.htze,jc_cgdd.qhtsj,jc_cgdd.tdsj, jc_cgdd.cgsjs,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sjs,cxhdbm,jc_cgdd.lrsj";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx,sq_gysxx";
    ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) ";
	ls_sql+=" and jc_cgdd.pdgc=sq_gysxx.gysbh(+)  ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_cgdd.clzt='99'";
	ls_sql+=" order by jc_cgdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey22={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey22;//�����в�����coluParm.key������
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

3��������������ϸ
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���������</td>
	<td  width="4%">�������ܶ�</td>
	<td  width="3%">������¼��ʱ��</td>
	<td  width="3%">�������</td>
	<td  width="3%">����״̬</td>
    <td  width="4%">���ɹ���</td>
    <td  width="3%">�����ʽ</td>
	<td  width="3%">�������ܶ�</td>
	<td  width="3%">��ͬ�ܶ�</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="2%">��װ���ʦ</td>
    <td  width="4%">�����</td>
</tr>
<%
	ls_sql="SELECT jc_cgzjx.zjxxh,jc_cgzjx.zjxze,jc_cgzjx.lrsj,jc_cgdd.ddbh,clztmc,gysmc,sdks,jc_cgdd.zjhze,jc_cgdd.htze,jc_cgdd.qhtsj, jc_cgdd.cgsjs,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sjs,cxhdbm";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx,sq_gysxx,jc_cgzjx";
    ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) ";
	ls_sql+=" and jc_cgdd.pdgc=sq_gysxx.gysbh(+) and jc_cgdd.ddbh=jc_cgzjx.ddbh ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";
	ls_sql+=" and jc_cgzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_cgzjx.clzt!='00'";
	ls_sql+=" order by jc_cgzjx.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey23={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey23;//�����в�����coluParm.key������
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>


<P>
4���Ҿ�ǩ����ϸ
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�������</td>
	<td  width="4%">����״̬</td>
	<td  width="5%">�Ҿ߹���</td>
	<td  width="5%">�Ͳ��Ź���</td>
	<td  width="4%">��ͬ�ܶ�</td>
	<td  width="4%">�������ܶ�</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">ȷ���˵�����</td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="9%">���ݵ�ַ</td>
	<td  width="2%">��װ���ʦ</td>
    <td  width="4%">�����</td>
	<td  width="3%">¼��ʱ��</td>
</tr>
<%
	ls_sql="SELECT jc_jjdd.ddbh,clztmc,c.gysmc pdgc,d.gysmc xcmgc,jc_jjdd.htze,jc_jjdd.zjhze,jc_jjdd.qhtsj,jc_jjdd.tdsj,jc_jjdd.jjsjs,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,crm_khxx.khxm khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sjs,cxhdbm,jc_jjdd.lrsj ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,crm_khxx,sq_gysxx c,sq_gysxx d";
    ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_jjdd.pdgc=c.gysbh(+)and jc_jjdd.xcmgc=d.gysbh(+)";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_jjdd.clzt>='13'";
	ls_sql+=" order by jc_jjdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey31={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey31;//�����в�����coluParm.key������
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

4���Ҿ��˵���ϸ
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�������</td>
	<td  width="4%">����״̬</td>
	<td  width="5%">�Ҿ߹���</td>
	<td  width="5%">�Ͳ��Ź���</td>
	<td  width="4%">��ͬ�ܶ�</td>
	<td  width="4%">�������ܶ�</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">ȷ���˵�����</td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="9%">���ݵ�ַ</td>
	<td  width="2%">��װ���ʦ</td>
    <td  width="4%">�����</td>
	<td  width="3%">¼��ʱ��</td>
</tr>
<%
	ls_sql="SELECT jc_jjdd.ddbh,clztmc,c.gysmc pdgc,d.gysmc xcmgc,jc_jjdd.htze,jc_jjdd.zjhze,jc_jjdd.qhtsj,jc_jjdd.tdsj,jc_jjdd.jjsjs,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,crm_khxx.khxm khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sjs,cxhdbm,jc_jjdd.lrsj ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,crm_khxx,sq_gysxx c,sq_gysxx d";
    ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_jjdd.pdgc=c.gysbh(+)and jc_jjdd.xcmgc=d.gysbh(+)";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_jjdd.clzt='99'";
	ls_sql+=" order by jc_jjdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey32={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey32;//�����в�����coluParm.key������
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>
 
4���Ҿ���������ϸ
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���������</td>
	<td  width="4%">�������ܶ�</td>
	<td  width="3%">������¼��ʱ��</td>
	<td  width="3%">�������</td>
	<td  width="4%">����״̬</td>
	<td  width="5%">�Ҿ߹���</td>
	<td  width="5%">�Ͳ��Ź���</td>
	<td  width="4%">������ͬ�ܶ�</td>
	<td  width="4%">�����������ܶ�</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="9%">���ݵ�ַ</td>
	<td  width="2%">��װ���ʦ</td>
    <td  width="4%">�����</td>
</tr>
<%
	ls_sql="SELECT jc_jjzjx.zjxxh,jc_jjzjx.zjxze,jc_jjzjx.lrsj,jc_jjdd.ddbh,clztmc,c.gysmc pdgc,d.gysmc xcmgc,jc_jjdd.htze,jc_jjdd.zjhze,jc_jjdd.qhtsj,jc_jjdd.jjsjs,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,crm_khxx.khxm khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sjs,cxhdbm";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,crm_khxx,sq_gysxx c,sq_gysxx d,jc_jjzjx";
    ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+) and jc_jjdd.ddbh=jc_jjzjx.ddbh";
	ls_sql+=" and jc_jjdd.pdgc=c.gysbh(+)and jc_jjdd.xcmgc=d.gysbh(+)";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";
	ls_sql+=" and jc_jjzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_jjzjx.clzt!='00'";
	ls_sql+=" order by jc_jjzjx.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey33={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey33;//�����в�����coluParm.key������
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>



<P>
5�����Ķ�����ϸ
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="3%">�������</td>
	<td  width="3%">����״̬</td>
	<td  width="5%">Ʒ��</td>
	<td  width="4%">��ͬ�ܶ�</td>
	<td  width="4%">��������</td>
	<td  width="4%">�����������</td>
	<td  width="3%">��������</td>
	<td  width="3%">�˵�ʱ��</td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="4%">�μӴ����</td>
	<td  width="2%">��װ���ʦ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="3%">¼��ʱ��</td>
</tr>
<%
	ls_sql="SELECT jc_zcdd.ddbh,clztmc,jc_zcdd.ppbm,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.htcxhdje,jc_zcdd.qhtsj,jc_zcdd.tdsj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,cxhdbm,crm_khxx.sjs,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,jc_zcdd.lrsj";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.clzt>='09'";
	ls_sql+=" order by jc_zcdd.lrsj";

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey41={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey41;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

5�������˵���ϸ
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="3%">�������</td>
	<td  width="3%">����״̬</td>
	<td  width="5%">Ʒ��</td>
	<td  width="4%">��ͬ�ܶ�</td>
	<td  width="4%">��������</td>
	<td  width="4%">�����������</td>
	<td  width="3%">��������</td>
	<td  width="3%">�˵�ʱ��</td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="4%">�μӴ����</td>
	<td  width="2%">��װ���ʦ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">�Ҿ����ʦ</td>
	<td  width="3%">¼��ʱ��</td>
</tr>
<%
	ls_sql="SELECT jc_zcdd.ddbh,clztmc,jc_zcdd.ppbm,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.htcxhdje,jc_zcdd.qhtsj,jc_zcdd.tdsj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,cxhdbm,crm_khxx.sjs,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,jc_zcdd.lrsj";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.clzt='99'";
	ls_sql+=" order by jc_zcdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey42={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey42;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>


5��������������ϸ
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="3%">��������</td>
   	<td  width="4%">�������ܶ�</td>
   	<td  width="3%">������¼��ʱ��</td>
   	<td  width="3%">�������</td>
	<td  width="3%">����״̬</td>
	<td  width="5%">Ʒ��</td>
	<td  width="4%">������ͬ�ܶ�</td>
	<td  width="4%">���������ܶ�</td>
	<td  width="4%">�����������</td>
	<td  width="3%">��������</td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="4%">�μӴ����</td>
	<td  width="2%">��װ���ʦ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">�Ҿ����ʦ</td>
</tr>
<%
	ls_sql="SELECT jc_zczjx.zjxbh,jc_zczjx.zjxze,jc_zczjx.lrsj,jc_zcdd.ddbh,clztmc,jc_zcdd.ppbm,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.htcxhdje,jc_zcdd.qhtsj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,cxhdbm,crm_khxx.sjs,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt,jc_zczjx ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and jc_zcdd.ddbh=jc_zczjx.ddbh ";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
	ls_sql+=" and jc_zczjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zczjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zczjx.clzt!='00'";
	ls_sql+=" order by jc_zczjx.lrsj";

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey43={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey43;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>


</body>
</html>