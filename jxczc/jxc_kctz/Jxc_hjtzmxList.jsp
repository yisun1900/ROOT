<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String tzph=request.getParameter("tzph");

	ls_sql="select tzxh,clbm,clmc,ppmc,xh,nbbm,scph,tzsl,ylsh,a.hjmc yhjbh,b.hjmc xhjbh,yhwbh,xlsh,xhwbh";
	ls_sql+=" FROM jxc_hjtzmx,jxc_hjmc a,jxc_hjmc b ";
	ls_sql+=" where jxc_hjtzmx.yhjbh=a.hjbh(+) and jxc_hjtzmx.xhjbh=b.hjbh(+)";
	ls_sql+=" and tzph='"+tzph+"'";
	ls_sql+=" order by tzxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJxc_hjtzmx.jsp?tzph="+tzph);
	pageObj.setPageRow(1000);

/*
//������ʾ��
	String[] disColName={"tzph","tzxh","clbm","zljb","tzsl","dchj","dchw","drhj","drhw"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"tzxh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteJxc_hjtzmx.jsp?tzph="+tzph};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���</td>
	<td  width="7%">���ϱ���</td>
	<td  width="10%">��������</td>
	<td  width="7%">��Ʒ��</td>
	<td  width="10%">�ͺ�</td>
	<td  width="7%">�ڲ�����</td>
	<td  width="7%">��������</td>
	<td  width="5%">��������</td>
	<td  width="7%">ԭ��ˮ��</td>
	<td  width="9%">ԭ����</td>
	<td  width="9%">�»���</td>
	<td  width="6%">ԭ��λ</td>
	<td  width="7%">����ˮ��</td>
	<td  width="6%">�»�λ</td>
</tr>
<%
	pageObj.displayDate();
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