<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String fkfabm=request.getParameter("fkfabm");

	ls_sql="SELECT cw_fkcs.fkcsmc, DECODE(cw_fkfamx.lx,'1','按折前收款(不含增减项)','2','按折前收款（含增减项一次收取）','3','按折前收款（含增减项分次收取）','6','按折后收款(不含增减项)','7','按折后收款（含增减项一次收取）','8','按折后收款（含增减项分次收取）','A','折前增减项','B','折后增减项') lx,DECODE(cw_fkfamx.sfbhglf,'N','不包含','Y','包含') sfbhglf,DECODE(cw_fkfamx.sfbhsj,'N','不包含','Y','包含') sfbhsj,cw_fkfamx.bqfkbl,cw_fkfamx.yfkbl  ";
	ls_sql+=" FROM cw_fkcs,cw_fkfamx  ";
    ls_sql+=" where cw_fkfamx.fkcs=cw_fkcs.fkcs(+) ";
	ls_sql+=" and  (cw_fkfamx.fkfabm='"+fkfabm+"')";
    ls_sql+=" order by cw_fkfamx.fkcs";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">付款方案明细</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">收款期数</td>
	<td  width="37%">收款方式</td>
	<td  width="12%">收款是否包含管理费</td>
	<td  width="12%">收款是否包含税金</td>
	<td  width="12%">本期收款比率（%）</td>
	<td  width="12%">累计收款比率（%）</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>

</body>
</html>