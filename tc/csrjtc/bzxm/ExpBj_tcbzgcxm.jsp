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

	bjbbh=request.getParameter("bjbbh");
	dqbm=request.getParameter("dqbm");


	ls_sql="SELECT bjjbmc,hxmc,tc_csrjbzgcxm.xmbh,bj_jzbjb.xmmc,DECODE(tc_csrjbzgcxm.sfxzsl,'1','������','2','��������','3','������') sfxzsl,tc_csrjbzgcxm.bzsl,tc_csrjbzgcxm.ccbfjj ";
	ls_sql+=" FROM tc_csrjbzgcxm,bdm_bjjbbm,bj_jzbjb,dm_hxbm  ";
    ls_sql+=" where tc_csrjbzgcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_csrjbzgcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tc_csrjbzgcxm.bjbbh=bj_jzbjb.bjbbh(+) and tc_csrjbzgcxm.dqbm=bj_jzbjb.dqbm(+) and tc_csrjbzgcxm.bjjbbm=bj_jzbjb.bjjbbm(+) and tc_csrjbzgcxm.xmbh=bj_jzbjb.xmbh(+)";
    ls_sql+=" and tc_csrjbzgcxm.bjbbh='"+bjbbh+"' and tc_csrjbzgcxm.dqbm='"+dqbm+"'";
    ls_sql+=" order by tc_csrjbzgcxm.bjjbbm,tc_csrjbzgcxm.hxbm,tc_csrjbzgcxm.xmbh";
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