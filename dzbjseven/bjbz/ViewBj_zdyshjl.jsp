<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj =new ybl.common.PageObject();
	String ls_sql=null;
	String xmbh=request.getParameter("xmbh");
	String lrr=request.getParameter("lrr");

	ls_sql="SELECT bj_zdyshjl.sqjl,DECODE(bj_zdyshjl.shbz,'N','�������','S','��������','Y',' ���ͨ��','W','δͨ��','C','��������') shbz,bj_zdyshjl.xmbh,bj_zdyshjl.zdyxmlrr,bj_zdyshjl.lrsj,dqmc,bjjbmc,bj_zdyshjl.slr,bj_zdyshjl.slsj,bj_zdyshjl.slsm,DECODE(bj_zdyshjl.sfbxg,'Y','��','N','��'),bj_zdyshjl.shr,bj_zdyshjl.shsj,bj_zdyshjl.shyj";
	ls_sql+=" FROM bj_zdyshjl,dm_dqbm,bdm_bjjbbm   ";
	ls_sql+=" where bj_zdyshjl.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_zdyshjl.dqbm=dm_dqbm.dqbm(+)";
	ls_sql+=" and bj_zdyshjl.xmbh='"+xmbh+"' and bj_zdyshjl.zdyxmlrr='"+lrr+"'";
	ls_sql+=" order by bj_zdyshjl.sqjl";

    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�Զ�����Ŀ��˼�¼</font></B>
</CENTER>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�����¼</td>
	<td  width="3%">��˱�־</td>
	<td  width="5%">��Ŀ���</td>
	<td  width="3%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="3%">����</td>
	<td  width="3%">���ۼ���</td>
	<td  width="2%">������</td>
	<td  width="3%">����ʱ��</td>
	<td  width="16%">����˵��</td>
	<td  width="2%">�Ƿ��޸�</td>
	<td  width="2%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="16%">������</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>

</body>
</html>