<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String xh=request.getParameter("xh");

	ls_sql="SELECT dwmc,ygbh,bianhao,yhmc,xzzwbm,cqts,sjts,bjts  ,jxfz  ,jbf,yjsxe  ,tc,jf,cjkk  ,qtkk  ,rs_yggzb.bz  ";
	ls_sql+=" FROM rs_yggzb,sq_dwxx  ";
    ls_sql+=" where rs_yggzb.dwbh=sq_dwxx.dwbh and xh='"+xh+"'";
    ls_sql+=" order by rs_yggzb.dwbh,yhmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">所属部门</td>
	<td  width="5%">员工序号</td>
	<td  width="8%">工号</td>
	<td  width="7%">员工姓名</td>
	<td  width="8%">行政职务</td>
	<td  width="5%">实际出勤天数</td>
	<td  width="5%">事假天数</td>
	<td  width="5%">病假天数</td>

	<td  width="5%">绩效分值</td>


	<td  width="5%">加班费</td>
	<td  width="5%">扣保费</td>

	<td  width="5%">提成</td>
	<td  width="5%">奖罚</td>
	<td  width="5%">产假扣款</td>

	<td  width="5%">其他款项</td>

	<td  width="12%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
	pageObj.printSum();
%> 
</table>

</body>
</html>