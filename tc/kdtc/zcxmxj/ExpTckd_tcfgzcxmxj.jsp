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


	ls_sql="SELECT bjjbmc,tckd_tcfgzcxmxj.fgmc,hxmc,tckd_tcfgzcxmxj.jgwzbm,clxlmc,tckd_tcfgzcxmxj.jldw,DECODE(tckd_tcfgzcxmxj.sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzsl,tckd_tcfgzcxmxj.bzsl,DECODE(tckd_tcfgzcxmxj.sfbxx,'Y','��','N','��') sfbxx,DECODE(tckd_tcfgzcxmxj.sfyxsj,'Y','��','N','��') sfyxsj,sjfl,DECODE(tckd_tcfgzcxmxj.sjjjfs,'1','����','2','������') sjjjfs,DECODE(tckd_tcfgzcxmxj.sfyqxtpp,'Y','��','N','��'),DECODE(tckd_tcfgzcxmxj.sfkjm,'1','���ɼ���','2','�ɼ���') sfkjm,jmfl,jmjldw,tckd_tcfgzcxmxj.yxjmzdsl,jmdj";
	ls_sql+=" FROM tckd_tcfgzcxmxj,dm_dqbm,bdm_bjjbbm,dm_hxbm,jxc_clxlbm  ";
    ls_sql+=" where tckd_tcfgzcxmxj.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckd_tcfgzcxmxj.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckd_tcfgzcxmxj.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tckd_tcfgzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tckd_tcfgzcxmxj.dqbm='"+dqbm+"' ";
    ls_sql+=" order by tckd_tcfgzcxmxj.bjjbbm,tckd_tcfgzcxmxj.fgmc,tckd_tcfgzcxmxj.hxbm,tckd_tcfgzcxmxj.jgwzbm,tckd_tcfgzcxmxj.tccplbbm";
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
	<td  width="6%">�������</td>
	<td  width="6%">����</td>
	<td  width="5%">�ṹλ��</td>
	<td  width="9%">��Ʒ���</td>
	<td  width="4%">������λ</td>
	<td  width="5%">�Ƿ���������</td>
	<td  width="4%">��׼����</td>
	<td  width="4%">�Ƿ��ѡ��</td>
	<td  width="4%">�����Ƿ��շ�</td>
	<td  width="8%">�ײ���������</td>
	<td  width="4%">�����Ƽ۷�ʽ</td>
	<td  width="5%">�Ƿ�Ҫ����ͬƷ��</td>

	<td  width="5%">�Ƿ�ɼ���</td>
	<td  width="8%">�������</td>
	<td  width="4%">���������λ</td>
	<td  width="4%">��������������</td>
	<td  width="6%">���ⵥ��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>