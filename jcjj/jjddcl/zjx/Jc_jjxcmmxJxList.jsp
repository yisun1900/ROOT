<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT xcmxh,xcmlxmc,xcmmc,azwz,gd||'*'||kd gg,bklxxh,bkys,mbcl1,mbcl2,zj,zqzj,bz  ";
	ls_sql+=" FROM jc_jjxcmmx,jdm_xcmlxbm  ";
    ls_sql+=" where jc_jjxcmmx.xcmlxbm=jdm_xcmlxbm.xcmlxbm and ddbh='"+ddbh+"' and zjhsl>0 ";
    ls_sql+=" and xcmxh not in(select xcmxh from jc_xcmzjxmx where zjxxh='"+zjxxh+"')";
    ls_sql+=" order by xcmxh";
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
	String[] keyName={"xcmxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"����ѡ���Ͳ���"};//��ť����ʾ����
	String[] buttonLink={"Jc_jjxcmmxJx.jsp?ddbh="+ddbh+"&zjxxh="+zjxxh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);


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
    <B><font size="2">�Ͳ��ż��������ţ�<%=ddbh%>��</font></B> 
</CENTER>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">�Ͳ������</td>
	<td  width="6%">�Ͳ�������</td>
	<td  width="6%">�Ͳ�������</td>
	<td  width="5%">��װλ��</td>
	<td  width="6%">��*��(mm)</td>
	<td  width="11%">�߿��ͺ�/����/����</td>
	<td  width="5%">�߿���ɫ</td>
	<td  width="11%">���1����/��ɫ</td>
	<td  width="10%">���2����/��ɫ</td>
	<td  width="5%"><span class="STYLE1">�ܼ�-�ۺ�</span></td>
	<td  width="5%"><strong>�ܼ�-��ǰ</strong></td>
	<td  width="27%">��ע</td>
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