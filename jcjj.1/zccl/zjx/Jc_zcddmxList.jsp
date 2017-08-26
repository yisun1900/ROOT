<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxbh=request.getParameter("zjxbh");
	
	ls_sql ="SELECT jc_zcddmx.xh xh,DECODE(jc_zcddmx.lx,'1','合同项','2','增项') lx,DECODE(jc_zcddmx.sfzp,'Y','赠品','N','否') sfzp,DECODE(jc_zcddmx.sxbz,'1','非手写','2','手写') sxbz,jc_zcddmx.sxhtyy,zclbbm,jc_zcddmx.zcbm zcbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'0','手写','1','销售价','2','<font color=\"#FF0000\">促销价</font>') xzjg,TO_CHAR(jc_zcddmx.zqdj) zqdj,TO_CHAR(jc_zcddmx.dpzk) dpzk,TO_CHAR(jc_zcddmx.dj) dj,jldwbm,jc_zcddmx.zjhsl,jc_zcddmx.zjhje,zjhycf,zjhqtfy,zjhcxhdje,jc_zcddmx.sl,jc_zcddmx.je,ycf,qtfyje,DECODE(jc_zcddmx.sfbhpj,'Y','包含','N','不含') sfbhpj,jc_zcddmx.pjts*jc_zcddmx.zjhsl pjzs, DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加') cxhdbz,cxhdbl||'%' cxhdbl,cxhdje,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx  ";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' ";
    ls_sql+=" and jc_zcddmx.xh not in(select xh from jc_zczjxmx where zjxbh='"+zjxbh+"')";
    ls_sql+=" order by jc_zcddmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"zcbm","lx","sfzp","zcmc","zclbbm","xinghao","gg","jldwbm","xzjg","zqdj","dpzk","dj","cxhdbz","cxhdbl","zjhsl","zjhje","zjhycf","zjhqtfy","zjhcxhdje","sl","je","ycf","qtfyje","cxhdje","pjzs","zcpzwzbm","zcysbm","sxbz","sxhtyy","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"选择项目"};//按钮的显示名称
	String[] buttonLink={"ChooseZjx.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">增减[已购买]项目（增减项编号：<%=zjxbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="260%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">主材编码</td>
	<td  width="2%">类型</td>
	<td  width="2%">是否赠品</td>
	<td  width="4%">主材名称</td>
	<td  width="5%">系列</td>
	<td  width="4%">型号</td>
	<td  width="4%">规格</td>
	<td  width="3%">计量单位</td>
	<td  width="3%" bgcolor="#CC99FF">选择价格</td>
	<td  width="3%">折前单价</td>
	<td  width="3%">折扣</td>
	<td  width="3%">折后单价</td>
	<td  width="3%">参加促销活动</td>
	<td  width="3%">计入比率</td>
	<td  width="3%" bgcolor="#CC99FF">增减后数量</td>
	<td  width="4%" bgcolor="#CC99FF">增减后材料费</td>
	<td  width="3%" bgcolor="#CC99FF">增减后远程费</td>
	<td  width="3%" bgcolor="#CC99FF">增减后其它费</td>
	<td  width="4%" bgcolor="#CC99FF">增减后计入促销活动金额</td>
	<td  width="3%">合同数量</td>
	<td  width="4%">合同材料费</td>
	<td  width="3%">合同远程费</td>
	<td  width="3%">合同其它费</td>
	<td  width="4%">合同计入活动金额</td>
	<td  width="2%">配件数</td>
	<td  width="3%">铺装位置</td>
	<td  width="3%">颜色</td>
	<td  width="2%">手写标志</td>
	<td  width="4%">手写合同原因</td>
	<td  width="6%">备注</td>
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