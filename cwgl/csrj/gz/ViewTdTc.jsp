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
	<td  width="5%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="15%">��ַ</td>
	<td  width="7%">�״���ɱ���</td>
	<td  width="7%">�״���ɽ��</td>
	<td  width="7%">��ɽ��</td>
	<td  width="17%">��ע</td>
</tr>
<%
	String ssfgs=request.getParameter("ssfgs");
	String khzq=request.getParameter("khzq");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	ls_sql="SELECT rs_tdtcmx.yhmc,rs_tdtcmx.xzzwbm,dwmc,rs_tdtcmx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,rs_tdtcmx.sctcbl||'%',rs_tdtcmx.sctcje,tcje,rs_tdtcmx.bz  ";
	ls_sql+=" from rs_tdtcmx,sq_dwxx,crm_zxkhxx";
	ls_sql+=" where rs_tdtcmx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and rs_tdtcmx.khbh=crm_zxkhxx.khbh(+)";
	ls_sql+=" and rs_tdtcmx.khzq='"+khzq+"' and rs_tdtcmx.ssfgs='"+ssfgs+"'";
    ls_sql+=" order by rs_tdtcmx.dwbh,rs_tdtcmx.xzzwbm,rs_tdtcmx.ygbh,rs_tdtcmx.khbh";
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