<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	
	String ls_sql=null;

	String mbbm=request.getParameter("mbbm");

	ls_sql="SELECT gdm_mbsjjd.rwxh,gdm_rwbm.rwmc,gdm_mbsjjd.rwsfsj,gdm_mbsjjd.rwts  ";
	ls_sql+=" FROM gdm_mbsjjd,gdm_rwbm  ";
    ls_sql+=" where gdm_mbsjjd.rwbm=gdm_rwbm.rwbm(+)";
    ls_sql+=" and gdm_mbsjjd.mbbm='"+mbbm+"'";
    ls_sql+=" order by gdm_mbsjjd.mbbm,gdm_mbsjjd.rwxh";
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
		<td width="15%">任务序号</td>
		<td width="62%">任务名称</td>
		<td width="15%">任务发生时间</td>
	<td  width="8%">任务天数</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 

</table>

</body>
</html>