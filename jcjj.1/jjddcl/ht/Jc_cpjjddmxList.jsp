<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String wheresql="";
	String ddbh=request.getParameter("ddbh");

	ls_sql="SELECT cpjjmc,xh,gg,cpjjxl,cpjjcz,cpjjhs,TO_CHAR(bzdj),sl,zqzj,bz,cpjjbh,cpjjfg  ";
	ls_sql+=" FROM jc_cpjjddmx  ";
    ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" order by cpjjbh";
   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_cpjjddmxMain.jsp?ddbh="+ddbh);
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.setEditBolt("");//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ddbh","cpjjbh","cpjjfg","cpjjmc","xh","gg","cpjjxl","cpjjcz","ys","cpjjhs","bzdj","khdj","sl","zjhsl","zj","cktp","cptp","cpsm","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cpjjbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除成品家具"};//按钮的显示名称
	String[] buttonLink={"DeleteJc_cpjjddmx.jsp?ddbh="+ddbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform">
<table border="1" width="190%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">名称</td>
	<td  width="6%">型号</td>
	<td  width="12%">规格</td>
	<td  width="7%">系列名称</td>
	<td  width="11%">材质</td>
	<td  width="15%">花色纹理</td>
	<td  width="5%">单价</td>
	<td  width="4%">数量</td>
	<td  width="6%">总价</td>
	<td  width="15%">备注</td>
	<td  width="4%">编号</td>
	<td  width="6%">风格</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
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