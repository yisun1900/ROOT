<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="pageObject" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String) session.getAttribute("dwbh");

	String ls_sql=null;
	ls_sql="SELECT thjlh,cpbm,thdw,thj,DECODE(thbz,0,'����',1,'���'),thrq,czy ";
	ls_sql+=" FROM dm_thjl  ";
    ls_sql+=" WHERE shbz='1' and xsdw='"+dwbh+"'";
    pageObject.sql=ls_sql;
//���ж����ʼ��
	pageObject.initPage("","","ydthrk.jsp","");
/*
//������ʾ��
	String[] disColName={"thjlh","cpbm","thdw","thj","thbz","thrq","czy"};
	pageObject.setDisColName(disColName);
*/

//��������
	String[] keyName={"thjlh","cpbm"};
	pageObject.setKey(keyName);
	pageObject.setPageRow(10000);
	pageObject.setViewStr("���");
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObject.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObject.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObject.out=out;
	pageObject.getDate(1);
	pageObject.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%" height="2">&nbsp;</td>
		<td  width="12%" height="2">�˻���¼��</td>
		<td  width="12%" height="2">��Ʒ����</td>
		<td  width="16%" height="2">�˻���λ</td>
		<td  width="12%" height="2">�˻����</td>
		<td  width="12%" height="2">����˻�</td>
		<td  width="12%" height="2">�˻�����</td>
		<td  width="12%" height="2">����Ա</td>
</tr>
<%
	pageObject.printDate();
	pageObject.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObject.printScript();
%> 
//-->
</script>
</html>