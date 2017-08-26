<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ssfgs=request.getParameter("ssfgs");

	ls_sql=" SELECT dwmc,rs_ygjbgzb.ygbh,sq_yhxx.bianhao,sq_yhxx.yhmc,sq_yhxx.xzzwbm,DECODE(gzlb,'1','固定工资','2','浮动工资'),khgz,jbgz,gwgz,glgz,jtbt,dhbt,cb,buzhu";
	ls_sql+=" FROM rs_ygjbgzb,sq_yhxx,sq_dwxx";
    ls_sql+=" where rs_ygjbgzb.ygbh=sq_yhxx.ygbh and sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.ssfgs='"+ssfgs+"'";
    ls_sql+=" and sq_yhxx.sfzszg in('N','Y')";
    ls_sql+=" order by sq_yhxx.dwbh,yhmc";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(20000);

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="14%">所属部门</td>
	<td  width="6%">员工序号</td>
	<td  width="8%">工号</td>
	<td  width="8%">员工姓名</td>
	<td  width="10%">行政职务</td>
	<td  width="6%">工资类别</td>
	<td  width="6%">绩效工资基数</td>
	<td  width="6%">基本工资</td>
	<td  width="6%">岗位工资</td>
	<td  width="6%">工龄工资</td>
	<td  width="6%">交通补贴</td>
	<td  width="6%">通讯补贴</td>
	<td  width="6%">餐饮补贴</td>
	<td  width="6%">其它补贴</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</table>

</body>
</html>