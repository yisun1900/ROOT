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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<center>�Ҿ����ʦ���ɼ�¼</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">�������</td>
	<td  width="8%">�����ʦ</td>
	<td  width="8%">ԭ���ʦ</td>
	<td  width="24%">���ʦ����ԭ��</td>
	<td  width="32%">�����ʦ˵��</td>
	<td  width="8%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	ls_sql="SELECT ddbh,jjsjs,yjjsjs,sjsgpyymc,pdsm,lrr,lrsj";
	ls_sql+=" FROM jc_jjsjsgpjl,jdm_sjsgpyybm";
	ls_sql+=" where jc_jjsjsgpjl.sjsgpyybm=jdm_sjsgpyybm.sjsgpyybm";
	ls_sql+=" and jc_jjsjsgpjl.ddbh='"+ddbh+"'";
	ls_sql+=" order by jc_jjsjsgpjl.lrsj desc";
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
