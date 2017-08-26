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
	String dxpjzbbm=null;
	String dxpjzb=null;
	String hfdxbm=null;
	String xh=null;
	dxpjzbbm=request.getParameter("dxpjzbbm");
	if (dxpjzbbm!=null)
	{
		dxpjzbbm=cf.GB2Uni(dxpjzbbm);
		if (!(dxpjzbbm.equals("")))	wheresql+=" and  (hdm_dxpjzb.dxpjzbbm='"+dxpjzbbm+"')";
	}
	dxpjzb=request.getParameter("dxpjzb");
	if (dxpjzb!=null)
	{
		dxpjzb=cf.GB2Uni(dxpjzb);
		if (!(dxpjzb.equals("")))	wheresql+=" and  (hdm_dxpjzb.dxpjzb='"+dxpjzb+"')";
	}
	hfdxbm=request.getParameter("hfdxbm");
	if (hfdxbm!=null)
	{
		hfdxbm=cf.GB2Uni(hfdxbm);
		if (!(hfdxbm.equals("")))	wheresql+=" and  (hdm_dxpjzb.hfdxbm='"+hfdxbm+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (hdm_dxpjzb.xh="+xh+") ";
	}
	ls_sql="SELECT hfdxflmc,hfdxmc,hdm_dxpjzb.xh,hdm_dxpjzb.dxpjzbbm,hdm_dxpjzb.dxpjzb  ";
	ls_sql+=" FROM hdm_dxpjzb,hdm_hfdxbm,hdm_hfdxflbm  ";
    ls_sql+=" where hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm(+)";
    ls_sql+=" and hdm_hfdxbm.hfdxflbm=hdm_hfdxflbm.hfdxflbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by hdm_dxpjzb.hfdxbm,hdm_dxpjzb.dxpjzbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hdm_dxpjzbList.jsp","","","");
	pageObj.setPageRow(300);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dxpjzbbm","dxpjzb","hfdxbm","xh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dxpjzbbm"};
	pageObj.setKey(keyName);


//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hfdxflmc","1");//列参数对象加入Hash表
	spanColHash.put("hfdxmc","1");//列参数对象加入Hash表
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
  <B><font size="3">回访对象评价指标－－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="28%">回访对象分类</td>
	<td  width="32%">回访对象</td>
	<td  width="6%">序号</td>
	<td  width="10%">回访对象评价指标编码</td>
	<td  width="24%">回访对象评价指标</td>
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