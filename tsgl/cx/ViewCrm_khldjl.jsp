<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String tsjlh=request.getParameter("tsjlh");
	String ls_sql=null;
%>
<body bgcolor="#FFFFFF">
<div align="center">�ͻ������¼</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">Ͷ�߱��޼�¼��</td>
	<td  width="17%">�ͻ�����ʱ��</td>
	<td  width="11%">�ͻ����</td>
	<td  width="61%">��ע</td>
</tr>

<%
	ls_sql="SELECT tsjlh,khldsj,khbh,bz";
	ls_sql+=" FROM crm_khldjl ";
    ls_sql+=" where tsjlh='"+tsjlh+"'";
    ls_sql+=" order by khldsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>



</body>
</html>
