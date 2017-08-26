<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";
	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	
	String jzbz=request.getParameter("jzbz");
	if (!jzbz.equals("0"))
	{
		wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
	}

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");

	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


	ls_sql="SELECT '',sjs,hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),cxhdbm,wdzgce,TO_CHAR(zkl),qye,zjxje,NVL(zjxje,0)+qye,sjf,DECODE(crm_khxx.sffj,'Y','����','N','��'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','��֤','N','��'),b.dwmc rzsc,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>'),sgdmc sgd,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.rzsc='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
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
  <B><font size="3">����ǩԼ��ϸ��<%=dwmc%>��
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
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
	pageObj.printSum();
%> 
</table>
</body>
</html>