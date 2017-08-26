<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String ls_sql=null;

%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<center>木门安装时间修改记录（预订单编号：<%=yddbh%>）</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">协商安装时间</td>
	<td  width="10%">录入人</td>
	<td  width="20%">录入时间</td>
	<td  width="50%">备注</td>
</tr>
<%

	ls_sql=" SELECT kazsj,lrr,lrsj,bz";
	ls_sql+=" FROM jc_mmazsjjl ";
    ls_sql+=" where yddbh='"+yddbh+"'";
    ls_sql+=" order by lrsj,kazsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();

%>

</table>
</body>
</html>
