<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=request.getParameter("ddbh");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT jc_jjyddmx.jjlbbm as jjlbbm,jdm_jjlbbm.jjlbmc as jdm_jjlbbm_jjlbmc,jc_jjyddmx.sl as jc_jjyddmx_sl,jc_jjyddmx.bz as jc_jjyddmx_bz  ";
	ls_sql+=" FROM jdm_jjlbbm,jc_jjyddmx  ";
    ls_sql+=" where jc_jjyddmx.jjlbbm=jdm_jjlbbm.jjlbbm";
    ls_sql+=" and jc_jjyddmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_jjyddmx.jjlbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_jjyddmxList.jsp?ddbh="+ddbh,"","","EditJc_jjyddmx.jsp?ddbh="+ddbh);
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"jdm_jjlbbm_jjlbmc","jc_jjyddmx_sl","jc_jjyddmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"jjlbbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_jjyddmxList.jsp?ddbh="+ddbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//非第一次进入此页，不需要初始化
{
	String[] jjlbbm = request.getParameterValues("jjlbbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jjlbbm,"jjlbbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_jjyddmx where ddbh='"+ddbh+"' and ("+chooseitem+")";
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">家具预订单明细（订单编号：<%=ddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="20%">家具类别</td>
	<td  width="10%">数量</td>
	<td  width="60%">备注</td>
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