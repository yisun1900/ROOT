<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT jc_jjxcmmx.xcmxh,DECODE(jc_xcmzjxmx.ysl-jc_xcmzjxmx.xsl,1,'����',-1,'����+'),jc_jjxcmmx.zj,jc_jjxcmmx.zqzj,xcmlxmc,jc_jjxcmmx.xcmmc,jc_jjxcmmx.azwz,jc_jjxcmmx.gd||'*'||jc_jjxcmmx.kd gg,jc_jjxcmmx.bklxxh,jc_jjxcmmx.bkys,jc_jjxcmmx.mbcl1,jc_jjxcmmx.mbcl2,jc_jjxcmmx.bz  ";
	ls_sql+=" FROM jc_jjxcmmx,jc_xcmzjxmx,jdm_xcmlxbm  ";
    ls_sql+=" where jc_jjxcmmx.xcmlxbm=jdm_xcmlxbm.xcmlxbm and jc_jjxcmmx.xcmxh=jc_xcmzjxmx.xcmxh and jc_xcmzjxmx.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by jc_xcmzjxmx.lx,jc_xcmzjxmx.xcmxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_jjxcmmxMain.jsp?zjxxh="+zjxxh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//	pageObj.setEditBolt("");//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"xcmxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��������"};//��ť����ʾ����
	String[] buttonLink={"DeleteJc_jjxcmmx.jsp?ddbh="+ddbh+"&zjxxh="+zjxxh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform">
<CENTER >
    <B><font size="2">�Ͳ�����ϸ����������ţ�<%=zjxxh%>��</font></B> 
</CENTER>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="6%">�Ͳ������</td>
	<td  width="4%">��־</td>
	<td  width="5%"><span class="STYLE1">�ܼ�-�ۺ�</span></td>
	<td  width="5%"><strong>�ܼ�-��ǰ</strong></td>
	<td  width="6%">�Ͳ�������</td>
	<td  width="6%">�Ͳ�������</td>
	<td  width="6%">��װλ��</td>
	<td  width="6%">��*��(mm)</td>
	<td  width="11%">�߿��ͺ�/����/����</td>
	<td  width="5%">�߿���ɫ</td>
	<td  width="11%">���1����/��ɫ</td>
	<td  width="11%">���2����/��ɫ</td>
	<td  width="13%">��ע</td>
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