<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">送货时间修改记录</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">订单编号</td>
	<td  width="10%">客户姓名</td>
	<td  width="10%">合同号</td>
	<td  width="10%">计划送货时间</td>
	<td  width="40%">送货通知说明</td>
	<td  width="10%">录入时间</td>
	<td  width="10%">录入人</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String ddbh=request.getParameter("ddbh");
	String ls_sql=null;

	ls_sql="SELECT jc_zcshsjjl.ddbh,khxm,hth,jhshsj,shtzsm,jc_zcshsjjl.lrsj,jc_zcshsjjl.lrr";
	ls_sql+=" FROM jc_zcshsjjl,crm_khxx  ";
    ls_sql+=" where jc_zcshsjjl.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_zcshsjjl.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_zcshsjjl.jhshsj";
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
