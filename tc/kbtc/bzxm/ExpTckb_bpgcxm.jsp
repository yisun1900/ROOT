<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String dqbm=request.getParameter("dqbm");
	String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));


	ls_sql="SELECT distinct bjjbmc,hxmc,jgwzbm,tckb_bpgcxm.xmbh,bj_jzbjb.xmmc,jldw,tckb_bpgcxm.sl,tckb_bpgcxm.dj,DECODE(tckb_bpgcxm.sfkth,'Y','可替换','N','否') sfkth,DECODE(tckb_bpgcxm.sfksc,'Y','可删除','N','否') sfksc";
	ls_sql+=" FROM tckb_bpgcxm,bdm_bjjbbm,bj_jzbjb,dm_hxbm  ";
    ls_sql+=" where tckb_bpgcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckb_bpgcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tckb_bpgcxm.dqbm=bj_jzbjb.dqbm(+) and tckb_bpgcxm.bjjbbm=bj_jzbjb.bjjbbm(+) and tckb_bpgcxm.xmbh=bj_jzbjb.xmbh(+)";
    ls_sql+=" and tckb_bpgcxm.dqbm='"+dqbm+"' and tckb_bpgcxm.bjbbh='"+bjbbh+"'";
    ls_sql+=" order by  bjjbmc,jldw,hxmc,jgwzbm,tckb_bpgcxm.xmbh";
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
	<td  width="8%">报价级别</td>
	<td  width="11%">户型</td>
	<td  width="15%">结构位置</td>
	<td  width="11%">项目编号</td>
	<td  width="20%">项目名称</td>
	<td  width="6%">计量单位</td>
	<td  width="7%">标配数量</td>
	<td  width="8%">单价</td>
	<td  width="7%">是否可替换</td>
	<td  width="7%">是否可删除</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>