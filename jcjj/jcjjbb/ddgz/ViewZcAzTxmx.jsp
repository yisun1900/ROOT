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
		wheresql+=" and jc_zcdd.xmzy='"+xmzymc+"'";
	}


	String ls_sql=null;

	ls_sql="SELECT jc_zcdd.ddbh, DECODE(jc_zcdd.clzt,'00','����δ���','01','���������','02','������ȷ��','03','���ͻ�'),DECODE(jc_zcdd.xclbz,'1','�������','2','�ȴ�����֪ͨ','3','������֪ͨ','4','�Ѳ���'),jc_zcdd.htshsj,jc_zcdd.tzshsj,crm_khxx.khxm,crm_khxx.lxfs,jc_zcdd.clgw,jc_zcdd.xmzy,jc_zcdd.hkze,dwmc,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx  ";
    ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and jc_zcdd.htshsj<SYSDATE+2 ";
	ls_sql+=" and jc_zcdd.clzt<'03'";
	ls_sql+=wheresql;
    ls_sql+=" order by jc_zcdd.htshsj,jc_zcdd.ddbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ddbh","jc_jjdd_clzt","jhccsj","khxm","fwdz","hth","jc_jjdd_dj","yhmc","jc_jjdd_jjsjs","jc_jjdd_ssje","jc_jjdd_khlx","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����ͻ����ѣ���ĿרԱ��<%=xmzymc%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�������</td>
	<td  width="8%">����״̬</td>
	<td  width="6%">�����</td>
	<td  width="10%">��ͬ�ͻ�ʱ��</td>
	<td  width="10%">֪ͨ�ͻ�ʱ��</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="10%">��ϵ��ʽ</td>
	<td  width="6%">פ��Ҿӹ���</td>
	<td  width="6%">��ĿרԱ</td>
	<td  width="10%">��ͬ�ܶ�</td>
	<td  width="10%">¼�벿��</td>
	<td  width="11%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
%> 

</table>
</body>
</html>