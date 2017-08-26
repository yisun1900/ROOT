<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yddbh=request.getParameter("yddbh");
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	ls_sql="SELECT TO_CHAR(lrxh) lrxh,wjmc,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_wjjddmx.xinghao,mmsbsmc,TO_CHAR(jc_wjjddmx.bzdj) bzdj,TO_CHAR(jc_wjjddmx.dj) as dj,jc_wjjddmx.sl,jc_wjjddmx.bzdj*jc_wjjddmx.sl zqje,jc_wjjddmx.dj*jc_wjjddmx.sl zhje,jc_wjjddmx.bz  ";
	ls_sql+=" FROM jc_wjjddmx,jdm_wjjbm,jdm_mmsbsbm  ";
    ls_sql+=" where jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm  ";
    ls_sql+=" and jc_wjjddmx.yddbh='"+yddbh+"' and jc_wjjddmx.lx='1'";
    ls_sql+=" and jc_wjjddmx.mmsbsbm=jdm_mmsbsbm.mmsbsbm(+)";
	ls_sql+=" order by jc_wjjddmx.yddbh,jc_wjjddmx.lrxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_wjjddmxMain.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数


//设置主键
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteJc_wjjddmx.jsp?yddbh="+yddbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">五金件订单明细（订单号：<%=yddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="4%">序号</td>
	<td  width="18%">五金名称</td>
	<td  width="8%">五金类别</td>
	<td  width="15%">型号</td>
	<td  width="9%">锁把手</td>
	<td  width="5%">折前单价</td>
	<td  width="5%">折后单价</td>
	<td  width="5%">订购数量</td>
	<td  width="6%">折前总金额</td>
	<td  width="6%">折后总金额</td>
	<td  width="12%">备注</td>
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