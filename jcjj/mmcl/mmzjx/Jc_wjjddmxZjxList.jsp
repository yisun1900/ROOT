<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yddbh=request.getParameter("yddbh");
	String zjxxh=request.getParameter("zjxxh");

	String ls_sql=null;

	ls_sql="SELECT TO_CHAR(jc_wjjddmx.lrxh) lrxh,jc_wjjddmx.yddbh as yddbh,jc_wjjddmx.xh as xh,wjmc,wjjmc,jc_wjjddmx.xinghao as jc_wjjbj_xinghao,mmsbsmc,TO_CHAR(jc_wjjddmx.bzdj) bzdj,TO_CHAR(jc_wjjddmx.dj) as jc_wjjddmx_dj,jc_wjzjxmx.ysl ,jc_wjzjxmx.xsl,jc_wjjddmx.bz as jc_wjjddmx_bz  ";
	ls_sql+=" FROM jc_wjjddmx,jc_wjzjxmx,jdm_wjjbm,jdm_mmsbsbm  ";
    ls_sql+=" where jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm ";
    ls_sql+=" and jc_wjjddmx.mmsbsbm=jdm_mmsbsbm.mmsbsbm(+) and jc_wjjddmx.lrxh=jc_wjzjxmx.lrxh";
	ls_sql+=" and jc_wjzjxmx.yddbh='"+yddbh+"' and jc_wjzjxmx.zjxxh="+zjxxh;
    ls_sql+=" order by jc_wjjddmx.yddbh,jc_wjjddmx.lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_wjjddmxMain.jsp?zjxxh="+zjxxh);
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"lrxh","wjmc","wjjmc","jc_wjjbj_xinghao","mmsbsmc","bzdj","jc_wjjddmx_dj","ysl","xsl","jc_wjjddmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除增项"};//按钮的显示名称
	String[] buttonLink={"DeleteZxJc_wjjddmx.jsp?zjxxh="+zjxxh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">五金增项明细（增减项序号：<%=zjxxh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="4%">序号</td>
	<td  width="18%">五金名称</td>
	<td  width="10%">五金类别</td>
	<td  width="17%">型号</td>
	<td  width="8%">锁把手</td>
	<td  width="6%">标准单价</td>
	<td  width="6%">客户单价</td>
	<td  width="5%" bgcolor="#99CCFF">原数量</td>
	<td  width="6%" bgcolor="#99CCFF">新数量</td>
	<td  width="14%">备注</td>
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