<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String zpjhbh=request.getParameter("zpjhbh");

	ls_sql="SELECT zpmxbh,dm_xzzwbm.xzzwmc zpzw,zprs,lrr,lrsj,bz  ";
	ls_sql+=" FROM rs_zpjhmx,dm_xzzwbm  ";
    ls_sql+=" where zpjhbh='"+zpjhbh+"' and dm_xzzwbm.xzzwbm=rs_zpjhmx.zpzw";
    ls_sql+=" order by zpmxbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��Ƹ�ƻ���ϸ����Ƹ�ƻ���ţ�<%=zpjhbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">�ƻ���ϸ���</td>
	<td  width="10%">��Ƹְλ</td>
	<td  width="10%">��Ƹ����</td>
 	<td  width="10%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="45%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
</html>