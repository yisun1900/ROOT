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


	ls_sql="SELECT bjjbmc,hxmc,tc_csrjbzgcxm.jgwzbm,clxlmc,tc_csrjbzgcxm.jldw,DECODE(tc_csrjbzgcxm.sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzsl,tc_csrjbzgcxm.bzsl,DECODE(tc_csrjbzgcxm.sfbxx,'Y','��','N','��') sfbxx,DECODE(tc_csrjbzgcxm.sfyxsj,'Y','��','N','��') sfyxsj,tcsjflmc,DECODE(tc_csrjbzgcxm.sfyqxtpp,'Y','��','N','��'),DECODE(tc_csrjbzgcxm.sfkjm,'1','���ɼ���','2','�ɼ���') sfkjm,jmfl,jmjldw,tc_csrjbzgcxm.yxjmzdsl,jmdj,DECODE(tc_csrjbzgcxm.sfkgh,'1','���ɻ�','2','�ɻ�') sfkgh,khzdsl,ghzj ";
	ls_sql+=" FROM tc_csrjbzgcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm,jxc_clxlbm,bj_tcsjflbm  ";
    ls_sql+=" where tc_csrjbzgcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_csrjbzgcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_csrjbzgcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tc_csrjbzgcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tc_csrjbzgcxm.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=" and tc_csrjbzgcxm.dqbm='"+dqbm+"' ";
    ls_sql+=" order by tc_csrjbzgcxm.bjjbbm,tc_csrjbzgcxm.hxbm,tc_csrjbzgcxm.jgwzbm,tc_csrjbzgcxm.tccplbbm";
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