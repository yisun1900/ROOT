<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String tcbm=request.getParameter("tcbm");
	String tcmc=cf.executeQuery("select tcmc from tckb_zctcmc where tcbm="+tcbm);

	String ls_sql=null;
	ls_sql="SELECT tckb_zctcmx.sl,TO_CHAR(tckb_zctcmx.tcdj),ROUND(tckb_zctcmx.tcdj*tckb_zctcmx.sl,2),tckb_zctcmx.cpmc,tckb_zctcmx.cpbm,tckb_zctcmx.kbwlbm,tckb_zctcmx.kbcpbm,tckb_zctcmx.xh,tckb_zctcmx.gg,tckb_zctcmx.ppmc,tckb_zctcmx.gysmc,tckb_zctcmx.jldw,TO_CHAR(tckb_zctcmx.ydj),TO_CHAR(tckb_zctcmx.jsj),tckb_zctcmx.bz,tckb_zctcmx.lrr,tckb_zctcmx.lrsj  ";
	ls_sql+=" FROM tckb_zctcmx  ";
    ls_sql+=" where tckb_zctcmx.tcbm="+tcbm;
    ls_sql+=" order by tckb_zctcmx.cpmc,tckb_zctcmx.xh";
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
  <B><font size="3">家具包明细(<%=tcmc%>)</font></B>
</CENTER>

<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">数量</td>
	<td  width="4%">包内单价</td>
	<td  width="5%">金额</td>
	<td  width="8%">产品名称</td>
	<td  width="5%">产品编码</td>
	<td  width="5%">科宝物料编码</td>
	<td  width="5%">科宝产品编码</td>
	<td  width="9%">型号</td>
	<td  width="7%">规格</td>
	<td  width="7%">品牌</td>
	<td  width="11%">供应商</td>
	<td  width="3%">计量单位</td>
	<td  width="4%">原单价</td>
	<td  width="4%">结算价</td>
	<td  width="12%">备注</td>
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