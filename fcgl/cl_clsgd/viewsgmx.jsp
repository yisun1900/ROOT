<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String sgph=request.getParameter("sgph");

	ls_sql="SELECT cl_clsgmx.clbm,cl_clsgmx.clmc,cl_clsgmx.clgg,cl_clsgmx.cldlmc,jldwmc,TO_CHAR(fgsdj),sgsl,ROUND(fgsdj*sgsl,2),shsl,ROUND(fgsdj*shsl,2)  ";
	ls_sql+=" FROM cl_clsgmx  ";
    ls_sql+=" where sgph='"+sgph+"'";
    ls_sql+=" order by cl_clsgmx.cldlmc,cl_clsgmx.clbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����깺��ϸ���깺���ţ�<%=sgph%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���ϱ���</td>
	<td  width="14%">��������</td>
	<td  width="14%">���Ϲ��</td>
	<td  width="14%">���ϴ���</td>
	<td  width="8%">������λ</td>
	<td  width="8%">�ֹ�˾���ϵ���</td>
	<td  width="8%">�깺����</td>
	<td  width="10%">�깺���</td>
	<td  width="8%">�������</td>
	<td  width="10%">��˽��</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>