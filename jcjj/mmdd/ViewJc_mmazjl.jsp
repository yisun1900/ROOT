<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String wheresql="";
	String yddbh=request.getParameter("yddbh");

	ls_sql="SELECT jc_mmazjl.yddbh,jc_mmazjl.smrq,jdm_zcsmyybm.zcsmyy,jc_mmazjl.azqk,jc_mmazjl.lrr,jc_mmazjl.lrsj  ";
	ls_sql+=" FROM jc_mmazjl,jdm_zcsmyybm  ";
    ls_sql+=" where jc_mmazjl.zcsmyybm=jdm_zcsmyybm.zcsmyybm(+)";
    ls_sql+=" and jc_mmazjl.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_mmazjl.yddbh,jc_mmazjl.smrq";
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
	<td  width="9%">Ԥ�������</td>
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