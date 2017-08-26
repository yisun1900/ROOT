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
	String hfdxbm=null;
	String hfdxmc=null;
	String hfdxflbm=null;
	String xh=null;
	hfdxbm=request.getParameter("hfdxbm");
	if (hfdxbm!=null)
	{
		hfdxbm=cf.GB2Uni(hfdxbm);
		if (!(hfdxbm.equals("")))	wheresql+=" and  (hdm_hfdxbm.hfdxbm='"+hfdxbm+"')";
	}
	hfdxmc=request.getParameter("hfdxmc");
	if (hfdxmc!=null)
	{
		hfdxmc=cf.GB2Uni(hfdxmc);
		if (!(hfdxmc.equals("")))	wheresql+=" and  (hdm_hfdxbm.hfdxmc='"+hfdxmc+"')";
	}
	hfdxflbm=request.getParameter("hfdxflbm");
	if (hfdxflbm!=null)
	{
		hfdxflbm=cf.GB2Uni(hfdxflbm);
		if (!(hfdxflbm.equals("")))	wheresql+=" and  (hdm_hfdxbm.hfdxflbm='"+hfdxflbm+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (xh="+xh+") ";
	}
	ls_sql="SELECT hdm_hfdxbm.xh,hdm_hfdxbm.hfdxbm,hdm_hfdxbm.hfdxmc,hfdxflmc  ";
	ls_sql+=" FROM hdm_hfdxbm,hdm_hfdxflbm  ";
    ls_sql+=" where hdm_hfdxbm.hfdxflbm=hdm_hfdxflbm.hfdxflbm(+)  ";
    ls_sql+=wheresql;
    ls_sql+=" order by hdm_hfdxbm.hfdxflbm,hdm_hfdxbm.hfdxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hdm_hfdxbmList.jsp","","","EditHdm_hfdxbm.jsp");
	pageObj.setPageRow(200);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hfdxbm","hfdxmc","hfdxflbm","hflxbm","xh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hfdxbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Hdm_hfdxbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hfdxflmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] hfdxbm = request.getParameterValues("hfdxbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hfdxbm,"hfdxbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from hdm_hfdxbm where "+chooseitem;
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
  <B><font size="3">回访对象－－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="6%">序号</td>
	<td  width="12%">回访对象编码</td>
	<td  width="42%">回访对象名称</td>
	<td  width="32%">回访对象分类</td>
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