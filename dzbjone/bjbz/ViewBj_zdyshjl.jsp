<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj =new ybl.common.PageObject();
	String ls_sql=null;
	String xmbh=request.getParameter("xmbh");
	String lrr=request.getParameter("lrr");

	ls_sql="SELECT bj_zdyshjl.sqjl,DECODE(bj_zdyshjl.shbz,'N','申请审核','S','受理申请','Y',' 审核通过','W','未通过','C','重新申请') shbz,bj_zdyshjl.xmbh,bj_zdyshjl.zdyxmlrr,bj_zdyshjl.lrsj,dqmc,bjjbmc,bj_zdyshjl.slr,bj_zdyshjl.slsj,bj_zdyshjl.slsm,DECODE(bj_zdyshjl.sfbxg,'Y','是','N','否'),bj_zdyshjl.shr,bj_zdyshjl.shsj,bj_zdyshjl.shyj";
	ls_sql+=" FROM bj_zdyshjl,dm_dqbm,bdm_bjjbbm   ";
	ls_sql+=" where bj_zdyshjl.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_zdyshjl.dqbm=dm_dqbm.dqbm(+)";
	ls_sql+=" and bj_zdyshjl.xmbh='"+xmbh+"' and bj_zdyshjl.zdyxmlrr='"+lrr+"'";
	ls_sql+=" order by bj_zdyshjl.sqjl";

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
  <B><font size="3">自定义项目审核记录</font></B>
</CENTER>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">申请记录</td>
	<td  width="3%">审核标志</td>
	<td  width="5%">项目编号</td>
	<td  width="3%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="3%">地区</td>
	<td  width="3%">报价级别</td>
	<td  width="2%">受理人</td>
	<td  width="3%">受理时间</td>
	<td  width="16%">受理说明</td>
	<td  width="2%">是否被修改</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="16%">审核意见</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>

</body>
</html>