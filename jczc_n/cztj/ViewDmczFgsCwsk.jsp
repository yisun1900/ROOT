<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";
	String wheresql1="";
	String wheresql2="";

	String dwbh=request.getParameter("fgsbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String dm=request.getParameter("dwbh");
//out.println(dm);

	String jzbz=request.getParameter("jzbz");
	if (!jzbz.equals("0"))
	{
		wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
	}
	if (dm!=null)
	{
		wheresql1+=" and  crm_khxx.dwbh='"+dm+"'";
		wheresql2+=" and  crm_khxx.dwbh='"+dm+"'";
	}

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");

	wheresql+=" and cwjzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and cwjzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


	ls_sql="SELECT '',sjs,hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),cxhdbm,wdzgce,TO_CHAR(zkl),qye,zjxje,NVL(zjxje,0)+qye,sjf,DECODE(crm_khxx.sffj,'Y','����','N','��'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','��֤','N','��'),b.dwmc rzsc,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>'),sgdmc sgd,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and a.cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" and crm_khxx.zt in ('2','3') ";
	ls_sql+=wheresql;
	ls_sql+=" order by sjs,lrsj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sjs","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ֹ�˾ǩԼ��ϸ��<%=dwmc%>��
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">���ʦ</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">����</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="3%">��װ��־</td>
	<td  width="5%">�����</td>
	<td  width="6%">δ���۽��</td>
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
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
	pageObj.printSum();
%> 
</table>


<%
	ybl.common.PageObject pageObj1=new ybl.common.PageObject();

	ls_sql="SELECT '',crm_khxx.sjs,hth,crm_khxx.khxm,crm_khxx.fwdz,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),cxhdbm,wdzgce,TO_CHAR(zkl),qye,zjxje,NVL(zjxje,0)+qye,sjf,DECODE(crm_khxx.sffj,'Y','����','N','��'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','��֤','N','��'),b.dwmc rzsc,a.dwmc qydm,TO_CHAR(crm_khxx.lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(crm_khxx.lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>'),sgdmc sgd,crm_khxx.zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd,crm_tddj";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and a.cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" and crm_khxx.zt='3' ";
	ls_sql+=" and crm_tddj.tdxh=crm_khxx.tdxh and crm_tddj.lrsj<=TO_DATE('"+sjfw+"','YYYY-MM-DD')  and crm_tddj.lrsj>=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.sjs,crm_khxx.lrsj";

//	out.println(ls_sql);

    pageObj1.sql=ls_sql;
//���ж����ʼ��
	pageObj1.initPage("","","","");
	pageObj1.setPageRow(50000);//����ÿҳ��ʾ��¼��
	pageObj1.setDateType("long");//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash1=new Hashtable();
	spanColHash1.put("sjs","1");//�в����������Hash��
	pageObj1.setSpanCol(spanColHash1);//�в����������Hash��
//�����г�������
	Hashtable coluParmHash1=new Hashtable();
	ColuParm coluParm1=null;

	coluParm1=new ColuParm();//����һ���в�������
	String[] coluKey1={"hth"};//�����в�����coluParm.key������
	coluParm1.key=coluKey1;//�����в�����coluParm.key������
	coluParm1.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm1.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash1.put("fwdz",coluParm1);//�в����������Hash��
	pageObj1.setColuLink(coluParmHash1);//�в����������Hash��


%>
<CENTER >
  <B><font size="3">�Ǳ�ʱ����˵��ͻ���<%=dwmc%>��<font color=red>+</font>
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">���ʦ</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">����</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="3%">��װ��־</td>
	<td  width="5%">�����</td>
	<td  width="6%">δ���۽��</td>
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
	pageObj1.out=out;
	pageObj1.getDate(1);
	pageObj1.printDate(true);
	pageObj1.printSum();
%> 
</table>

<%
	ybl.common.PageObject pageObj2=new ybl.common.PageObject();

	ls_sql="SELECT '',crm_khxx.sjs,hth,crm_khxx.khxm,crm_khxx.fwdz,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),cxhdbm,wdzgce,TO_CHAR(zkl),qye,zjxje,NVL(zjxje,0)+qye,sjf,DECODE(crm_khxx.sffj,'Y','����','N','��'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','��֤','N','��'),b.dwmc rzsc,a.dwmc qydm,TO_CHAR(crm_khxx.lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(crm_khxx.lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>'),sgdmc sgd,crm_khxx.zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd,crm_tddj";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.fgsbh='"+dwbh+"' and a.cxbz='N' and crm_khxx.cwjzkscsj is not null ";
	ls_sql+=wheresql1;
	ls_sql+=" and crm_khxx.zt='3' and (crm_khxx.khbh in (select khbh from cw_khfkjl where skdd='1' or (skdd='2' and   dsksjbz='Y') and cw_khfkjl.fgsbh='"+dwbh+"' ))";
	ls_sql+=" and crm_tddj.tdxh=crm_khxx.tdxh and crm_tddj.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')  and crm_tddj.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=wheresql2;
	ls_sql+=" order by crm_khxx.sjs,crm_khxx.lrsj";

//	out.println(ls_sql);

    pageObj2.sql=ls_sql;
//���ж����ʼ��
	pageObj2.initPage("","","","");
	pageObj2.setPageRow(50000);//����ÿҳ��ʾ��¼��
	pageObj2.setDateType("long");//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash2=new Hashtable();
	spanColHash2.put("sjs","1");//�в����������Hash��
	pageObj2.setSpanCol(spanColHash2);//�в����������Hash��
//�����г�������
	Hashtable coluParmHash2=new Hashtable();
	ColuParm coluParm2=null;

	coluParm2=new ColuParm();//����һ���в�������
	String[] coluKey2={"hth"};//�����в�����coluParm.key������
	coluParm2.key=coluKey2;//�����в�����coluParm.key������
	coluParm2.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm2.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash2.put("fwdz",coluParm2);//�в����������Hash��
	pageObj2.setColuLink(coluParmHash2);//�в����������Hash��


%>
<CENTER >
  <B><font size="3">�Ǳ�ʱ����˵��ͻ���<%=dwmc%>��<font color=red>&nbsp;&nbsp;-</font>
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">���ʦ</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">����</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="3%">��װ��־</td>
	<td  width="5%">�����</td>
	<td  width="6%">δ���۽��</td>
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
	pageObj2.out=out;
	pageObj2.getDate(1);
	pageObj2.printDate(true);
	pageObj2.printSum();
%> 
</table>
</body>
</html>
