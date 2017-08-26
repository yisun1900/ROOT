<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yddbh=request.getParameter("yddbh");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	ls_sql="SELECT TO_CHAR(lrxh) lrxh,blxh,blyt,TO_CHAR(jc_blddmx.bzdj) bzdj,TO_CHAR(jc_blddmx.dj) as dj,jc_blddmx.sl,jc_blddmx.bzdj*jc_blddmx.sl zqje,jc_blddmx.dj*jc_blddmx.sl je,jc_blddmx.bz";
	ls_sql+=" FROM jc_blddmx,jdm_blytbm  ";
    ls_sql+=" where jc_blddmx.blytbm=jdm_blytbm.blytbm(+)";
    ls_sql+=" and jc_blddmx.yddbh='"+yddbh+"' and jc_blddmx.lx='1'";
    ls_sql+=" order by jc_blddmx.yddbh,jc_blddmx.lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_blddmx.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数


//设置主键
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteJc_blddmx.jsp?yddbh="+yddbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">玻璃订单明细（订单号：<%=yddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="5%">序号</td>
	<td  width="20%">玻璃型号</td>
	<td  width="10%">玻璃用途</td>
	<td  width="7%">折前单价</td>
	<td  width="7%">折后单价</td>
	<td  width="7%">订购数量</td>
	<td  width="8%">折前金额</td>
	<td  width="8%">折后金额</td>
	<td  width="20%">备注</td>
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