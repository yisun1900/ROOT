<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String yddbh=request.getParameter("yddbh");

	String ls_sql=null;

	ls_sql="SELECT TO_CHAR(lrxh) lrxh,DECODE(lx,'1','合同项','2','增项','3','减项') lx,blzjxyymc,jc_blddmx.yddbh as yddbh,jc_blddmx.blxhbm as blxhbm,jc_blbj.blxh as jc_blbj_blxh,TO_CHAR(jc_blddmx.dj) as jc_blddmx_dj,jc_blddmx.sl as jc_blddmx_sl,jc_blddmx.dj*jc_blddmx.sl je,jc_blddmx.bz as jc_blddmx_bz  ";
	ls_sql+=" FROM jc_blbj,jc_blddmx,jdm_blzjxyybm  ";
    ls_sql+=" where jc_blddmx.blxhbm=jc_blbj.blxhbm and  jc_blddmx.blzjxyybm=jdm_blzjxyybm.blzjxyybm(+)";
    ls_sql+=" and jc_blddmx.yddbh='"+yddbh+"' and jc_blddmx.lx in('1','3')";
    ls_sql+=" order by jc_blddmx.yddbh,jc_blddmx.lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","JxJc_blddmx.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.setEditStr("减项");
//设置显示列
	String[] disColName={"lrxh","lx","blzjxyymc","jc_blbj_blxh","jc_blddmx_dj","jc_blddmx_sl","je","jc_blddmx_bz"};
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
  <B><font size="3">玻璃订单--减项</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">序号</td>
	<td  width="6%">类型</td>
	<td  width="10%">增减项原因</td>
	<td  width="30%">玻璃型号</td>
	<td  width="10%">单价</td>
	<td  width="10%">订购数量</td>
	<td  width="10%">金额</td>
	<td  width="20%">备注</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>