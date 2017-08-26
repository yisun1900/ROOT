<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String bjbbh=null;
	String dqbm=null;

	bjbbh=request.getParameter("bjbbh");
	dqbm=request.getParameter("dqbm");


	ls_sql="SELECT bjjbmc,hxmc,bj_tcjgb.fwmj,bj_tcjgb.tcmc,bj_tcjgb.tcjg,bj_tcjgb.pmzjdj,bj_tcjgb.tlgbzjj  ";
	ls_sql+=" FROM bj_tcjgb,bdm_bjjbbm,dm_hxbm  ";
    ls_sql+=" where bj_tcjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tcjgb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and bj_tcjgb.bjbbh='"+bjbbh+"' and bj_tcjgb.dqbm='"+dqbm+"'";
    ls_sql+=" order by bj_tcjgb.bjjbbm,bj_tcjgb.hxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="13%">报价级别</td>
	<td  width="13%">户型</td>
	<td  width="10%">套内基准面积</td>
	<td  width="13%">套餐名称</td>
	<td  width="10%">套餐价格</td>
	<td  width="10%">平米增加单价</td>
	<td  width="10%">涂料改为壁纸加价</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>