<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";

	String dqbm=request.getParameter("dqbm");//��������


	ls_sql="SELECT cldlbm,clxlbm,nbbm,clmc,xh,gg,jldwbm,TO_CHAR(jxc_cljgb.cbj),TO_CHAR(jxc_cljgb.dfgsjg),TO_CHAR(jxc_cljgb.dgzjg),'' ";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb,dm_dqbm  ";
    ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
    ls_sql+=" and jxc_cljgb.dqbm=dm_dqbm.dqbm";
    ls_sql+=" and jxc_clbm.cllb='1'";//0�����ģ�1������
    ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"'";
    ls_sql+=wheresql;
    ls_sql+=" order by cldlbm,clxlbm,clmc,jxc_clbm.clbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���ϴ���</td>
	<td  width="4%">����С��</td>
	<td  width="3%">�ڲ�����</td>
	<td  width="6%">��������</td>
	<td  width="4%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="4%">������λ</td>
	<td  width="3%">�ɱ���</td>
	<td  width="3%">�ֹ�˾��</td>
	<td  width="3%">���Ӽ�</td>
	<td  width="3%">�¼۸���Чʱ��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>
</body>
</html>