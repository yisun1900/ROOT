<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
	String clzt=cf.executeQuery("select clzt from jc_zczjx where ddbh='"+ddbh+"' and zjxxh="+zjxxh);
	if (!clzt.equals("00"))
	{
		out.println("<BR>错误，不能再进行修改！增减项单已完成");
		return;
	}

	
	ls_sql ="SELECT jc_zcddmx.xh xh,dwmc,zclbbm,jc_zcddmx.zcbm zcbm,zcmc,jc_zcjgb.xh xinghao,jc_zcjgb.gg,zcpzwzmc,jc_zcddmx.zcysbm,TO_CHAR(jc_zcddmx.dj) dj,jldwmc,jc_zcddmx.sl,jc_zcddmx.je,ycf,DECODE(jc_zcjgb.sfbhpj,'Y','包含','N','不含') sfbhpj,jc_zcjgb.pjts*jc_zcddmx.sl pjzs, DECODE(jc_zcddmx.cxhdbz,'Y','参加','N','不参加') cxhdbz,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx,jc_zcjgb,jdm_zcpzwzbm,sq_dwxx,jdm_jldwbm  ";
    ls_sql+=" where jc_zcddmx.zcpzwzbm=jdm_zcpzwzbm.zcpzwzbm(+)";
    ls_sql+=" and jc_zcddmx.zcbm=jc_zcjgb.zcbm and jc_zcjgb.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and jc_zcddmx.ddbh='"+ddbh+"' and jc_zcjgb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and jc_zcddmx.xh in(select xh from jc_zczjxmx where ddbh='"+ddbh+"' and zjxxh="+zjxxh+")";
    ls_sql+=" order by jc_zcjgb.zcdlbm,jc_zcjgb.dwbh,jc_zcjgb.zclbbm,jc_zcjgb.zcbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_zcddmx.jsp?ddbh="+ddbh+"&zjxxh="+zjxxh);
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"dwmc","zclbbm","zcbm","zcmc","xinghao","gg","zcpzwzmc","zcysbm","dj","jldwmc","sl","je","ycf","sfbhpj","pjzs","cxhdbz","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的主材"};//按钮的显示名称
	String[] buttonLink={"DeleteJc_zcddmx.jsp?ddbh="+ddbh+"&zjxxh="+zjxxh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	spanColHash.put("zclbbm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">被选主材（订单编号：<%=ddbh%>，序号：<%=zjxxh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="5%">品牌</td>
	<td  width="7%">系列</td>
	<td  width="5%">主材编码</td>
	<td  width="7%">主材名称</td>
	<td  width="5%">型号</td>
	<td  width="10%">规格</td>
	<td  width="4%" bgcolor="#CC99FF">铺装位置</td>
	<td  width="6%" bgcolor="#CC99FF">颜色</td>
	<td  width="4%">单价</td>
	<td  width="4%">计量单位</td>
	<td  width="4%" bgcolor="#CC99FF">数量</td>
	<td  width="5%">材料费</td>
	<td  width="4%">远程费</td>
	<td  width="5%">是否包含配件</td>
	<td  width="3%">配件套数</td>
	<td  width="5%" bgcolor="#CC99FF">参加促销活动</td>
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