<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String gysbm=request.getParameter("gysbm");

	ls_sql="SELECT sq_gyslxr.lxrxm,sq_gyslxr.zw,sq_gyslxr.sj,sq_gyslxr.bgdh,sq_gyslxr.cz, DECODE(sq_gyslxr.sflz,'Y','是','N','否') as sflz,sq_gyslxr.bz  ";
	ls_sql+=" FROM sq_gyslxr  ";
    ls_sql+=" where sq_gyslxr.gysbm='"+gysbm+"' ";
    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("","","","EditSq_gyslxr.jsp?gysbm="+gysbm);
	pageObj.setPageRow(2000);//设置每页显示记录数


//设置主键
	String[] keyName={"lxrxm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteSq_gyslxr.jsp?gysbm="+gysbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">联系人信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="10%">联系人姓名</td>
	<td  width="10%">职务</td>
	<td  width="14%">手机</td>
	<td  width="20%">办公电话</td>
	<td  width="12%">传真</td>
	<td  width="6%">是否离职</td>
	<td  width="22%">备注</td>
</tr>
<%
	pageObj.displayDate();
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