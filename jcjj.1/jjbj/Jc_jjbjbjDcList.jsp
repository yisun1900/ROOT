<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String bcpp=null;
	String bchd=null;
	String dj=null;
	bcpp=request.getParameter("bcpp");
	if (bcpp!=null)
	{
		bcpp=cf.GB2Uni(bcpp);
		if (!(bcpp.equals("")))	wheresql+=" and  (bcpp='"+bcpp+"')";
	}
	bchd=request.getParameter("bchd");
	if (bchd!=null)
	{
		bchd=bchd.trim();
		if (!(bchd.equals("")))	wheresql+=" and (bchd="+bchd+") ";
	}
	dj=request.getParameter("dj");
	if (dj!=null)
	{
		dj=dj.trim();
		if (!(dj.equals("")))	wheresql+=" and  (dj="+dj+") ";
	}
	ls_sql="SELECT '',bcpp,bclx,bchd,dj  ";
	ls_sql+=" FROM jc_jjbjbj  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by bcpp,bclx,bchd";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="33%">���Ʒ��</td>
	<td  width="33%">�������</td>
	<td  width="15%">��ĺ�ȣ�mm��</td>
	<td  width="15%">����</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
%> 
</table>

</body>
</html>