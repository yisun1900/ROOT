<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String dqbm=null;

	dqbm=request.getParameter("dqbm");


	ls_sql="SELECT bjjbmc,hxmc,tckd_tcjgb.fwmj,tckd_tcjgb.tcmc,tckd_tcjgb.tcjg,tckd_tcjgb.pmzjdj,tckd_tcjgb.tlgbzjj,tckd_tcjgb.dbhddzjj  ";
	ls_sql+=" FROM tckd_tcjgb,bdm_bjjbbm,dm_hxbm  ";
    ls_sql+=" where tckd_tcjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckd_tcjgb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tckd_tcjgb.dqbm='"+dqbm+"'";
    ls_sql+=" order by tckd_tcjgb.bjjbbm,tckd_tcjgb.hxbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="13%">���ۼ���</td>
	<td  width="13%">����</td>
	<td  width="10%">���ڻ�׼���</td>
	<td  width="13%">�ײ�����</td>
	<td  width="10%">�ײͼ۸�</td>
	<td  width="10%">ƽ�����ӵ���</td>
	<td  width="10%">Ϳ�ϻ���ֽ�շ�</td>
	<td  width="10%">�ذ廻���ש�շ�</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>