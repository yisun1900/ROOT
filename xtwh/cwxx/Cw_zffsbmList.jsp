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
	String zffsbm=null;
	String zffsmc=null;
	String lx=null;
	zffsbm=request.getParameter("zffsbm");
	if (zffsbm!=null)
	{
		zffsbm=cf.GB2Uni(zffsbm);
		if (!(zffsbm.equals("")))	wheresql+=" and  (zffsbm='"+zffsbm+"')";
	}
	zffsmc=request.getParameter("zffsmc");
	if (zffsmc!=null)
	{
		zffsmc=cf.GB2Uni(zffsmc);
		if (!(zffsmc.equals("")))	wheresql+=" and  (zffsmc='"+zffsmc+"')";
	}
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (lx='"+lx+"')";
	}
	ls_sql="SELECT zffsbm,zffsmc, DECODE(lx,'1','现金','2','非现金') lx ";
	ls_sql+=" FROM cw_zffsbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by zffsbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_zffsbmList.jsp","SelectCw_zffsbm.jsp","","EditCw_zffsbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zffsbm","zffsmc","lx"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zffsbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_zffsbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("lx","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] zffsbm = request.getParameterValues("zffsbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zffsbm,"zffsbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_zffsbm where "+chooseitem;
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
	<td  width="20%">支付方式编码</td>
	<td  width="40%">支付方式名称</td>
	<td  width="20%">类型</td>
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