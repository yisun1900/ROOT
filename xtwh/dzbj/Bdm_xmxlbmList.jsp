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
	String bdm_xmxlbm_xmxlbm=null;
	String bdm_xmxlbm_xmxlmc=null;
	String bdm_xmxlbm_xmdlbm=null;
	bdm_xmxlbm_xmxlbm=request.getParameter("bdm_xmxlbm_xmxlbm");
	if (bdm_xmxlbm_xmxlbm!=null)
	{
		bdm_xmxlbm_xmxlbm=cf.GB2Uni(bdm_xmxlbm_xmxlbm);
		if (!(bdm_xmxlbm_xmxlbm.equals("")))	wheresql+=" and  (bdm_xmxlbm.xmxlbm='"+bdm_xmxlbm_xmxlbm+"')";
	}
	bdm_xmxlbm_xmxlmc=request.getParameter("bdm_xmxlbm_xmxlmc");
	if (bdm_xmxlbm_xmxlmc!=null)
	{
		bdm_xmxlbm_xmxlmc=cf.GB2Uni(bdm_xmxlbm_xmxlmc);
		if (!(bdm_xmxlbm_xmxlmc.equals("")))	wheresql+=" and  (bdm_xmxlbm.xmxlmc='"+bdm_xmxlbm_xmxlmc+"')";
	}
	bdm_xmxlbm_xmdlbm=request.getParameter("bdm_xmxlbm_xmdlbm");
	if (bdm_xmxlbm_xmdlbm!=null)
	{
		bdm_xmxlbm_xmdlbm=cf.GB2Uni(bdm_xmxlbm_xmdlbm);
		if (!(bdm_xmxlbm_xmdlbm.equals("")))	wheresql+=" and  (bdm_xmxlbm.xmdlbm='"+bdm_xmxlbm_xmdlbm+"')";
	}
	ls_sql="SELECT xmdlmc,xmxlbm,bdm_xmxlbm.xmxlmc  ";
	ls_sql+=" FROM bdm_xmdlbm,bdm_xmxlbm  ";
    ls_sql+=" where bdm_xmxlbm.xmdlbm=bdm_xmdlbm.xmdlbm";
    ls_sql+=wheresql;
    ls_sql+=" order by bdm_xmxlbm.xmdlbm,bdm_xmxlbm.xmxlbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bdm_xmxlbmList.jsp","SelectBdm_xmxlbm.jsp","","EditBdm_xmxlbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xmxlbm","bdm_xmxlbm_xmxlmc","bdm_xmxlbm_xmdlbm","bdm_xmdlbm_xmdlmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xmxlbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Bdm_xmxlbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("xmdlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] xmxlbm = request.getParameterValues("xmxlbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xmxlbm,"xmxlbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from bdm_xmxlbm where "+chooseitem;
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
	<td  width="28%">项目大类名称</td>
	<td  width="12%">项目小类编码</td>
	<td  width="42%">项目小类名称</td>
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