<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT xcmxh,xcmlxmc,xcmmc,azwz,gd||'*'||kd gg,bklxxh,bkys,mbcl1,mbcl2,zj,zqzj,bz  ";
	ls_sql+=" FROM jc_jjxcmmx,jdm_xcmlxbm  ";
    ls_sql+=" where jc_jjxcmmx.xcmlxbm=jdm_xcmlxbm.xcmlxbm and ddbh='"+ddbh+"' and zjhsl>0 ";
    ls_sql+=" and xcmxh not in(select xcmxh from jc_xcmzjxmx where zjxxh='"+zjxxh+"')";
    ls_sql+=" order by xcmxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.setEditBolt("");//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"gtxh","ddbh","gtmc","jjazwz","guige","jjlx","bcpp","bcys","bcbfje","pjbfje","zj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xcmxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"减项选中型材门"};//按钮的显示名称
	String[] buttonLink={"Jc_jjxcmmxJx.jsp?ddbh="+ddbh+"&zjxxh="+zjxxh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);


%>

<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform">
<CENTER >
    <B><font size="2">型材门减项（订单编号：<%=ddbh%>）</font></B> 
</CENTER>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">型材门序号</td>
	<td  width="6%">型材门类型</td>
	<td  width="6%">型材门名称</td>
	<td  width="5%">安装位置</td>
	<td  width="6%">高*宽(mm)</td>
	<td  width="11%">边框型号/刀型/门型</td>
	<td  width="5%">边框颜色</td>
	<td  width="11%">面板1材料/花色</td>
	<td  width="10%">面板2材料/花色</td>
	<td  width="5%"><span class="STYLE1">总价-折后</span></td>
	<td  width="5%"><strong>总价-折前</strong></td>
	<td  width="27%">备注</td>
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