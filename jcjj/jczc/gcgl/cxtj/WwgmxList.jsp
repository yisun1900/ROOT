<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���̼���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String px=request.getParameter("px");
	String tjrq=request.getParameter("tjrq");
	String tjrq2=request.getParameter("tjrq2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}

	String ls_sql=null;
%>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="19%">���ݵ�ַ</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">�ʼ�</td>
	<td  width="7%">ǩԼ����</td>
	<td  width="9%">ǩԼ����</td>
	<td  width="7%">��ͬ��������</td>
	<td  width="7%">��ͬ��������</td>
	<td  width="4%">��ͬ����</td>
	<td  width="7%">ʵ��������</td>
	<td  width="7%">ʵ��������</td>
	<td  width="4%">ʵ�ʹ���</td>
	<td  width="4%">��������</td>
	<td  width="6%">Ŀǰ����</td>
</tr>
<%

	//δ���ڿ�����
	ls_sql="SELECT '',khxm, fwdz,sjs,sgdmc sgd,zjxm,qyrq,a.dwmc sbdm,kgrq,jgrq,TRUNC(jgrq-kgrq),sjkgrq,sjjgrq,TRUNC(sjjgrq-sjkgrq),TRUNC((sjjgrq-sjkgrq)-(jgrq-kgrq)) yqts,gcjdmc   ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm ";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_khxx.zt='2'and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";

	ls_sql+=" and jgrq>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and jgrq<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=" and ((jgrq<sjjgrq and crm_khxx.gcjdbm='5') or (crm_khxx.gcjdbm!='5'))";
	ls_sql+=wheresql;
	ls_sql+=" order by "+px;

	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
%> 
</table>
</body>
</html>