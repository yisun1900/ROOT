<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">随机回访记录 </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">回访序号</td>
	<td  width="9%">回访结果</td>
	<td  width="27%">回访内容</td>
	<td  width="11%">回访时间</td>
	<td  width="6%">回访人</td>
	<td  width="10%">反馈部门</td>
	<td  width="8%">处理状态</td>
	<td  width="22%">相关部门处理情况</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	

	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT crm_sjhfjl.hfjlh ,jglxmc,hfsm,crm_sjhfjl.hfsj,crm_sjhfjl.hfr,sq_dwxx.dwmc,DECODE(clzt,'0','不需处理','Y','已处理','N','未处理'),xwtclqk";
	ls_sql+=" FROM crm_sjhfjl,sq_dwxx,crm_sjhffkbm,dm_jglxbm   ";
    ls_sql+=" where crm_sjhffkbm.dwbh=sq_dwxx.dwbh(+)and crm_sjhfjl.jglxbm=dm_jglxbm.jglxbm(+)";
    ls_sql+=" and crm_sjhfjl.hfjlh=crm_sjhffkbm.hfjlh(+) and crm_sjhfjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_sjhfjl.hfjlh";
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
