<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT jc_cpjjzjxmx.cpjjbh,DECODE(jc_cpjjzjxmx.lx,'1','������','2','������') lx,jc_cpjjzjxmx.ysl,jc_cpjjzjxmx.xsl,TO_CHAR(jc_cpjjddmx.khdj) khdj,TO_CHAR(jc_cpjjddmx.bzdj) bzdj,cpjjmc,xh,gg,cpjjcz,cpjjhs,bz  ";
	ls_sql+=" FROM jc_cpjjddmx,jc_cpjjzjxmx  ";
    ls_sql+=" where jc_cpjjddmx.cpjjbh=jc_cpjjzjxmx.cpjjbh and jc_cpjjddmx.ddbh=jc_cpjjzjxmx.ddbh and jc_cpjjzjxmx.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by jc_cpjjzjxmx.lx,jc_cpjjzjxmx.cpjjbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_cpjjddmxMain.jsp?zjxxh="+zjxxh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//	pageObj.setEditBolt("");//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"cpjjbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��������"};//��ť����ʾ����
	String[] buttonLink={"DeleteJc_cpjjddmx.jsp?ddbh="+ddbh+"&zjxxh="+zjxxh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform">
<CENTER >
    <B><font size="2">��Ʒ�Ҿ���������ϸ����������ţ�<%=zjxxh%>��</font></B> 
</CENTER>
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="5%">��Ʒ�Ҿ߱��</td>
	<td  width="5%">����</td>
	<td  width="5%">ԭ����</td>
	<td  width="5%">������</td>
	<td  width="5%">�ۺ󵥼�</td>
	<td  width="5%">��ǰ����</td>
	<td  width="8%">�Ҿ�����</td>
	<td  width="7%">�ͺ�</td>
	<td  width="11%">���(mm)</td>
	<td  width="11%">����</td>
	<td  width="11%">��ɫ����</td>
	<td  width="16%">��ע</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
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