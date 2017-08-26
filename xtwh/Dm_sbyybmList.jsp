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
	String sbyybm=null;
	String sbyymc=null;
	sbyybm=request.getParameter("sbyybm");
	if (sbyybm!=null)
	{
		sbyybm=cf.GB2Uni(sbyybm);
		if (!(sbyybm.equals("")))	wheresql+=" and  (sbyybm='"+sbyybm+"')";
	}
	sbyymc=request.getParameter("sbyymc");
	if (sbyymc!=null)
	{
		sbyymc=cf.GB2Uni(sbyymc);
		if (!(sbyymc.equals("")))	wheresql+=" and  (sbyymc='"+sbyymc+"')";
	}
	ls_sql="SELECT sbyybm,sbyymc,DECODE(dmzxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过') dmzxzt,DECODE(fgszxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过') fgszxzt ";
	ls_sql+=" FROM dm_sbyybm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by sbyybm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_sbyybmList.jsp","SelectDm_sbyybm.jsp","","EditDm_sbyybm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sbyybm","sbyymc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sbyybm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_sbyybmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dmzxzt","1");//列参数对象加入Hash表
	spanColHash.put("fgszxzt","2");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] sbyybm = request.getParameterValues("sbyybm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(sbyybm,"sbyybm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_sbyybm where "+chooseitem;
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
	<td  width="14%">失败原因编码</td>
	<td  width="30%">失败原因名称</td>
	<td  width="20%">店面咨询状态</td>
	<td  width="20%">分公司咨询状态</td>
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