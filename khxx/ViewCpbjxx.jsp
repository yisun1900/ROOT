<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">��Ʒ������Ϣ </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="16%">��Ŀ����</td>
	<td  width="6%">��������</td>
	<td  width="6%">������λ</td>
	<td  width="5%">����</td>
	<td  width="6%">�ܼ�</td>
	<td  width="6%">¼����</td>
	<td  width="9%">¼��ʱ��</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT crm_cpbjb.xmmc as crm_cpbjb_xmmc,crm_gmcpmx.gmsl as crm_gmcpmx_gmsl,crm_gmcpmx.jldw as crm_gmcpmx_jldw,TO_CHAR(crm_gmcpmx.dj) as crm_gmcpmx_dj,crm_gmcpmx.zj as crm_gmcpmx_zj,crm_gmcpmx.lrr as crm_gmcpmx_lrr,crm_gmcpmx.lrsj as crm_gmcpmx_lrsj  ";
	ls_sql+=" FROM crm_cpbjb,crm_gmcpmx";
    ls_sql+=" where crm_gmcpmx.xmbh=crm_cpbjb.xmbh ";
    ls_sql+=" and crm_gmcpmx.khbh='"+khbh+"'";
    ls_sql+=" order by crm_gmcpmx.khbh,crm_gmcpmx.xmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%>
</table>
</body>
</html>
