<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String gtxh=request.getParameter("gtxh");

	ls_sql="SELECT TO_CHAR(bjxh) bjxh,ddbh,bjmc,bcpp,TO_CHAR(bchd),TO_CHAR(bzdj),TO_CHAR(khdj),cd||'*'||kd,sl,zjhsl,je,bz  ";
	ls_sql+=" FROM jc_gtbjmx  ";
    ls_sql+=" where gtxh='"+gtxh+"'";
    ls_sql+=" order by bjxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_gtbjmxMain.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.setEditBolt("");//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"bjxh","gtxh","ddbh","bjmc","bcpp","bchd","bzdj","khdj","cd","kd","sl","zjhsl","je","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"bjxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"���ư��","ɾ�����"};//��ť����ʾ����
	String[] buttonLink={"CopyJc_gtbjmx.jsp?gtxh="+gtxh,"DeleteJc_gtbjmx.jsp?gtxh="+gtxh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1,0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��������ϸ��������ţ�<%=gtxh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="4%">������</td>
	<td  width="7%">�������</td>
	<td  width="7%">�������</td>
	<td  width="11%">�������</td>
	<td  width="6%">��ĺ��</td>
	<td  width="6%">��׼����</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="8%">��*��(mm)</td>
	<td  width="6%">��ͬ����</td>
	<td  width="6%">����������</td>
	<td  width="9%">���</td>
	<td  width="16%">��ע</td>
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