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
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ط����</td>
	<td  width="9%">�ط�����</td>
	<td  width="9%">�طý��</td>
	<td  width="27%">�ط�����</td>
	<td  width="11%">�ط�ʱ��</td>
	<td  width="6%">�ط���</td>
	<td  width="10%">��������</td>
	<td  width="8%">����״̬</td>
	<td  width="22%">��ز��Ŵ������</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	

	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT crm_hfjl.hfjlh ,dm_hflxbm.hflxmc,jglxmc,DECODE(sjshfnr,null,'',sjshfnr,'�裺'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>�ʣ�'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>ʩ��'||sgdhfnr)||DECODE(jchfnr,null,'',jchfnr,'<BR>�Ҿӣ�'||jchfnr) as hfnr,crm_hfjl.hfsj,crm_hfjl.hfr,sq_dwxx.dwmc,DECODE(clzt,'0','���账��','Y','�Ѵ���','N','δ����'),xwtclqk";
	ls_sql+=" FROM crm_hfjl,dm_hflxbm,sq_dwxx,crm_gchffkbm,dm_jglxbm   ";
    ls_sql+=" where crm_gchffkbm.dwbh=sq_dwxx.dwbh(+) and crm_hfjl.hflxbm=dm_hflxbm.hflxbm and crm_hfjl.jglxbm=dm_jglxbm.jglxbm(+)";
    ls_sql+=" and crm_hfjl.hfjlh=crm_gchffkbm.hfjlh(+) and crm_hfjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_hfjl.hfjlh";
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[3]="align='left'";//����ÿҳ��ʾ��¼��
	pageObj.alignStr[8]="align='left'";//����ÿҳ��ʾ��¼��
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hfjlh","1");//�в����������Hash��
	spanColHash.put("hflxmc","1");//�в����������Hash��
	spanColHash.put("jglxmc","1");//�в����������Hash��
	spanColHash.put("hfnr","1");//�в����������Hash��
	spanColHash.put("hfsj","1");//�в����������Hash��
	spanColHash.put("hfr","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>
</body>
</html>
