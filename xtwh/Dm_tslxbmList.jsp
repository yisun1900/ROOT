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
	String tslxbm=null;
	String tslxmc=null;
	String tsdl=null;
	String px=null;
	tslxbm=request.getParameter("tslxbm");
	if (tslxbm!=null)
	{
		tslxbm=cf.GB2Uni(tslxbm);
		if (!(tslxbm.equals("")))	wheresql+=" and  (tslxbm='"+tslxbm+"')";
	}
	tslxmc=request.getParameter("tslxmc");
	if (tslxmc!=null)
	{
		tslxmc=cf.GB2Uni(tslxmc);
		if (!(tslxmc.equals("")))	wheresql+=" and  (tslxmc='"+tslxmc+"')";
	}
	tsdl=request.getParameter("tsdl");
	if (tsdl!=null)
	{
		tsdl=cf.GB2Uni(tsdl);
		if (!(tsdl.equals("")))	wheresql+=" and  (tsdl='"+tsdl+"')";
	}
	px=request.getParameter("px");
	if (px!=null)
	{
		px=px.trim();
		if (!(px.equals("")))	wheresql+=" and (px="+px+") ";
	}
	ls_sql="SELECT tslxbm,tslxmc, DECODE(tsdl,'1','报修','2','投诉') tsdl,px  ";
	ls_sql+=" FROM dm_tslxbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by tsdl,tslxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_tslxbmList.jsp","SelectDm_tslxbm.jsp","","EditDm_tslxbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"tslxbm","tslxmc","tsdl","px"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"tslxbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_tslxbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("tsdl","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] tslxbm = request.getParameterValues("tslxbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(tslxbm,"tslxbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_tslxbm where "+chooseitem;
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
	<td  width="15%">投诉报修大类编码</td>
	<td  width="30%">投诉报修大类名称</td>
	<td  width="12%">类别</td>
	<td  width="12%">排序</td>
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