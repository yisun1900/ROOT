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


	ls_sql="SELECT bjjbmc,fgmc,hxmc,tckd_tcfgzcxm.jgwzbm,clxlmc,tckd_tcfgzcxm.jldw,tckd_tcfgzcxm.bzsl,nbbm,bz ";
	ls_sql+=" FROM tckd_tcfgzcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm,jxc_clxlbm  ";
    ls_sql+=" where tckd_tcfgzcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckd_tcfgzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckd_tcfgzcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tckd_tcfgzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tckd_tcfgzcxm.dqbm='"+dqbm+"'";
    ls_sql+=" order by tckd_tcfgzcxm.bjjbbm,fgmc,tckd_tcfgzcxm.hxbm,tckd_tcfgzcxm.jgwzbm,tckd_tcfgzcxm.tccplbbm,nbbm";
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

<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">���ۼ���</td>
	<td  width="6%">�������</td>
	<td  width="6%">����</td>
	<td  width="5%">�ṹλ��</td>
	<td  width="9%">��Ʒ���</td>
	<td  width="5%">������λ</td>
	<td  width="6%">��׼����</td>
	<td  width="6%">�����ڲ�����</td>
	<td  width="46%">��ע</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>