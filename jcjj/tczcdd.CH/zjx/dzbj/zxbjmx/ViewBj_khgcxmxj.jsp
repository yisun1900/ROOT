<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT bj_khgcxmxj.xmbh,bj_bjxmmx.xmmc,DECODE(bj_khgcxmxj.sfxzsl,'1','可增项需加价','2','不可增项','3','不控制'),bj_khgcxmxj.bzsl,bj_khgcxmxj.sjsl,bj_khgcxmxj.xjjsl,bj_khgcxmxj.ccbfjj,bj_khgcxmxj.ccbfjj*xjjsl,DECODE(bj_khgcxmxj.tcnxmbz,'Y','套餐内','N','否')";
	ls_sql+=" FROM bj_khgcxmxj,bj_bjxmmx  ";
    ls_sql+=" where bj_khgcxmxj.khbh=bj_bjxmmx.khbh and bj_khgcxmxj.xmbh=bj_bjxmmx.xmbh and bj_khgcxmxj.khbh='"+khbh+"'";
    ls_sql+=" order by bj_khgcxmxj.xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">客户工程项目小计
  </font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">项目编号</td>
	<td  width="30%">项目名称</td>
	<td  width="10%">是否限制数量</td>
	<td  width="8%">标准数量</td>
	<td  width="8%">实际数量</td>
	<td  width="8%">需加价数量</td>
	<td  width="8%">超出部分加价</td>
	<td  width="10%">加价金额</td>
	<td  width="8%">套餐内项目</td>
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