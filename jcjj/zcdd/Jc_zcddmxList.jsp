<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String clzt=cf.executeQuery("select clzt from jc_zcdd where ddbh='"+ddbh+"'");
	if (!clzt.equals("07"))
	{
		out.println("<BR>错误，不能再进行修改！合同已完成");
		return;
	}

	
	ls_sql ="SELECT jc_zcddmx.xh,zclbbm,jc_zcddmx.zcbm zcbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'0','手写','1','销售限价','2','<font color=\"#FF0000\">促销价</font>') xzjg,TO_CHAR(jc_zcddmx.zqdj) zqdj,TO_CHAR(jc_zcddmx.dpzk) dpzk,TO_CHAR(jc_zcddmx.dj) dj,TO_CHAR(jc_zcddmx.zdxsj) zdxsj,jldwbm,jc_zcddmx.sl,jc_zcddmx.zqje,jc_zcddmx.je,ycf,qtfyje,DECODE(jc_zcddmx.sfbhpj,'Y','<font color=\"#FF0000\">包含</font>','N','不含') sfbhpj,jc_zcddmx.pjts*jc_zcddmx.sl pjzs, DECODE(jc_zcddmx.cxhdbz,'Y','<font color=\"#FF0000\">参加</font>','N','不参加') cxhdbz,cxhdbl||'%' cxhdbl,cxhdje,DECODE(jc_zcddmx.sxbz,'1','否','2','手写') sxbz, jc_zcddmx.sxhtyy,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx  ";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_zcddmx.xh,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_zcddmxMain.jsp?ddbh="+ddbh);
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"zcbm","sxbz","sxhtyy","zqdj","dpzk","dj","zdxsj","sl","zcmc","xinghao","gg","zcpzwzbm","zcysbm","xzjg","zclbbm","jldwbm","zqje","je","ycf","qtfyje","cxhdbz","cxhdbl","cxhdje","sfbhpj","pjzs","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的主材"};//按钮的显示名称
	String[] buttonLink={"DeleteJc_zcddmx.jsp?ddbh="+ddbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">被选主材（订单编号：<%=ddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="210%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">主材编码</td>
	<td  width="2%">手写标志</td>
	<td  width="5%">手写合同原因</td>
	<td  width="3%">折前单价</td>
	<td  width="2%">折扣</td>
	<td  width="3%">折后单价</td>
	<td  width="3%">最低销售限价</td>
	<td  width="3%" bgcolor="#CC99FF">数量</td>
	<td  width="6%">主材名称</td>
	<td  width="5%">型号</td>
	<td  width="4%">规格</td>
	<td  width="4%" bgcolor="#CC99FF">铺装位置</td>
	<td  width="3%" bgcolor="#CC99FF">颜色</td>
	<td  width="3%" bgcolor="#CC99FF">选择价格</td>
	<td  width="8%">系列</td>
	<td  width="2%">计量单位</td>
	<td  width="4%">折前材料费</td>
	<td  width="4%">折后材料费</td>
	<td  width="4%">远程费</td>
	<td  width="4%">其它费</td>
	<td  width="3%" bgcolor="#CC99FF">参加促销活动</td>
	<td  width="3%" bgcolor="#CC99FF">计入促销活动比率</td>
	<td  width="4%">计入促销活动金额</td>
	<td  width="2%">是否包含配件</td>
	<td  width="2%">配件数</td>
	<td  width="11%">备注</td>
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