<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");

	String ls_sql=null;

	ls_sql="SELECT cw_gckkjl.kkjlh,crm_khxx.khxm,sgdmc,cw_gckkjl.gckk,cw_gckkjl.spgckk,cw_gckkjl.sgdfy,cw_gckkjl.spsgdfy,cw_gckkjl.lrr,cw_gckkjl.lrsj, DECODE(cw_gckkjl.spbz,'2','δ����','3','����ͨ��','4','����δͨ��'), DECODE(cw_gckkjl.jsbz,'N','δ����','Y','�ѽ���'),cw_gckkjl.jsjlh,cw_gckkjl.bz  ";
	ls_sql+=" FROM crm_khxx,cw_gckkjl,sq_sgd  ";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and cw_gckkjl.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_gckkjl.khbh='"+khbh+"'";
    ls_sql+=" order by cw_gckkjl.kkjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"kkjlh"};
	pageObj.setKey(keyName);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���̿ۿ�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�ۿ��¼��</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="6%">ʩ����</td>
	<td  width="7%">���̿ۿ�</td>
	<td  width="7%">�����󹤳̿ۿ�</td>
	<td  width="7%">ʩ���ӳе�����</td>
	<td  width="7%">������ʩ���ӳе�����</td>
	<td  width="6%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="6%">������־</td>
	<td  width="6%">�����־</td>
	<td  width="7%">�����¼��</td>
	<td  width="26%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>