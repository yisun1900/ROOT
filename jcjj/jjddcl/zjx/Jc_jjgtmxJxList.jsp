<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT gtxh,gtmc,jjazwz,guige,jjlx,bclx,bcys,bcbfje,pjbfje,zj,zqbcbfje,zqpjbfje,zqzj  ";
	ls_sql+=" FROM jc_jjgtmx  ";
    ls_sql+=" where ddbh='"+ddbh+"' and zjhsl>0 ";
    ls_sql+=" and gtxh not in(select gtxh from jc_gtzjxmx where zjxxh='"+zjxxh+"')";
    ls_sql+=" order by gtxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.setEditBolt("");//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"gtxh","ddbh","gtmc","jjazwz","guige","jjlx","bcpp","bcys","bcbfje","pjbfje","zj","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gtxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"����ѡ�й���"};//��ť����ʾ����
	String[] buttonLink={"Jc_jjgtmxJx.jsp?ddbh="+ddbh+"&zjxxh="+zjxxh};//��ť�������õ���ҳ���������Ӳ���
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
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform">
<CENTER >
    <B><font size="2">������������ţ�<%=ddbh%>��</font></B> 
</CENTER>
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="7%">�������</td>
	<td  width="7%">��������</td>
	<td  width="6%">��װλ��</td>
	<td  width="8%">���</td>
	<td  width="8%">�Ҿ�ϵ��</td>
	<td  width="13%">�������</td>
	<td  width="6%">�����ɫ</td>
	<td  width="7%"><span class="STYLE1">��Ľ��-�ۺ�</span></td>
	<td  width="7%"><span class="STYLE1">������-�ۺ�</span></td>
	<td  width="7%"><span class="STYLE1">�ܼ�-�ۺ�</span></td>
	<td  width="7%"><strong>��Ľ��-��ǰ</strong></td>
	<td  width="7%"><strong>������-��ǰ</strong></td>
	<td  width="7%"><strong>�ܼ�-��ǰ</strong></td>
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