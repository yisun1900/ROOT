<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String xh=request.getParameter("xh");

	ls_sql="SELECT dwmc,ygbh,bianhao,yhmc,xzzwbm,cqts,sjts,bjts  ,jxfz  ,jbf,yjsxe  ,tc,jf,cjkk  ,qtkk  ,rs_yggzb.bz  ";
	ls_sql+=" FROM rs_yggzb,sq_dwxx  ";
    ls_sql+=" where rs_yggzb.dwbh=sq_dwxx.dwbh and xh='"+xh+"'";
    ls_sql+=" order by rs_yggzb.dwbh,yhmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">��������</td>
	<td  width="5%">Ա�����</td>
	<td  width="8%">����</td>
	<td  width="7%">Ա������</td>
	<td  width="8%">����ְ��</td>
	<td  width="5%">ʵ�ʳ�������</td>
	<td  width="5%">�¼�����</td>
	<td  width="5%">��������</td>

	<td  width="5%">��Ч��ֵ</td>


	<td  width="5%">�Ӱ��</td>
	<td  width="5%">�۱���</td>

	<td  width="5%">���</td>
	<td  width="5%">����</td>
	<td  width="5%">���ٿۿ�</td>

	<td  width="5%">��������</td>

	<td  width="12%">��ע</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
	pageObj.printSum();
%> 
</table>

</body>
</html>