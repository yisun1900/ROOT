<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;


	String khbh=request.getParameter("khbh");
	String ddbh=request.getParameter("ddbh");
	String ppbm=cf.executeQuery("select ppbm from jc_zcdd where ddbh='"+ddbh+"'");

	ls_sql="SELECT jc_zcysd.ddbh,DECODE(jc_zcysd.clzt,'00','¼��Ԥ�㵥','01','Ԥ�㵥���','02','תΪ��ʽ����'),jc_zcysd.ppbm,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,jc_zcysd.wdzje,jc_zcysd.hkze,jc_zcysd.lrsj,a.dwmc lrdw,jc_zcysd.bz,jc_zcysd.ppmc,jc_zcysd.gys,zcxlbm";
	ls_sql+=" FROM crm_khxx,jc_zcysd,sq_dwxx a ";
    ls_sql+=" where jc_zcysd.khbh=crm_khxx.khbh and jc_zcysd.dwbh=a.dwbh";
    ls_sql+=" and jc_zcysd.khbh='"+khbh+"' and jc_zcysd.ppbm='"+ppbm+"'";
    ls_sql+=" and jc_zcysd.clzt!='02' ";
    ls_sql+=" order by jc_zcysd.lrsj desc,jc_zcysd.ddbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","drysd.jsp?drddbh="+ddbh);
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
	pageObj.setEditStr("����");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����Ԥ�㵥</font></B>��<font color="#FF0000" size="4"><strong>ע�⣺�������Ѵ��ڵĵ�Ʒ�������ᱻ����</strong></font>��
</CENTER>
<table border="1" width="200%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">�������</td>
	<td  width="5%">����״̬</td>
	<td  width="8%">��Ʒ��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="5%">��ͬ��</td>
	<td  width="5%">��ǰ�ܶ�</td>
	<td  width="5%">�ۺ��ܶ�</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="7%">¼�벿��</td>
	<td  width="14%">��ע</td>
	<td  width="7%">Ʒ��</td>
	<td  width="10%">��Ӧ��</td>
	<td  width="8%">����С��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>
</body>
</html>