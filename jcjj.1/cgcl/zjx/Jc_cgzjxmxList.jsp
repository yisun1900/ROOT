<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String zjxxh=null;
	zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT TO_CHAR(xh) xh,DECODE(lx,'1','����','2','̨��','3','���','4','����'),zjxm,zjsl,TO_CHAR(zqdj),TO_CHAR(dj),zqzjje,zjje,bz  ";
	ls_sql+=" FROM jc_cgzjxmx  ";
    ls_sql+=" where zjxxh="+zjxxh;
    ls_sql+=" order by xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_cgzjxmx.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteJc_cgzjxmx.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">������������ϸ����������ţ�<%=zjxxh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="6%">���</td>
	<td  width="6%">����</td>
	<td  width="20%">������Ŀ</td>
	<td  width="7%">��������</td>
	<td  width="7%">��ǰ����</td>
	<td  width="7%">�ۺ󵥼�</td>
	<td  width="9%">��ǰ�������</td>
	<td  width="9%">�ۺ��������</td>
	<td  width="21%">��ע</td>
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