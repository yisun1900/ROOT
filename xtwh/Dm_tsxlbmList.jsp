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
	String dm_tsxlbm_tsxlbm=null;
	String dm_tsxlbm_tsxlmc=null;
	String dm_tsxlbm_tslxbm=null;
	String dm_tsxlbm_px=null;
	dm_tsxlbm_tsxlbm=request.getParameter("dm_tsxlbm_tsxlbm");
	if (dm_tsxlbm_tsxlbm!=null)
	{
		dm_tsxlbm_tsxlbm=cf.GB2Uni(dm_tsxlbm_tsxlbm);
		if (!(dm_tsxlbm_tsxlbm.equals("")))	wheresql+=" and  (dm_tsxlbm.tsxlbm='"+dm_tsxlbm_tsxlbm+"')";
	}
	dm_tsxlbm_tsxlmc=request.getParameter("dm_tsxlbm_tsxlmc");
	if (dm_tsxlbm_tsxlmc!=null)
	{
		dm_tsxlbm_tsxlmc=cf.GB2Uni(dm_tsxlbm_tsxlmc);
		if (!(dm_tsxlbm_tsxlmc.equals("")))	wheresql+=" and  (dm_tsxlbm.tsxlmc='"+dm_tsxlbm_tsxlmc+"')";
	}
	dm_tsxlbm_tslxbm=request.getParameter("dm_tsxlbm_tslxbm");
	if (dm_tsxlbm_tslxbm!=null)
	{
		dm_tsxlbm_tslxbm=cf.GB2Uni(dm_tsxlbm_tslxbm);
		if (!(dm_tsxlbm_tslxbm.equals("")))	wheresql+=" and  (dm_tsxlbm.tslxbm='"+dm_tsxlbm_tslxbm+"')";
	}
	dm_tsxlbm_px=request.getParameter("dm_tsxlbm_px");
	if (dm_tsxlbm_px!=null)
	{
		dm_tsxlbm_px=dm_tsxlbm_px.trim();
		if (!(dm_tsxlbm_px.equals("")))	wheresql+=" and (dm_tsxlbm.px="+dm_tsxlbm_px+") ";
	}
	ls_sql="SELECT dm_tsxlbm.tsxlbm,dm_tsxlbm.tsxlmc,dm_tslxbm.tslxmc,dm_tsxlbm.px  ";
	ls_sql+=" FROM dm_tslxbm,dm_tsxlbm  ";
    ls_sql+=" where dm_tsxlbm.tslxbm=dm_tslxbm.tslxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_tsxlbm.tslxbm,dm_tsxlbm.tsxlbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_tsxlbmList.jsp","SelectDm_tsxlbm.jsp","","EditDm_tsxlbm.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"tsxlbm","dm_tsxlbm_tsxlmc","dm_tslxbm_tslxmc","dm_tsxlbm_px"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"tsxlbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_tsxlbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("tslxmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] tsxlbm = request.getParameterValues("tsxlbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(tsxlbm,"tsxlbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_tsxlbm where "+chooseitem;
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
	<td  width="10%">&nbsp;</td>
	<td  width="17%">投诉报修小类编码</td>
	<td  width="35%">投诉报修小类名称</td>
	<td  width="25%">投诉报修大类</td>
	<td  width="13%">排序</td>
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