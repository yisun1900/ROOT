<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yddbh=request.getParameter("yddbh");
	String zjxxh=request.getParameter("zjxxh");
	String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");

	String ls_sql=null;

	ls_sql="SELECT TO_CHAR(jc_blddmx.lrxh) lrxh,jc_blddmx.yddbh as yddbh,jc_blddmx.blxhbm as blxhbm,blxh,TO_CHAR(jc_blddmx.bzdj) bzdj,TO_CHAR(jc_blddmx.dj) as jc_blddmx_dj,jc_blzjxmx.ysl,jc_blzjxmx.xsl,jc_blddmx.bz as jc_blddmx_bz  ";
	ls_sql+=" FROM jc_blddmx,jc_blzjxmx  ";
    ls_sql+=" where jc_blddmx.lrxh=jc_blzjxmx.lrxh";
	ls_sql+=" and jc_blzjxmx.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by jc_blddmx.yddbh,jc_blddmx.lrxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_blddmxMain.jsp?zjxxh="+zjxxh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"lrxh","blxh","bzdj","jc_blddmx_dj","ysl","xsl","jc_blddmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteZxJc_blddmx.jsp?zjxxh="+zjxxh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����������ϸ��Ԥ������ţ�<%=yddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="5%">���</td>
	<td  width="30%">�����ͺ�</td>
	<td  width="10%">��ǰ����</td>
	<td  width="10%">�ۺ󵥼�</td>
	<td  width="8%" bgcolor="#99CCFF">ԭ����</td>
	<td  width="8%" bgcolor="#99CCFF">������</td>
	<td  width="30%">��ע</td>
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