<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ssfgs=request.getParameter("ssfgs");
	String dwbh=request.getParameter("dwbh");
	String nian=request.getParameter("nian");
	String yue=request.getParameter("yue");
	String qqts=request.getParameter("qqts");

	
	String ls_sql=null;

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);


	if (dwbh!=null && !dwbh.equals(""))
	{
		ls_sql="SELECT rownum,'"+nian+"','"+yue+"',dwmc,ygbh,bianhao,yhmc,'"+qqts+"','',''";
		ls_sql+=" FROM (";
		ls_sql+=" SELECT dwmc,ygbh,bianhao,yhmc";
		ls_sql+=" FROM sq_yhxx,sq_dwxx  ";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.dwbh='"+dwbh+"'";
		ls_sql+=" order by sq_yhxx.dwbh,yhmc";
		ls_sql+=" )";
	}
	else{
		ls_sql="SELECT rownum,'"+nian+"','"+yue+"',dwmc,ygbh,bianhao,yhmc,'"+qqts+"','',''";
		ls_sql+=" FROM (";
		ls_sql+=" SELECT dwmc,ygbh,bianhao,yhmc";
		ls_sql+=" FROM sq_yhxx,sq_dwxx  ";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.ssfgs='"+ssfgs+"'";
		ls_sql+=" order by sq_yhxx.dwbh,yhmc";
		ls_sql+=" )";
	}
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="6%">年</td>
	<td  width="6%">月</td>
	<td  width="14%">所属部门</td>
	<td  width="10%">员工序号</td>
	<td  width="10%">工号</td>
	<td  width="10%">员工姓名</td>
	<td  width="10%">全勤天数</td>
	<td  width="10%">出勤天数</td>
	<td  width="20%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>