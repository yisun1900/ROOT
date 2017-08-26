<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String dqbm=null;

	dqbm=request.getParameter("dqbm");

	ls_sql="SELECT clxlmc,a.bjjbmc,b.bjjbmc bjjbmc1,tckd_tcsjcjb.jldw,tckd_tcsjcjb.sjcj,DECODE(sjsfycx,'1','无促销','2','<font color=\"#FF0000\">无数量限制促销</font>','3','<font color=\"#0000FF\">有数量限制促销</font>') sjsfycx,cxsjcj,cxkssj,cxjssj  ";
	ls_sql+=" FROM tckd_tcsjcjb,jdm_bjjbbm a,jdm_bjjbbm b,jxc_clxlbm  ";
    ls_sql+=" where tckd_tcsjcjb.bjjbbm=a.bjjbbm(+)";
    ls_sql+=" and tckd_tcsjcjb.bjjbbm1=b.bjjbbm(+)";
    ls_sql+=" and tckd_tcsjcjb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tckd_tcsjcjb.dqbm='"+dqbm+"'";
    ls_sql+=" order by tckd_tcsjcjb.tccplbbm,tckd_tcsjcjb.bjjbbm,tckd_tcsjcjb.bjjbbm1";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">产品类别</td>
	<td  width="10%">原报价级别</td>
	<td  width="10%">升级报价级别</td>
	<td  width="10%">计量单位</td>
	<td  width="10%">升级差价</td>
	<td  width="12%">升级是否有促销</td>
	<td  width="10%">促销升级差价</td>
	<td  width="9%">促销开始时间</td>
	<td  width="9%">促销结束时间</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 

</body>
</html>