<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String tcbm=request.getParameter("tcbm");
	String tcmc=cf.executeQuery("select tcmc from bj_zctcmc where tcbm="+tcbm);

	String ls_sql=null;
	ls_sql="SELECT bj_zctcmx.sl,TO_CHAR(bj_zctcmx.tcdj),ROUND(bj_zctcmx.tcdj*bj_zctcmx.sl,2),bj_zctcmx.cpmc,bj_zctcmx.cpbm,bj_zctcmx.xh,bj_zctcmx.gg,bj_zctcmx.ppmc,bj_zctcmx.gysmc,bj_zctcmx.jldw,TO_CHAR(bj_zctcmx.ydj),TO_CHAR(bj_zctcmx.sjzj),bj_zctcmx.bz,bj_zctcmx.lrr,bj_zctcmx.lrsj  ";
	ls_sql+=" FROM bj_zctcmx  ";
    ls_sql+=" where bj_zctcmx.tcbm="+tcbm;
    ls_sql+=" order by bj_zctcmx.cpmc,bj_zctcmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��



//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cpmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����ײ���ϸ(<%=tcmc%>)</font></B>
</CENTER>

<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">����</td>
	<td  width="4%">�ײ͵���</td>
	<td  width="5%">���</td>
	<td  width="8%">��Ʒ����</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="11%">�ͺ�</td>
	<td  width="9%">���</td>
	<td  width="7%">Ʒ��</td>
	<td  width="11%">��Ӧ��</td>
	<td  width="3%">������λ</td>
	<td  width="4%">ԭ����</td>
	<td  width="4%">�����ۼ�</td>
	<td  width="14%">��ע</td>
	<td  width="3%">¼����</td>
	<td  width="56%">¼��ʱ��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.displayDateSum();
%> 
</table>
</body>

</html>