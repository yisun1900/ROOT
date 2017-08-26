<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
	
	ls_sql ="SELECT jc_zcddmx.xh xh,DECODE(jc_zczjxmx.lx,'1','原项目','2','新增') lx,DECODE(jc_zczjxmx.sxbz,'1','非手写','2','手写') sxbz,jc_zcddmx.sxhtyy,jc_zcddmx.dwbh,zclbbm,jc_zcddmx.zcbm zcbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'0','手写','1','销售限价','2','<font color=\"#FF0000\">促销价</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj,DECODE(jc_zcddmx.jsfs,'1','结算价','2','结算比例') jsfs,TO_CHAR(jc_zcddmx.jsbl)||'%' jsbl,TO_CHAR(jc_zcddmx.cbj) cbj,round(jc_zcddmx.cbj*jc_zczjxmx.zjsl,2) jsje,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl,jc_zczjxmx.zjje ,jc_zczjxmx.zjycf,jc_zczjxmx.zjqtfy,jc_zczjxmx.zjcxhdje,jc_zcddmx.zjhsl,jc_zcddmx.zjhje,jc_zcddmx.zjhycf,jc_zcddmx.zjhqtfy,jc_zcddmx.zjhcxhdje,cxhdbl||'%' cxhdbl,jc_zczjxmx.bz  ";
	ls_sql+=" FROM jc_zczjxmx,jc_zcddmx";
    ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh and jc_zczjxmx.zjxbh='"+zjxbh+"'";
//    ls_sql+=" and jc_zczjxmx.lx='2' and jc_zczjxmx.sxbz='2'";//1：非手写；2：手写
    ls_sql+=" order by jc_zczjxmx.lx,jc_zcddmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","LrjsjEditJc_zcddmx.jsp?zjxbh="+zjxbh+"&ddbh="+ddbh);
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"lx","sxbz","zcmc","xinghao","gg","xzjg","dj","jsfs","jsbl","cbj","jsje","jldwbm","cxhdbl","zjsl","zjje","zjycf","zjqtfy","zjcxhdje","zjhsl","zjhje","zjhycf","zjhqtfy","zjhcxhdje","zclbbm","zcpzwzbm","zcysbm","sxhtyy","zcbm","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">审核手写合同－录入结算价（增减项编号：<%=zjxbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="210%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">类型</td>
	<td  width="3%">手写标志</td>
	<td  width="5%">主材名称</td>
	<td  width="5%">型号</td>
	<td  width="4%">规格</td>
	<td  width="3%">选择价格</td>
	<td  width="3%">单价</td>
	<td  width="2%">结算方式</td>
	<td  width="2%">结算比例</td>
	<td  width="3%">结算单价</td>
	<td  width="3%">结算金额</td>
	<td  width="2%">计量单位</td>
	<td  width="3%">计入活动比率</td>
	<td  width="3%" bgcolor="#CC99FF">增减数量</td>
	<td  width="3%" bgcolor="#CC99FF">增减材料费</td>
	<td  width="3%" bgcolor="#CC99FF">增减远程费</td>
	<td  width="3%" bgcolor="#CC99FF">增减其它费</td>
	<td  width="3%" bgcolor="#CC99FF">增减计入活动金额</td>
	<td  width="3%">原数量</td>
	<td  width="3%">原材料费</td>
	<td  width="3%">原远程费</td>
	<td  width="3%">原其它费</td>
	<td  width="3%">原计入活动金额</td>
	<td  width="5%">系列</td>
	<td  width="4%">铺装位置</td>
	<td  width="3%">颜色</td>
	<td  width="4%">手写合同原因</td>
	<td  width="3%">主材编码</td>
	<td  width="65%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
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