<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
String khbh=request.getParameter("khbh");

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<table border="1" width="260%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">增减项序号</td>
	<td  width="3%">客户编号</td>
	<td  width="3%">结构位置</td>
	<td  width="4%">材料计价方式</td>
	<td  width="2%">实际单价</td>
	<td  width="2%">数量</td>
	<td  width="3%">金额</td>
	<td  width="8%">配套产品说明</td>
	<td  width="2%">报价级别名称</td>
	<td  width="4%">产品编码</td>
	<td  width="4%">产品名称</td>
	<td  width="4%">品牌</td>
	<td  width="4%">型号</td>
	<td  width="4%">规格</td>
	<td  width="7%">供应商名称</td>
	<td  width="2%">报价计量单位</td>
	<td  width="2%">下单计量单位</td>
	<td  width="2%">下单比</td>
	<td  width="2%">是否需处理小数</td>
	<td  width="2%">是否有效</td>
	<td  width="2%">有效开始时间</td>
	<td  width="2%">有效结束时间</td>
	<td  width="2%">套餐内单价</td>
	<td  width="2%">套餐超量单价</td>
	<td  width="2%">是否可改单价</td>
	<td  width="2%">损耗</td>
	<td  width="2%">是否超市产品</td>
	<td  width="3%">主材类型</td>
	<td  width="2%">SKU号</td>
	<td  width="3%">产品大类</td>
	<td  width="3%">产品类别</td>
	<td  width="53%">套餐升级分</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();


	String ls_sql=null;

	ls_sql="SELECT bj_zjxzcbgqd.zjxxh,bj_zjxzcbgqd.khbh,bj_zjxzcbgqd.jgwzbm,DECODE(bj_zjxzcbgqd.ddcljjfs,'0','非顶配材料','1','顶配（补差价）','2','顶配（独立计价）','3','套餐选配'),TO_CHAR(bj_zjxzcbgqd.dj),bj_zjxzcbgqd.sl,ROUND(bj_zjxzcbgqd.dj*bj_zjxzcbgqd.sl,2) je,bj_zjxzcbgqd.ptcpsm,bdm_bjjbbm.bjjbmc  ,bj_zjxzcbgqd.cpbm,bj_zjxzcbgqd.cpmc,bj_zjxzcbgqd.ppmc,bj_zjxzcbgqd.xh,bj_zjxzcbgqd.gg,bj_zjxzcbgqd.gysmc,bj_zjxzcbgqd.jldw,bj_zjxzcbgqd.xdjldw,TO_CHAR(bj_zjxzcbgqd.xdb),bj_zjxzcbgqd.sfxclxs,bj_zjxzcbgqd.sfyx,bj_zjxzcbgqd.yxkssj,bj_zjxzcbgqd.yxjzsj,TO_CHAR(bj_zjxzcbgqd.tcndj),TO_CHAR(bj_zjxzcbgqd.tccldj),DECODE(bj_zjxzcbgqd.sfkgdj,'Y','是','N','否'),bj_zjxzcbgqd.sh||'%',DECODE(bj_zjxzcbgqd.sfcscp,'Y','是','N','否'),DECODE(bj_zjxzcbgqd.zclx,'1','套餐内','2','套餐外','3','顶配套餐内','4','顶配套餐外'),bj_zjxzcbgqd.sku,jxc_cldlbm.cldlmc,jxc_clxlbm.clxlmc,bj_tcsjflbm.tcsjflmc";
	ls_sql+=" FROM bdm_bjjbbm,bj_zjxzcbgqd,jxc_cldlbm,jxc_clxlbm,bj_tcsjflbm  ";
	ls_sql+=" where bj_zjxzcbgqd.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.tccpdlbm=jxc_cldlbm.cldlbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.khbh='"+khbh+"' and bj_zjxzcbgqd.zjxxh='"+zjxxh+"'";
	ls_sql+=" order by bj_zjxzcbgqd.jgwzbm,bj_zjxzcbgqd.ppmc,bj_zjxzcbgqd.xh";
	pageObj.sql=ls_sql;
	//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数



	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>