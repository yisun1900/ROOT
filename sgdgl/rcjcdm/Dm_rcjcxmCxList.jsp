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
	String dm_rcjcxm_xmbm=null;
	String dm_rcjcxm_xmmc=null;
	String dm_rcjcxm_rcjcdlbm=null;
	String dm_rcjcxm_jcnr=null;
	String dm_rcjcxm_rcjclxbm=null;
	dm_rcjcxm_xmbm=request.getParameter("dm_rcjcxm_xmbm");
	if (dm_rcjcxm_xmbm!=null)
	{
		dm_rcjcxm_xmbm=cf.GB2Uni(dm_rcjcxm_xmbm);
		if (!(dm_rcjcxm_xmbm.equals("")))	wheresql+=" and  (dm_rcjcxm.xmbm='"+dm_rcjcxm_xmbm+"')";
	}
	dm_rcjcxm_xmmc=request.getParameter("dm_rcjcxm_xmmc");
	if (dm_rcjcxm_xmmc!=null)
	{
		dm_rcjcxm_xmmc=cf.GB2Uni(dm_rcjcxm_xmmc);
		if (!(dm_rcjcxm_xmmc.equals("")))	wheresql+=" and  (dm_rcjcxm.xmmc='"+dm_rcjcxm_xmmc+"')";
	}
	dm_rcjcxm_rcjcdlbm=request.getParameter("dm_rcjcxm_rcjcdlbm");
	if (dm_rcjcxm_rcjcdlbm!=null)
	{
		dm_rcjcxm_rcjcdlbm=cf.GB2Uni(dm_rcjcxm_rcjcdlbm);
		if (!(dm_rcjcxm_rcjcdlbm.equals("")))	wheresql+=" and  (dm_rcjcxm.rcjcdlbm='"+dm_rcjcxm_rcjcdlbm+"')";
	}
	dm_rcjcxm_jcnr=request.getParameter("dm_rcjcxm_jcnr");
	if (dm_rcjcxm_jcnr!=null)
	{
		dm_rcjcxm_jcnr=cf.GB2Uni(dm_rcjcxm_jcnr);
		if (!(dm_rcjcxm_jcnr.equals("")))	wheresql+=" and  (dm_rcjcxm.jcnr='"+dm_rcjcxm_jcnr+"')";
	}
	dm_rcjcxm_rcjclxbm=request.getParameter("dm_rcjcxm_rcjclxbm");
	if (dm_rcjcxm_rcjclxbm!=null)
	{
		dm_rcjcxm_rcjclxbm=cf.GB2Uni(dm_rcjcxm_rcjclxbm);
		if (!(dm_rcjcxm_rcjclxbm.equals("")))	wheresql+=" and  (dm_rcjcxm.rcjclxbm='"+dm_rcjcxm_rcjclxbm+"')";
	}
	ls_sql="SELECT rcjclxmc,rcjcdlmc,dm_rcjcxm.xmbm,dm_rcjcxm.xmmc,dm_rcjcxm.jcnr  ";
	ls_sql+=" FROM dm_rcjclxbm,dm_rcjcdlbm,dm_rcjcxm  ";
    ls_sql+=" where dm_rcjcxm.rcjclxbm=dm_rcjclxbm.rcjclxbm and dm_rcjcxm.rcjcdlbm=dm_rcjcdlbm.rcjcdlbm";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_rcjcxm.rcjclxbm,dm_rcjcxm.rcjcdlbm,dm_rcjcxm.xmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_rcjcxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xmbm","dm_rcjcxm_xmmc","dm_rcjcdlbm_rcjcdlmc","dm_rcjcxm_jcnr","dm_rcjclxbm_rcjclxmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xmbm"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("rcjclxmc","1");//列参数对象加入Hash表
	spanColHash.put("rcjcdlmc","1");//列参数对象加入Hash表
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
  <B><font size="3">日常检查项目－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">日常检查类型</td>
	<td  width="12%">日常检查大类</td>
	<td  width="8%">项目编码</td>
	<td  width="30%">项目名称</td>
	<td  width="40%">检查内容</td>
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