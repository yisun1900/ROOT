<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
	
	ls_sql ="SELECT jc_zcddmx.xh xh,DECODE(jc_zczjxmx.lx,'1','ԭ��Ŀ','2','����') lx,DECODE(jc_zczjxmx.sxbz,'1','����д','2','��д') sxbz,jc_zcddmx.sxhtyy,jc_zcddmx.dwbh,zclbbm,jc_zcddmx.zcbm zcbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'0','��д','1','�����޼�','2','<font color=\"#FF0000\">������</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj,DECODE(jc_zcddmx.jsfs,'1','�����','2','�������') jsfs,TO_CHAR(jc_zcddmx.jsbl)||'%' jsbl,TO_CHAR(jc_zcddmx.cbj) cbj,round(jc_zcddmx.cbj*jc_zczjxmx.zjsl,2) jsje,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl,jc_zczjxmx.zjje ,jc_zczjxmx.zjycf,jc_zczjxmx.zjqtfy,jc_zczjxmx.zjcxhdje,jc_zcddmx.zjhsl,jc_zcddmx.zjhje,jc_zcddmx.zjhycf,jc_zcddmx.zjhqtfy,jc_zcddmx.zjhcxhdje,cxhdbl||'%' cxhdbl,jc_zczjxmx.bz  ";
	ls_sql+=" FROM jc_zczjxmx,jc_zcddmx";
    ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh and jc_zczjxmx.zjxbh='"+zjxbh+"'";
//    ls_sql+=" and jc_zczjxmx.lx='2' and jc_zczjxmx.sxbz='2'";//1������д��2����д
    ls_sql+=" order by jc_zczjxmx.lx,jc_zcddmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","LrjsjEditJc_zcddmx.jsp?zjxbh="+zjxbh+"&ddbh="+ddbh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"lx","sxbz","zcmc","xinghao","gg","xzjg","dj","jsfs","jsbl","cbj","jsje","jldwbm","cxhdbl","zjsl","zjje","zjycf","zjqtfy","zjcxhdje","zjhsl","zjhje","zjhycf","zjhqtfy","zjhcxhdje","zclbbm","zcpzwzbm","zcysbm","sxhtyy","zcbm","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����д��ͬ��¼�����ۣ��������ţ�<%=zjxbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="210%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">����</td>
	<td  width="3%">��д��־</td>
	<td  width="5%">��������</td>
	<td  width="5%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="3%">ѡ��۸�</td>
	<td  width="3%">����</td>
	<td  width="2%">���㷽ʽ</td>
	<td  width="2%">�������</td>
	<td  width="3%">���㵥��</td>
	<td  width="3%">������</td>
	<td  width="2%">������λ</td>
	<td  width="3%">��������</td>
	<td  width="3%" bgcolor="#CC99FF">��������</td>
	<td  width="3%" bgcolor="#CC99FF">�������Ϸ�</td>
	<td  width="3%" bgcolor="#CC99FF">����Զ�̷�</td>
	<td  width="3%" bgcolor="#CC99FF">����������</td>
	<td  width="3%" bgcolor="#CC99FF">�����������</td>
	<td  width="3%">ԭ����</td>
	<td  width="3%">ԭ���Ϸ�</td>
	<td  width="3%">ԭԶ�̷�</td>
	<td  width="3%">ԭ������</td>
	<td  width="3%">ԭ�������</td>
	<td  width="5%">ϵ��</td>
	<td  width="4%">��װλ��</td>
	<td  width="3%">��ɫ</td>
	<td  width="4%">��д��ͬԭ��</td>
	<td  width="3%">���ı���</td>
	<td  width="65%">��ע</td>
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