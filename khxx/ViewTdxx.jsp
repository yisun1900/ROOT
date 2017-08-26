<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">退单信息 </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">退单序号</td>
	<td  width="15%">退单原因</td>
	<td  width="30%">退单原因说明</td>
	<td  width="7%">应退金额</td>
	<td  width="7%">实退金额</td>
	<td  width="7%">是否返券</td>
	<td  width="7%">是否已认证</td>
	<td  width="7%">退单时间</td>
	<td  width="7%">录入时间</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT tdxh,dm_tdyybm.tdyymc,tdyysm,crm_tddj.ytje,crm_tddj.stje,DECODE(sffj,'Y','是','N','否'),DECODE(sfyrz,'Y','是','N','否'),tdsj,lrsj  ";
	ls_sql+=" FROM crm_tddj,dm_tdyybm,sq_sgd  ";
    ls_sql+=" where crm_tddj.tdyybm=dm_tdyybm.tdyybm and crm_tddj.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_tddj.khbh='"+khbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>
</body>
</html>
