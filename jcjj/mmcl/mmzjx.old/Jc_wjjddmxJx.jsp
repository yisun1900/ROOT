<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yddbh=request.getParameter("yddbh");
	String zjxxh=request.getParameter("zjxxh");

	String ls_sql=null;

	ls_sql="SELECT DECODE(lx,'1','��ͬ��','2','����') lx,TO_CHAR(lrxh) lrxh,jc_wjjddmx.yddbh as yddbh,jc_wjjddmx.xh as xh,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_wjjbj.xinghao as jc_wjjbj_xinghao,dwmc,TO_CHAR(jc_wjjddmx.dj) as jc_wjjddmx_dj,jc_wjjddmx.sl as jc_wjjddmx_sl,jc_wjjddmx.dj*jc_wjjddmx.sl je,jc_wjjddmx.bz as jc_wjjddmx_bz  ";
	ls_sql+=" FROM jc_wjjddmx,jdm_wjjbm,sq_dwxx  ";
    ls_sql+=" where jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm and jc_wjjbj.xh=jc_wjjddmx.xh and jc_wjjbj.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and jxbz='N' ";
	ls_sql+=" and jc_wjjddmx.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_wjjddmx.yddbh,jc_wjjddmx.lrxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"lrxh","lx","jdm_wjjbm_wjjmc","jc_wjjbj_xinghao","dwmc","jc_wjjddmx_dj","jc_wjjddmx_sl","je","jc_wjjddmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"����"};//��ť����ʾ����
	String[] buttonLink={"SaveJc_wjjddmxJx.jsp?yddbh="+yddbh+"&zjxxh="+zjxxh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��������ţ�<%=yddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">���</td>
	<td  width="6%">����</td>
	<td  width="12%">��������</td>
	<td  width="20%">�ͺ�</td>
	<td  width="10%">��Ӧ��</td>
	<td  width="6%">����</td>
	<td  width="7%">��������</td>
	<td  width="8%">�ܽ��</td>
	<td  width="20%">��ע</td>
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