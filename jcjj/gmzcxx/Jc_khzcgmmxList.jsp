<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT ppgys,zcdlbm,zcxlbm,yj,zhj,dj,ssk,rq,bz  ";
	ls_sql+=" FROM jc_khzcgmmx  ";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by ppgys";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_khzcgmmx.jsp?khbh="+khbh);
	pageObj.setPageRow(500);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","ppgys","zcdlbm","zcxlbm","yj","zhj","dj","ssk","rq","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ppgys"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteJc_khzcgmmx.jsp?khbh="+khbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ͻ����Ĺ�����ϸ���ͻ���ţ�<%=khbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="15%">Ʒ�ƹ�Ӧ������</td>
	<td  width="12%">���Ĵ���</td>
	<td  width="10%">����С��</td>
	<td  width="8%">ԭ��</td>
	<td  width="8%">�ۺ��</td>
	<td  width="7%">����</td>
	<td  width="8%">ʵ�տ�</td>
	<td  width="8%">����</td>
	<td  width="17%">��ע</td>
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