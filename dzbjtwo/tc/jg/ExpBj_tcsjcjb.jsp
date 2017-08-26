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

	ls_sql="SELECT tcsjflmc,a.bjjbmc,b.bjjbmc bjjbmc1,bj_tcsjcjb.jldw,bj_tcsjcjb.sjcj  ";
	ls_sql+=" FROM bj_tcsjcjb,bdm_bjjbbm a,bdm_bjjbbm b,bj_tcsjflbm  ";
    ls_sql+=" where bj_tcsjcjb.bjjbbm=a.bjjbbm(+)";
    ls_sql+=" and bj_tcsjcjb.bjjbbm1=b.bjjbbm(+)";
    ls_sql+=" and bj_tcsjcjb.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=" and bj_tcsjcjb.bjbbh='"+bjbbh+"' and bj_tcsjcjb.dqbm='"+dqbm+"'";
    ls_sql+=" order by bj_tcsjcjb.tcsjflbm,bj_tcsjcjb.bjjbbm,bj_tcsjcjb.bjjbbm1";
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
	<td  width="25%">套餐升级分类</td>
	<td  width="20%">原报价级别</td>
	<td  width="20%">升级报价级别</td>
	<td  width="15%">计量单位</td>
	<td  width="10%">升级差价</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 

</body>
</html>