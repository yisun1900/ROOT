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


	ls_sql="SELECT bjjbmc,hxmc,bj_tcbzzcxm.jgwzbm,clxlmc,DECODE(bj_tcbzzcxm.sfxzsl,'1','������','2','��������','3','������') sfxzsl,bj_tcbzzcxm.bzsl,bj_tcbzzcxm.ccbfjj,DECODE(bj_tcbzzcxm.sfbxx,'Y','��','N','��') sfbxx,DECODE(bj_tcbzzcxm.sfyxsj,'Y','��','N','��') sfyxsj,tcsjflmc,DECODE(bj_tcbzzcxm.sfyqxtpp,'Y','��','N','��') ";
	ls_sql+=" FROM bj_tcbzzcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm,jxc_clxlbm,bj_tcsjflbm  ";
    ls_sql+=" where bj_tcbzzcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcbzzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tcbzzcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and bj_tcbzzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_tcbzzcxm.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=" and bj_tcbzzcxm.bjbbh='"+bjbbh+"' and bj_tcbzzcxm.dqbm='"+dqbm+"'";
    ls_sql+=" order by bj_tcbzzcxm.bjjbbm,bj_tcbzzcxm.hxbm,bj_tcbzzcxm.jgwzbm,bj_tcbzzcxm.tccplbbm";
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
	<td  width="9%">���ۼ���</td>
	<td  width="9%">����</td>
	<td  width="10%">�ṹλ��</td>
	<td  width="16%">��Ʒ���</td>
	<td  width="6%">�Ƿ���������</td>
	<td  width="8%">��׼����</td>
	<td  width="8%">�������ּӼ�</td>
	<td  width="6%">�Ƿ��ѡ��</td>
	<td  width="6%">�����Ƿ��շ�</td>
	<td  width="16%">�ײ���������</td>
	<td  width="6%">�Ƿ�Ҫ����ͬƷ��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>