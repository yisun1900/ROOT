<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;



	
	ls_sql ="SELECT jc_zcddmx.xinghao,jc_zcddmx.gg,zclbbm,jc_zcddmx.zcbm zcbm,zcmc,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'0','��д','1','�����޼�','2','<font color=\"#FF0000\">������</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj,jldwbm,jc_zcddmx.sl,jc_zcddmx.je,ycf,qtfyje,DECODE(jc_zcddmx.sfbhpj,'Y','<font color=\"#FF0000\">����</font>','N','����') sfbhpj,jc_zcddmx.pjts*jc_zcddmx.sl pjzs, DECODE(jc_zcddmx.cxhdbz,'Y','<font color=\"#FF0000\">�μ�</font>','N','���μ�') cxhdbz,cxhdbl||'%' cxhdbl,cxhdje,DECODE(jc_zcddmx.sxbz,'1','����д','2','��д') sxbz, jc_zcddmx.sxhtyy,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx  ";
    ls_sql+=" order by jc_zcddmx.xh,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_zcddmxMain.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��



%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѡ����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="400%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">�ͺ�</td>
	<td  width="5%">���</td>
	<td  width="3%">����</td>
	<td  width="3%" bgcolor="#CC99FF">����</td>
	<td  width="8%">ϵ��</td>
	<td  width="7%">��������</td>
	<td  width="3%">���ı���</td>
	<td  width="3%">��д��־</td>
	<td  width="5%">��д��ͬԭ��</td>
	<td  width="4%" bgcolor="#CC99FF">��װλ��</td>
	<td  width="4%" bgcolor="#CC99FF">��ɫ</td>
	<td  width="4%" bgcolor="#CC99FF">ѡ��۸�</td>
	<td  width="3%">������λ</td>
	<td  width="5%">���Ϸ�</td>
	<td  width="4%">Զ�̷�</td>
	<td  width="4%">������</td>
	<td  width="3%" bgcolor="#CC99FF">�μӴ����</td>
	<td  width="4%" bgcolor="#CC99FF">������������</td>
	<td  width="4%">�����������</td>
	<td  width="3%">�Ƿ�������</td>
	<td  width="3%">�����</td>
	<td  width="10%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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