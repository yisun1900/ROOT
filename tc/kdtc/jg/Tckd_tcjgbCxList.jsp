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
	String tckd_tcjgb_dqbm=null;
	String tckd_tcjgb_bjjbbm=null;
	String tckd_tcjgb_hxbm=null;
	String tckd_tcjgb_tcmc=null;

	tckd_tcjgb_dqbm=request.getParameter("tckd_tcjgb_dqbm");
	if (tckd_tcjgb_dqbm!=null)
	{
		tckd_tcjgb_dqbm=cf.GB2Uni(tckd_tcjgb_dqbm);
		if (!(tckd_tcjgb_dqbm.equals("")))	wheresql+=" and  (tckd_tcjgb.dqbm='"+tckd_tcjgb_dqbm+"')";
	}
	tckd_tcjgb_bjjbbm=request.getParameter("tckd_tcjgb_bjjbbm");
	if (tckd_tcjgb_bjjbbm!=null)
	{
		tckd_tcjgb_bjjbbm=cf.GB2Uni(tckd_tcjgb_bjjbbm);
		if (!(tckd_tcjgb_bjjbbm.equals("")))	wheresql+=" and  (tckd_tcjgb.bjjbbm='"+tckd_tcjgb_bjjbbm+"')";
	}
	tckd_tcjgb_hxbm=request.getParameter("tckd_tcjgb_hxbm");
	if (tckd_tcjgb_hxbm!=null)
	{
		tckd_tcjgb_hxbm=cf.GB2Uni(tckd_tcjgb_hxbm);
		if (!(tckd_tcjgb_hxbm.equals("")))	wheresql+=" and  (tckd_tcjgb.hxbm='"+tckd_tcjgb_hxbm+"')";
	}
	tckd_tcjgb_tcmc=request.getParameter("tckd_tcjgb_tcmc");
	if (tckd_tcjgb_tcmc!=null)
	{
		tckd_tcjgb_tcmc=cf.GB2Uni(tckd_tcjgb_tcmc);
		if (!(tckd_tcjgb_tcmc.equals("")))	wheresql+=" and  (tckd_tcjgb.tcmc='"+tckd_tcjgb_tcmc+"')";
	}

	ls_sql="SELECT tckd_tcjgb.dqbm,dm_dqbm.dqmc,tckd_tcjgb.bjjbbm,bjjbmc,tckd_tcjgb.hxbm,hxmc,tckd_tcjgb.tcmc,tckd_tcjgb.fwmj,tckd_tcjgb.tcjg,tckd_tcjgb.pmzjdj,tckd_tcjgb.tlgbzjj,tckd_tcjgb.dbhddzjj  ";
	ls_sql+=" FROM tckd_tcjgb,dm_dqbm,bdm_bjjbbm,dm_hxbm  ";
    ls_sql+=" where tckd_tcjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckd_tcjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckd_tcjgb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckd_tcjgb.dqbm,tckd_tcjgb.bjjbbm,tckd_tcjgb.hxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tckd_tcjgbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","bjjbmc","hxmc","tcmc","fwmj","tcjg","pmzjdj","tlgbzjj","dbhddzjj"};
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
	<td  width="10%">地区</td>
	<td  width="13%">报价级别</td>
	<td  width="13%">户型</td>
	<td  width="13%">套餐名称</td>
	<td  width="10%">套内基准面积</td>
	<td  width="10%">套餐价格</td>
	<td  width="10%">平米增加单价</td>
	<td  width="9%">涂料换壁纸收费</td>
	<td  width="9%">地板换大磁砖收费</td>
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