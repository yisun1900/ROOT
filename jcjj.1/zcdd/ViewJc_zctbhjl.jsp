<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">�˲�����¼</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�������</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="8%">��ͬ��</td>
	<td  width="8%">Լ���˲���ʱ��</td>
	<td  width="8%">���˲���֪ͨʱ��</td>
	<td  width="6%">���˲���֪ͨ��</td>
	<td  width="8%">�˲���֪ͨ��Ա</td>
	<td  width="8%">ʵ�˲���ʱ��</td>
	<td  width="8%">ʵ�˲�����</td>
	<td  width="32%">�˲������</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String ddbh=request.getParameter("ddbh");
	String ls_sql=null;

	ls_sql="SELECT jc_zctbhjl.ddbh,khxm,hth,jhtbhsj,jc_zctbhjl.tztbhsj,jc_zctbhjl.tztbhr,tbhtzry,stbhsj,stbhr,tbhqk";
	ls_sql+=" FROM jc_zctbhjl,crm_khxx  ";
    ls_sql+=" where jc_zctbhjl.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_zctbhjl.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_zctbhjl.jhtbhsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>
</body>
</html>
