<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String bjbbh=null;
	String dqbm=null;

	bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
	dqbm=request.getParameter("dqbm");


	ls_sql="SELECT bjjbmc,hxmc,tc_bzgcxm.xmbh,bj_jzbjb.xmmc,DECODE(tc_bzgcxm.sfxzsl,'1','������','2','��������','3','������') sfxzsl,tc_bzgcxm.bzsl,tc_bzgcxm.ccbfjj ";
	ls_sql+=" FROM tc_bzgcxm,bdm_bjjbbm,bj_jzbjb,dm_hxbm  ";
    ls_sql+=" where tc_bzgcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_bzgcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tc_bzgcxm.bjbbh=bj_jzbjb.bjbbh(+) and tc_bzgcxm.dqbm=bj_jzbjb.dqbm(+) and tc_bzgcxm.bjjbbm=bj_jzbjb.bjjbbm(+) and tc_bzgcxm.xmbh=bj_jzbjb.xmbh(+)";
    ls_sql+=" and tc_bzgcxm.bjbbh='"+bjbbh+"' and tc_bzgcxm.dqbm='"+dqbm+"'";
    ls_sql+=" order by tc_bzgcxm.bjjbbm,tc_bzgcxm.hxbm,tc_bzgcxm.xmbh";
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
	<td  width="10%">���ۼ���</td>
	<td  width="15%">����</td>
	<td  width="15%">��Ŀ���</td>
	<td  width="30%">��Ŀ����</td>
	<td  width="10%">�Ƿ���������</td>
	<td  width="10%">��׼����</td>
	<td  width="10%">�������ּӼ�</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>