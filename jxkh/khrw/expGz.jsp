<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ssfgs=request.getParameter("ssfgs");

	ls_sql=" SELECT sq_yhxx.ygbh,dwmc,sq_yhxx.bianhao,sq_yhxx.yhmc,sq_yhxx.xzzwbm,DECODE(gzlb,'1','�̶�����','2','��������'),khyj,khgz,jbgz,gwgz,glgz,jtbt,dhbt,cb,buzhu,DECODE(rs_ygjbgzb.txbz,'Y','��','N','��'),rs_ygjbgzb.bz";
	ls_sql+=" FROM rs_ygjbgzb,sq_yhxx,sq_dwxx";
    ls_sql+=" where sq_yhxx.ygbh=rs_ygjbgzb.ygbh(+) and sq_yhxx.dwbh=sq_dwxx.dwbh(+) and sq_yhxx.ssfgs='"+ssfgs+"'";
    ls_sql+=" and sq_yhxx.sfzszg in('N','Y')";
    ls_sql+=" order by sq_yhxx.dwbh,yhmc";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(20000);

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">Ա�����</td>
	<td  width="9%">��������</td>
	<td  width="7%">����</td>
	<td  width="7%">Ա������</td>
	<td  width="9%">����ְ��</td>
	<td  width="5%">�������</td>
	<td  width="5%">����ҵ��</td>
	<td  width="5%">��Ч���ʻ���</td>
	<td  width="5%">��������</td>
	<td  width="5%">��λ����</td>
	<td  width="5%">���乤��</td>
	<td  width="5%">��ͨ����</td>
	<td  width="5%">ͨѶ����</td>
	<td  width="5%">��������</td>
	<td  width="5%">��������</td>
	<td  width="3%">ͣн��־</td>
	<td  width="11%">��ע</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</table>

</body>
</html>