<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String gtxh=request.getParameter("gtxh");

	ls_sql="SELECT TO_CHAR(bjxh) bjxh,ddbh,bjmc,bcpp,TO_CHAR(bchd),TO_CHAR(bzdj),TO_CHAR(khdj),cd||'*'||kd,sl,zjhsl,je,bz  ";
	ls_sql+=" FROM jc_gtbjmx  ";
    ls_sql+=" where gtxh='"+gtxh+"'";
    ls_sql+=" order by bjxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_gtbjmxMain.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.setEditBolt("");//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"bjxh","gtxh","ddbh","bjmc","bcpp","bchd","bzdj","khdj","cd","kd","sl","zjhsl","je","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"bjxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"复制板件","删除板件"};//按钮的显示名称
	String[] buttonLink={"CopyJc_gtbjmx.jsp?gtxh="+gtxh,"DeleteJc_gtbjmx.jsp?gtxh="+gtxh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1,0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">柜体板件明细（柜体序号：<%=gtxh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="4%">板件序号</td>
	<td  width="7%">订单编号</td>
	<td  width="7%">板件名称</td>
	<td  width="11%">板材类型</td>
	<td  width="6%">板材厚度</td>
	<td  width="6%">标准单价</td>
	<td  width="6%">客户单价</td>
	<td  width="8%">长*宽(mm)</td>
	<td  width="6%">合同数量</td>
	<td  width="6%">增减后数量</td>
	<td  width="9%">金额</td>
	<td  width="16%">备注</td>
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