<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String gtxh=request.getParameter("gtxh");
	String zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT TO_CHAR(pjxh) pjxh,ddbh,gtpjmc,xinghao,guige,jldwmc,TO_CHAR(bzdj),sl,zqje,bz  ";
	ls_sql+=" FROM jc_gtpjmx,jdm_jldwbm  ";
    ls_sql+=" where jc_gtpjmx.jldwbm=jdm_jldwbm.jldwbm(+) and gtxh='"+gtxh+"'";
    ls_sql+=" order by pjxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_gtpjmxMain.jsp?zjxxh="+zjxxh);
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.setEditBolt("");//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"pjxh","ddbh","gtxh","gtpjbh","gtpjmc","xinghao","guige","bzdj","khdj","sl","zjhsl","je","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"pjxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除配件"};//按钮的显示名称
	String[] buttonLink={"DeleteJc_gtpjmx.jsp?gtxh="+gtxh+"&zjxxh="+zjxxh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">柜体配件明细（增减项序号：<%=zjxxh%>，柜体序号：<%=gtxh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="5%">配件序号</td>
	<td  width="7%">订单编号</td>
	<td  width="12%">配件名称</td>
	<td  width="11%">型号</td>
	<td  width="10%">规格</td>
	<td  width="6%">计量单位</td>
	<td  width="7%">单价</td>
	<td  width="6%">合同数量</td>
	<td  width="9%">金额</td>
	<td  width="19%">备注</td>
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