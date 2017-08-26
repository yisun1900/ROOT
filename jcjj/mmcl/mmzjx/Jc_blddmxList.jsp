<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yddbh=request.getParameter("yddbh");
	String zjxxh=request.getParameter("zjxxh");
	String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");

	String ls_sql=null;

	ls_sql="SELECT DECODE(lx,'1','合同项','2','增项') lx,TO_CHAR(lrxh) lrxh,jc_blddmx.yddbh as yddbh,jc_blddmx.blxhbm as blxhbm,blxh,TO_CHAR(jc_blddmx.bzdj) bzdj,TO_CHAR(jc_blddmx.dj) as jc_blddmx_dj,jc_blddmx.sl,jc_blddmx.zjhsl,jc_blddmx.bz as jc_blddmx_bz  ";
	ls_sql+=" FROM jc_blddmx  ";
    ls_sql+=" where jc_blddmx.yddbh='"+yddbh+"'";
    ls_sql+=" and jc_blddmx. lrxh  not in(select lrxh from jc_blzjxmx where zjxxh='"+zjxxh+"')";
    ls_sql+=" order by jc_blddmx.yddbh,jc_blddmx.lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"lrxh","lx","blxh","bzdj","jc_blddmx_dj","sl","zjhsl","jc_blddmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"选择"};//按钮的显示名称
	String[] buttonLink={"SaveJc_blddmxZjx.jsp?yddbh="+yddbh+"&zjxxh="+zjxxh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">玻璃减项（增减项序号：<%=zjxxh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">序号</td>
	<td  width="6%">类型</td>
	<td  width="20%">玻璃型号</td>
	<td  width="10%">折前单价</td>
	<td  width="10%">折后单价</td>
	<td  width="9%" bgcolor="#99CCFF">合同数量</td>
	<td  width="9%" bgcolor="#99CCFF">增减后数量</td>
	<td  width="30%">备注</td>
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