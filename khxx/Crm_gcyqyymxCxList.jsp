<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;

	String khbh=request.getParameter("khbh");



	ls_sql="SELECT gcyqyymc,yqts";
	ls_sql+=" FROM crm_gcyqyymx,dm_gcyqyybm";
    ls_sql+=" where crm_gcyqyymx.gcyqyybm=dm_gcyqyybm.gcyqyybm";
    ls_sql+=" and crm_gcyqyymx.khbh='"+khbh+"' and crm_gcyqyymx.lx='1'";
    ls_sql+=" order by crm_gcyqyymx.gcyqyybm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��������ԭ����ϸ���ͻ���ţ�<%=khbh%>��</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="65%">��������ԭ��</td>
	<td  width="35%">��������</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%> 
</table>

</body>
</html>