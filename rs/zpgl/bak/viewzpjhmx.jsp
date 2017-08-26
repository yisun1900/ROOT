<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String zpjhbh=request.getParameter("zpjhbh");

	ls_sql="SELECT zpmxbh,dm_xzzwbm.xzzwmc zpzw,zprs,lrr,lrsj,bz  ";
	ls_sql+=" FROM rs_zpjhmx,dm_xzzwbm  ";
    ls_sql+=" where zpjhbh='"+zpjhbh+"' and dm_xzzwbm.xzzwbm=rs_zpjhmx.zpzw";
    ls_sql+=" order by zpmxbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">招聘计划明细（招聘计划编号：<%=zpjhbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">计划明细编号</td>
	<td  width="10%">招聘职位</td>
	<td  width="10%">招聘人数</td>
 	<td  width="10%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="45%">备注</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
</html>