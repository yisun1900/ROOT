<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String tcmc=cf.GB2Uni(request.getParameter("tcmc"));
	String hxbm=cf.GB2Uni(request.getParameter("hxbm"));

	String ls_sql=null;
	ls_sql="SELECT bj_wntczcmx.jgwzbm,bj_wntczcmx.cpbm,bj_wntczcmx.cpmc,bj_wntczcmx.sl,TO_CHAR(bj_wntczcmx.tcdj),ROUND(bj_wntczcmx.tcdj*bj_wntczcmx.sl,2) je,bj_wntczcmx.tcmc,bj_wntczcmx.xh,bj_wntczcmx.gg,bj_wntczcmx.ppmc,bj_wntczcmx.gysmc,bj_wntczcmx.jldw,TO_CHAR(bj_wntczcmx.ydj),TO_CHAR(bj_wntczcmx.sjzj),TO_CHAR(bj_wntczcmx.jsj),bj_wntczcmx.lrr,bj_wntczcmx.lrsj,bj_wntczcmx.bz  ";
	ls_sql+=" FROM bj_wntczcmx  ";
    ls_sql+=" where bj_wntczcmx.dqbm='"+dqbm+"' and bj_wntczcmx.hxbm='"+hxbm+"' and bj_wntczcmx.tcmc='"+tcmc+"'";
    ls_sql+=" order by bj_wntczcmx.jgwzbm,bj_wntczcmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","Editbj_wntczcmx.jsp");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteBj_wntczcmx.jsp?dqbm="+dqbm+"&hxbm="+hxbm+"&tcmc="+tcmc};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ů�ײ���ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="3%">����λ��</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="8%">��Ʒ����</td>
	<td  width="3%">����</td>
	<td  width="3%">�ײ͵���</td>
	<td  width="3%">���</td>
	<td  width="6%">�ײ�����</td>
	<td  width="9%">�ͺ�</td>
	<td  width="8%">���</td>
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