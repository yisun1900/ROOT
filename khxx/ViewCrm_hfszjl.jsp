<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">工程回访记录 </div>
<table width="120%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">回访设置记录号</td>
	<td  width="4%">最新设置标志</td>
	<td  width="5%">客户编号</td>
	<td  width="7%">回访类型</td>
	<td  width="7%">回访时间</td>
	<td  width="5%">回访设置人</td>
	<td  width="11%">回访设置时间</td>
	<td  width="17%">回访设置原因</td>
	<td  width="7%">类型</td>
	<td  width="6%">回访设置关键字</td>
	<td  width="5%">是否已回访</td>
	<td  width="7%">实际回访时间</td>
	<td  width="6%">实际回访记录号</td>
	<td  width="6%">原回访设置记录号</td>

</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	

	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT crm_hfszjl.hfszjlh,DECODE(crm_hfszjl.zxszbz,'Y','是','N','否'),khbh ,dm_hflxbm.hflxmc,TO_CHAR(crm_hfszjl.hfsj,'YYYY-MM-DD'),crm_hfszjl.hfszr,crm_hfszjl.hfszsj,crm_hfszjl.hfszyy";
	ls_sql+=" ,DECODE(crm_hfszjl.lx,'1','开工登记设置','2','隐蔽工程设置','3','中期验收设置','4','完工登记设置','5','工程分项验收','6','回访设置'),crm_hfszjl.hfzcgjz,DECODE(crm_hfszjl.sfyhf,'Y','回访','N','未回访'),TO_CHAR(crm_hfszjl.zxhfsj,'YYYY-MM-DD'),crm_hfszjl.hfjlh,yhfszjlh ";
	ls_sql+=" FROM crm_hfszjl,dm_hflxbm  ";
    ls_sql+=" where crm_hfszjl.hflxbm=dm_hflxbm.hflxbm and crm_hfszjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_hfszjl.hfszjlh";
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.setDateType("long");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>
</body>
</html>
