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


	ls_sql="SELECT distinct bjjbmc,fgmc,hxmc,jgwzbm,tckd_tcfggcxm.xmbh,bj_jzbjb.xmmc,tckd_tcfggcxm.bzsl";
	ls_sql+=" FROM tckd_tcfggcxm,bdm_bjjbbm,bj_jzbjb,dm_hxbm  ";
    ls_sql+=" where tckd_tcfggcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckd_tcfggcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tckd_tcfggcxm.dqbm=bj_jzbjb.dqbm(+) and tckd_tcfggcxm.bjjbbm=bj_jzbjb.bjjbbm(+) and tckd_tcfggcxm.xmbh=bj_jzbjb.xmbh(+)";
    ls_sql+=" and tckd_tcfggcxm.dqbm='"+dqbm+"'";
    ls_sql+=" order by  bjjbmc,fgmc,hxmc,jgwzbm,tckd_tcfggcxm.xmbh";
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
	<td  width="15%">�������</td>
	<td  width="15%">����</td>
	<td  width="15%">�ṹλ��</td>
	<td  width="15%">��Ŀ���</td>
	<td  width="30%">��Ŀ����</td>
	<td  width="10%">��׼����</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>