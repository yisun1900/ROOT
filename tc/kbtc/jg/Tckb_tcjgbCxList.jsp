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
	String tckb_tcjgb_dqbm=null;
	String tckb_tcjgb_bjjbbm=null;
	String tckb_tcjgb_hxbm=null;
	String tckb_tcjgb_tcmc=null;

	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (bjbbh!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (tckb_tcjgb.bjbbh='"+bjbbh+"')";
	}

	tckb_tcjgb_dqbm=request.getParameter("tckb_tcjgb_dqbm");
	if (tckb_tcjgb_dqbm!=null)
	{
		tckb_tcjgb_dqbm=cf.GB2Uni(tckb_tcjgb_dqbm);
		if (!(tckb_tcjgb_dqbm.equals("")))	wheresql+=" and  (tckb_tcjgb.dqbm='"+tckb_tcjgb_dqbm+"')";
	}
	tckb_tcjgb_bjjbbm=request.getParameter("tckb_tcjgb_bjjbbm");
	if (tckb_tcjgb_bjjbbm!=null)
	{
		tckb_tcjgb_bjjbbm=cf.GB2Uni(tckb_tcjgb_bjjbbm);
		if (!(tckb_tcjgb_bjjbbm.equals("")))	wheresql+=" and  (tckb_tcjgb.bjjbbm='"+tckb_tcjgb_bjjbbm+"')";
	}
	tckb_tcjgb_hxbm=request.getParameter("tckb_tcjgb_hxbm");
	if (tckb_tcjgb_hxbm!=null)
	{
		tckb_tcjgb_hxbm=cf.GB2Uni(tckb_tcjgb_hxbm);
		if (!(tckb_tcjgb_hxbm.equals("")))	wheresql+=" and  (tckb_tcjgb.hxbm='"+tckb_tcjgb_hxbm+"')";
	}
	tckb_tcjgb_tcmc=request.getParameter("tckb_tcjgb_tcmc");
	if (tckb_tcjgb_tcmc!=null)
	{
		tckb_tcjgb_tcmc=cf.GB2Uni(tckb_tcjgb_tcmc);
		if (!(tckb_tcjgb_tcmc.equals("")))	wheresql+=" and  (tckb_tcjgb.tcmc='"+tckb_tcjgb_tcmc+"')";
	}

	ls_sql="SELECT tckb_tcjgb.dqbm,dm_dqbm.dqmc,bjbbh,tckb_tcjgb.bjjbbm,bjjbmc,tckb_tcjgb.hxbm,hxmc,tckb_tcjgb.tcmc,tckb_tcjgb.fwmj,tckb_tcjgb.tcjg,tckb_tcjgb.pmzjdj,tckb_tcjgb.cpjg,tckb_tcjgb.sgjg,tckb_tcjgb.jjjg  ";
	ls_sql+=" FROM tckb_tcjgb,dm_dqbm,bdm_bjjbbm,dm_hxbm  ";
    ls_sql+=" where tckb_tcjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckb_tcjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckb_tcjgb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckb_tcjgb.dqbm,bjbbh,tckb_tcjgb.bjjbbm,tckb_tcjgb.hxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tckb_tcjgbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","bjbbh","bjjbmc","hxmc","tcmc","fwmj","tcjg","cpjg","sgjg","jjjg","pmzjdj"};
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
  <B><font size="3">套餐总价表－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">地区</td>
	<td  width="12%">报价版本号</td>
	<td  width="8%">报价级别</td>
	<td  width="10%">户型</td>
	<td  width="12%">套餐名称</td>
	<td  width="7%">起价面积</td>
	<td  width="8%">套餐总价</td>
	<td  width="7%">产品起包价</td>
	<td  width="7%">施工起包价</td>
	<td  width="7%">家具起包价</td>
	<td  width="7%">平米增加单价</td>
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