<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">�˵���Ϣ </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�˵����</td>
	<td  width="15%">�˵�ԭ��</td>
	<td  width="30%">�˵�ԭ��˵��</td>
	<td  width="7%">Ӧ�˽��</td>
	<td  width="7%">ʵ�˽��</td>
	<td  width="7%">�Ƿ�ȯ</td>
	<td  width="7%">�Ƿ�����֤</td>
	<td  width="7%">�˵�ʱ��</td>
	<td  width="7%">¼��ʱ��</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT tdxh,dm_tdyybm.tdyymc,tdyysm,crm_tddj.ytje,crm_tddj.stje,DECODE(sffj,'Y','��','N','��'),DECODE(sfyrz,'Y','��','N','��'),tdsj,lrsj  ";
	ls_sql+=" FROM crm_tddj,dm_tdyybm,sq_sgd  ";
    ls_sql+=" where crm_tddj.tdyybm=dm_tdyybm.tdyybm and crm_tddj.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_tddj.khbh='"+khbh+"'";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>
</body>
</html>
