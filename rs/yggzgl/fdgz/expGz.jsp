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

	ls_sql="SELECT rownum,dwmc,ygbh,bianhao,yhmc,qqts,cqts,glgz,gwgz,jbgz,jtbt,cb,dhbt,yjsxe,jj,qtbt,qtkk,tc,sqgz,ksk,shgz,''";
	ls_sql+=" FROM (";
	ls_sql+=" SELECT dwmc,TO_CHAR(ygbh) ygbh,bianhao,yhmc,qqts,cqts,glgz,gwgz,jbgz,jtbt,mrcb*cqts cb,dhbt,yjsxe,jj,qtbt,qtkk,tc,sqgz,ksk,shgz";
	ls_sql+=" FROM rs_yggzb,sq_dwxx  ";
    ls_sql+=" where rs_yggzb.dwbh=sq_dwxx.dwbh and xh='"+xh+"'";
    ls_sql+=" order by rs_yggzb.dwbh,yhmc";
	ls_sql+=" )";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="7%">��������</td>
	<td  width="4%">Ա�����</td>
	<td  width="5%">����</td>
	<td  width="5%">Ա������</td>
	<td  width="3%">ȫ������</td>
	<td  width="3%">��������</td>
	<td  width="5%">���乤��</td>
	<td  width="5%">��λ����</td>
	<td  width="5%">��н</td>
	<td  width="5%">��ͨ����</td>
	<td  width="4%">�Ͳ�</td>
	<td  width="4%">�绰��</td>
	<td  width="4%">�۱���</td>
	<td  width="5%">����</td>
	<td  width="4%">��������</td>
	<td  width="4%">�����ۿ�</td>
	<td  width="5%">���</td>
	<td  width="5%">˰ǰ����</td>
	<td  width="5%">��˰��</td>
	<td  width="5%">˰����</td>
	<td  width="5%">��ע</td>
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