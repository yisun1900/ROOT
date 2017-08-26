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

	ls_sql="SELECT bjjbmc,tckb_zck.kbcpbm,tckb_zck.kbwlbm,tckb_zck.ppmc,tckb_zck.gysmc,tckb_zck.cpdl,tckb_zck.cpxl,tckb_zck.cpbm,tckb_zck.cpmc,tckb_zck.xh,tckb_zck.gg,tckb_zck.cptz,tckb_zck.czlx,tckb_zck.cpks,tckb_zck.cplx,tckb_zck.jldw,tckb_zck.xdjldw,tckb_zck.xdb,tckb_zck.sh,DECODE(tckb_zck.sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理') sfxclxs,tckb_zck.jsj,tckb_zck.lsj,tckb_zck.sjj,DECODE(tckb_zck.cllx,'1','包内产品','2','包外产品') cllx,DECODE(tckb_zck.sfyx,'1','正在销售','2','停止销售','3','阶段销售','4','售前核实') sfyx,tckb_zck.yxkssj,tckb_zck.yxjzsj, tckb_zck.xuhao,DECODE(tckb_zck.sfkgdj,'Y','可改','N','否') sfkgdj ";
	ls_sql+=" FROM tckb_zck,bdm_bjjbbm ";
    ls_sql+=" where tckb_zck.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckb_zck.dqbm='"+dqbm+"'";
    ls_sql+=" order by tckb_zck.bjjbbm,tckb_zck.kbcpbm,tckb_zck.cpdl,tckb_zck.cpxl,tckb_zck.cpbm";
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
<table border="1" width="280%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
      <td width="2%">报价级别</td>
      <td width="3%">科宝产品编码</td>
      <td width="3%">科宝物料编码</td>
      <td width="4%">品牌</td>
      <td width="8%">供应商</td>
      <td width="4%">产品大类</td>
      <td width="4%">产品小类</td>
	  <td width="3%">产品编码</td>
      <td width="6%">产品名称</td>
      <td width="5%">型号</td>
      <td width="5%">规格</td>
      <td width="7%">产品特征</td>
      <td width="5%">材质类型</td>
      <td width="5%">产品款式</td>
      <td width="4%">产品类型</td>
	  <td width="2%">报价计量单位</td>
	  <td width="2%">下单计量单位</td>
	  <td width="2%">下单比</td>
	  <td width="2%">损耗（%）</td>
	  <td width="2%">是否需处理小数</td>
	  <td width="2%">结算价</td>
	  <td width="2%">零售价</td>
	  <td width="2%">包内价</td>
	  <td width="2%">材料类型</td>
	<td  width="2%">是否有效</td>
	<td  width="3%">有效开始时间</td>
	<td  width="3%">有效结束时间</td>
      <td width="2%">排序</td>
	<td  width="2%">是否可改单价</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>