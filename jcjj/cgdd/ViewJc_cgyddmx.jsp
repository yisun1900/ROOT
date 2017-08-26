<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String ls_sql=null;
%>

<html>
<head>
<title>查看明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 14px'>
<div align="center">橱柜预订单明细</div> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="12%">橱柜</td>
	<td  width="10%">台面</td>
	<td  width="10%">门板</td>
	<td  width="8%">门板封边</td>
	<td  width="12%">箱体</td>
	<td  width="14%">拉手</td>
	<td  width="12%">抽屉</td>
	<td  width="8%">铰链</td>
	<td  width="14%">备注</td>
  </tr>
  <%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cgmc,jc_tmbj.tmmc,jdm_mbbm.mbmc,jdm_mbfbbm.mbfbmc,jdm_xtbm.xtmc,jdm_lsbm.lsmc,jdm_ctbm.ctmc,jdm_jlbm.jlmc,jc_cgyddmx.bz  ";
	ls_sql+=" FROM jc_cgyddmx,jc_tmbj,jdm_ctbm,jdm_jlbm,jdm_lsbm,jdm_mbbm,jdm_mbfbbm,jdm_tjbbm,jdm_xtbm,jc_cgjgb  ";
    ls_sql+=" where jc_cgyddmx.cgbm=jc_cgjgb.cgbm and jc_cgyddmx.jlbm=jdm_jlbm.jlbm(+) and jc_cgyddmx.ctbm=jdm_ctbm.ctbm(+)";
    ls_sql+=" and jc_cgyddmx.tjbbm=jdm_tjbbm.tjbbm(+) and jc_cgyddmx.lsbm=jdm_lsbm.lsbm(+) and jc_cgyddmx.xtbm=jdm_xtbm.xtbm(+)";
    ls_sql+=" and jc_cgyddmx.mbfbbm=jdm_mbfbbm.mbfbbm(+) and jc_cgyddmx.mbbm=jdm_mbbm.mbbm(+) and jc_cgyddmx.tmbm=jc_tmbj.tmbm(+)";
    ls_sql+=" and jc_cgyddmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_cgyddmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>


<div align="center">五金预订单明细</div> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="29%">五金名称</td>
	<td  width="19%">数量</td>
	<td  width="52%">备注</td>
</tr>
<%
	ls_sql="SELECT jc_cgwjbj.wjmc as jc_cgwjbj_wjmc,jc_cgwjyddmx.sl as jc_cgwjyddmx_sl,jc_cgwjyddmx.bz as jc_cgwjyddmx_bz ";
	ls_sql+=" FROM jc_cgwjbj,jc_cgwjyddmx  ";
    ls_sql+=" where jc_cgwjyddmx.wjbm=jc_cgwjbj.wjbm";
    ls_sql+=" and jc_cgwjyddmx.ddbh='"+ddbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>

<div align="center">电器预订单明细</div> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">电器名称</td>
	<td  width="15%">型号</td>
	<td  width="37%">产品特征</td>
	<td  width="11%">数量</td>
	<td  width="22%">备注</td>
</tr>
<%
	ls_sql="SELECT jc_cgdqbj.dqmc as jc_cgdqbj_dqmc,xh,cptz,jc_cgdqyddmx.sl as jc_cgdqyddmx_sl,jc_cgdqyddmx.bz as jc_cgdqyddmx_bz ";
	ls_sql+=" FROM jc_cgdqbj,jc_cgdqyddmx  ";
    ls_sql+=" where jc_cgdqyddmx.dqbm=jc_cgdqbj.dqbm";
    ls_sql+=" and jc_cgdqyddmx.ddbh='"+ddbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>

</body>
</html>
