<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;

	String khbh=request.getParameter("khbh");



	ls_sql="SELECT a.sgdmc oldsgd,b.sgdmc newsgd,c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,lrsj,lrr,hsgdyy";
	ls_sql+=" FROM pd_hsgdjl,sq_sgd a,sq_sgd b,dm_gcyszxmbm c,dm_gcyszxmbm d  ";
    ls_sql+=" where pd_hsgdjl.oldsgd=a.sgd and pd_hsgdjl.newsgd=b.sgd";
    ls_sql+=" and pd_hsgdjl.ybysxmbm=c.gcyszxmbm(+) and pd_hsgdjl.zqysxmbm=d.gcyszxmbm(+)";
    ls_sql+=" and pd_hsgdjl.khbh='"+khbh+"'";
    ls_sql+=" order by pd_hsgdjl.lrsj";
//	out.println(ls_sql);
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
  <B><font size="3">��ʩ���Ӽ�¼</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">ԭʩ����</td>
	<td  width="5%">��ʩ����</td>
	<td  width="7%">���ι�������</td>
	<td  width="7%">��������</td>
	<td  width="7%">����ʱ��</td>
	<td  width="5%">������</td>
	<td  width="30%">��ʩ����˵��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>