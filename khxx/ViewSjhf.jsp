<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">����طü�¼ </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ط����</td>
	<td  width="9%">�طý��</td>
	<td  width="27%">�ط�����</td>
	<td  width="11%">�ط�ʱ��</td>
	<td  width="6%">�ط���</td>
	<td  width="10%">��������</td>
	<td  width="8%">����״̬</td>
	<td  width="22%">��ز��Ŵ������</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	

	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT crm_sjhfjl.hfjlh ,jglxmc,hfsm,crm_sjhfjl.hfsj,crm_sjhfjl.hfr,sq_dwxx.dwmc,DECODE(clzt,'0','���账��','Y','�Ѵ���','N','δ����'),xwtclqk";
	ls_sql+=" FROM crm_sjhfjl,sq_dwxx,crm_sjhffkbm,dm_jglxbm   ";
    ls_sql+=" where crm_sjhffkbm.dwbh=sq_dwxx.dwbh(+)and crm_sjhfjl.jglxbm=dm_jglxbm.jglxbm(+)";
    ls_sql+=" and crm_sjhfjl.hfjlh=crm_sjhffkbm.hfjlh(+) and crm_sjhfjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_sjhfjl.hfjlh";
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
