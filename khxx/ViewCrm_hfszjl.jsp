<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">���̻طü�¼ </div>
<table width="120%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">�ط����ü�¼��</td>
	<td  width="4%">�������ñ�־</td>
	<td  width="5%">�ͻ����</td>
	<td  width="7%">�ط�����</td>
	<td  width="7%">�ط�ʱ��</td>
	<td  width="5%">�ط�������</td>
	<td  width="11%">�ط�����ʱ��</td>
	<td  width="17%">�ط�����ԭ��</td>
	<td  width="7%">����</td>
	<td  width="6%">�ط����ùؼ���</td>
	<td  width="5%">�Ƿ��ѻط�</td>
	<td  width="7%">ʵ�ʻط�ʱ��</td>
	<td  width="6%">ʵ�ʻطü�¼��</td>
	<td  width="6%">ԭ�ط����ü�¼��</td>

</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	

	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT crm_hfszjl.hfszjlh,DECODE(crm_hfszjl.zxszbz,'Y','��','N','��'),khbh ,dm_hflxbm.hflxmc,TO_CHAR(crm_hfszjl.hfsj,'YYYY-MM-DD'),crm_hfszjl.hfszr,crm_hfszjl.hfszsj,crm_hfszjl.hfszyy";
	ls_sql+=" ,DECODE(crm_hfszjl.lx,'1','�����Ǽ�����','2','���ι�������','3','������������','4','�깤�Ǽ�����','5','���̷�������','6','�ط�����'),crm_hfszjl.hfzcgjz,DECODE(crm_hfszjl.sfyhf,'Y','�ط�','N','δ�ط�'),TO_CHAR(crm_hfszjl.zxhfsj,'YYYY-MM-DD'),crm_hfszjl.hfjlh,yhfszjlh ";
	ls_sql+=" FROM crm_hfszjl,dm_hflxbm  ";
    ls_sql+=" where crm_hfszjl.hflxbm=dm_hflxbm.hflxbm and crm_hfszjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_hfszjl.hfszjlh";
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>
</body>
</html>
