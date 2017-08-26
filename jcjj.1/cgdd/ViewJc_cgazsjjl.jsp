<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<center>安装时间修改记录</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">协商安装时间</td>
	<td  width="10%">录入人</td>
	<td  width="20%">录入时间</td>
	<td  width="50%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	ls_sql=" SELECT kazsj,lrr,lrsj,bz";
	ls_sql+=" FROM jc_cgazsjjl ";
    ls_sql+=" where ddbh='"+ddbh+"'";
    ls_sql+=" order by lrsj,kazsj";
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>
</body>
</html>
