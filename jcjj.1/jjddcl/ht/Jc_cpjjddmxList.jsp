<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String wheresql="";
	String ddbh=request.getParameter("ddbh");

	ls_sql="SELECT cpjjmc,xh,gg,cpjjxl,cpjjcz,cpjjhs,TO_CHAR(bzdj),sl,zqzj,bz,cpjjbh,cpjjfg  ";
	ls_sql+=" FROM jc_cpjjddmx  ";
    ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" order by cpjjbh";
   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_cpjjddmxMain.jsp?ddbh="+ddbh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.setEditBolt("");//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ddbh","cpjjbh","cpjjfg","cpjjmc","xh","gg","cpjjxl","cpjjcz","ys","cpjjhs","bzdj","khdj","sl","zjhsl","zj","cktp","cptp","cpsm","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cpjjbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ����Ʒ�Ҿ�"};//��ť����ʾ����
	String[] buttonLink={"DeleteJc_cpjjddmx.jsp?ddbh="+ddbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform">
<table border="1" width="190%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">����</td>
	<td  width="6%">�ͺ�</td>
	<td  width="12%">���</td>
	<td  width="7%">ϵ������</td>
	<td  width="11%">����</td>
	<td  width="15%">��ɫ����</td>
	<td  width="5%">����</td>
	<td  width="4%">����</td>
	<td  width="6%">�ܼ�</td>
	<td  width="15%">��ע</td>
	<td  width="4%">���</td>
	<td  width="6%">���</td>
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