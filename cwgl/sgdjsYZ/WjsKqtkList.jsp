<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String sgd=request.getParameter("sgd");

	String ls_sql=null;

	ls_sql="SELECT cw_kqtkjl.kkjlh,sq_sgd.sgdmc,cw_kqtkjl.kkje,cw_kqtkjl.lrr,cw_kqtkjl.lrsj,sq_dwxx.dwmc, DECODE(cw_kqtkjl.jsbz,'N','δ����','Y','�ѽ���'),cw_kqtkjl.jsjlh,cw_kqtkjl.bz  ";
	ls_sql+=" FROM cw_kqtkjl,sq_dwxx,sq_sgd  ";
    ls_sql+=" where cw_kqtkjl.sgd=sq_sgd.sgd and cw_kqtkjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and cw_kqtkjl.sgd='"+sgd+"' and cw_kqtkjl.jsbz='N'";
    ls_sql+=" order by cw_kqtkjl.kkjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">δ�����������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�ۿ��¼</td>
	<td  width="6%">ʩ����</td>
	<td  width="10%">�ۿ���</td>
	<td  width="6%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="13%">¼�벿��</td>
	<td  width="7%">�����־</td>
	<td  width="9%">�����¼��</td>
	<td  width="31%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>