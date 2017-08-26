<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");

	ls_sql="SELECT xcmxh,xcmlxmc,xcmmc,azwz,gd||'*'||kd gg,bklxxh,bkys,mbcl1,mbcl2,sl,zqzj ";
	ls_sql+=" FROM jc_jjxcmmx,jdm_xcmlxbm  ";
    ls_sql+=" where jc_jjxcmmx.xcmlxbm=jdm_xcmlxbm.xcmlxbm(+) and ddbh='"+ddbh+"'";
    ls_sql+=" order by xcmxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_jjxcmmxMain.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.setEditBolt("");//设置每页显示记录数
//设置显示列
	String[] disColName={"xcmlxmc","xcmmc","gg","bklxxh","bkys","mbcl1","mbcl2","sl","zqzj"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xcmxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"复制型材门","删除型材门"};//按钮的显示名称
	String[] buttonLink={"CopyJc_jjxcmmx.jsp?ddbh="+ddbh,"DeleteJc_jjxcmmx.jsp?ddbh="+ddbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform">
<CENTER >
    <B><font size="2">型材门明细（订单编号：<%=ddbh%>）</font></B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">型材门类型</td>
	<td  width="8%">型材门名称</td>
	<td  width="8%">高*宽(mm)</td>
	<td  width="16%" align="left">&nbsp;&nbsp;<strong>推拉门</strong>：边框型号<BR>
	  &nbsp;&nbsp;<strong>吸塑</strong>：刀型<BR>
	  &nbsp;&nbsp;<strong>包覆</strong>：刀型<BR>
	  &nbsp;&nbsp;<strong>板材铝门</strong>：门型</td>
	<td  width="7%">边框颜色</td>
	<td  width="15%">面板1材料/花色</td>
	<td  width="15%">面板2材料/花色</td>
	<td  width="6%">数量</td>
	<td  width="9%">总价</td>
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