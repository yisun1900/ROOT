<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String bjbbh=null;
	String dqbm=null;
	String bjjbbm=null;

	bjbbh=request.getParameter("bjbbh");
	dqbm=request.getParameter("dqbm");
	bjjbbm=request.getParameter("bjjbbm");

	ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,tcsjflmc,bj_tczcbj.cpbm,DECODE(bj_tczcbj.sfcscp,'Y','是','N','否') sfcscp,bj_tczcbj.sku,bj_tczcbj.cpmc,bj_tczcbj.xh,bj_tczcbj.gg,bj_tczcbj.jldw,bj_tczcbj.xdjldw,bj_tczcbj.xdb,bj_tczcbj.sh,DECODE(bj_tczcbj.sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理') sfxclxs,bj_tczcbj.dj,bj_tczcbj.jsj,bj_tczcbj.jjje, bj_tczcbj.xuhao,bj_tczcbj.ppmc,bj_tczcbj.gysmc ";
	ls_sql+=" FROM bj_tczcbj,jxc_cldlbm,jxc_clxlbm,bj_tcsjflbm  ";
    ls_sql+=" where bj_tczcbj.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_tczcbj.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_tczcbj.tcsjflbm=bj_tcsjflbm.tcsjflbm(+) ";
    ls_sql+=" and bj_tczcbj.bjbbh='"+bjbbh+"' and bj_tczcbj.dqbm='"+dqbm+"' and bj_tczcbj.bjjbbm='"+bjjbbm+"'";
    ls_sql+=" order by bj_tczcbj.tccpdlbm,bj_tczcbj.tccplbbm,bj_tczcbj.cpbm";
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
<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">产品大类</td>
	<td  width="6%">产品类别</td>
	<td  width="6%">套餐升级分类</td>
	<td  width="5%">产品编码</td>
	<td  width="3%">是否超市产品</td>
	<td  width="4%">SKU号</td>
	<td  width="7%">产品名称</td>
	<td  width="8%">型号</td>
	<td  width="8%">规格</td>
	<td  width="3%">计量单位</td>
	<td  width="3%">下单计量单位</td>
	<td  width="3%">下单比</td>
	<td  width="3%">损耗(%)</td>
	<td  width="4%">是否需处理小数</td>
	<td  width="4%">单价</td>
	<td  width="4%">结算价</td>
	<td  width="4%">加价金额</td>
	<td  width="2%">排序序号</td>
	<td  width="6%">品牌</td>
	<td  width="11%">供应商</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>