<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%//weblogic@ page session=true%>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String yhzbh=request.getParameter("yhzbh");
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">�����ֹ�˾</td>
	<td  width="20%">��������</td>
	<td  width="9%">����</td>
	<td  width="15%">�û���½��</td>
	<td  width="11%" >����</td>
	<td  width="13%" >ְ��</td>
	<td  width="8%" >Ա��״̬</td>
	<td  width="9%" >��ְ����</td>
</tr>
<%
	String ls_sql=null;
	ls_sql="SELECT a.dwmc ssfgs,b.dwmc bm,sq_yhxx.bianhao,sq_yhssz.yhdlm,yhmc,xzzwbm,DECODE(sq_yhxx.sfzszg,'M','<font color=\"#009999\">ʵϰ��</font>','Y','ת��','N','<font color=\"#0000CC\">������</font>','D','<font color=\"#CCCC00\">����</font>','S','<font color=\"#CC0000\">��ְ</font>','T','<font color=\"#CC00CC\">����</font>'),rzsj  ";
	ls_sql+=" FROM sq_yhssz,sq_yhxx,sq_dwxx b,sq_dwxx a  ";
    ls_sql+=" where sq_yhssz.yhdlm=sq_yhxx.yhdlm  and sq_yhxx.dwbh=b.dwbh(+) and sq_yhxx.ssfgs=a.dwbh(+)";
	ls_sql+=" and sq_yhssz.yhzbh='"+yhzbh+"'  ";
	ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,yhmc  ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ssfgs","1");//�в����������Hash��
	spanColHash.put("bm","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
	pageObj.displayFoot();
%>
  
</table>
</body>
</html>
