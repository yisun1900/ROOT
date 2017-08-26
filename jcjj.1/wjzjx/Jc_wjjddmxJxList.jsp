<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String yddbh=request.getParameter("yddbh");

	String ls_sql=null;

	ls_sql="SELECT TO_CHAR(lrxh) lrxh,DECODE(lx,'1','合同项','2','增项','3','减项') lx,wjzjxyymc,jc_wjjddmx.yddbh as yddbh,jc_wjjddmx.xh as xh,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_wjjbj.xinghao as jc_wjjbj_xinghao,TO_CHAR(jc_wjjddmx.dj) as jc_wjjddmx_dj,jc_wjjddmx.sl as jc_wjjddmx_sl,jc_wjjddmx.dj*jc_wjjddmx.sl je,jc_wjjddmx.bz as jc_wjjddmx_bz  ";
	ls_sql+=" FROM jc_wjjddmx,jdm_wjjbm,jdm_wjzjxyybm  ";
    ls_sql+=" where jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm and  jc_wjjddmx.wjzjxyybm=jdm_wjzjxyybm.wjzjxyybm(+)";
    ls_sql+=" and jc_wjjddmx.yddbh='"+yddbh+"' and jc_wjjddmx.lx in('1','3')";
    ls_sql+=" order by jc_wjjddmx.yddbh,jc_wjjddmx.lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","JxJc_wjjddmx.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.setEditStr("减项");
//设置显示列
	String[] disColName={"lrxh","lx","wjzjxyymc","jdm_wjjbm_wjjmc","jc_wjjbj_xinghao","jc_wjjddmx_dj","jc_wjjddmx_sl","je","jc_wjjddmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("lx","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">五金件订单--减项</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">序号</td>
	<td  width="6%">类型</td>
	<td  width="10%">增减项原因</td>
	<td  width="12%">五金件名称</td>
	<td  width="17%">型号</td>
	<td  width="7%">单价</td>
	<td  width="8%">订购数量</td>
	<td  width="10%">总金额</td>
	<td  width="20%">备注</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>