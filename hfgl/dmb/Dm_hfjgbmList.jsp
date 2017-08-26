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
	String dm_hfjgbm_hfjgbm=null;
	String dm_hfjgbm_hfjgmc=null;

	dm_hfjgbm_hfjgbm=request.getParameter("dm_hfjgbm_hfjgbm");
	if (dm_hfjgbm_hfjgbm!=null)
	{
		dm_hfjgbm_hfjgbm=cf.GB2Uni(dm_hfjgbm_hfjgbm);
		if (!(dm_hfjgbm_hfjgbm.equals("")))	wheresql+=" and  (dm_hfjgbm.hfjgbm='"+dm_hfjgbm_hfjgbm+"')";
	}
	dm_hfjgbm_hfjgmc=request.getParameter("dm_hfjgbm_hfjgmc");
	if (dm_hfjgbm_hfjgmc!=null)
	{
		dm_hfjgbm_hfjgmc=cf.GB2Uni(dm_hfjgbm_hfjgmc);
		if (!(dm_hfjgbm_hfjgmc.equals("")))	wheresql+=" and  (dm_hfjgbm.hfjgmc='"+dm_hfjgbm_hfjgmc+"')";
	}

	ls_sql="SELECT dm_hfjgbm.hfjgbm,dm_hfjgbm.hfjgmc";
	ls_sql+=" FROM dm_hfjgbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_hfjgbm.hfjgbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_hfjgbmList.jsp","","","EditDm_hfjgbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置主键
	String[] keyName={"hfjgbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_hfjgbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//非第一次进入此页，不需要初始化
{
	String[] hfjgbm = request.getParameterValues("hfjgbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hfjgbm,"hfjgbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_hfjgbm where "+chooseitem;
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
	<td  width="22%">回访结果编码</td>
	<td  width="42%">回访结果名称</td>
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