<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String wheresql="";
	String ddbh=request.getParameter("ddbh");

	ls_sql="SELECT jc_jjazjl.ddbh,jc_jjazjl.smrq,jdm_zcsmyybm.zcsmyy,jc_jjazjl.azqk,jc_jjazjl.lrr,jc_jjazjl.lrsj  ";
	ls_sql+=" FROM jc_jjazjl,jdm_zcsmyybm  ";
    ls_sql+=" where jc_jjazjl.zcsmyybm=jdm_zcsmyybm.zcsmyybm(+)";
    ls_sql+=" and jc_jjazjl.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_jjazjl.ddbh,jc_jjazjl.smrq";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//设置每页显示记录数
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">安装记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">订单编号</td>
	<td  width="11%">上门日期</td>
	<td  width="10%">再次上门原因</td>
	<td  width="51%">安装情况</td>
	<td  width="8%">录入人</td>
	<td  width="11%">录入时间</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
</html>