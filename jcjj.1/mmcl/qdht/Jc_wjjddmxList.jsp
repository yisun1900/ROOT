<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yddbh=request.getParameter("yddbh");
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	ls_sql="SELECT TO_CHAR(lrxh) lrxh,wjmc,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_wjjddmx.xinghao,mmsbsmc,TO_CHAR(jc_wjjddmx.bzdj) bzdj,TO_CHAR(jc_wjjddmx.dj) as dj,jc_wjjddmx.sl,jc_wjjddmx.bzdj*jc_wjjddmx.sl zqje,jc_wjjddmx.dj*jc_wjjddmx.sl zhje,jc_wjjddmx.bz  ";
	ls_sql+=" FROM jc_wjjddmx,jdm_wjjbm,jdm_mmsbsbm  ";
    ls_sql+=" where jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm  ";
    ls_sql+=" and jc_wjjddmx.yddbh='"+yddbh+"' and jc_wjjddmx.lx='1'";
    ls_sql+=" and jc_wjjddmx.mmsbsbm=jdm_mmsbsbm.mmsbsbm(+)";
	ls_sql+=" order by jc_wjjddmx.yddbh,jc_wjjddmx.lrxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_wjjddmxMain.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteJc_wjjddmx.jsp?yddbh="+yddbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����������ϸ�������ţ�<%=yddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="4%">���</td>
	<td  width="18%">�������</td>
	<td  width="8%">������</td>
	<td  width="15%">�ͺ�</td>
	<td  width="9%">������</td>
	<td  width="5%">��ǰ����</td>
	<td  width="5%">�ۺ󵥼�</td>
	<td  width="5%">��������</td>
	<td  width="6%">��ǰ�ܽ��</td>
	<td  width="6%">�ۺ��ܽ��</td>
	<td  width="12%">��ע</td>
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