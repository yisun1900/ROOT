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


	ls_sql="SELECT bjjbmc,hxmc,bj_tcbzzcxm.jgwzbm,clxlmc,bj_tcbzzcxm.jldw,DECODE(bj_tcbzzcxm.sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzsl,bj_tcbzzcxm.bzsl,DECODE(bj_tcbzzcxm.sfbxx,'Y','��','N','��') sfbxx,DECODE(bj_tcbzzcxm.sfyxsj,'Y','��','N','��') sfyxsj,tcsjflmc,DECODE(bj_tcbzzcxm.sfyqxtpp,'Y','��','N','��'),DECODE(bj_tcbzzcxm.sfkjm,'1','���ɼ���','2','�ɼ���') sfkjm,jmfl,jmjldw,bj_tcbzzcxm.yxjmzdsl,jmdj,DECODE(bj_tcbzzcxm.sfkgh,'1','���ɻ�','2','�ɻ�') sfkgh,khzdsl,ghzj ";
	ls_sql+=" FROM bj_tcbzzcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm,jxc_clxlbm,bj_tcsjflbm  ";
    ls_sql+=" where bj_tcbzzcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcbzzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tcbzzcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and bj_tcbzzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_tcbzzcxm.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=" and bj_tcbzzcxm.dqbm='"+dqbm+"' ";
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

<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">���ۼ���</td>
	<td  width="6%">����</td>
	<td  width="5%">�ṹλ��</td>
	<td  width="9%">��Ʒ���</td>
	<td  width="4%">������λ</td>
	<td  width="5%">�Ƿ���������</td>
	<td  width="4%">��׼����</td>
	<td  width="4%">�Ƿ��ѡ��</td>
	<td  width="4%">�����Ƿ��շ�</td>
	<td  width="8%">�ײ���������</td>
	<td  width="5%">�Ƿ�Ҫ����ͬƷ��</td>

	<td  width="5%">�Ƿ�ɼ���</td>
	<td  width="8%">�������</td>
	<td  width="4%">���������λ</td>
	<td  width="4%">��������������</td>
	<td  width="6%">���ⵥ��</td>
	<td  width="5%">�Ƿ�ɸ���</td>
	<td  width="4%">�ɻ��������</td>
	<td  width="6%">�����ۼ�</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>