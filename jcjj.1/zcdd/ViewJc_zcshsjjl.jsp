<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">�ͻ�ʱ���޸ļ�¼</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">�������</td>
	<td  width="10%">�ͻ�����</td>
	<td  width="10%">��ͬ��</td>
	<td  width="10%">�ƻ��ͻ�ʱ��</td>
	<td  width="40%">�ͻ�֪ͨ˵��</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="10%">¼����</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String ddbh=request.getParameter("ddbh");
	String ls_sql=null;

	ls_sql="SELECT jc_zcshsjjl.ddbh,khxm,hth,jhshsj,shtzsm,jc_zcshsjjl.lrsj,jc_zcshsjjl.lrr";
	ls_sql+=" FROM jc_zcshsjjl,crm_khxx  ";
    ls_sql+=" where jc_zcshsjjl.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_zcshsjjl.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_zcshsjjl.jhshsj";
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
