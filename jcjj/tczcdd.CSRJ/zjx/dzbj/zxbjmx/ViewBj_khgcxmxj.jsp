<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT bj_khgcxmxj.xmbh,bj_bjxmmx.xmmc,DECODE(bj_khgcxmxj.sfxzsl,'1','��������Ӽ�','2','��������','3','������'),bj_khgcxmxj.bzsl,bj_khgcxmxj.sjsl,bj_khgcxmxj.xjjsl,bj_khgcxmxj.ccbfjj,bj_khgcxmxj.ccbfjj*xjjsl,DECODE(bj_khgcxmxj.tcnxmbz,'Y','�ײ���','N','��')";
	ls_sql+=" FROM bj_khgcxmxj,bj_bjxmmx  ";
    ls_sql+=" where bj_khgcxmxj.khbh=bj_bjxmmx.khbh and bj_khgcxmxj.xmbh=bj_bjxmmx.xmbh and bj_khgcxmxj.khbh='"+khbh+"'";
    ls_sql+=" order by bj_khgcxmxj.xmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ͻ�������ĿС��
  </font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">��Ŀ���</td>
	<td  width="30%">��Ŀ����</td>
	<td  width="10%">�Ƿ���������</td>
	<td  width="8%">��׼����</td>
	<td  width="8%">ʵ������</td>
	<td  width="8%">��Ӽ�����</td>
	<td  width="8%">�������ּӼ�</td>
	<td  width="10%">�Ӽ۽��</td>
	<td  width="8%">�ײ�����Ŀ</td>
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