<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String clzt=cf.executeQuery("select clzt from jc_zcysd where ddbh='"+ddbh+"'");
	if (!clzt.equals("00"))
	{
		out.println("<BR>���󣬲����ٽ����޸ģ���ͬ�����");
		return;
	}

	
	ls_sql ="SELECT jc_zcysdmx.xh xh,zclbbm,jc_zcysdmx.zcbm zcbm,zcmc,jc_zcysdmx.xinghao,jc_zcysdmx.gg,zcpzwzbm,jc_zcysdmx.zcysbm,DECODE(xzjg,'0','��д','1','�����޼�','2','<font color=\"#FF0000\">������</font>') xzjg,TO_CHAR(jc_zcysdmx.zqdj) zqdj,TO_CHAR(jc_zcysdmx.dpzk) dpzk,TO_CHAR(jc_zcysdmx.dj) dj,jldwbm,jc_zcysdmx.sl,jc_zcysdmx.zqje,jc_zcysdmx.je,ycf,qtfyje,DECODE(jc_zcysdmx.sfbhpj,'Y','<font color=\"#FF0000\">����</font>','N','����') sfbhpj,jc_zcysdmx.pjts*jc_zcysdmx.sl pjzs, DECODE(jc_zcysdmx.cxhdbz,'Y','<font color=\"#FF0000\">�μ�</font>','N','���μ�') cxhdbz,cxhdbl||'%' cxhdbl,cxhdje,DECODE(jc_zcysdmx.sxbz,'1','��','2','��д') sxbz, jc_zcysdmx.sxhtyy,jc_zcysdmx.bz  ";
	ls_sql+=" FROM jc_zcysdmx  ";
    ls_sql+=" where jc_zcysdmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_zcysdmx.xh,jc_zcysdmx.zcbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_zcddmxMain.jsp?ddbh="+ddbh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"zcbm","sxbz","sxhtyy","zqdj","dpzk","dj","sl","zcmc","xinghao","gg","zcpzwzbm","zcysbm","xzjg","zclbbm","jldwbm","zqje","je","ycf","qtfyje","cxhdbz","cxhdbl","cxhdje","sfbhpj","pjzs","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е�����"};//��ť����ʾ����
	String[] buttonLink={"DeleteJc_zcddmx.jsp?ddbh="+ddbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѡ���ģ�������ţ�<%=ddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="210%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">���ı���</td>
	<td  width="2%">��д��־</td>
	<td  width="5%">��д��ͬԭ��</td>
	<td  width="3%">��ǰ����</td>
	<td  width="2%">�ۿ�</td>
	<td  width="3%">�ۺ󵥼�</td>
	<td  width="3%" bgcolor="#CC99FF">����</td>
	<td  width="6%">��������</td>
	<td  width="5%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="4%" bgcolor="#CC99FF">��װλ��</td>
	<td  width="3%" bgcolor="#CC99FF">��ɫ</td>
	<td  width="3%" bgcolor="#CC99FF">ѡ��۸�</td>
	<td  width="8%">ϵ��</td>
	<td  width="2%">������λ</td>
	<td  width="4%">��ǰ���Ϸ�</td>
	<td  width="4%">�ۺ���Ϸ�</td>
	<td  width="4%">Զ�̷�</td>
	<td  width="4%">������</td>
	<td  width="3%" bgcolor="#CC99FF">�μӴ����</td>
	<td  width="3%" bgcolor="#CC99FF">������������</td>
	<td  width="4%">�����������</td>
	<td  width="2%">�Ƿ�������</td>
	<td  width="2%">�����</td>
	<td  width="11%">��ע</td>
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