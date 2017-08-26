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
	String dm_hfwtbm_hfwtbm=null;
	String dm_hfwtbm_hfwtmc=null;
	String dm_hfwtbm_hflxbm=null;

	dm_hfwtbm_hfwtbm=request.getParameter("dm_hfwtbm_hfwtbm");
	if (dm_hfwtbm_hfwtbm!=null)
	{
		dm_hfwtbm_hfwtbm=cf.GB2Uni(dm_hfwtbm_hfwtbm);
		if (!(dm_hfwtbm_hfwtbm.equals("")))	wheresql+=" and  (dm_hfwtbm.hfwtbm='"+dm_hfwtbm_hfwtbm+"')";
	}
	dm_hfwtbm_hfwtmc=request.getParameter("dm_hfwtbm_hfwtmc");
	if (dm_hfwtbm_hfwtmc!=null)
	{
		dm_hfwtbm_hfwtmc=cf.GB2Uni(dm_hfwtbm_hfwtmc);
		if (!(dm_hfwtbm_hfwtmc.equals("")))	wheresql+=" and  (dm_hfwtbm.hfwtmc='"+dm_hfwtbm_hfwtmc+"')";
	}
	dm_hfwtbm_hflxbm=request.getParameter("dm_hfwtbm_hflxbm");
	if (dm_hfwtbm_hflxbm!=null)
	{
		dm_hfwtbm_hflxbm=cf.GB2Uni(dm_hfwtbm_hflxbm);
		if (!(dm_hfwtbm_hflxbm.equals("")))	wheresql+=" and  (dm_hfwtbm.hflxbm='"+dm_hfwtbm_hflxbm+"')";
	}

	ls_sql="SELECT dm_hfwtbm.hfwtbm,dm_hfwtbm.hfwtmc,dm_hflxbm.hflxmc";
	ls_sql+=" FROM dm_hflxbm,dm_hfwtbm  ";
    ls_sql+=" where dm_hfwtbm.hflxbm=dm_hflxbm.hflxbm";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_hfwtbm.hflxbm,dm_hfwtbm.hfwtbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_hfwtbmList.jsp","","","EditDm_hfwtbm.jsp");
	pageObj.setPageRow(100);//设置每页显示记录数


//设置主键
	String[] keyName={"hfwtbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_hfwtbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hflxmc","1");//列参数对象加入Hash表

	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] hfwtbm = request.getParameterValues("hfwtbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hfwtbm,"hfwtbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_hfwtbm where "+chooseitem;
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
	<td  width="20%">回访问题编码</td>
	<td  width="32%">回访问题名称</td>
	<td  width="32%">回访类型名称</td>
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