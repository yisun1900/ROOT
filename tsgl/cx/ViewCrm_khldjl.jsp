<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String tsjlh=request.getParameter("tsjlh");
	String ls_sql=null;
%>
<body bgcolor="#FFFFFF">
<div align="center">客户来电记录</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">投诉报修记录号</td>
	<td  width="17%">客户来电时间</td>
	<td  width="11%">客户编号</td>
	<td  width="61%">备注</td>
</tr>

<%
	ls_sql="SELECT tsjlh,khldsj,khbh,bz";
	ls_sql+=" FROM crm_khldjl ";
    ls_sql+=" where tsjlh='"+tsjlh+"'";
    ls_sql+=" order by khldsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.setDateType("long");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>



</body>
</html>
