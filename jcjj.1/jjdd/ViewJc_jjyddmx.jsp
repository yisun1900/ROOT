<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ddbh=request.getParameter("ddbh");

	String ls_sql=null;

	ls_sql="SELECT jdm_jjlbbm.jjlbmc as jdm_jjlbbm_jjlbmc,jc_jjyddmx.sl as jc_jjyddmx_sl,jc_jjyddmx.bz as jc_jjyddmx_bz  ";
	ls_sql+=" FROM jdm_jjlbbm,jc_jjyddmx  ";
    ls_sql+=" where jc_jjyddmx.jjlbbm=jdm_jjlbbm.jjlbbm";
    ls_sql+=" and jc_jjyddmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_jjyddmx.jjlbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">家具预订单明细（订单编号：<%=ddbh%>）</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="25%">家具类别</td>
	<td  width="10%">数量</td>
	<td  width="65%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 
</table>
</body>
</html>