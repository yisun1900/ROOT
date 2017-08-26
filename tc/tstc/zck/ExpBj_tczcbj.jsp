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

	ls_sql="SELECT tc_zck.cpbm,tc_zck.nbbm,tc_zck.cldl,tc_zck.clxl,tc_zck.cpmc,tc_zck.xh,tc_zck.gg,tc_zck.ppmc,tc_zck.gysmc,tc_zck.jldw,tc_zck.xdjldw,tc_zck.xdb,tc_zck.sh, DECODE(tc_zck.sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理'),tc_zck.lbxmbm,tc_zck.cxxmbm, DECODE(tc_zck.sfyx,'1','正在销售','2','停止销售','3','阶段销售','4','售前核实'),tc_zck.yxkssj,tc_zck.yxjzsj,tc_zck.xuhao, DECODE(tc_zck.lx,'1','套餐项','2','促销项','3','礼包项','4','套餐外'),bdm_bjjbbm.bjjbmc,tc_zck.jsj,tc_zck.khxsdj,tc_zck.sgddj,tc_zck.sjj1,tc_zck.sjj2,tc_zck.sjj3,tc_zck.sjj4,tc_zck.sjj5  ";
	ls_sql+=" FROM bdm_bjjbbm,tc_zck  ";
    ls_sql+=" where tc_zck.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_zck.dqbm='"+dqbm+"'";
    ls_sql+=" order by tc_zck.bjjbbm,tc_zck.cldl,tc_zck.clxl,tc_zck.cpbm";
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
<table border="1" width="370%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">产品编码</td>
	<td  width="2%">内部编码</td>
	<td  width="3%">产品大类</td>
	<td  width="3%">产品小类</td>
	<td  width="7%">产品名称</td>
	<td  width="6%">型号</td>
	<td  width="4%">规格</td>
	<td  width="4%">品牌</td>
	<td  width="6%">供应商</td>
	<td  width="2%">计量单位</td>
	<td  width="2%">下单计量单位</td>
	<td  width="2%">下单比</td>
	<td  width="2%">损耗</td>
	<td  width="2%">是否需处理小数</td>
	<td  width="3%">礼包项目编码</td>
	<td  width="3%">促销项目编码</td>
	<td  width="3%">是否有效</td>
	<td  width="3%">有效开始时间</td>
	<td  width="3%">有效结束时间</td>
	<td  width="2%">排序序号</td>
	<td  width="2%">类型</td>
	<td  width="2%">报价级别</td>

	<td  width="2%">结算价</td>
	<td  width="2%">客户销售单价</td>
	<td  width="2%">施工队单价</td>
	<td  width="2%">升级价1</td>
	<td  width="2%">升级价2</td>
	<td  width="2%">升级价3</td>
	<td  width="2%">升级价4</td>
	<td  width="2%">升级价5</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>