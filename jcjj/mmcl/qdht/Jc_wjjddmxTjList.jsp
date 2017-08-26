<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=request.getParameter("yddbh");
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;

	ls_sql="SELECT TO_CHAR(lrxh) lrxh,jc_wjjddmx.yddbh as yddbh,jc_wjjddmx.xh as xh,wjmc,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,mmsbsmc,jc_wjjddmx.xinghao xinghao,TO_CHAR(jc_wjjddmx.bzdj) bzdj,TO_CHAR(jc_wjjddmx.dj) as jc_wjjddmx_dj,jc_wjjddmx.sl as jc_wjjddmx_sl,jc_wjjddmx.dj*jc_wjjddmx.sl je,jc_wjjddmx.bz as jc_wjjddmx_bz  ";
	ls_sql+=" FROM jc_wjjddmx,jdm_wjjbm,jdm_mmsbsbm  ";
    ls_sql+=" where jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm";
    ls_sql+=" and jc_wjjddmx.yddbh='"+yddbh+"' and jc_wjjddmx.lx='1'";
    ls_sql+=" and jc_wjjddmx.mmsbsbm=jdm_mmsbsbm.mmsbsbm(+)";
	ls_sql+=" order by jc_wjjddmx.yddbh,jc_wjjddmx.lrxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_wjjddmxTjList.jsp?yddbh="+yddbh,"","","TjJc_wjjddmx.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"lrxh","wjmc","jdm_wjjbm_wjjmc","xinghao","mmsbsmc","bzdj","jc_wjjddmx_dj","jc_wjjddmx_sl","je","jc_wjjddmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);

}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">五金件订单明细---调整合同价格</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="4%">序号</td>
	<td  width="18%">五金名称</td>
	<td  width="8%">五金类别</td>
	<td  width="17%">型号</td>
	<td  width="9%">锁把手</td>
	<td  width="5%">标准单价</td>
	<td  width="5%">客户单价</td>
	<td  width="5%">订购数量</td>
	<td  width="8%">总金额</td>
	<td  width="14%">备注</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
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