<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String wheresql="";
	String ddbh=request.getParameter("ddbh");

	ls_sql="SELECT jc_cgazjl.ddbh,jc_cgazjl.smrq,jdm_zcsmyybm.zcsmyy,jc_cgazjl.azqk,jc_cgazjl.lrr,jc_cgazjl.lrsj  ";
	ls_sql+=" FROM jc_cgazjl,jdm_zcsmyybm  ";
    ls_sql+=" where jc_cgazjl.zcsmyybm=jdm_zcsmyybm.zcsmyybm(+)";
    ls_sql+=" and jc_cgazjl.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_cgazjl.ddbh,jc_cgazjl.smrq";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��װ��¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">�������</td>
	<td  width="11%">��������</td>
	<td  width="10%">�ٴ�����ԭ��</td>
	<td  width="51%">��װ���</td>
	<td  width="8%">¼����</td>
	<td  width="11%">¼��ʱ��</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
</html>