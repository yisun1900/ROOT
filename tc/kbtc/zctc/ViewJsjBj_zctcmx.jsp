<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String tcbm=request.getParameter("tcbm");
	String tcmc=cf.executeQuery("select tcmc from tckb_zctcmc where tcbm="+tcbm);

	String ls_sql=null;
	ls_sql="SELECT tckb_zctcmx.sl,TO_CHAR(tckb_zctcmx.tcdj),ROUND(tckb_zctcmx.tcdj*tckb_zctcmx.sl,2),tckb_zctcmx.cpmc,tckb_zctcmx.cpbm,tckb_zctcmx.kbwlbm,tckb_zctcmx.kbcpbm,tckb_zctcmx.xh,tckb_zctcmx.gg,tckb_zctcmx.ppmc,tckb_zctcmx.gysmc,tckb_zctcmx.jldw,TO_CHAR(tckb_zctcmx.ydj),TO_CHAR(tckb_zctcmx.jsj),tckb_zctcmx.bz,tckb_zctcmx.lrr,tckb_zctcmx.lrsj  ";
	ls_sql+=" FROM tckb_zctcmx  ";
    ls_sql+=" where tckb_zctcmx.tcbm="+tcbm;
    ls_sql+=" order by tckb_zctcmx.cpmc,tckb_zctcmx.xh";
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
  <B><font size="3">�Ҿ߰���ϸ(<%=tcmc%>)</font></B>
</CENTER>

<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">����</td>
	<td  width="4%">���ڵ���</td>
	<td  width="5%">���</td>
	<td  width="8%">��Ʒ����</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="5%">�Ʊ����ϱ���</td>
	<td  width="5%">�Ʊ���Ʒ����</td>
	<td  width="9%">�ͺ�</td>
	<td  width="7%">���</td>
	<td  width="7%">Ʒ��</td>
	<td  width="11%">��Ӧ��</td>
	<td  width="3%">������λ</td>
	<td  width="4%">ԭ����</td>
	<td  width="4%">�����</td>
	<td  width="12%">��ע</td>
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