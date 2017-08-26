<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;



	
	ls_sql ="SELECT jc_zcddmx.xinghao,jc_zcddmx.gg,zclbbm,jc_zcddmx.zcbm zcbm,zcmc,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'0','手写','1','销售限价','2','<font color=\"#FF0000\">促销价</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj,jldwbm,jc_zcddmx.sl,jc_zcddmx.je,ycf,qtfyje,DECODE(jc_zcddmx.sfbhpj,'Y','<font color=\"#FF0000\">包含</font>','N','不含') sfbhpj,jc_zcddmx.pjts*jc_zcddmx.sl pjzs, DECODE(jc_zcddmx.cxhdbz,'Y','<font color=\"#FF0000\">参加</font>','N','不参加') cxhdbz,cxhdbl||'%' cxhdbl,cxhdje,DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写') sxbz, jc_zcddmx.sxhtyy,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx  ";
    ls_sql+=" order by jc_zcddmx.xh,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_zcddmxMain.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数



%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">被选主材</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="400%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">型号</td>
	<td  width="5%">规格</td>
	<td  width="3%">单价</td>
	<td  width="3%" bgcolor="#CC99FF">数量</td>
	<td  width="8%">系列</td>
	<td  width="7%">主材名称</td>
	<td  width="3%">主材编码</td>
	<td  width="3%">手写标志</td>
	<td  width="5%">手写合同原因</td>
	<td  width="4%" bgcolor="#CC99FF">铺装位置</td>
	<td  width="4%" bgcolor="#CC99FF">颜色</td>
	<td  width="4%" bgcolor="#CC99FF">选择价格</td>
	<td  width="3%">计量单位</td>
	<td  width="5%">材料费</td>
	<td  width="4%">远程费</td>
	<td  width="4%">其它费</td>
	<td  width="3%" bgcolor="#CC99FF">参加促销活动</td>
	<td  width="4%" bgcolor="#CC99FF">计入促销活动比率</td>
	<td  width="4%">计入促销活动金额</td>
	<td  width="3%">是否包含配件</td>
	<td  width="3%">配件数</td>
	<td  width="10%">备注</td>
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