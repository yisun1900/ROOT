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
	ls_sql="SELECT hfdxflmc,hdm_hfdxbm.xh,hdm_hfdxbm.hfdxbm,hdm_hfdxbm.hfdxmc ";
	ls_sql+=" FROM hdm_hfdxbm,hdm_hfdxflbm  ";
    ls_sql+=" where hdm_hfdxbm.hfdxflbm=hdm_hfdxflbm.hfdxflbm(+)  ";
    ls_sql+=wheresql;
    ls_sql+=" order by hdm_hfdxbm.hfdxflbm,hdm_hfdxbm.hfdxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hdm_hfdxbmCxList.jsp","","","");
	pageObj.setPageRow(200);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hfdxbm","hfdxmc","hfdxflbm","hflxbm","xh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hfdxbm"};
	pageObj.setKey(keyName);


//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hflxmc","1");//列参数对象加入Hash表
	spanColHash.put("hfdxflmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
  <B><font size="3">回访对象－－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="34%">回访对象分类</td>
	<td  width="8%">序号</td>
	<td  width="14%">回访对象编码</td>
	<td  width="44%">回访对象名称</td>
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