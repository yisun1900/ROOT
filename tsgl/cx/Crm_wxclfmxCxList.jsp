<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String tsjlh=null;
	tsjlh=request.getParameter("tsjlh");

	ls_sql="SELECT TO_CHAR(lrxh) lrxh,sxcl,clf,llr,llsj,lrr,lrsj,bz  ";
	ls_sql+=" FROM crm_wxclfmx  ";
    ls_sql+=" where tsjlh='"+tsjlh+"'";
    ls_sql+=" order by lrxh";
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
  <B><font size="3">维修材料费明细（报修记录号：<%=tsjlh%>）</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">录入序号</td>
	<td  width="36%">所需材料</td>
	<td  width="9%">材料费</td>
	<td  width="9%">领料人</td>
	<td  width="9%">领料时间</td>
	<td  width="6%">录入人</td>
	<td  width="9%">录入时间</td>
	<td  width="16%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>
</body>
</html>