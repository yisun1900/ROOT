<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT bj_sfxmmx.khbh,bj_sfxmmx.sfxmbm,sfxmmc,DECODE(bj_sfxmmx.sflx,'1','�ٷֱ�','2','�̶����') sflx,bj_sfxmmx.sfbfb||'%' sfbfb,bj_sfxmmx.sfje,bj_sfxmmx.bz";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditBj_sfxmmx.jsp?khbh="+khbh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"khbh","sfxmmc","sflx","sfbfb","sfje","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"sfxmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteBj_sfxmmx.jsp?khbh="+khbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����շ���Ŀ��ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="10%">�ͻ����</td>
	<td  width="15%">�շ���Ŀ</td>
	<td  width="10%">�շ�����</td>
	<td  width="10%">�շѰٷֱ�</td>
	<td  width="15%">�շѽ��</td>
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