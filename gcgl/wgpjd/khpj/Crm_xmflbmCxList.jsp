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
	String xmflbm=null;
	String xmfl=null;
	xmflbm=request.getParameter("xmflbm");
	if (xmflbm!=null)
	{
		xmflbm=cf.GB2Uni(xmflbm);
		if (!(xmflbm.equals("")))	wheresql+=" and  (xmflbm='"+xmflbm+"')";
	}
	xmfl=request.getParameter("xmfl");
	if (xmfl!=null)
	{
		xmfl=cf.GB2Uni(xmfl);
		if (!(xmfl.equals("")))	wheresql+=" and  (xmfl='"+xmfl+"')";
	}
	ls_sql="SELECT xmflbm,xmfl,xskd ";
	ls_sql+=" FROM crm_xmflbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by xmflbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_xmflbmCxList.jsp","SelectCxCrm_xmflbm.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xmflbm","xmfl","spjrybm","spjry"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xmflbm"};
	pageObj.setKey(keyName);
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
	<td  width="20%">项目分类编码</td>
	<td  width="60%">项目分类</td>
	<td  width="20%">显示宽度</td>
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