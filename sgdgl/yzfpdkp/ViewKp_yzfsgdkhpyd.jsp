<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String kpjlh=request.getParameter("kpjlh");

	String ls_sql=null;


	ls_sql="SELECT '',kp_yzfsgdkhpyd.kpjlh,sgdmc,dwmc,kp_yzfsgdkhpyd.khmyd||'%'";
	ls_sql+=" FROM kp_yzfsgdkhpyd,sq_sgd,sq_dwxx";
    ls_sql+=" where kp_yzfsgdkhpyd.sgd=sq_sgd.sgd(+) and kp_yzfsgdkhpyd.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=" and kp_yzfsgdkhpyd.kpjlh='"+kpjlh+"'";
    ls_sql+=" order by kp_yzfsgdkhpyd.kpjlh,kp_yzfsgdkhpyd.ssfgs,kp_yzfsgdkhpyd.khmyd desc,sgdmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(4000);//设置每页显示记录数
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果（考评记录号：<%=kpjlh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">考评记录号</td>
	<td  width="20%">考评记录号</td>
	<td  width="20%">施工队</td>
	<td  width="20%">分公司</td>
	<td  width="20%">户满意度</td>
</tr>
<%
	pageObj.printDate(true);
	pageObj.printFoot();
%> 

</body>
</html>