<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	
	ls_sql="SELECT '',crm_zxkhxx.lfdj,TO_CHAR(crm_zxkhxx.jlfdjsj,'YYYY-MM-DD') jlfdjsj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ') jzbz,crm_khxx.cxhdbm,crm_khxx.wdzgce,TO_CHAR(crm_khxx.zkl) zkl,crm_khxx.qye,crm_khxx.suijinbfb||'%' suijinbfb,crm_khxx.suijin,crm_khxx.sjf,crm_khxx.zjxje,crm_khxx.zhzjxje,crm_khxx.zjxsuijin,NVL(crm_khxx.zhzjxje,0)+crm_khxx.qye zjhze,NVL(crm_khxx.suijin,0)+NVL(crm_khxx.zjxsuijin,0) suijinze,DECODE(crm_khxx.sffj,'Y','����','N','��') sffj,crm_khxx.fjje,DECODE(crm_khxx.sfyrz,'Y','��֤','N','��') sfyrz,b.dwmc rzsc,a.dwmc qydm,TO_CHAR(crm_khxx.lrsj,'YYYY-MM-DD HH24:MI') lrsj,TO_CHAR(crm_khxx.qyrq,'YYYY-MM-DD') qyrq,DECODE(TO_CHAR(crm_khxx.lrsj,'MM')-TO_CHAR(crm_khxx.qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>') dylr,sgdmc sgd,crm_khxx.zjxm";
	ls_sql+=" FROM crm_khxx,crm_zxkhxx,sq_dwxx a,sq_dwxx b,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.khbh=crm_zxkhxx.khbh";
    ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt!='3'";
	ls_sql+=" and crm_zxkhxx.lfdjbz='Y' ";
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by crm_khxx.lrsj";

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

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����ǩ���� 
  <BR>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">��������</td>
	<td  width="3%">����������ʱ��</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="2%">��װ��־</td>
	<td  width="4%">�����</td>
	<td  width="4%">δ���۽��</td>
	<td  width="3%">�ۿ���</td>
	<td  width="4%">ǩԼ���˰��</td>
	<td  width="3%">˰��</td>
	<td  width="4%">˰��</td>
	<td  width="4%">��Ʒ�</td>
	<td  width="4%">��ǰ������</td>
	<td  width="4%">�ۺ��������˰��</td>
	<td  width="4%">������˰��</td>
	<td  width="4%">�������ܶ� </td>
	<td  width="4%">������˰���ܶ�</td>
	<td  width="2%">�Ƿ񷵾�</td>
	<td  width="3%">�����ܽ��</td>
	<td  width="2%">�Ƿ���֤</td>
	<td  width="5%">��֤�г�</td>
	<td  width="6%">ǩԼ����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="2%">����¼��</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ʼ�Ա</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>