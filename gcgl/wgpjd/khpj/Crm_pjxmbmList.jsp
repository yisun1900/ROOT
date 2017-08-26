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
	String pjxmbm=null;
	String pjxm=null;
	String spjrybm=null;
	String xmflbm=null;
	String xsfs=null;
	String xh=null;
	pjxmbm=request.getParameter("pjxmbm");
	if (pjxmbm!=null)
	{
		pjxmbm=cf.GB2Uni(pjxmbm);
		if (!(pjxmbm.equals("")))	wheresql+=" and  (pjxmbm='"+pjxmbm+"')";
	}
	pjxm=request.getParameter("pjxm");
	if (pjxm!=null)
	{
		pjxm=cf.GB2Uni(pjxm);
		if (!(pjxm.equals("")))	wheresql+=" and  (pjxm='"+pjxm+"')";
	}
	spjrybm=request.getParameter("spjrybm");
	if (spjrybm!=null)
	{
		spjrybm=cf.GB2Uni(spjrybm);
		if (!(spjrybm.equals("")))	wheresql+=" and  (spjrybm='"+spjrybm+"')";
	}
	xmflbm=request.getParameter("xmflbm");
	if (xmflbm!=null)
	{
		xmflbm=cf.GB2Uni(xmflbm);
		if (!(xmflbm.equals("")))	wheresql+=" and  (xmflbm='"+xmflbm+"')";
	}
	xsfs=request.getParameter("xsfs");
	if (xsfs!=null)
	{
		xsfs=cf.GB2Uni(xsfs);
		if (!(xsfs.equals("")))	wheresql+=" and  (xsfs='"+xsfs+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (xh="+xh+") ";
	}
	ls_sql="SELECT pjxmbm,pjxm, DECODE(xsfs,'1','多选','2','项目分类单选'),xh,xmflbm,xmfl,spjrybm,spjry  ";
	ls_sql+=" FROM crm_pjxmbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by pjxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_pjxmbmList.jsp","SelectCrm_pjxmbm.jsp","","EditCrm_pjxmbm.jsp");
	pageObj.setPageRow(500);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"pjxmbm","pjxm","spjrybm","spjry","xmflbm","xmfl","xsfs","xh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"pjxmbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Crm_pjxmbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("xmflbm","1");//列参数对象加入Hash表
	spanColHash.put("xmfl","1");//列参数对象加入Hash表
	spanColHash.put("spjrybm","2");//列参数对象加入Hash表
	spanColHash.put("spjry","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] pjxmbm = request.getParameterValues("pjxmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pjxmbm,"pjxmbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from crm_pjxmbm where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="8%">评价项目编码(6位)</td>
	<td  width="27%">评价项目</td>
	<td  width="11%">显示方式</td>
	<td  width="6%">序号</td>
	<td  width="8%">项目分类编码</td>
	<td  width="12%">项目分类</td>
	<td  width="8%">受评价人员编码</td>
	<td  width="12%">受评价人员</td>
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