<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yhdlm=(String)session.getAttribute("yhdlm");
	String zdyhbz=cf.executeQuery("select zdyhbz from sq_yhxx where yhdlm='"+yhdlm+"'");
	String wheresql="";
	String xmzymc="";
	if (zdyhbz.equals("Y"))
	{
		xmzymc="ȫ����ĿרԱ";
	}
	else 
	{
		xmzymc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"'");
		wheresql+=" and jc_jjdd.xmzy='"+xmzymc+"'";
	}

	String ls_sql=null;

	ls_sql="SELECT jc_jjdd.ddbh as ddbh,jc_jjdd.xmzy,jc_jjdd.khbh as khbh,jgrq,jc_jjdd.dj as jc_jjdd_dj,jc_jjdd.jjsjs as jc_jjdd_jjsjs,clztmc, DECODE(jc_jjdd.khlx,'1','װ�޿ͻ�','2','�Ҿ߿ͻ�') as jc_jjdd_khlx,crm_khxx.khxm as khxm,crm_khxx.fwdz as fwdz,crm_khxx.hth as hth,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,crm_khxx,sq_dwxx   ";
    ls_sql+=" where jc_jjdd.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
	ls_sql+=" and jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jhazrq<SYSDATE";
	ls_sql+=" and clzt<'08'";
	ls_sql+=wheresql;
    ls_sql+=" order by jhazrq";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"ddbh","clztmc","jgrq","khxm","fwdz","hth","jc_jjdd_dj","xmzy","jc_jjdd_jjsjs","jc_jjdd_khlx","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
/*
*/

//�����г�������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�Ҿ߰�װ���ڣ���ĿרԱ��<%=xmzymc%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">�������</td>
	<td  width="10%">����״̬</td>
	<td  width="8%">��ͬ��������</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="20%">���ݵ�ַ</td>
	<td  width="7%">��ͬ��</td>
	<td  width="5%">����</td>
	<td  width="6%">��ĿרԱ</td>
	<td  width="6%">�Ҿ����ʦ</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="10%">¼�벿��</td>
</tr>
<%
	pageObj.displayDateSum();
%> 

</table>
</body>
</html>