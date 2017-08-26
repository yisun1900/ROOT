<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT jc_cpjjzjxmx.cpjjbh,DECODE(jc_cpjjzjxmx.lx,'1','已有项','2','新增项') lx,jc_cpjjzjxmx.ysl,jc_cpjjzjxmx.xsl,TO_CHAR(jc_cpjjddmx.khdj) khdj,TO_CHAR(jc_cpjjddmx.bzdj) bzdj,cpjjmc,xh,gg,cpjjcz,cpjjhs,bz  ";
	ls_sql+=" FROM jc_cpjjddmx,jc_cpjjzjxmx  ";
    ls_sql+=" where jc_cpjjddmx.cpjjbh=jc_cpjjzjxmx.cpjjbh and jc_cpjjddmx.ddbh=jc_cpjjzjxmx.ddbh and jc_cpjjzjxmx.zjxxh='"+zjxxh+"'";
    ls_sql+=" order by jc_cpjjzjxmx.lx,jc_cpjjzjxmx.cpjjbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_cpjjddmxMain.jsp?zjxxh="+zjxxh);
	pageObj.setPageRow(1000);//设置每页显示记录数
//	pageObj.setEditBolt("");//设置每页显示记录数


//设置主键
	String[] keyName={"cpjjbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除增减项"};//按钮的显示名称
	String[] buttonLink={"DeleteJc_cpjjddmx.jsp?ddbh="+ddbh+"&zjxxh="+zjxxh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform">
<CENTER >
    <B><font size="2">成品家具增减项明细（增减项序号：<%=zjxxh%>）</font></B> 
</CENTER>
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="5%">成品家具编号</td>
	<td  width="5%">类型</td>
	<td  width="5%">原数量</td>
	<td  width="5%">新数量</td>
	<td  width="5%">折后单价</td>
	<td  width="5%">折前单价</td>
	<td  width="8%">家具名称</td>
	<td  width="7%">型号</td>
	<td  width="11%">规格(mm)</td>
	<td  width="11%">材质</td>
	<td  width="11%">花色纹理</td>
	<td  width="16%">备注</td>
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