<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String dqbm=request.getParameter("dqbm");
	String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));


	ls_sql="SELECT bjjbmc,hxmc,tckb_tcjgb.fwmj,tckb_tcjgb.tcmc,tckb_tcjgb.tcjg,tckb_tcjgb.cpjg,tckb_tcjgb.sgjg,tckb_tcjgb.jjjg,tckb_tcjgb.pmzjdj  ";
	ls_sql+=" FROM tckb_tcjgb,bdm_bjjbbm,dm_hxbm  ";
    ls_sql+=" where tckb_tcjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckb_tcjgb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tckb_tcjgb.dqbm='"+dqbm+"'";
    ls_sql+=" and tckb_tcjgb.bjbbh='"+bjbbh+"'";
    ls_sql+=" order by tckb_tcjgb.bjjbbm,tckb_tcjgb.hxbm";
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
	<td  width="10%">������</td>
	<td  width="13%">�ײ�����</td>
	<td  width="10%">�ײ��ܼ�</td>
	<td  width="10%">��Ʒ�����</td>
	<td  width="10%">ʩ�������</td>
	<td  width="10%">�Ҿ������</td>
	<td  width="10%">ƽ�����ӵ���</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>