<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String gysbm=request.getParameter("gysbm");

	ls_sql="SELECT sq_gyslxr.lxrxm,sq_gyslxr.zw,sq_gyslxr.sj,sq_gyslxr.bgdh,sq_gyslxr.cz, DECODE(sq_gyslxr.sflz,'Y','��','N','��') as sflz,sq_gyslxr.bz  ";
	ls_sql+=" FROM sq_gyslxr  ";
    ls_sql+=" where sq_gyslxr.gysbm='"+gysbm+"' ";
    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("","","","EditSq_gyslxr.jsp?gysbm="+gysbm);
	pageObj.setPageRow(2000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"lxrxm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteSq_gyslxr.jsp?gysbm="+gysbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ϵ����Ϣ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="10%">��ϵ������</td>
	<td  width="10%">ְ��</td>
	<td  width="14%">�ֻ�</td>
	<td  width="20%">�칫�绰</td>
	<td  width="12%">����</td>
	<td  width="6%">�Ƿ���ְ</td>
	<td  width="22%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>