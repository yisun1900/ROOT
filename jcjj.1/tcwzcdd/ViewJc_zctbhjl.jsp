<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">退补货记录</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">订单编号</td>
	<td  width="6%">客户姓名</td>
	<td  width="8%">合同号</td>
	<td  width="8%">约定退补货时间</td>
	<td  width="8%">发退补货通知时间</td>
	<td  width="6%">发退补货通知人</td>
	<td  width="8%">退补货通知人员</td>
	<td  width="8%">实退补货时间</td>
	<td  width="8%">实退补货人</td>
	<td  width="32%">退补货情况</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String ddbh=request.getParameter("ddbh");
	String ls_sql=null;

	ls_sql="SELECT jc_zctbhjl.ddbh,khxm,hth,jhtbhsj,jc_zctbhjl.tztbhsj,jc_zctbhjl.tztbhr,tbhtzry,stbhsj,stbhr,tbhqk";
	ls_sql+=" FROM jc_zctbhjl,crm_khxx  ";
    ls_sql+=" where jc_zctbhjl.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_zctbhjl.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_zctbhjl.jhtbhsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>
</body>
</html>
