<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String tcbm=request.getParameter("tcbm");

	String ls_sql=null;
	ls_sql="SELECT tckb_zctcmx.cpbm,tckb_zctcmx.kbwlbm,tckb_zctcmx.kbcpbm,tckb_zctcmx.cpmc,tckb_zctcmx.sl,TO_CHAR(tckb_zctcmx.tcdj),ROUND(tckb_zctcmx.sl*tckb_zctcmx.tcdj,2) je,tckb_zctcmc.tcmc,tckb_zctcmx.xh,tckb_zctcmx.gg,tckb_zctcmx.ppmc,tckb_zctcmx.gysmc,tckb_zctcmx.jldw,TO_CHAR(tckb_zctcmx.ydj),TO_CHAR(tckb_zctcmx.jsj),tckb_zctcmx.lrr,tckb_zctcmx.lrsj,tckb_zctcmx.bz  ";
	ls_sql+=" FROM tckb_zctcmc,tckb_zctcmx  ";
    ls_sql+=" where tckb_zctcmx.tcbm=tckb_zctcmc.tcbm(+)";
    ls_sql+=" and tckb_zctcmx.tcbm="+tcbm;
    ls_sql+=" order by tckb_zctcmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditTckb_zctcmx.jsp?tcbm="+tcbm);
	pageObj.setPageRow(10000);//设置每页显示记录数


//设置主键
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteTckb_zctcmx.jsp?tcbm="+tcbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">家具包明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">产品编码</td>
	<td  width="4%">科宝物料编码</td>
	<td  width="4%">科宝产品编码</td>
	<td  width="8%">产品名称</td>
	<td  width="3%">数量</td>
	<td  width="3%">包内单价</td>
	<td  width="4%">金额</td>
	<td  width="5%">包名称</td>
	<td  width="9%">型号</td>
	<td  width="7%">规格</td>
	<td  width="5%">品牌</td>
	<td  width="11%">供应商</td>
	<td  width="3%">计量单位</td>
	<td  width="3%">原单价</td>
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