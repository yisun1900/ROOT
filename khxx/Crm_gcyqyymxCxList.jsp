<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;

	String khbh=request.getParameter("khbh");



	ls_sql="SELECT gcyqyymc,yqts";
	ls_sql+=" FROM crm_gcyqyymx,dm_gcyqyybm";
    ls_sql+=" where crm_gcyqyymx.gcyqyybm=dm_gcyqyybm.gcyqyybm";
    ls_sql+=" and crm_gcyqyymx.khbh='"+khbh+"' and crm_gcyqyymx.lx='1'";
    ls_sql+=" order by crm_gcyqyymx.gcyqyybm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">工程延期原因明细（客户编号：<%=khbh%>）</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="65%">工程延期原因</td>
	<td  width="35%">延期天数</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%> 
</table>

</body>
</html>