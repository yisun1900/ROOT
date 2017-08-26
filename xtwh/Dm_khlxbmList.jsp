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
	String khlxbm=null;
	String khlxmc=null;
	khlxbm=request.getParameter("khlxbm");
	if (khlxbm!=null)
	{
		khlxbm=cf.GB2Uni(khlxbm);
		if (!(khlxbm.equals("")))	wheresql+=" and  (khlxbm='"+khlxbm+"')";
	}
	khlxmc=request.getParameter("khlxmc");
	if (khlxmc!=null)
	{
		khlxmc=cf.GB2Uni(khlxmc);
		if (!(khlxmc.equals("")))	wheresql+=" and  (khlxmc='"+khlxmc+"')";
	}
	ls_sql="SELECT khlxbm,khlxmc  ";
	ls_sql+=" FROM dm_khlxbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by khlxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_khlxbmList.jsp","SelectDm_khlxbm.jsp","","EditDm_khlxbm.jsp");
//	pageObj.setPageRow(25);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khlxbm","khlxmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khlxbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_khlxbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String[] khlxbm = request.getParameterValues("khlxbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khlxbm,"khlxbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_khlxbm where "+chooseitem;
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
	<td  width="14%">客户类型编码</td>
	<td  width="44%">客户类型名称</td>
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