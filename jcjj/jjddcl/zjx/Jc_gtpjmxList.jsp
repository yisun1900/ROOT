<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String gtxh=request.getParameter("gtxh");
	String zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT TO_CHAR(pjxh) pjxh,ddbh,gtpjmc,xinghao,guige,jldwmc,TO_CHAR(bzdj),sl,zqje,bz  ";
	ls_sql+=" FROM jc_gtpjmx,jdm_jldwbm  ";
    ls_sql+=" where jc_gtpjmx.jldwbm=jdm_jldwbm.jldwbm(+) and gtxh='"+gtxh+"'";
    ls_sql+=" order by pjxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_gtpjmxMain.jsp?zjxxh="+zjxxh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.setEditBolt("");//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"pjxh","ddbh","gtxh","gtpjbh","gtpjmc","xinghao","guige","bzdj","khdj","sl","zjhsl","je","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pjxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ�����"};//��ť����ʾ����
	String[] buttonLink={"DeleteJc_gtpjmx.jsp?gtxh="+gtxh+"&zjxxh="+zjxxh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���������ϸ����������ţ�<%=zjxxh%>��������ţ�<%=gtxh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="5%">������</td>
	<td  width="7%">�������</td>
	<td  width="12%">�������</td>
	<td  width="11%">�ͺ�</td>
	<td  width="10%">���</td>
	<td  width="6%">������λ</td>
	<td  width="7%">����</td>
	<td  width="6%">��ͬ����</td>
	<td  width="9%">���</td>
	<td  width="19%">��ע</td>
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