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


	ls_sql="SELECT bjjbmc,hxmc,tckb_bpzcxm.jgwzbm,tckb_bpzcxm.kbwlbm,tckb_bpzcxm.kbcpbm,tckb_zck.cpmc,tckb_zck.xh,tckb_bpzcxm.jldw,tckb_bpzcxm.sl,tckb_bpzcxm.dj,DECODE(tckb_bpzcxm.sfkth,'Y','���滻','N','��') sfkth,DECODE(tckb_bpzcxm.sfksc,'Y','��ɾ��','N','��') sfksc,tckb_bpzcxm.bz ";
	ls_sql+=" FROM tckb_bpzcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm,tckb_zck ";
    ls_sql+=" where tckb_bpzcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckb_bpzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckb_bpzcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tckb_bpzcxm.kbwlbm=tckb_zck.kbwlbm(+)";
    ls_sql+=" and tckb_bpzcxm.dqbm='"+dqbm+"'";
    ls_sql+=" order by tckb_bpzcxm.bjjbbm,bjbbh,tckb_bpzcxm.hxbm,tckb_bpzcxm.jgwzbm,tckb_bpzcxm.kbcpbm,kbwlbm";
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
	<td  width="6%">����</td>
	<td  width="5%">�ṹλ��</td>
	<td  width="6%">�Ʊ����ϱ���</td>
	<td  width="9%">�Ʊ���Ʒ����</td>
	<td  width="12%">��Ʒ����</td>
	<td  width="12%">�ͺ�</td>
	<td  width="5%">������λ</td>
	<td  width="6%">��������</td>
	<td  width="8%">����</td>
	<td  width="7%">�Ƿ���滻</td>
	<td  width="7%">�Ƿ��ɾ��</td>
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