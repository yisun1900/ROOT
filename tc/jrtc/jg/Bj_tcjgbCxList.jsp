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
	String bj_tcjgb_bjbbh=null;
	String bj_tcjgb_dqbm=null;
	String bj_tcjgb_bjjbbm=null;
	String bj_tcjgb_hxbm=null;
	String bj_tcjgb_tcmc=null;
	bj_tcjgb_bjbbh=request.getParameter("bj_tcjgb_bjbbh");
	if (bj_tcjgb_bjbbh!=null)
	{
		bj_tcjgb_bjbbh=cf.GB2Uni(bj_tcjgb_bjbbh);
		if (!(bj_tcjgb_bjbbh.equals("")))	wheresql+=" and  (bj_tcjgb.bjbbh='"+bj_tcjgb_bjbbh+"')";
	}
	bj_tcjgb_dqbm=request.getParameter("bj_tcjgb_dqbm");
	if (bj_tcjgb_dqbm!=null)
	{
		bj_tcjgb_dqbm=cf.GB2Uni(bj_tcjgb_dqbm);
		if (!(bj_tcjgb_dqbm.equals("")))	wheresql+=" and  (bj_tcjgb.dqbm='"+bj_tcjgb_dqbm+"')";
	}
	bj_tcjgb_bjjbbm=request.getParameter("bj_tcjgb_bjjbbm");
	if (bj_tcjgb_bjjbbm!=null)
	{
		bj_tcjgb_bjjbbm=cf.GB2Uni(bj_tcjgb_bjjbbm);
		if (!(bj_tcjgb_bjjbbm.equals("")))	wheresql+=" and  (bj_tcjgb.bjjbbm='"+bj_tcjgb_bjjbbm+"')";
	}
	bj_tcjgb_hxbm=request.getParameter("bj_tcjgb_hxbm");
	if (bj_tcjgb_hxbm!=null)
	{
		bj_tcjgb_hxbm=cf.GB2Uni(bj_tcjgb_hxbm);
		if (!(bj_tcjgb_hxbm.equals("")))	wheresql+=" and  (bj_tcjgb.hxbm='"+bj_tcjgb_hxbm+"')";
	}
	bj_tcjgb_tcmc=request.getParameter("bj_tcjgb_tcmc");
	if (bj_tcjgb_tcmc!=null)
	{
		bj_tcjgb_tcmc=cf.GB2Uni(bj_tcjgb_tcmc);
		if (!(bj_tcjgb_tcmc.equals("")))	wheresql+=" and  (bj_tcjgb.tcmc='"+bj_tcjgb_tcmc+"')";
	}

	ls_sql="SELECT bj_tcjgb.bjbbh,bj_tcjgb.dqbm,dm_dqbm.dqmc,bj_tcjgb.bjjbbm,bjjbmc,bj_tcjgb.hxbm,hxmc,bj_tcjgb.tcmc,bj_tcjgb.fwmj,bj_tcjgb.tcjg,bj_tcjgb.pmzjdj,bj_tcjgb.tlgbzjj  ";
	ls_sql+=" FROM bj_tcjgb,dm_dqbm,bdm_bjjbbm,dm_hxbm  ";
    ls_sql+=" where bj_tcjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tcjgb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tcjgb.bjbbh,bj_tcjgb.dqbm,bj_tcjgb.bjjbbm,bj_tcjgb.hxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_tcjgbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"bjbbh","dqmc","bjjbmc","hxmc","tcmc","fwmj","tcjg","pmzjdj","tlgbzjj"};
	pageObj.setDisColName(disColName);

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
  <B><font size="3">套餐价格表－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">报价版本号</td>
	<td  width="10%">地区</td>
	<td  width="13%">报价级别</td>
	<td  width="13%">户型</td>
	<td  width="13%">套餐名称</td>
	<td  width="10%">套内基准面积</td>
	<td  width="10%">套餐价格</td>
	<td  width="10%">平米增加单价</td>
	<td  width="10%">涂料改为壁纸加价</td>
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