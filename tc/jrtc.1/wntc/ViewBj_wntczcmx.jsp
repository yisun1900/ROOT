<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String tcmc=cf.getParameter(request,"tcmc");
	String hxbm=cf.GB2Uni(request.getParameter("hxbm"));

	String ls_sql=null;
	ls_sql="SELECT bj_wntczcmx.tcmc,bj_wntczcmx.jgwzbm,TO_CHAR(bj_wntczcmx.tcdj),bj_wntczcmx.sl,bj_wntczcmx.tcdj*bj_wntczcmx.sl,bj_wntczcmx.cpbm,bj_wntczcmx.cpmc,bj_wntczcmx.xh,bj_wntczcmx.gg,bj_wntczcmx.ppmc,bj_wntczcmx.gysmc,bj_wntczcmx.jldw,TO_CHAR(bj_wntczcmx.ydj),TO_CHAR(bj_wntczcmx.sjzj),bj_wntczcmx.lrr,bj_wntczcmx.lrsj,bj_wntczcmx.bz  ";
	ls_sql+=" FROM bj_wntczcmx  ";
    ls_sql+=" where bj_wntczcmx.dqbm='"+dqbm+"' and bj_wntczcmx.hxbm='"+hxbm+"' and bj_wntczcmx.tcmc='"+tcmc+"'";
    ls_sql+=" order by bj_wntczcmx.jgwzbm,bj_wntczcmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


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
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ײ�����</td>
	<td  width="5%">����λ��</td>
	<td  width="3%">�ײ͵���</td>
	<td  width="3%">����</td>
	<td  width="4%">���</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="10%">��Ʒ����</td>
	<td  width="9%">�ͺ�</td>
	<td  width="9%">���</td>
	<td  width="9%">Ʒ��</td>
	<td  width="11%">��Ӧ��</td>
	<td  width="3%">������λ</td>
	<td  width="3%">ԭ����</td>
	<td  width="3%">�����ۼ�</td>
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