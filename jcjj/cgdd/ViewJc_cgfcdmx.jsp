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
<div align="center">橱柜复测单明细</div> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">橱柜</td>
	<td  width="4%">吊柜<BR>进深*高</td>
	<td  width="3%">吊柜长</td>
	<td  width="3%">吊柜单价</td>
	<td  width="3%">吊柜非标系数</td>
	<td  width="4%">地柜<BR>进深*高</td>
	<td  width="3%">地柜长度</td>
	<td  width="3%">地柜单价</td>
	<td  width="3%">地柜非标系数</td>
	<td  width="3%">台面</td>
	<td  width="3%">台面长度</td>
	<td  width="3%">台面单价</td>
	<td  width="3%">台面非标系数</td>
	<td  width="6%">门板</td>
	<td  width="3%">门板面积</td>
	<td  width="3%">门板单价</td>
	<td  width="5%">门板封边</td>
	<td  width="6%">箱体</td>
	<td  width="8%">拉手</td>
	<td  width="7%">抽屉</td>
	<td  width="4%">铰链</td>
	<td  width="4%">实际总价</td>
	<td  width="4%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cgmc,dgjs||'*'||dggd,TO_CHAR(dgcd),TO_CHAR(dgdj),TO_CHAR(dgfbxs),tgjs||'*'||tggd,TO_CHAR(tdcd),TO_CHAR(tgdj),TO_CHAR(tgfbxs),jc_tmbj.tmmc,TO_CHAR(tmcd),TO_CHAR(tmdj),TO_CHAR(tmfbxs),jdm_mbbm.mbmc,TO_CHAR(mbmj),TO_CHAR(mbdj),jdm_mbfbbm.mbfbmc,jdm_xtbm.xtmc,jdm_lsbm.lsmc,jdm_ctbm.ctmc,jdm_jlbm.jlmc,jc_cgfcdmx.sjzj,jc_cgfcdmx.bz  ";
	ls_sql+=" FROM jc_cgfcdmx,jc_tmbj,jdm_ctbm,jdm_jlbm,jdm_lsbm,jdm_mbbm,jdm_mbfbbm,jdm_tjbbm,jdm_xtbm,jc_cgjgb  ";
    ls_sql+=" where jc_cgfcdmx.cgbm=jc_cgjgb.cgbm and jc_cgfcdmx.jlbm=jdm_jlbm.jlbm(+) and jc_cgfcdmx.ctbm=jdm_ctbm.ctbm(+)";
    ls_sql+=" and jc_cgfcdmx.tjbbm=jdm_tjbbm.tjbbm(+) and jc_cgfcdmx.lsbm=jdm_lsbm.lsbm(+) and jc_cgfcdmx.xtbm=jdm_xtbm.xtbm(+)";
    ls_sql+=" and jc_cgfcdmx.mbfbbm=jdm_mbfbbm.mbfbbm(+) and jc_cgfcdmx.mbbm=jdm_mbbm.mbbm(+) and jc_cgfcdmx.tmbm=jc_tmbj.tmbm(+)";
    ls_sql+=" and jc_cgfcdmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_cgfcdmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>


<div align="center">五金复测单明细</div> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="18%">五金名称</td>
	<td  width="10%">单价</td>
	<td  width="10%">数量</td>
	<td  width="12%">金额</td>
	<td  width="40%">备注</td>
</tr>
<%
	ls_sql="SELECT jc_cgwjbj.wjmc as jc_cgwjbj_wjmc,TO_CHAR(jc_cgwjfcdmx.dj) as jc_cgwjfcdmx_dj,jc_cgwjfcdmx.sl as jc_cgwjfcdmx_sl,jc_cgwjfcdmx.je as jc_cgwjfcdmx_je,jc_cgwjfcdmx.bz as jc_cgwjfcdmx_bz ";
	ls_sql+=" FROM jc_cgwjbj,jc_cgwjfcdmx  ";
    ls_sql+=" where jc_cgwjfcdmx.wjbm=jc_cgwjbj.wjbm";
    ls_sql+=" and jc_cgwjfcdmx.ddbh='"+ddbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>

<div align="center">电器复测单明细</div> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">电器名称</td>
	<td  width="10%">型号</td>
	<td  width="32%">产品特征</td>
	<td  width="6%">单价</td>
	<td  width="6%">数量</td>
	<td  width="10%">金额</td>
	<td  width="16%">备注</td>
</tr>
<%
	ls_sql="SELECT jc_cgdqbj.dqmc as jc_cgdqbj_dqmc,xh,cptz,TO_CHAR(jc_cgdqfcdmx.dj) as jc_cgdqfcdmx_dj,jc_cgdqfcdmx.sl as jc_cgdqfcdmx_sl,jc_cgdqfcdmx.je as jc_cgdqfcdmx_je,jc_cgdqfcdmx.bz as jc_cgdqfcdmx_bz ";
	ls_sql+=" FROM jc_cgdqbj,jc_cgdqfcdmx  ";
    ls_sql+=" where jc_cgdqfcdmx.dqbm=jc_cgdqbj.dqbm";
    ls_sql+=" and jc_cgdqfcdmx.ddbh='"+ddbh+"'";
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
