<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj= new ybl.common.PageObject();
	String ls_sql=null;
	String pdph=request.getParameter("pdph");

	ls_sql=" SELECT pdxh,hjmc,jxc_kcpdmx.scph,jxc_kcpdmx.scrq,clbm,clmc,xh,gg,ppmc,nbbm,kczcpsl,pdzcpsl,zcppdcyl,DECODE(pdjg,'1','<font color=blue>��ӯ</font>','2','<font color=red>�̿�</font>','3','��ƽ') pdjg ";
	ls_sql+=" from  jxc_kcpdmx,jxc_hjmc ";
	ls_sql+=" where  jxc_kcpdmx.hjbh=jxc_hjmc.hjbh(+) ";
	ls_sql+=" and pdph="+pdph;
	ls_sql+=" order by pdxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"pdph","pdxh","dqbm","ckbh","hjbh","hwbh","clbm","zljb","kcsl","pdsl"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pdxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteJxc_kcpdmx.jsp?pdph="+pdph};//��ť�������õ���ҳ���������Ӳ���
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
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">���</td>
	<td  width="8%">����</td>
	<td  width="7%">��������</td>
	<td  width="7%">��������</td>
	<td  width="9%">���ϱ���</td>
	<td  width="13%">��������</td>
	<td  width="9%">�ͺ�</td>
	<td  width="8%">���</td>
	<td  width="8%">Ʒ��</td>
	<td  width="6%">�ڲ�����</td>
	<td  width="5%">�������</td>
	<td  width="5%">ʵ������</td>
	<td  width="5%">�̵������</td>
	<td  width="5%">�̵���</td>
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