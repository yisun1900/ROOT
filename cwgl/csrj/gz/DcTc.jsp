<%@ page contentType="application/vnd.ms-excel;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">Ա�����</td>
	<td  width="4%">����</td>
	<td  width="4%">Ա������</td>
	<td  width="4%">����ְ��</td>
	<td  width="4%">����</td>
	<td  width="6%">��������</td>
	<td  width="4%">ǩ����ɽ��</td>
	<td  width="4%">������ɽ��</td>
	<td  width="4%">�˵���ɽ��</td>
	<td  width="4%">��Ʒ���ɽ��</td>
	<td  width="4%">������ɽ��</td>
	<td  width="4%">��������</td>
	<td  width="4%">Ӧ�����</td>
	<td  width="4%">���ʱ���</td>
	<td  width="4%">�۸�˰</td>
	<td  width="4%">ʵ�����</td>
	<td  width="4%">��ע</td>
</tr>
<%
	String ssfgs=request.getParameter("ssfgs");
	String khzq=request.getParameter("khzq");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	ls_sql="SELECT ygbh,bianhao,yhmc,xzzwbm,zwmc,dwmc,qdtcje,jstcje,tdtcje,sjftcje,zctcje,qtkk,yftc,kzbj,ksk,sftc,rs_tcmxb.bz  ";
	ls_sql+=" from rs_tcmxb,sq_dwxx,dm_zwbm";
	ls_sql+=" where rs_tcmxb.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and rs_tcmxb.zwbm=dm_zwbm.zwbm(+)";
	ls_sql+=" and rs_tcmxb.khzq='"+khzq+"' and rs_tcmxb.ssfgs='"+ssfgs+"'";
    ls_sql+=" order by rs_tcmxb.dwbh,rs_tcmxb.xzzwbm,rs_tcmxb.ygbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
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