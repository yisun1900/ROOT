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
	String zcxlbm=null;
	String zcxlmc=null;
	String zcdlmc=null;
	zcxlbm=request.getParameter("zcxlbm");
	if (zcxlbm!=null)
	{
		zcxlbm=cf.GB2Uni(zcxlbm);
		if (!(zcxlbm.equals("")))	wheresql+=" and  (jdm_zcxlbm.zcxlbm='"+zcxlbm+"')";
	}
	zcxlmc=request.getParameter("zcxlmc");
	if (zcxlmc!=null)
	{
		zcxlmc=cf.GB2Uni(zcxlmc);
		if (!(zcxlmc.equals("")))	wheresql+=" and  (jdm_zcxlbm.zcxlmc='"+zcxlmc+"')";
	}
	zcdlmc=request.getParameter("zcdlmc");
	if (zcdlmc!=null)
	{
		zcdlmc=cf.GB2Uni(zcdlmc);
		if (!(zcdlmc.equals("")))	wheresql+=" and  (jdm_zcxlbm.zcdlmc='"+zcdlmc+"')";
	}


	ls_sql="SELECT zcxlbm,zcxlmc,jdm_zcdlbm.zcdlbm,jdm_zcxlbm.zcdlmc  ";
	ls_sql+=" FROM jdm_zcxlbm,jdm_zcdlbm  ";
    ls_sql+=" where jdm_zcxlbm.zcdlmc=jdm_zcdlbm.zcdlmc(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by zcxlbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jdm_zcxlbmCxList.jsp","SelectCxJdm_zcxlbm.jsp","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zcxlbm","zcxlmc","zcdlmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zcxlbm"};
	pageObj.setKey(keyName);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zcdlbm","1");//列参数对象加入Hash表
	spanColHash.put("zcdlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
	<td  width="14%">主材小类编码</td>
	<td  width="36%">主材小类名称</td>
	<td  width="14%">大类编码</td>
	<td  width="36%">大类</td>
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