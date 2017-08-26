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
	String scsbm=null;
	String scsmc=null;
	String scslb=null;
	scslb=request.getParameter("scslb");
	if (scslb!=null)
	{
		scslb=cf.GB2Uni(scslb);
		if (!(scslb.equals("")))	wheresql+=" and  (scslb='"+scslb+"')";
	}
	scsbm=request.getParameter("scsbm");
	if (scsbm!=null)
	{
		scsbm=cf.GB2Uni(scsbm);
		if (!(scsbm.equals("")))	wheresql+=" and  (scsbm='"+scsbm+"')";
	}
	scsmc=request.getParameter("scsmc");
	if (scsmc!=null)
	{
		scsmc=cf.GB2Uni(scsmc);
		if (!(scsmc.equals("")))	wheresql+=" and  (scsmc like '%"+scsmc+"%')";
	}

	ls_sql="SELECT scsbm,scsmc,DECODE(scslb,'1','主材','2','辅材类','3','通用类别') scslb  ";
	ls_sql+=" FROM jxc_scsxx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by scslb,scsmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_scsxxCxList.jsp","","","");
	pageObj.setPageRow(300);//设置每页显示记录数

//设置主键
	String[] keyName={"scsbm"};
	pageObj.setKey(keyName);
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
	<td  width="20%">品牌编码</td>
	<td  width="60%">品牌名称</td>
	<td  width="20%">品牌类别</td>
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