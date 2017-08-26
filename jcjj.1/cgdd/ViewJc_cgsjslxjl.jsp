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
<center>橱柜设计师联系客户记录</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">记录号</td>
	<td  width="10%">订单编号</td>
	<td  width="8%">橱柜设计师</td>
	<td  width="10%">计划测量时间</td>
	<td  width="10%">联系结果</td>
	<td  width="8%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="34%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	ls_sql="select jlh,ddbh,cgsjs,jhclsj,DECODE(clzt,'03','未确定','05','确定时间'),lrr,lrsj,bz";
	ls_sql+=" from jc_cgsjslxjl ";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" order by jlh";
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
