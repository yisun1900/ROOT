<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");

	ls_sql="SELECT xcmxh,xcmlxmc,xcmmc,azwz,gd||'*'||kd gg,bklxxh,bkys,mbcl1,mbcl2,sl,zqzj ";
	ls_sql+=" FROM jc_jjxcmmx,jdm_xcmlxbm  ";
    ls_sql+=" where jc_jjxcmmx.xcmlxbm=jdm_xcmlxbm.xcmlxbm(+) and ddbh='"+ddbh+"'";
    ls_sql+=" order by xcmxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_jjxcmmxMain.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.setEditBolt("");//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"xcmlxmc","xcmmc","gg","bklxxh","bkys","mbcl1","mbcl2","sl","zqzj"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xcmxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"�����Ͳ���","ɾ���Ͳ���"};//��ť����ʾ����
	String[] buttonLink={"CopyJc_jjxcmmx.jsp?ddbh="+ddbh,"DeleteJc_jjxcmmx.jsp?ddbh="+ddbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform">
<CENTER >
    <B><font size="2">�Ͳ�����ϸ��������ţ�<%=ddbh%>��</font></B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">�Ͳ�������</td>
	<td  width="8%">�Ͳ�������</td>
	<td  width="8%">��*��(mm)</td>
	<td  width="16%" align="left">&nbsp;&nbsp;<strong>������</strong>���߿��ͺ�<BR>
	  &nbsp;&nbsp;<strong>����</strong>������<BR>
	  &nbsp;&nbsp;<strong>����</strong>������<BR>
	  &nbsp;&nbsp;<strong>�������</strong>������</td>
	<td  width="7%">�߿���ɫ</td>
	<td  width="15%">���1����/��ɫ</td>
	<td  width="15%">���2����/��ɫ</td>
	<td  width="6%">����</td>
	<td  width="9%">�ܼ�</td>
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