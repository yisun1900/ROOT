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
	String cgbm=request.getParameter("cgbm");

	ls_sql="SELECT cgbm as cgbm,jc_dgjgb.dggdbm as dggdbm,jdm_dggdbm.dggdmc as jdm_dggdbm_dggdmc,jc_dgjgb.dgjsbm as dgjsbm,jdm_dgjsbm.dgjsmc as jdm_dgjsbm_dgjsmc,jc_dgjgb.lsj as jc_dgjgb_lsj,jc_dgjgb.yhj as jc_dgjgb_yhj  ";
	ls_sql+=" FROM jdm_dgjsbm,jdm_dggdbm,jc_dgjgb  ";
    ls_sql+=" where jc_dgjgb.dgjsbm=jdm_dgjsbm.dgjsbm and jc_dgjgb.dggdbm=jdm_dggdbm.dggdbm";
    ls_sql+=" and jc_dgjgb.cgbm='"+cgbm+"'";
    ls_sql+=" order by jc_dgjgb.dgjsbm,jc_dgjgb.dggdbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_dgjgbList.jsp","","","EditJc_dgjgb.jsp");
	pageObj.setPageRow(100);//设置每页显示记录数
//设置显示列
	String[] disColName={"jdm_dgjsbm_dgjsmc","jdm_dggdbm_dggdmc","jc_dgjgb_lsj","jc_dgjgb_yhj"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"cgbm","dggdbm","dgjsbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_dgjgbList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jdm_dgjsbm_dgjsmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_dgjgb where "+chooseitem;
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
  <B><font size="3">吊柜价格表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="25%">吊柜进深区间</td>
	<td  width="35%">吊柜高度区间</td>
	<td  width="12%">零售价</td>
	<td  width="12%">优惠价</td>
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