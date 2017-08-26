<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_sbkhlx_xh=null;
	String crm_sbkhlx_ssfgs=null;
	String crm_sbkhlx_sbkhlx=null;
	crm_sbkhlx_xh=request.getParameter("crm_sbkhlx_xh");
	if (crm_sbkhlx_xh!=null)
	{
		crm_sbkhlx_xh=crm_sbkhlx_xh.trim();
		if (!(crm_sbkhlx_xh.equals("")))	wheresql+=" and (crm_sbkhlx.xh="+crm_sbkhlx_xh+") ";
	}
	crm_sbkhlx_ssfgs=request.getParameter("crm_sbkhlx_ssfgs");
	if (crm_sbkhlx_ssfgs!=null)
	{
		crm_sbkhlx_ssfgs=cf.GB2Uni(crm_sbkhlx_ssfgs);
		if (!(crm_sbkhlx_ssfgs.equals("")))	wheresql+=" and  (crm_sbkhlx.ssfgs='"+crm_sbkhlx_ssfgs+"')";
	}
	crm_sbkhlx_sbkhlx=request.getParameter("crm_sbkhlx_sbkhlx");
	if (crm_sbkhlx_sbkhlx!=null)
	{
		crm_sbkhlx_sbkhlx=cf.GB2Uni(crm_sbkhlx_sbkhlx);
		if (!(crm_sbkhlx_sbkhlx.equals("")))	wheresql+=" and  (crm_sbkhlx.sbkhlx='"+crm_sbkhlx_sbkhlx+"')";
	}
	ls_sql="SELECT crm_sbkhlx.xh,crm_sbkhlx.sbkhlx,sq_dwxx.dwmc  ";
	ls_sql+=" FROM sq_dwxx,crm_sbkhlx  ";
    ls_sql+=" where crm_sbkhlx.ssfgs=sq_dwxx.dwbh(+)";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_sbkhlx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_sbkhlx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}

    ls_sql+=wheresql;
    ls_sql+=" order by crm_sbkhlx.ssfgs,crm_sbkhlx.sbkhlx";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_sbkhlxCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","sq_dwxx_dwmc","crm_sbkhlx_sbkhlx"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
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
	<td  width="12%">序号</td>
	<td  width="63%">失败客户流向</td>
	<td  width="25%">分公司</td>
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