<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
	
	ls_sql ="SELECT jc_zcddmx.xh,jc_zcddmx.zsdj,DECODE(jc_zczjxmx.lx,'1','ԭ��','2','����') lx,DECODE(jc_zcddmx.sfzp,'Y','��Ʒ','N','��') sfzp,DECODE(jc_zczjxmx.sxbz,'1','��','2','��д') sxbz,jc_zcddmx.sxhtyy,jc_zcddmx.dwbh,zclbbm,jc_zcddmx.zcbm zcbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'0','��д','1','���ۼ�','2','<font color=\"#FF0000\">������</font>') xzjg,TO_CHAR(jc_zcddmx.zqdj) zqdj,TO_CHAR(jc_zcddmx.dpzk) dpzk,TO_CHAR(jc_zcddmx.dj) dj,TO_CHAR(jc_zcddmx.zdxsj) zdxsj,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl,jc_zczjxmx.zqzjje,jc_zczjxmx.zjje ,jc_zczjxmx.zjycf,jc_zczjxmx.zjqtfy,jc_zczjxmx.zjcxhdje,jc_zcddmx.zjhsl,jc_zcddmx.zjhje,jc_zcddmx.zjhycf,jc_zcddmx.zjhqtfy,jc_zcddmx.zjhcxhdje,cxhdbl||'%' cxhdbl,jc_zczjxmx.zjyjjrje,yjjrbl||'%' yjjrbl,jc_zczjxmx.bz  ";
	ls_sql+=" FROM jc_zczjxmx,jc_zcddmx";
    ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh and jc_zczjxmx.zjxbh='"+zjxbh+"'";
    ls_sql+=" order by jc_zczjxmx.lx,jc_zcddmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_zcddmxMain.jsp?zjxbh="+zjxbh+"&ddbh="+ddbh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"lx","sxbz","sfzp","zcmc","xinghao","gg","xzjg","zsdj","zqdj","dpzk","dj","zdxsj","jldwbm","zjsl","zqzjje","zjje","zjycf","zjqtfy","cxhdbl","zjcxhdje","yjjrbl","zjyjjrje","zclbbm","zcpzwzbm","zcysbm","sxhtyy","zcbm","dwbh","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е�����"};//��ť����ʾ����
	String[] buttonLink={"DeleteJc_zcddmx.jsp?zjxbh="+zjxbh+"&ddbh="+ddbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��������ϸ���������ţ�<%=zjxbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="210%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">����</td>
	<td  width="2%">��д��־</td>
	<td  width="2%">�Ƿ���Ʒ</td>
	<td  width="5%">��������</td>
	<td  width="5%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="3%">ѡ��۸�</td>
	<td  width="3%">���͵���</td>
	<td  width="3%">��ǰ����</td>
	<td  width="2%">�ۿ�</td>
	<td  width="3%">�ۺ󵥼�</td>
	<td  width="3%">��������޼�</td>
	<td  width="2%">������λ</td>
	<td  width="3%" bgcolor="#CC99FF">��������</td>
	<td  width="4%" bgcolor="#CC99FF">��ǰ�������Ϸ�</td>
	<td  width="4%" bgcolor="#CC99FF">�ۺ��������Ϸ�</td>
	<td  width="3%" bgcolor="#CC99FF">����Զ�̷�</td>
	<td  width="3%" bgcolor="#CC99FF">����������</td>
	<td  width="2%">��������</td>
	<td  width="4%" bgcolor="#CC99FF">�����������</td>
	<td  width="2%" bgcolor="#CC99FF">ҵ���������</td>
	<td  width="4%" bgcolor="#CC99FF">����ҵ��������</td>
	<td  width="5%">ϵ��</td>
	<td  width="4%">��װλ��</td>
	<td  width="3%">��ɫ</td>
	<td  width="4%">��д��ͬԭ��</td>
	<td  width="3%">���ı���</td>
	<td  width="4%">��Ʒ��</td>
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