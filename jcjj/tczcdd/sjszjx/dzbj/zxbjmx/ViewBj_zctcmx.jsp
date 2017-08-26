<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String tcbm=request.getParameter("tcbm");
	String tcmc=cf.executeQuery("select tcmc from bj_zctcmc where tcbm="+tcbm);

	String ls_sql=null;
	ls_sql="SELECT bj_zctcmx.cpmc,bj_zctcmx.xh,bj_zctcmx.gg,bj_zctcmx.ppmc,bj_zctcmx.sl||bj_zctcmx.jldw";
	ls_sql+=" FROM bj_zctcmc,bj_zctcmx  ";
    ls_sql+=" where bj_zctcmx.tcbm=bj_zctcmc.tcbm(+)";
    ls_sql+=" and bj_zctcmx.tcbm="+tcbm;
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
<style type="text/css">
<!--
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3"><%=tcmc%>(<span class="STYLE2">名称相同项多选一</span>)</font></B>
</CENTER>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">产品名称</td>
	<td  width="30%">型号</td>
	<td  width="20%">规格</td>
	<td  width="18%">品牌</td>
	<td  width="12%">数量</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.displayDate();
%> 
</table>
</body>

</html>