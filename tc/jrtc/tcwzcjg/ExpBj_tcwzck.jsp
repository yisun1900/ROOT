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
	String ppmc=null;

	dqbm=request.getParameter("dqbm");
	ppmc=cf.GB2Uni(request.getParameter("ppmc"));

	ls_sql="SELECT bj_tcwzck.ppmc,bj_tcwzck.gysmc,jxc_cldlbm.cldlmc,clxlmc,bj_tcwzck.cpbm,bj_tcwzck.cpmc,bj_tcwzck.xh,bj_tcwzck.gg,bj_tcwzck.jldw,bj_tcwzck.xdjldw,bj_tcwzck.xdb,bj_tcwzck.sh,DECODE(bj_tcwzck.sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理') sfxclxs,bj_tcwzck.dj,DECODE(bj_tcwzck.sfkgdj,'Y','可改','N','否') sfkgdj,DECODE(bj_tcwzck.jsfs,'1','结算价','2','结算比例') jsfs,bj_tcwzck.jsj,bj_tcwzck.jsbl,DECODE(bj_tcwzck.jjfs,'1','补差价','2','独立计价','3','套餐选配') jjfs,DECODE(bj_tcwzck.sfycx,'Y','有促销','N','无') sfycx,bj_tcwzck.cxkssj,bj_tcwzck.cxjssj,bj_tcwzck.cxj,bj_tcwzck.cxjsj,bj_tcwzck.cxjsbl,DECODE(bj_tcwzck.sfyx,'1','永远有效','2','无效','3','阶段有效') sfyx,bj_tcwzck.yxkssj,bj_tcwzck.yxjzsj ";
	ls_sql+=" FROM bj_tcwzck,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where bj_tcwzck.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_tcwzck.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_tcwzck.dqbm='"+dqbm+"' and bj_tcwzck.ppmc='"+ppmc+"'";
    ls_sql+=" order by bj_tcwzck.tccpdlbm,bj_tcwzck.tccplbbm,bj_tcwzck.cpbm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);

//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="230%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">品牌</td>
	<td  width="8%">供应商</td>
	<td  width="5%">产品大类</td>
	<td  width="4%">产品类别</td>
	<td  width="4%">产品编码</td>
	<td  width="6%">产品名称</td>
	<td  width="6%">型号</td>
	<td  width="6%">规格</td>
	<td  width="3%">计量单位</td>
	<td  width="3%">下单计量单位</td>
	<td  width="3%">下单比</td>
	<td  width="3%">损耗(%)</td>
	<td  width="4%">是否需处理小数</td>
	<td  width="3%">单价</td>
	<td  width="3%">是否可改单价</td>
	<td  width="3%">结算方式</td>
	<td  width="2%">结算价</td>
	<td  width="2%">结算比例</td>
	<td  width="3%">计价方式</td>
	<td  width="3%">是否有促销</td>
	<td  width="3%">促销开始时间</td>
	<td  width="3%">促销结束时间</td>
	<td  width="3%">促销价</td>
	<td  width="2%">促销结算价</td>
	<td  width="2%">促销结算比例</td>
	<td  width="3%">是否有效</td>
	<td  width="3%">有效开始时间</td>
	<td  width="3%">有效结束时间</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>