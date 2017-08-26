<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String tzph=request.getParameter("tzph");

	ls_sql="select tzxh,clbm,clmc,ppmc,xh,nbbm,scph,tzsl,ylsh,a.hjmc yhjbh,b.hjmc xhjbh,yhwbh,xlsh,xhwbh";
	ls_sql+=" FROM jxc_hjtzmx,jxc_hjmc a,jxc_hjmc b ";
	ls_sql+=" where jxc_hjtzmx.yhjbh=a.hjbh(+) and jxc_hjtzmx.xhjbh=b.hjbh(+)";
	ls_sql+=" and tzph='"+tzph+"'";
	ls_sql+=" order by tzxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJxc_hjtzmx.jsp?tzph="+tzph);
	pageObj.setPageRow(1000);

/*
//设置显示列
	String[] disColName={"tzph","tzxh","clbm","zljb","tzsl","dchj","dchw","drhj","drhw"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"tzxh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteJxc_hjtzmx.jsp?tzph="+tzph};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">序号</td>
	<td  width="7%">材料编码</td>
	<td  width="10%">材料名称</td>
	<td  width="7%">子品牌</td>
	<td  width="10%">型号</td>
	<td  width="7%">内部编码</td>
	<td  width="7%">生产批号</td>
	<td  width="5%">调整数量</td>
	<td  width="7%">原流水号</td>
	<td  width="9%">原货架</td>
	<td  width="9%">新货架</td>
	<td  width="6%">原货位</td>
	<td  width="7%">新流水号</td>
	<td  width="6%">新货位</td>
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