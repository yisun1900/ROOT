<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ppbm=request.getParameter("ppbm");
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">Ʒ�ƹ�Ӧ�̱��</td>
	<td  width="16%">Ʒ�ƹ�Ӧ������</td>
	<td  width="5%">ÿ�հ�װ��������</td>
	<td  width="5%">��Ӧ�����</td>
	<td  width="9%">����С��</td>
	<td  width="5%">Ʒ�Ʊ���</td>
	<td  width="11%">Ʒ������</td>
	<td  width="5%">��Ӧ�̱���</td>
	<td  width="16%">��Ӧ������</td>
	<td  width="6%">��������</td>
	<td  width="17%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	ls_sql="SELECT sq_gysxx.gysbh,sq_gysxx.gysmc,mrazhs,DECODE(sq_gysxx.gyslb,'1','ľ��','2','����','3','�Ҿ�','4','����') gyslb,zclb,sq_gysxx.ppbm,sq_gysxx.ppmc,sq_gysxx.gysbm,sq_gysxx.gys,dm_dqbm.dqmc, sq_gysxx.bz  ";
	ls_sql+=" FROM dm_dqbm,sq_gysxx  ";
    ls_sql+=" where sq_gysxx.dqbm=dm_dqbm.dqbm ";
    ls_sql+=" and sq_gysxx.ppbm='"+ppbm+"'";
	ls_sql+=" order by sq_gysxx.dqbm,sq_gysxx.gyslb,sq_gysxx.zclb";
//	out.println(ls_sql);

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();


%>
</table>

</body>
</html>
