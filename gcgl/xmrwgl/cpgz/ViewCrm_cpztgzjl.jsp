<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查看跟踪信息</font></B>
</CENTER>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">客户编号</td>
	<td  width="15%">产品分类</td>
	<td  width="9%">产品状态</td>
	<td  width="8%">发生时间</td>
	<td  width="6%">责任人</td>
	<td  width="6%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="11%">录入部门</td>
	<td  width="31%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String khbh=cf.GB2Uni(request.getParameter("khbh"));
	String cpflbm=cf.GB2Uni(request.getParameter("cpflbm"));

	ls_sql="SELECT crm_cpztgzjl.khbh,cpflmc,cpztmc,crm_cpztgzjl.fssj,crm_cpztgzjl.zrr,crm_cpztgzjl.lrr,crm_cpztgzjl.lrsj,dwmc,crm_cpztgzjl.bz";
	ls_sql+=" FROM crm_cpztgzjl,dm_cpztbm,dm_cpflbm,sq_dwxx  ";
    ls_sql+=" where crm_cpztgzjl.cpztbm=dm_cpztbm.cpztbm and crm_cpztgzjl.cpflbm=dm_cpflbm.cpflbm and crm_cpztgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and crm_cpztgzjl.khbh='"+khbh+"' and crm_cpztgzjl.cpflbm='"+cpflbm+"'";
    ls_sql+=" order by crm_cpztgzjl.cpflbm,crm_cpztgzjl.fssj ";
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