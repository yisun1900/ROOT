<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String tsjlh=null;
	tsjlh=request.getParameter("tsjlh");

	ls_sql="SELECT TO_CHAR(lrxh) lrxh,wxrgf,wxcf,wxclf,wxzfy,zrfcdfy,sqyzfy,gscdfy,qtfcdfy,DECODE(sfksj,'Y','��','N','��'),DECODE(jsbz,'N','δ����','Y','�ѽ���'),jsjlh,lrr,lrsj,fysm ";
	ls_sql+=" FROM crm_wxfmx ";
    ls_sql+=" where tsjlh='"+tsjlh+"'";
    ls_sql+=" order by lrxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditCrm_wxfmx.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCrm_wxfmx.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ά�޷���ϸ�����޼�¼�ţ�<%=tsjlh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="4%">¼�����</td>
	<td  width="6%">ά���˹���</td>
	<td  width="6%">ά�޳���</td>
	<td  width="6%">ά�޲��Ϸ�</td>
	<td  width="7%">ά���ܷ���</td>

	<td  width="6%">ʩ���ӳе�����</td>
	<td  width="6%">ҵ���е�����</td>
	<td  width="6%">��˾�е�����</td>
	<td  width="6%">�������е�����</td>
	<td  width="5%">�Ƿ��վ�</td>
	<td  width="5%">�����־</td>
	<td  width="7%">�����¼��</td>

	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="12%">����˵��</td>
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