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
	String hxmjbm=null;
	String hxmjmc=null;
	String qd=null;
	String zd=null;
	hxmjbm=request.getParameter("hxmjbm");
	if (hxmjbm!=null)
	{
		hxmjbm=cf.GB2Uni(hxmjbm);
		if (!(hxmjbm.equals("")))	wheresql+=" and  (hxmjbm='"+hxmjbm+"')";
	}
	hxmjmc=request.getParameter("hxmjmc");
	if (hxmjmc!=null)
	{
		hxmjmc=cf.GB2Uni(hxmjmc);
		if (!(hxmjmc.equals("")))	wheresql+=" and  (hxmjmc='"+hxmjmc+"')";
	}
	qd=request.getParameter("qd");
	if (qd!=null)
	{
		qd=qd.trim();
		if (!(qd.equals("")))	wheresql+=" and  (qd="+qd+") ";
	}
	zd=request.getParameter("zd");
	if (zd!=null)
	{
		zd=zd.trim();
		if (!(zd.equals("")))	wheresql+=" and  (zd="+zd+") ";
	}
	ls_sql="SELECT hxmjbm,hxmjmc,qd,zd  ";
	ls_sql+=" FROM dm_hxmjbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by hxmjbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_hxmjbmList.jsp","SelectDm_hxmjbm.jsp","","EditDm_hxmjbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hxmjbm","hxmjmc","qd","zd"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hxmjbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteDm_hxmjbm.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//非第一次进入此页，不需要初始化
{
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
	<td  width="12%">户型面积编码</td>
	<td  width="32%">户型面积名称</td>
	<td  width="12%">起点</td>
	<td  width="12%">终点</td>
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