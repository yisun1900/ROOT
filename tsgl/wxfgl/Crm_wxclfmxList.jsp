<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String tsjlh=null;
	tsjlh=request.getParameter("tsjlh");

	ls_sql="SELECT TO_CHAR(lrxh) lrxh,clmc,sl,TO_CHAR(dj) dj,clf,llr,llsj,lrr,lrsj,bz  ";
	ls_sql+=" FROM crm_wxclfmx  ";
    ls_sql+=" where tsjlh='"+tsjlh+"'";
    ls_sql+=" order by lrxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditCrm_wxclfmx.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"lrxh","tsjlh","sxcl","clf","llr","llsj","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCrm_wxclfmx.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ά�޲��Ϸ���ϸ�����޼�¼�ţ�<%=tsjlh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="6%">¼�����</td>
	<td  width="17%">��������</td>
	<td  width="6%">����</td>
	<td  width="7%">����</td>
	<td  width="9%">���Ϸ�</td>
	<td  width="6%">������</td>
	<td  width="8%">����ʱ��</td>
	<td  width="6%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="58%">��ע</td>
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