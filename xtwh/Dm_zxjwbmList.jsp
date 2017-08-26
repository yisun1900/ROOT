<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String zxjwbm=null;
	String zxjwmc=null;
	String qd=null;
	String zd=null;
	zxjwbm=request.getParameter("zxjwbm");
	if (zxjwbm!=null)
	{
		zxjwbm=cf.GB2Uni(zxjwbm);
		if (!(zxjwbm.equals("")))	wheresql+=" and  (zxjwbm='"+zxjwbm+"')";
	}
	zxjwmc=request.getParameter("zxjwmc");
	if (zxjwmc!=null)
	{
		zxjwmc=cf.GB2Uni(zxjwmc);
		if (!(zxjwmc.equals("")))	wheresql+=" and  (zxjwmc='"+zxjwmc+"')";
	}
	qd=request.getParameter("qd");
	if (qd!=null)
	{
		qd=qd.trim();
		if (!(qd.equals("")))	wheresql+=" and  (qd="+qd+") ";
	}
	zd=request.getParameter("zd");
	if (zd!=null)
	{
		zd=zd.trim();
		if (!(zd.equals("")))	wheresql+=" and  (zd="+zd+") ";
	}
	ls_sql="SELECT zxjwbm,zxjwmc,qd,zd  ";
	ls_sql+=" FROM dm_zxjwbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by zxjwbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_zxjwbmList.jsp","SelectDm_zxjwbm.jsp","","EditDm_zxjwbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zxjwbm","zxjwmc","qd","zd"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zxjwbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteDm_zxjwbm.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//非第一次进入此页，不需要初始化
{
	String[] zxjwbm = request.getParameterValues("zxjwbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zxjwbm,"zxjwbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_zxjwbm where "+chooseitem;
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="12%">装修价位编码</td>
	<td  width="32%">装修价位名称</td>
	<td  width="12%">起点</td>
	<td  width="12%">终点</td>
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