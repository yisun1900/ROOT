<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String sgd=request.getParameter("sgd");

	String ls_sql=null;

	ls_sql="SELECT cw_kqtkjl.kkjlh,sq_sgd.sgdmc,cw_kqtkjl.kkje,cw_kqtkjl.lrr,cw_kqtkjl.lrsj,sq_dwxx.dwmc, DECODE(cw_kqtkjl.jsbz,'N','未结算','Y','已结算'),cw_kqtkjl.jsjlh,cw_kqtkjl.bz  ";
	ls_sql+=" FROM cw_kqtkjl,sq_dwxx,sq_sgd  ";
    ls_sql+=" where cw_kqtkjl.sgd=sq_sgd.sgd and cw_kqtkjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and cw_kqtkjl.sgd='"+sgd+"' and cw_kqtkjl.jsbz='N'";
    ls_sql+=" order by cw_kqtkjl.kkjlh";
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
  <B><font size="3">未结算扣其它款</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">扣款记录</td>
	<td  width="6%">施工队</td>
	<td  width="10%">扣款金额</td>
	<td  width="6%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="13%">录入部门</td>
	<td  width="7%">结算标志</td>
	<td  width="9%">结算记录号</td>
	<td  width="31%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>