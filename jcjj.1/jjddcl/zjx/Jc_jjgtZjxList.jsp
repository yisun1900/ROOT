<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT jc_jjgtmx.gtxh,DECODE(jc_gtzjxmx.ysl-jc_gtzjxmx.xsl,1,'����',-1,'����+'),jc_jjgtmx.gtmc,jc_jjgtmx.jjazwz,jc_jjgtmx.guige,jc_jjgtmx.jjlx,jc_jjgtmx.bclx,jc_jjgtmx.bcys,(jc_gtzjxmx.xsl-jc_gtzjxmx.ysl)*jc_jjgtmx.zj,(jc_gtzjxmx.xsl-jc_gtzjxmx.ysl)*zqzj";
	ls_sql+=" FROM jc_jjgtmx,jc_gtzjxmx  ";
    ls_sql+=" where jc_jjgtmx.gtxh=jc_gtzjxmx.gtxh and jc_gtzjxmx.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by gtxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_jjgtmx.jsp?zjxxh="+zjxxh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//	pageObj.setEditBolt("");//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"gtxh","ddbh","gtmc","jjazwz","guige","jjlx","bcpp","bcys","bcbfje","pjbfje","zj","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gtxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��������"};//��ť����ʾ����
	String[] buttonLink={"DeleteJc_jjgtmx.jsp?ddbh="+ddbh+"&zjxxh="+zjxxh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"gtxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jcjj/jjddcl/ht/ViewJc_jjgtmx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gtxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform">
<CENTER >
    <B><font size="2">�����������������ţ�<%=zjxxh%>��</font></B> 
  </CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">�������</td>
	<td  width="5%">��־</td>
	<td  width="9%">��������</td>
	<td  width="8%">��װλ��</td>
	<td  width="10%">���</td>
	<td  width="12%">�Ҿ�ϵ��</td>
	<td  width="16%">�������</td>
	<td  width="8%">�����ɫ</td>
	<td  width="8%"><span class="STYLE1">�ܼ�-�ۺ�</span></td>
	<td  width="8%"><strong>�ܼ�-��ǰ</strong></td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
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