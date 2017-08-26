<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String zjxxh=null;
	zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT TO_CHAR(xh) xh,DECODE(lx,'1','柜体','2','台面','3','五金','4','电器'),zjxm,zjsl,TO_CHAR(zqdj),TO_CHAR(dj),zqzjje,zjje,bz  ";
	ls_sql+=" FROM jc_cgzjxmx  ";
    ls_sql+=" where zjxxh="+zjxxh;
    ls_sql+=" order by xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_cgzjxmx.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数


//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteJc_cgzjxmx.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">橱柜增减项明细（增减项序号：<%=zjxxh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="6%">序号</td>
	<td  width="6%">类型</td>
	<td  width="20%">增减项目</td>
	<td  width="7%">增减数量</td>
	<td  width="7%">折前单价</td>
	<td  width="7%">折后单价</td>
	<td  width="9%">折前增减金额</td>
	<td  width="9%">折后增减金额</td>
	<td  width="21%">备注</td>
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