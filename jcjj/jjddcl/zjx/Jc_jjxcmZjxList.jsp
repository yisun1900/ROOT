<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT jc_jjxcmmx.xcmxh,DECODE(jc_xcmzjxmx.ysl-jc_xcmzjxmx.xsl,1,'减项',-1,'增项+'),jc_jjxcmmx.zj,jc_jjxcmmx.zqzj,xcmlxmc,jc_jjxcmmx.xcmmc,jc_jjxcmmx.azwz,jc_jjxcmmx.gd||'*'||jc_jjxcmmx.kd gg,jc_jjxcmmx.bklxxh,jc_jjxcmmx.bkys,jc_jjxcmmx.mbcl1,jc_jjxcmmx.mbcl2,jc_jjxcmmx.bz  ";
	ls_sql+=" FROM jc_jjxcmmx,jc_xcmzjxmx,jdm_xcmlxbm  ";
    ls_sql+=" where jc_jjxcmmx.xcmlxbm=jdm_xcmlxbm.xcmlxbm and jc_jjxcmmx.xcmxh=jc_xcmzjxmx.xcmxh and jc_xcmzjxmx.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by jc_xcmzjxmx.lx,jc_xcmzjxmx.xcmxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_jjxcmmxMain.jsp?zjxxh="+zjxxh);
	pageObj.setPageRow(1000);//设置每页显示记录数
//	pageObj.setEditBolt("");//设置每页显示记录数


//设置主键
	String[] keyName={"xcmxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除增减项"};//按钮的显示名称
	String[] buttonLink={"DeleteJc_jjxcmmx.jsp?ddbh="+ddbh+"&zjxxh="+zjxxh};//按钮单击调用的网页，可以增加参数
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
    <B><font size="2">型材门明细（增减项序号：<%=zjxxh%>）</font></B> 
</CENTER>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="6%">型材门序号</td>
	<td  width="4%">标志</td>
	<td  width="5%"><span class="STYLE1">总价-折后</span></td>
	<td  width="5%"><strong>总价-折前</strong></td>
	<td  width="6%">型材门类型</td>
	<td  width="6%">型材门名称</td>
	<td  width="6%">安装位置</td>
	<td  width="6%">高*宽(mm)</td>
	<td  width="11%">边框型号/刀型/门型</td>
	<td  width="5%">边框颜色</td>
	<td  width="11%">面板1材料/花色</td>
	<td  width="11%">面板2材料/花色</td>
	<td  width="13%">备注</td>
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