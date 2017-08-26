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
	String bcpp=null;
	String bchd=null;
	String dj=null;
	bcpp=request.getParameter("bcpp");
	if (bcpp!=null)
	{
		bcpp=cf.GB2Uni(bcpp);
		if (!(bcpp.equals("")))	wheresql+=" and  (bcpp='"+bcpp+"')";
	}
	bchd=request.getParameter("bchd");
	if (bchd!=null)
	{
		bchd=bchd.trim();
		if (!(bchd.equals("")))	wheresql+=" and (bchd="+bchd+") ";
	}
	dj=request.getParameter("dj");
	if (dj!=null)
	{
		dj=dj.trim();
		if (!(dj.equals("")))	wheresql+=" and  (dj="+dj+") ";
	}
	ls_sql="SELECT bcpp,bclx,bchd,dj  ";
	ls_sql+=" FROM jc_jjbjbj  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by bcpp,bclx,bchd";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_jjbjbjCxList.jsp","SelectCxJc_jjbjbj.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"bcpp","bchd","dj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"bcpp","bchd"};
	pageObj.setKey(keyName);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("bcpp","1");//列参数对象加入Hash表
	spanColHash.put("bclx","1");//列参数对象加入Hash表
	spanColHash.put("bchd","1");//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="35%">板材品牌</td>
	<td  width="35%">板材类型</td>
	<td  width="15%">板材厚度（mm）</td>
	<td  width="15%">单价</td>
</tr>
<%
	pageObj.printDate();
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