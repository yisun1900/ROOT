<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String tcbm=request.getParameter("tcbm");

	String ls_sql=null;
	ls_sql="SELECT bj_zctcmx.cpbm,bj_zctcmx.cpmc,bj_zctcmx.sl,TO_CHAR(bj_zctcmx.tcdj),ROUND(bj_zctcmx.sl*bj_zctcmx.tcdj,2) je,bj_zctcmc.tcmc,bj_zctcmx.xh,bj_zctcmx.gg,bj_zctcmx.ppmc,bj_zctcmx.gysmc,bj_zctcmx.jldw,TO_CHAR(bj_zctcmx.ydj),TO_CHAR(bj_zctcmx.sjzj),TO_CHAR(bj_zctcmx.jsj),bj_zctcmx.lrr,bj_zctcmx.lrsj,bj_zctcmx.bz  ";
	ls_sql+=" FROM bj_zctcmc,bj_zctcmx  ";
    ls_sql+=" where bj_zctcmx.tcbm=bj_zctcmc.tcbm(+)";
    ls_sql+=" and bj_zctcmx.tcbm="+tcbm;
    ls_sql+=" order by bj_zctcmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditBj_zctcmx.jsp");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteBj_zctcmx.jsp?tcbm="+tcbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����ײ���ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="3%">����</td>
	<td  width="3%">�ײ͵���</td>
	<td  width="4%">���</td>
	<td  width="5%">�ײ�����</td>
	<td  width="11%">�ͺ�</td>
	<td  width="9%">���</td>
	<td  width="7%">Ʒ��</td>
	<td  width="11%">��Ӧ��</td>
	<td  width="3%">������λ</td>
	<td  width="3%">ԭ����</td>
	<td  width="3%">�����ۼ�</td>
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