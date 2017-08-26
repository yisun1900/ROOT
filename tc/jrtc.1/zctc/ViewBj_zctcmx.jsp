<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String tcbm=request.getParameter("tcbm");
	String tcmc=cf.executeQuery("select tcmc from bj_zctcmc where tcbm="+tcbm);

	String ls_sql=null;
	ls_sql="SELECT bj_zctcmx.sl,TO_CHAR(bj_zctcmx.tcdj),ROUND(bj_zctcmx.tcdj*bj_zctcmx.sl,2),bj_zctcmx.cpmc,bj_zctcmx.cpbm,bj_zctcmx.xh,bj_zctcmx.gg,bj_zctcmx.ppmc,bj_zctcmx.gysmc,bj_zctcmx.jldw,TO_CHAR(bj_zctcmx.ydj),TO_CHAR(bj_zctcmx.sjzj),bj_zctcmx.bz,bj_zctcmx.lrr,bj_zctcmx.lrsj  ";
	ls_sql+=" FROM bj_zctcmx  ";
    ls_sql+=" where bj_zctcmx.tcbm="+tcbm;
    ls_sql+=" order by bj_zctcmx.cpmc,bj_zctcmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数



//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cpmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">主材套餐明细(<%=tcmc%>)</font></B>
</CENTER>

<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">数量</td>
	<td  width="4%">套餐单价</td>
	<td  width="5%">金额</td>
	<td  width="8%">产品名称</td>
	<td  width="5%">产品编码</td>
	<td  width="11%">型号</td>
	<td  width="9%">规格</td>
	<td  width="7%">品牌</td>
	<td  width="11%">供应商</td>
	<td  width="3%">计量单位</td>
	<td  width="4%">原单价</td>
	<td  width="4%">升级折价</td>
	<td  width="14%">备注</td>
	<td  width="3%">录入人</td>
	<td  width="56%">录入时间</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.displayDateSum();
%> 
</table>
</body>

</html>