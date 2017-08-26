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


	ls_sql="SELECT nbbm,tc_csrjzck.tccpdlbm,tc_csrjzck.tccplbbm,bzmc,tc_csrjzck.cpmc,tc_csrjzck.xh,tc_csrjzck.gg,tc_csrjzck.ppmc,tc_csrjzck.gysmc,tc_csrjzck.jldw,tc_csrjzck.xdjldw,tc_csrjzck.xdb,tc_csrjzck.sh,DECODE(tc_csrjzck.sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理') sfxclxs,tc_csrjzck.jsj vv,tc_csrjzck.khxsdj ggd ";
	ls_sql+=" FROM tc_csrjzck,bdm_bjjbbm a,bdm_bjjbbm b,tc_csrjzcsjcjb  ";
    ls_sql+=" where tc_csrjzck.cpbm=tc_csrjzcsjcjb.cpbm(+) ";
    ls_sql+=" and tc_csrjzck.bjjbbm=a.bjjbbm(+) ";
    ls_sql+=" and tc_csrjzcsjcjb.bjjbbm=b.bjjbbm(+) ";
    ls_sql+=" and tc_csrjzck.dqbm='"+dqbm+"'";
    ls_sql+=" order by tc_csrjzck.tccpdlbm,tc_csrjzck.tccplbbm,tc_csrjzck.bjjbbm,tc_csrjzck.cpbm";
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
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
      <td width="3%">内部编码</td>
      <td width="3%">产品大类</td>
	  <td width="5%">产品小类</td>
	  <td width="4%">分组名称</td>
      <td width="5%">产品名称</td>
      <td width="5%">型号</td>
      <td width="5%">规格</td>
	  <td width="4%">品牌</td>
	  <td width="5%">供应商</td>
	  <td width="2%">计量单位</td>
	  <td width="2%">下单计量单位</td>
	  <td width="2%">下单比</td>
	  <td width="2%">损耗</td>
	  <td width="3%">是否需处理小数</td>
	  <td width="3%">原结算价</td>
	  <td width="3%">原客户销售单价</td>
      <td width="3%">原施工队单价</td>
	  <td width="3%">结算价</td>
	  <td width="3%">客户销售单价</td>
      <td width="3%">施工队单价</td>
	  <td width="3%">是否有效</td>
	  <td width="3%">有效开始时间</td>
	  <td width="3%">有效结束时间</td>
	  <td width="4%">照片名称</td>
	  <td width="7%">备注</td>
	  <td width="3%">主材级别</td>
	  <td width="3%">被升级级别</td>
	  <td width="3%">原升级收费价</td>
	  <td width="3%">升级收费价</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>