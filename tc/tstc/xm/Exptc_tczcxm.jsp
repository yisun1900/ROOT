<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String bjjbbm=null;
	String dqbm=null;

	bjjbbm=request.getParameter("bjjbbm");
	dqbm=request.getParameter("dqbm");


	ls_sql="SELECT jxc_cldlbm.cldlmc,jxc_clxlbm.clxlmc,tcsjflmc,DECODE(tc_tczcxm.sfbxx,'Y','��','N','��') sfbxx,DECODE(tc_tczcxm.sfyxsj,'Y','��','N','��') sfyxsj,DECODE(tc_tczcxm.sfyqxtpp,'Y','��','N','��') sfyqxtpp,tc_tczcxm.jldw,DECODE(tc_tczcxm.sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzsl,tc_tczcxm.bzsl,DECODE(tc_tczcxm.sfkjm,'1','���ɼ���','2','�ɼ���') sfkjm,yxjmzdsl,jmdj,DECODE(tc_tczcxm.sfkgh,'1','���ɻ�','2','�ɻ�') sfkgh,khzdsl,ghzj ";
	ls_sql+=" FROM tc_tczcxm,dm_dqbm,bdm_bjjbbm,jxc_cldlbm,jxc_clxlbm,bdm_tcsjflbm  ";
    ls_sql+=" where tc_tczcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_tczcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and tc_tczcxm.tccpdlbm=jxc_cldlbm.cldlbm(+)";
    ls_sql+=" and tc_tczcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tc_tczcxm.tcsjflbm=bdm_tcsjflbm.tcsjflbm(+)";
    ls_sql+=" and tc_tczcxm.bjjbbm='"+bjjbbm+"' and tc_tczcxm.dqbm='"+dqbm+"'";
    ls_sql+=" order by tc_tczcxm.tccpdlbm,tc_tczcxm.tccplbbm";
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
	<td  width="9%">��Ʒ����</td>
	<td  width="9%">��ƷС��</td>
	<td  width="9%">�ײ���������</td>
	<td  width="6%">�Ƿ��ѡ��</td>
	<td  width="6%">�����Ƿ��շ�</td>
	<td  width="6%">�Ƿ�Ҫ����ͬƷ��</td>
	<td  width="5%">������λ</td>
	<td  width="8%">�Ƿ���������</td>
	<td  width="6%">��׼����</td>
	<td  width="6%">�Ƿ�ɼ���</td>
	<td  width="6%">��������������</td>
	<td  width="6%">���ⵥ��</td>
	<td  width="6%">�Ƿ�ɸ���</td>
	<td  width="6%">�ɻ��������</td>
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