<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String ls_sql=null;
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<CENTER >
  <B><font size="3">付款记录</font></B>
</CENTER>
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">收款序号</td>
	<td  width="7%">收据编号</td>
	<td  width="6%">支付方式</td>
	<td  width="8%">付款类型</td>
	<td  width="8%">收款金额</td>
	<td  width="7%">收取时间</td>
	<td  width="5%">收取人</td>
	<td  width="7%">财务收取时间</td>
	<td  width="5%">财务收取人</td>
	<td  width="11%">录入单位</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="17%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_khfkjl.fkxh,cw_khfkjl.sjbh,zffsmc,fklxmc,cw_khfkjl.fkje,cw_khfkjl.sksj,cw_khfkjl.skr,cw_khfkjl.sjsj,cw_khfkjl.sjr,sq_dwxx.dwmc,cw_khfkjl.lrr,cw_khfkjl.lrsj,cw_khfkjl.bz  ";
	ls_sql+=" FROM sq_dwxx,cw_khfkjl,cw_fklxbm,cw_zffsbm  ";
    ls_sql+=" where cw_khfkjl.dwbh=sq_dwxx.dwbh(+) and cw_khfkjl.zffs=cw_zffsbm.zffsbm(+)";
    ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and cw_khfkjl.fklxbm=cw_fklxbm.fklxbm(+) and cw_khfkjl.scbz='N'";
    ls_sql+=" order by cw_khfkjl.fklxbm,fkxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>


</body>
</html>
