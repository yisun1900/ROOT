<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String jzph=request.getParameter("jzph");


	ls_sql="SELECT clbm,clmc,clgg,cldlmc,jldwmc,sqkcsl,rksl,cksl,kcsl  ";
	ls_sql+=" FROM cl_ydjzmx ";
    ls_sql+=" where jzph='"+jzph+"' ";
    ls_sql+=" order by clbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);//����ÿҳ��ʾ��¼��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ�������ת���ţ�<%=jzph%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���ϱ���</td>
	<td  width="10%">��������</td>
	<td  width="6%">���Ϲ��</td>
	<td  width="8%">���ϴ���</td>
	<td  width="6%">������λ</td>
	<td  width="6%">���ڿ������</td>
	<td  width="6%">�������</td>
	<td  width="6%">��������</td>
	<td  width="6%">�������</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>