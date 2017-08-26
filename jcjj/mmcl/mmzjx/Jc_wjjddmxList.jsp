<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yddbh=request.getParameter("yddbh");
	String zjxxh=request.getParameter("zjxxh");

	String ls_sql=null;

	ls_sql="SELECT DECODE(jc_wjjddmx.lx,'1','合同项','2','增项') lx,TO_CHAR(jc_wjjddmx.lrxh) lrxh,jc_wjjddmx.yddbh as yddbh,jc_wjjddmx.xh as xh,wjmc,wjjmc,xinghao,TO_CHAR(jc_wjjddmx.bzdj) bzdj,TO_CHAR(jc_wjjddmx.dj) as jc_wjjddmx_dj,jc_wjjddmx.sl,jc_wjjddmx.zjhsl,jc_wjjddmx.bz as jc_wjjddmx_bz  ";
	ls_sql+=" FROM jc_wjjddmx,jdm_wjjbm  ";
    ls_sql+=" where jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm ";
	ls_sql+=" and jc_wjjddmx.yddbh='"+yddbh+"'";
    ls_sql+=" and jc_wjjddmx. lrxh  not in(select lrxh from jc_wjzjxmx where zjxxh='"+zjxxh+"')";
    ls_sql+=" order by jc_wjjddmx.yddbh,jc_wjjddmx.lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"lrxh","lx","wjmc","xinghao","wjjmc","bzdj","jc_wjjddmx_dj","sl","zjhsl","jc_wjjddmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"选择"};//按钮的显示名称
	String[] buttonLink={"SaveJc_wjjddmxZjx.jsp?yddbh="+yddbh+"&zjxxh="+zjxxh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">五金增减项（增减项序号：<%=zjxxh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">序号</td>
	<td  width="6%">类型</td>
	<td  width="12%">五金件名称</td>
	<td  width="20%">型号</td>
	<td  width="10%">五金类别</td>
	<td  width="6%">折前单价</td>
	<td  width="6%">折后单价</td>
	<td  width="7%" bgcolor="#99CCFF">合同数量</td>
	<td  width="8%" bgcolor="#99CCFF">增减后数量</td>
	<td  width="17%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>