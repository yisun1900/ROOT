<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String tcmc=cf.GB2Uni(cf.getParameter(request,"tcmc"));
	String hxbm=cf.GB2Uni(request.getParameter("hxbm"));

	String ls_sql=null;
	ls_sql="SELECT bj_wntczcmx.cpmc,bj_wntczcmx.xh,bj_wntczcmx.gg,bj_wntczcmx.ppmc,bj_wntczcmx.jldw,bj_wntczcmx.sl,bj_wntczcmx.jgwzbm,bj_wntczcmx.bz  ";
	ls_sql+=" FROM bj_wntczcmx  ";
    ls_sql+=" where bj_wntczcmx.dqbm='"+dqbm+"' and bj_wntczcmx.hxbm='"+hxbm+"' and bj_wntczcmx.tcmc='"+tcmc+"'";
    ls_sql+=" order by bj_wntczcmx.cpmc,bj_wntczcmx.xh";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
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
  <B><font size="3">套餐明细（<%=tcmc%>）</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="16%">产品名称</td>
	<td  width="16%">型号</td>
	<td  width="16%">规格</td>
	<td  width="11%">品牌</td>
	<td  width="6%">计量单位</td>
	<td  width="6%">数量</td>
	<td  width="7%">房间位置</td>
	<td  width="22%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 

</table>
</body>
</html>