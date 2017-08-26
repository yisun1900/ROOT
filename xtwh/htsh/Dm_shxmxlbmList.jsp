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
	String dm_shxmxlbm_shxmxlbm=null;
	String dm_shxmxlbm_shxmxlmc=null;
	String dm_shxmxlbm_shxmdlbm=null;
	dm_shxmxlbm_shxmxlbm=request.getParameter("dm_shxmxlbm_shxmxlbm");
	if (dm_shxmxlbm_shxmxlbm!=null)
	{
		dm_shxmxlbm_shxmxlbm=cf.GB2Uni(dm_shxmxlbm_shxmxlbm);
		if (!(dm_shxmxlbm_shxmxlbm.equals("")))	wheresql+=" and  (dm_shxmxlbm.shxmxlbm='"+dm_shxmxlbm_shxmxlbm+"')";
	}
	dm_shxmxlbm_shxmxlmc=request.getParameter("dm_shxmxlbm_shxmxlmc");
	if (dm_shxmxlbm_shxmxlmc!=null)
	{
		dm_shxmxlbm_shxmxlmc=cf.GB2Uni(dm_shxmxlbm_shxmxlmc);
		if (!(dm_shxmxlbm_shxmxlmc.equals("")))	wheresql+=" and  (dm_shxmxlbm.shxmxlmc='"+dm_shxmxlbm_shxmxlmc+"')";
	}
	dm_shxmxlbm_shxmdlbm=request.getParameter("dm_shxmxlbm_shxmdlbm");
	if (dm_shxmxlbm_shxmdlbm!=null)
	{
		dm_shxmxlbm_shxmdlbm=cf.GB2Uni(dm_shxmxlbm_shxmdlbm);
		if (!(dm_shxmxlbm_shxmdlbm.equals("")))	wheresql+=" and  (dm_shxmxlbm.shxmdlbm='"+dm_shxmxlbm_shxmdlbm+"')";
	}
	ls_sql="SELECT shxmdlmc,dm_shxmxlbm.shxmxlbm,dm_shxmxlbm.shxmxlmc ";
	ls_sql+=" FROM dm_shxmdlbm,dm_shxmxlbm  ";
    ls_sql+=" where dm_shxmxlbm.shxmdlbm=dm_shxmdlbm.shxmdlbm";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_shxmxlbm.shxmdlbm,shxmxlbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_shxmxlbmList.jsp","SelectDm_shxmxlbm.jsp","","EditDm_shxmxlbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"shxmxlbm","dm_shxmxlbm_shxmxlmc","dm_shxmdlbm_shxmdlmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"shxmxlbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_shxmxlbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("shxmdlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] shxmxlbm = request.getParameterValues("shxmxlbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(shxmxlbm,"shxmxlbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_shxmxlbm where "+chooseitem;
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
	<td  width="20%">审核项目大类</td>
	<td  width="19%">审核项目小类编码</td>
	<td  width="29%">审核项目小类名称</td>
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