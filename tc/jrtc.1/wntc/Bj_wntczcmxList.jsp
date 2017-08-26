<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String tcmc=cf.GB2Uni(request.getParameter("tcmc"));
	String hxbm=cf.GB2Uni(request.getParameter("hxbm"));

	String ls_sql=null;
	ls_sql="SELECT bj_wntczcmx.jgwzbm,bj_wntczcmx.cpbm,bj_wntczcmx.cpmc,bj_wntczcmx.sl,TO_CHAR(bj_wntczcmx.tcdj),ROUND(bj_wntczcmx.tcdj*bj_wntczcmx.sl,2) je,bj_wntczcmx.tcmc,bj_wntczcmx.xh,bj_wntczcmx.gg,bj_wntczcmx.ppmc,bj_wntczcmx.gysmc,bj_wntczcmx.jldw,TO_CHAR(bj_wntczcmx.ydj),TO_CHAR(bj_wntczcmx.sjzj),TO_CHAR(bj_wntczcmx.jsj),bj_wntczcmx.lrr,bj_wntczcmx.lrsj,bj_wntczcmx.bz  ";
	ls_sql+=" FROM bj_wntczcmx  ";
    ls_sql+=" where bj_wntczcmx.dqbm='"+dqbm+"' and bj_wntczcmx.hxbm='"+hxbm+"' and bj_wntczcmx.tcmc='"+tcmc+"'";
    ls_sql+=" order by bj_wntczcmx.jgwzbm,bj_wntczcmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","Editbj_wntczcmx.jsp");
	pageObj.setPageRow(10000);//设置每页显示记录数


//设置主键
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteBj_wntczcmx.jsp?dqbm="+dqbm+"&hxbm="+hxbm+"&tcmc="+tcmc};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">温暖套餐明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="3%">房间位置</td>
	<td  width="5%">产品编码</td>
	<td  width="8%">产品名称</td>
	<td  width="3%">数量</td>
	<td  width="3%">套餐单价</td>
	<td  width="3%">金额</td>
	<td  width="6%">套餐名称</td>
	<td  width="9%">型号</td>
	<td  width="8%">规格</td>
	<td  width="7%">品牌</td>
	<td  width="11%">供应商</td>
	<td  width="3%">计量单位</td>
	<td  width="3%">原单价</td>
	<td  width="3%">升级折价</td>
	<td  width="3%">结算价</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
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