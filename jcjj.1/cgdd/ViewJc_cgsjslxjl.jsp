<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<center>�������ʦ��ϵ�ͻ���¼</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">��¼��</td>
	<td  width="10%">�������</td>
	<td  width="8%">�������ʦ</td>
	<td  width="10%">�ƻ�����ʱ��</td>
	<td  width="10%">��ϵ���</td>
	<td  width="8%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="34%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	ls_sql="select jlh,ddbh,cgsjs,jhclsj,DECODE(clzt,'03','δȷ��','05','ȷ��ʱ��'),lrr,lrsj,bz";
	ls_sql+=" from jc_cgsjslxjl ";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" order by jlh";
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>
</body>
</html>
