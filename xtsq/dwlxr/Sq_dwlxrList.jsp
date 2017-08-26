<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=request.getParameter("dwbh");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;

	ls_sql="SELECT sq_dwlxr.lxrxm as lxrxm,sq_dwlxr.zw as sq_dwlxr_zw,sq_dwlxr.sj as sq_dwlxr_sj,sq_dwlxr.bgdh as sq_dwlxr_bgdh,sq_dwlxr.cz as sq_dwlxr_cz, DECODE(sq_dwlxr.sflz,'Y','是','N','否') as sq_dwlxr_sflz,sq_dwlxr.bz as sq_dwlxr_bz  ";
	ls_sql+=" FROM sq_dwlxr  ";
    ls_sql+=" where sq_dwlxr.dwbh='"+dwbh+"'";
    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("Sq_dwlxrList.jsp?dwbh="+dwbh,"","","EditSq_dwlxr.jsp?dwbh="+dwbh);
	pageObj.setPageRow(20);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dwbh","sq_dwxx_dwmc","lxrxm","sq_dwlxr_zw","sq_dwlxr_sj","sq_dwlxr_bgdh","sq_dwlxr_cz","sq_dwlxr_sflz","sq_dwlxr_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"lxrxm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Sq_dwlxrList.jsp?dwbh="+dwbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//非第一次进入此页，不需要初始化
{
	String[] lxrxm = request.getParameterValues("lxrxm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(lxrxm,"lxrxm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from sq_dwlxr where dwbh='"+dwbh+"' and ("+chooseitem+")";
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
  <B><font size="3">联系人信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="10%">联系人姓名</td>
	<td  width="10%">职务</td>
	<td  width="14%">手机</td>
	<td  width="22%">办公电话</td>
	<td  width="12%">传真</td>
	<td  width="8%">是否离职</td>
	<td  width="10%">备注</td>
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