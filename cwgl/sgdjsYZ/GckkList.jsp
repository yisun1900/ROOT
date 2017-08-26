<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");

	String ls_sql=null;

	ls_sql="SELECT cw_gckkjl.kkjlh,crm_khxx.khxm,sgdmc,cw_gckkjl.gckk,cw_gckkjl.spgckk,cw_gckkjl.sgdfy,cw_gckkjl.spsgdfy,cw_gckkjl.lrr,cw_gckkjl.lrsj, DECODE(cw_gckkjl.spbz,'2','未审批','3','审批通过','4','审批未通过'), DECODE(cw_gckkjl.jsbz,'N','未结算','Y','已结算'),cw_gckkjl.jsjlh,cw_gckkjl.bz  ";
	ls_sql+=" FROM crm_khxx,cw_gckkjl,sq_sgd  ";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and cw_gckkjl.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_gckkjl.khbh='"+khbh+"'";
    ls_sql+=" order by cw_gckkjl.kkjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置主键
	String[] keyName={"kkjlh"};
	pageObj.setKey(keyName);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">工程扣款</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">扣款记录号</td>
	<td  width="6%">客户姓名</td>
	<td  width="6%">施工队</td>
	<td  width="7%">工程扣款</td>
	<td  width="7%">审批后工程扣款</td>
	<td  width="7%">施工队承担费用</td>
	<td  width="7%">审批后施工队承担费用</td>
	<td  width="6%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="6%">审批标志</td>
	<td  width="6%">结算标志</td>
	<td  width="7%">结算记录号</td>
	<td  width="26%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>