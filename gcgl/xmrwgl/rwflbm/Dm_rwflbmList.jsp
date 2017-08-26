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
	String rwflbm=null;
	String rwflmc=null;
	String dl=null;
	rwflbm=request.getParameter("rwflbm");
	if (rwflbm!=null)
	{
		rwflbm=cf.GB2Uni(rwflbm);
		if (!(rwflbm.equals("")))	wheresql+=" and  (rwflbm='"+rwflbm+"')";
	}
	rwflmc=request.getParameter("rwflmc");
	if (rwflmc!=null)
	{
		rwflmc=cf.GB2Uni(rwflmc);
		if (!(rwflmc.equals("")))	wheresql+=" and  (rwflmc='"+rwflmc+"')";
	}
	dl=request.getParameter("dl");
	if (dl!=null)
	{
		dl=cf.GB2Uni(dl);
		if (!(dl.equals("")))	wheresql+=" and  (dl='"+dl+"')";
	}
	ls_sql="SELECT rwflbm,rwflmc, DECODE(dl,'1','一般','2','交底','3','进场','4','验收','5','复尺','6','下单','7','入库','8','送货','9','安装') dlmc ";
	ls_sql+=" FROM dm_rwflbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by dl,rwflbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_rwflbmList.jsp","","","EditDm_rwflbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"rwflbm","rwflmc","dl"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"rwflbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_rwflbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] rwflbm = request.getParameterValues("rwflbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(rwflbm,"rwflbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_rwflbm where "+chooseitem;
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
	<td  width="10%">&nbsp;</td>
	<td  width="15%">任务分类编码</td>
	<td  width="50%">任务分类名称</td>
	<td  width="25%">大类</td>
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