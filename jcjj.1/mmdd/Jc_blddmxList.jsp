<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yddbh=request.getParameter("yddbh");

	String ls_sql=null;

	ls_sql="SELECT TO_CHAR(lrxh) lrxh,jc_blddmx.yddbh as yddbh,jc_blddmx.blxhbm as blxhbm,blyt,blxh,TO_CHAR(jc_blddmx.bzdj) bzdj,TO_CHAR(jc_blddmx.dj) as jc_blddmx_dj,jc_blddmx.sl as jc_blddmx_sl,jc_blddmx.dj*jc_blddmx.sl je,jc_blddmx.bz as jc_blddmx_bz  ";
	ls_sql+=" FROM jc_blddmx,jdm_blytbm  ";
    ls_sql+=" where jc_blddmx.blytbm=jdm_blytbm.blytbm(+)";
    ls_sql+=" and jc_blddmx.yddbh='"+yddbh+"' and jc_blddmx.lx='1'";
    ls_sql+=" order by jc_blddmx.yddbh,jc_blddmx.lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_blddmx.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"lrxh","blxh","blyt","bzdj","jc_blddmx_dj","jc_blddmx_sl","je","jc_blddmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">玻璃订单明细（预订单编号：<%=yddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">序号</td>
	<td  width="21%">玻璃型号</td>
	<td  width="10%">玻璃用途</td>
	<td  width="8%">折前单价</td>
	<td  width="8%">折后单价</td>
	<td  width="8%">订购数量</td>
	<td  width="10%">金额</td>
	<td  width="32%">备注</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>

</html>