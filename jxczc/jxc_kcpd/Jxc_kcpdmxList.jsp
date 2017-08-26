<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj= new ybl.common.PageObject();
	String ls_sql=null;
	String pdph=request.getParameter("pdph");

	ls_sql=" SELECT pdxh,hjmc,jxc_kcpdmx.scph,jxc_kcpdmx.scrq,clbm,clmc,xh,gg,ppmc,nbbm,kczcpsl,pdzcpsl,zcppdcyl,DECODE(pdjg,'1','<font color=blue>盘盈</font>','2','<font color=red>盘亏</font>','3','盘平') pdjg ";
	ls_sql+=" from  jxc_kcpdmx,jxc_hjmc ";
	ls_sql+=" where  jxc_kcpdmx.hjbh=jxc_hjmc.hjbh(+) ";
	ls_sql+=" and pdph="+pdph;
	ls_sql+=" order by pdxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"pdph","pdxh","dqbm","ckbh","hjbh","hwbh","clbm","zljb","kcsl","pdsl"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"pdxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteJxc_kcpdmx.jsp?pdph="+pdph};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">序号</td>
	<td  width="8%">货架</td>
	<td  width="7%">生产批号</td>
	<td  width="7%">生产日期</td>
	<td  width="9%">材料编码</td>
	<td  width="13%">材料名称</td>
	<td  width="9%">型号</td>
	<td  width="8%">规格</td>
	<td  width="8%">品牌</td>
	<td  width="6%">内部编码</td>
	<td  width="5%">库存数量</td>
	<td  width="5%">实际数量</td>
	<td  width="5%">盘点差异量</td>
	<td  width="5%">盘点结果</td>
</tr>
<%
	pageObj.displayDate();
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