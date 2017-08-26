<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='txin.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="txin.common.PageObject"/>

<%
String ls_sql=null;
String wheresql=" WHERE (1=1) ";
int curPage=0;
String pageStr=request.getParameter("curPage");

if (pageStr!=null)//第x次运行
{
	//要求显示第几页
	curPage=Integer.parseInt(pageStr);
}
else//第一次运行,需要查询
{
	curPage=1;
	String dw_name=null;
	String dw_note=null;
	String dw_sql=null;
	String dw_wheresql=null;
	dw_name=request.getParameter("dw_name");
	if (dw_name!=null)
	{
		dw_name=cf.GB2Uni(dw_name);
		if (!(dw_name.equals("")))	wheresql+="  and (dw_name='"+dw_name+"')";
	}
	dw_note=request.getParameter("dw_note");
	if (dw_note!=null)
	{
		dw_note=cf.GB2Uni(dw_note);
		if (!(dw_note.equals("")))	wheresql+=" and  (dw_note='"+dw_note+"')";
	}
	dw_sql=request.getParameter("dw_sql");
	if (dw_sql!=null)
	{
		dw_sql=cf.GB2Uni(dw_sql);
		if (!(dw_sql.equals("")))	wheresql+=" and  (dw_sql='"+dw_sql+"')";
	}
	dw_wheresql=request.getParameter("dw_wheresql");
	if (dw_wheresql!=null)
	{
		dw_wheresql=cf.GB2Uni(dw_wheresql);
		if (!(dw_wheresql.equals("")))	wheresql+=" and  (dw_wheresql='"+dw_wheresql+"')";
	}
	ls_sql="SELECT dw_name,dw_note,dw_sql,dw_wheresql  ";
	ls_sql+=" FROM jdatawindow_note  ";
    ls_sql+=wheresql;
    pageObject.sql=ls_sql;
//进行对象初始化
	pageObject.initPage("Jdatawindow_noteCpList.jsp","SelectCpJdatawindow_note.jsp","ViewJdatawindow_note.jsp","CopyJdatawindow_note.jsp");
	pageObject.setEditStr("复制");
/*
//设置显示列
	String[] disColName={"dw_name","dw_note","dw_sql","dw_wheresql"};
	pageObject.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dw_name"};
	pageObject.setKey(keyName);
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
	pageObject.out=out;
	pageObject.getDate(curPage);
	pageObject.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
		<td  width="12%" height="2">&nbsp;</td>
		<td  width="16%" height="2">DataWindow名称</td>
		<td  width="22%" height="2">DataWindow说明</td>
		<td  width="22%" height="2">DataWindow SQL</td>
		<td  width="22%" height="2">WhereSQL</td>
</tr>
<%
	pageObject.printDate();
	pageObject.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObject.printScript();
%> 
//-->
</script>
</html>