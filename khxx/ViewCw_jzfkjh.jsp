<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj =new ybl.common.PageObject();

	String ls_sql=null;

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT cw_jzfkjh.fkjhxh,cw_jzfkjh.fkcs,cw_jzfkjh.yfksj,cw_jzfkjh.yfkbl,cw_jzfkjh.yfkje,cw_jzfkjh.lrr,cw_jzfkjh.lrsj,dwmc,cw_jzfkjh.bz  ";
	ls_sql+=" FROM cw_jzfkjh,sq_dwxx  ";
    ls_sql+=" where cw_jzfkjh.lrbm=sq_dwxx.dwbh(+) and cw_jzfkjh.khbh='"+khbh+"'";
    ls_sql+=" order by cw_jzfkjh.fkjhxh";
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
  <B><font size="3">��װ����ƻ�</font></B>
</CENTER>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">����ƻ����</td>
	<td  width="8%">��װ��������</td>
	<td  width="10%">Ӧ����ʱ��</td>
	<td  width="10%">Ӧ�������</td>
	<td  width="10%">Ӧ������</td>
	<td  width="8%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="14%">¼�벿��</td>
	<td  width="20%">��ע</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%> 

</table>
</body>
</html>