<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";

	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");

%>

<CENTER >
  <B><font size="3">����ǩԼ��ϸ��<%=dwmc%>��
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
ǩ����ϸ
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="8%">�������</td>
	<td  width="8%">����״̬</td>
	<td  width="7%">פ��Ҿӹ���</td>
	<td  width="7%">չ���Ҿӹ���</td>
	<td  width="7%">��ĿרԱ</td>
	<td  width="16%">����</td>
	<td  width="7%">�ͻ����</td>
	<td  width="8%">��ͬ��</td>
	<td  width="8%">����</td>
	<td  width="10%">��ͬ���</td>
	<td  width="8%">��ͬ����</td>
</tr>


<%
	ls_sql="SELECT 'ľ��' lx,jc_mmydd.yddbh,clztmc,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.xmzy,jc_mmydd.pdgcmc,jc_mmydd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_mmydd.htje,jc_mmydd.htrq";
	ls_sql+=" FROM crm_khxx,jc_mmydd,jdm_mmyddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='98'";//04��ǩ����ͬ
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" order by jc_mmydd.htrq";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey11={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey11;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

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
�˵���ϸ
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="8%">�������</td>
	<td  width="8%">����״̬</td>
	<td  width="7%">פ��Ҿӹ���</td>
	<td  width="7%">չ���Ҿӹ���</td>
	<td  width="7%">��ĿרԱ</td>
	<td  width="16%">����</td>
	<td  width="7%">�ͻ����</td>
	<td  width="8%">��ͬ��</td>
	<td  width="8%">����</td>
	<td  width="10%">��ͬ���</td>
	<td  width="8%">��ͬ����</td>
</tr>


<%
	ls_sql="SELECT 'ľ��' lx,jc_mmydd.yddbh,clztmc,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.xmzy,jc_mmydd.pdgcmc,jc_mmydd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_mmydd.zjhze,jc_mmydd.htrq";
	ls_sql+=" FROM crm_khxx,jc_mmydd,jdm_mmyddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.clzt='99' ";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" order by jc_mmydd.htrq";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey13={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey13;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey14={"yddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey14;//�����в�����coluParm.key������
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

��������ϸ
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="8%">���������</td>
	<td  width="8%">����״̬</td>
	<td  width="7%">פ��Ҿӹ���</td>
	<td  width="7%">չ���Ҿӹ���</td>
	<td  width="7%">��ĿרԱ</td>
	<td  width="16%">����</td>
	<td  width="7%">�ͻ����</td>
	<td  width="8%">��ͬ��</td>
	<td  width="8%">����</td>
	<td  width="10%">��������</td>
	<td  width="8%">������ʱ��</td>
</tr>


<%
	ls_sql="SELECT 'ľ��' lx,jc_mmzjx.zjxxh,clztmc,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.xmzy,jc_mmydd.pdgcmc,jc_mmydd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_mmzjx.zjxze,jc_mmzjx.zjxfssj";
	ls_sql+=" FROM crm_khxx,jc_mmydd,jc_mmzjx,jdm_mmyddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_mmydd.khbh and jc_mmydd.yddbh=jc_mmzjx.yddbh and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and jc_mmzjx.clzt not in('00')";
	ls_sql+=" and jc_mmzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" order by jc_mmydd.htrq";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey15={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey15;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey16={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey16;//�����в�����coluParm.key������
	coluParm.link="/jcjj/mmcl/mmzjx/ViewJc_mmzjx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>



<P>
ǩ����ϸ
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="8%">�������</td>
	<td  width="8%">����״̬</td>
	<td  width="7%">פ��Ҿӹ���</td>
	<td  width="7%">չ���Ҿӹ���</td>
	<td  width="7%">��ĿרԱ</td>
	<td  width="16%">����</td>
	<td  width="7%">�ͻ����</td>
	<td  width="8%">��ͬ��</td>
	<td  width="8%">����</td>
	<td  width="10%">��ͬ���</td>
	<td  width="8%">��ͬ����</td>
</tr>


<%
	ls_sql="SELECT '����' lx,jc_cgdd.ddbh,clztmc,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.xmzy,jc_cgdd.pdgcmc,jc_cgdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_cgdd.htze,jc_cgdd.qhtsj";
	ls_sql+=" FROM crm_khxx,jc_cgdd,jdm_cgddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='98'";//13��ǩ����ͬ
	ls_sql+=" and jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
	ls_sql+=" order by jc_cgdd.qhtsj";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey21={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey21;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

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
�˵���ϸ
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="8%">�������</td>
	<td  width="8%">����״̬</td>
	<td  width="7%">פ��Ҿӹ���</td>
	<td  width="7%">չ���Ҿӹ���</td>
	<td  width="7%">��ĿרԱ</td>
	<td  width="16%">����</td>
	<td  width="7%">�ͻ����</td>
	<td  width="8%">��ͬ��</td>
	<td  width="8%">����</td>
	<td  width="10%">��ͬ���</td>
	<td  width="8%">��ͬ����</td>
</tr>


<%
	ls_sql="SELECT '����' lx,jc_cgdd.ddbh,clztmc,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.xmzy,jc_cgdd.pdgcmc,jc_cgdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_cgdd.zjhze,jc_cgdd.qhtsj";
	ls_sql+=" FROM crm_khxx,jc_cgdd,jdm_cgddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgdd.clzt='99' ";
	ls_sql+=" and jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
	ls_sql+=" order by jc_cgdd.qhtsj";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey23={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey23;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey24={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey24;//�����в�����coluParm.key������
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

��������ϸ
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="8%">���������</td>
	<td  width="8%">����״̬</td>
	<td  width="7%">פ��Ҿӹ���</td>
	<td  width="7%">չ���Ҿӹ���</td>
	<td  width="7%">��ĿרԱ</td>
	<td  width="16%">����</td>
	<td  width="7%">�ͻ����</td>
	<td  width="8%">��ͬ��</td>
	<td  width="8%">����</td>
	<td  width="10%">��������</td>
	<td  width="8%">������ʱ��</td>
</tr>


<%
	ls_sql="SELECT '����' lx,jc_cgzjx.zjxxh,clztmc,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.xmzy,jc_cgdd.pdgcmc,jc_cgdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_cgzjx.zjxze,jc_cgzjx.zjxfssj";
	ls_sql+=" FROM crm_khxx,jc_cgdd,jc_cgzjx,jdm_cgddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_cgdd.khbh and jc_cgdd.ddbh=jc_cgzjx.ddbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_cgzjx.clzt not in('00')";
			ls_sql+=" and jc_cgzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
	ls_sql+=" order by jc_cgdd.qhtsj";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey25={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey25;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey26={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey26;//�����в�����coluParm.key������
	coluParm.link="/jcjj/cgcl/zjx/ViewJc_cgzjx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>





<P>
ǩ����ϸ
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="8%">�������</td>
	<td  width="8%">����״̬</td>
	<td  width="7%">פ��Ҿӹ���</td>
	<td  width="7%">չ���Ҿӹ���</td>
	<td  width="7%">��ĿרԱ</td>
	<td  width="16%">����</td>
	<td  width="7%">�ͻ����</td>
	<td  width="8%">��ͬ��</td>
	<td  width="8%">����</td>
	<td  width="10%">��ͬ���</td>
	<td  width="8%">��ͬ����</td>
</tr>


<%
	ls_sql="SELECT '�Ҿ�' lx,jc_jjdd.ddbh,clztmc,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.pdgcmc,jc_jjdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_jjdd.htze,jc_jjdd.qhtsj";
	ls_sql+=" FROM crm_khxx,jc_jjdd,jdm_jjddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='98'";//13��ǩ����ͬ
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
	ls_sql+=" order by jc_jjdd.qhtsj";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey31={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey31;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

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
�˵���ϸ
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="8%">�������</td>
	<td  width="8%">����״̬</td>
	<td  width="7%">פ��Ҿӹ���</td>
	<td  width="7%">չ���Ҿӹ���</td>
	<td  width="7%">��ĿרԱ</td>
	<td  width="16%">����</td>
	<td  width="7%">�ͻ����</td>
	<td  width="8%">��ͬ��</td>
	<td  width="8%">����</td>
	<td  width="10%">��ͬ���</td>
	<td  width="8%">��ͬ����</td>
</tr>


<%
	ls_sql="SELECT '�Ҿ�' lx,jc_jjdd.ddbh,clztmc,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.pdgcmc,jc_jjdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_jjdd.zjhze,jc_jjdd.qhtsj";
	ls_sql+=" FROM crm_khxx,jc_jjdd,jdm_jjddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjdd.clzt='99'";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
	ls_sql+=" order by jc_jjdd.qhtsj";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey33={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey33;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey34={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey34;//�����в�����coluParm.key������
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

��������ϸ
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="8%">���������</td>
	<td  width="8%">����״̬</td>
	<td  width="7%">פ��Ҿӹ���</td>
	<td  width="7%">չ���Ҿӹ���</td>
	<td  width="7%">��ĿרԱ</td>
	<td  width="16%">����</td>
	<td  width="7%">�ͻ����</td>
	<td  width="8%">��ͬ��</td>
	<td  width="8%">����</td>
	<td  width="10%">��������</td>
	<td  width="8%">������ʱ��</td>
</tr>


<%
	ls_sql="SELECT '�Ҿ�' lx,jc_jjzjx.zjxxh,clztmc,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.pdgcmc,jc_jjdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_jjzjx.zjxze,jc_jjzjx.zjxfssj";
	ls_sql+=" FROM crm_khxx,jc_jjdd,jc_jjzjx,jdm_jjddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_jjdd.khbh and jc_jjdd.ddbh=jc_jjzjx.ddbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_jjzjx.clzt not in('00')";
			ls_sql+=" and jc_jjzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
	ls_sql+=" order by jc_jjdd.qhtsj";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey35={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey35;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey36={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey36;//�����в�����coluParm.key������
	coluParm.link="/jcjj/jjddcl/zjx/ViewJc_jjzjx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>







<P>
ǩ����ϸ
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="8%">�������</td>
	<td  width="8%">����״̬</td>
	<td  width="9%">С��</td>
	<td  width="6%">פ��Ҿӹ���</td>
	<td  width="6%">չ���Ҿӹ���</td>
	<td  width="6%">��ĿרԱ</td>
	<td  width="16%">����</td>
	<td  width="6%">�ͻ����</td>
	<td  width="7%">��ͬ��</td>
	<td  width="6%">����</td>
	<td  width="8%">��ͬ���</td>
	<td  width="8%">��ͬ����</td>
</tr>


<%
	ls_sql="SELECT '����' lx,jc_zcdd.ddbh,clztmc,jc_zcdd.zcxlbm,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.ppbm,jc_zcdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_zcdd.hkze,jc_zcdd.qhtsj";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";//09����ͬ�����
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
	ls_sql+=" order by jc_zcdd.qhtsj";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey41={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey41;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

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
�˵���ϸ
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="8%">�������</td>
	<td  width="8%">����״̬</td>
	<td  width="9%">С��</td>
	<td  width="6%">פ��Ҿӹ���</td>
	<td  width="6%">չ���Ҿӹ���</td>
	<td  width="6%">��ĿרԱ</td>
	<td  width="16%">����</td>
	<td  width="6%">�ͻ����</td>
	<td  width="7%">��ͬ��</td>
	<td  width="6%">����</td>
	<td  width="8%">��ͬ���</td>
	<td  width="8%">��ͬ����</td>
</tr>


<%
	ls_sql="SELECT '����' lx,jc_zcdd.ddbh,clztmc,jc_zcdd.zcxlbm,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.ppbm,jc_zcdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_zcdd.hkze+zjhze,jc_zcdd.tdsj";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99'";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
	ls_sql+=" order by jc_zcdd.tdsj";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey43={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey43;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey44={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey44;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

��������ϸ
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="8%">���������</td>
	<td  width="8%">����״̬</td>
	<td  width="9%">С��</td>
	<td  width="6%">פ��Ҿӹ���</td>
	<td  width="6%">չ���Ҿӹ���</td>
	<td  width="6%">��ĿרԱ</td>
	<td  width="16%">����</td>
	<td  width="6%">�ͻ����</td>
	<td  width="7%">��ͬ��</td>
	<td  width="6%">����</td>
	<td  width="8%">�������ܶ�</td>
	<td  width="8%">�������ʱ��</td>
</tr>


<%
	ls_sql="SELECT '����' lx,jc_zczjx.zjxbh,clztmc,jc_zcdd.zcxlbm,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.ppbm,jc_zcdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_zczjx.zjxze,jc_zczjx.zjxfssj";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zczjx,jdm_zcddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_zcdd.khbh and jc_zcdd.ddbh=jc_zczjx.ddbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
	ls_sql+=" order by jc_zcdd.qhtsj";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey45={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey45;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey46={"zjxbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey46;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zccl/zjx/ViewJc_zczjx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>


</body>
</html>