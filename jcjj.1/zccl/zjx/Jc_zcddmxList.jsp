<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxbh=request.getParameter("zjxbh");
	
	ls_sql ="SELECT jc_zcddmx.xh xh,DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����') lx,DECODE(jc_zcddmx.sfzp,'Y','��Ʒ','N','��') sfzp,DECODE(jc_zcddmx.sxbz,'1','����д','2','��д') sxbz,jc_zcddmx.sxhtyy,zclbbm,jc_zcddmx.zcbm zcbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'0','��д','1','���ۼ�','2','<font color=\"#FF0000\">������</font>') xzjg,TO_CHAR(jc_zcddmx.zqdj) zqdj,TO_CHAR(jc_zcddmx.dpzk) dpzk,TO_CHAR(jc_zcddmx.dj) dj,jldwbm,jc_zcddmx.zjhsl,jc_zcddmx.zjhje,zjhycf,zjhqtfy,zjhcxhdje,jc_zcddmx.sl,jc_zcddmx.je,ycf,qtfyje,DECODE(jc_zcddmx.sfbhpj,'Y','����','N','����') sfbhpj,jc_zcddmx.pjts*jc_zcddmx.zjhsl pjzs, DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�') cxhdbz,cxhdbl||'%' cxhdbl,cxhdje,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx  ";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' ";
    ls_sql+=" and jc_zcddmx.xh not in(select xh from jc_zczjxmx where zjxbh='"+zjxbh+"')";
    ls_sql+=" order by jc_zcddmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"zcbm","lx","sfzp","zcmc","zclbbm","xinghao","gg","jldwbm","xzjg","zqdj","dpzk","dj","cxhdbz","cxhdbl","zjhsl","zjhje","zjhycf","zjhqtfy","zjhcxhdje","sl","je","ycf","qtfyje","cxhdje","pjzs","zcpzwzbm","zcysbm","sxbz","sxhtyy","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ѡ����Ŀ"};//��ť����ʾ����
	String[] buttonLink={"ChooseZjx.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����[�ѹ���]��Ŀ���������ţ�<%=zjxbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="260%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">���ı���</td>
	<td  width="2%">����</td>
	<td  width="2%">�Ƿ���Ʒ</td>
	<td  width="4%">��������</td>
	<td  width="5%">ϵ��</td>
	<td  width="4%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="3%">������λ</td>
	<td  width="3%" bgcolor="#CC99FF">ѡ��۸�</td>
	<td  width="3%">��ǰ����</td>
	<td  width="3%">�ۿ�</td>
	<td  width="3%">�ۺ󵥼�</td>
	<td  width="3%">�μӴ����</td>
	<td  width="3%">�������</td>
	<td  width="3%" bgcolor="#CC99FF">����������</td>
	<td  width="4%" bgcolor="#CC99FF">��������Ϸ�</td>
	<td  width="3%" bgcolor="#CC99FF">������Զ�̷�</td>
	<td  width="3%" bgcolor="#CC99FF">������������</td>
	<td  width="4%" bgcolor="#CC99FF">����������������</td>
	<td  width="3%">��ͬ����</td>
	<td  width="4%">��ͬ���Ϸ�</td>
	<td  width="3%">��ͬԶ�̷�</td>
	<td  width="3%">��ͬ������</td>
	<td  width="4%">��ͬ�������</td>
	<td  width="2%">�����</td>
	<td  width="3%">��װλ��</td>
	<td  width="3%">��ɫ</td>
	<td  width="2%">��д��־</td>
	<td  width="4%">��д��ͬԭ��</td>
	<td  width="6%">��ע</td>
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