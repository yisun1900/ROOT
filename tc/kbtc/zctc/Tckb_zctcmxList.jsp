<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String tcbm=request.getParameter("tcbm");

	String ls_sql=null;
	ls_sql="SELECT tckb_zctcmx.cpbm,tckb_zctcmx.kbwlbm,tckb_zctcmx.kbcpbm,tckb_zctcmx.cpmc,tckb_zctcmx.sl,TO_CHAR(tckb_zctcmx.tcdj),ROUND(tckb_zctcmx.sl*tckb_zctcmx.tcdj,2) je,tckb_zctcmc.tcmc,tckb_zctcmx.xh,tckb_zctcmx.gg,tckb_zctcmx.ppmc,tckb_zctcmx.gysmc,tckb_zctcmx.jldw,TO_CHAR(tckb_zctcmx.ydj),TO_CHAR(tckb_zctcmx.jsj),tckb_zctcmx.lrr,tckb_zctcmx.lrsj,tckb_zctcmx.bz  ";
	ls_sql+=" FROM tckb_zctcmc,tckb_zctcmx  ";
    ls_sql+=" where tckb_zctcmx.tcbm=tckb_zctcmc.tcbm(+)";
    ls_sql+=" and tckb_zctcmx.tcbm="+tcbm;
    ls_sql+=" order by tckb_zctcmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditTckb_zctcmx.jsp?tcbm="+tcbm);
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteTckb_zctcmx.jsp?tcbm="+tcbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�Ҿ߰���ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">��Ʒ����</td>
	<td  width="4%">�Ʊ����ϱ���</td>
	<td  width="4%">�Ʊ���Ʒ����</td>
	<td  width="8%">��Ʒ����</td>
	<td  width="3%">����</td>
	<td  width="3%">���ڵ���</td>
	<td  width="4%">���</td>
	<td  width="5%">������</td>
	<td  width="9%">�ͺ�</td>
	<td  width="7%">���</td>
	<td  width="5%">Ʒ��</td>
	<td  width="11%">��Ӧ��</td>
	<td  width="3%">������λ</td>
	<td  width="3%">ԭ����</td>
	<td  width="3%">�����</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
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