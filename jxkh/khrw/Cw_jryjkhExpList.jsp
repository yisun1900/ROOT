<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;

	String khzq=null;
	String ssfgs=null;
	khzq=request.getParameter("khzq");
	ssfgs=request.getParameter("ssfgs");

	ls_sql="SELECT sq_yhxx.ygbh,sq_dwxx.dwmc,sq_yhxx.bianhao,sq_yhxx.yhmc,sq_yhxx.xzzwbm,(select cw_jryjkh.byrw  from cw_jryjkh where sq_yhxx.ygbh=cw_jryjkh.ygbh and cw_jryjkh.khzq='"+khzq+"')";
	ls_sql+=" FROM sq_yhxx,sq_dwxx ";
    ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and sq_yhxx.sfzszg in('N','Y')";
	ls_sql+=" and sq_yhxx.ssfgs='"+ssfgs+"'";

    ls_sql+=" order by sq_yhxx.dwbh,sq_yhxx.xzzwbm,sq_yhxx.yhmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">员工序号</td>
	<td  width="8%">所属部门</td>
	<td  width="6%">工号</td>
	<td  width="5%">姓名</td>
	<td  width="6%">职务</td>
	<td  width="7%">考核任务</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 

</table>
</body>
</html>