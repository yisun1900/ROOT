<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT ppgys,zcdlbm,zcxlbm,yj,zhj,dj,ssk,rq,bz  ";
	ls_sql+=" FROM jc_khzcgmmx  ";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by ppgys";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_khzcgmmx.jsp?khbh="+khbh);
	pageObj.setPageRow(500);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","ppgys","zcdlbm","zcxlbm","yj","zhj","dj","ssk","rq","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ppgys"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteJc_khzcgmmx.jsp?khbh="+khbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">客户主材购买明细（客户编号：<%=khbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="15%">品牌供应商名称</td>
	<td  width="12%">主材大类</td>
	<td  width="10%">主材小类</td>
	<td  width="8%">原价</td>
	<td  width="8%">折后价</td>
	<td  width="7%">订金</td>
	<td  width="8%">实收款</td>
	<td  width="8%">日期</td>
	<td  width="17%">备注</td>
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