<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">Ա������</td>
	<td  width="7%">����ְ��</td>
	<td  width="8%">��������</td>
	<td  width="7%">��ɻ���</td>
	<td  width="7%">��ɱ���</td>
	<td  width="7%">��ɽ��</td>
	<td  width="17%">��ע</td>
</tr>
<%
	String ssfgs=request.getParameter("ssfgs");
	String khzq=request.getParameter("khzq");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	ls_sql="SELECT rs_zctcmx.yhmc,rs_zctcmx.xzzwbm,dwmc,rs_zctcmx.tcjs,rs_zctcmx.tcbl||'%',tcje,rs_zctcmx.bz  ";
	ls_sql+=" from rs_zctcmx,sq_dwxx";
	ls_sql+=" where rs_zctcmx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and rs_zctcmx.khzq='"+khzq+"' and rs_zctcmx.ssfgs='"+ssfgs+"'";
    ls_sql+=" order by rs_zctcmx.dwbh,rs_zctcmx.xzzwbm,rs_zctcmx.ygbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>