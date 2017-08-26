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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<center>橱柜设计师改派记录</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">订单编号</td>
	<td  width="8%">新设计师</td>
	<td  width="8%">原设计师</td>
	<td  width="24%">设计师改派原因</td>
	<td  width="32%">派设计师说明</td>
	<td  width="8%">录入人</td>
	<td  width="10%">录入时间</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	ls_sql="SELECT ddbh,cgsjs,ycgsjs,sjsgpyymc,pdsm,lrr,lrsj";
	ls_sql+=" FROM jc_cgsjsgpjl,jdm_sjsgpyybm";
	ls_sql+=" where jc_cgsjsgpjl.sjsgpyybm=jdm_sjsgpyybm.sjsgpyybm";
	ls_sql+=" and jc_cgsjsgpjl.ddbh='"+ddbh+"'";
	ls_sql+=" order by jc_cgsjsgpjl.lrsj desc";
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
