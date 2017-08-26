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
	String tc_bzxm_dqbm=null;
	String tc_bzxm_bjjbbm=null;
	String tc_bzxm_xmmc=null;
	String tc_bzxm_ppmc=null;
	String tc_bzxm_xh=null;
	String tc_bzxm_jldw=null;
	String tc_bzxm_bhsl=null;
	String tc_bzxm_lrr=null;
	String tc_bzxm_lrsj=null;
	tc_bzxm_dqbm=request.getParameter("tc_bzxm_dqbm");
	if (tc_bzxm_dqbm!=null)
	{
		tc_bzxm_dqbm=cf.GB2Uni(tc_bzxm_dqbm);
		if (!(tc_bzxm_dqbm.equals("")))	wheresql+=" and  (tc_bzxm.dqbm='"+tc_bzxm_dqbm+"')";
	}
	tc_bzxm_bjjbbm=request.getParameter("tc_bzxm_bjjbbm");
	if (tc_bzxm_bjjbbm!=null)
	{
		tc_bzxm_bjjbbm=cf.GB2Uni(tc_bzxm_bjjbbm);
		if (!(tc_bzxm_bjjbbm.equals("")))	wheresql+=" and  (tc_bzxm.bjjbbm='"+tc_bzxm_bjjbbm+"')";
	}
	tc_bzxm_xmmc=request.getParameter("tc_bzxm_xmmc");
	if (tc_bzxm_xmmc!=null)
	{
		tc_bzxm_xmmc=cf.GB2Uni(tc_bzxm_xmmc);
		if (!(tc_bzxm_xmmc.equals("")))	wheresql+=" and  (tc_bzxm.xmmc='"+tc_bzxm_xmmc+"')";
	}
	tc_bzxm_ppmc=request.getParameter("tc_bzxm_ppmc");
	if (tc_bzxm_ppmc!=null)
	{
		tc_bzxm_ppmc=cf.GB2Uni(tc_bzxm_ppmc);
		if (!(tc_bzxm_ppmc.equals("")))	wheresql+=" and  (tc_bzxm.ppmc='"+tc_bzxm_ppmc+"')";
	}
	tc_bzxm_xh=request.getParameter("tc_bzxm_xh");
	if (tc_bzxm_xh!=null)
	{
		tc_bzxm_xh=cf.GB2Uni(tc_bzxm_xh);
		if (!(tc_bzxm_xh.equals("")))	wheresql+=" and  (tc_bzxm.xh='"+tc_bzxm_xh+"')";
	}
	tc_bzxm_jldw=request.getParameter("tc_bzxm_jldw");
	if (tc_bzxm_jldw!=null)
	{
		tc_bzxm_jldw=cf.GB2Uni(tc_bzxm_jldw);
		if (!(tc_bzxm_jldw.equals("")))	wheresql+=" and  (tc_bzxm.jldw='"+tc_bzxm_jldw+"')";
	}
	tc_bzxm_bhsl=request.getParameter("tc_bzxm_bhsl");
	if (tc_bzxm_bhsl!=null)
	{
		tc_bzxm_bhsl=tc_bzxm_bhsl.trim();
		if (!(tc_bzxm_bhsl.equals("")))	wheresql+=" and  (tc_bzxm.bhsl="+tc_bzxm_bhsl+") ";
	}
	tc_bzxm_lrr=request.getParameter("tc_bzxm_lrr");
	if (tc_bzxm_lrr!=null)
	{
		tc_bzxm_lrr=cf.GB2Uni(tc_bzxm_lrr);
		if (!(tc_bzxm_lrr.equals("")))	wheresql+=" and  (tc_bzxm.lrr='"+tc_bzxm_lrr+"')";
	}
	tc_bzxm_lrsj=request.getParameter("tc_bzxm_lrsj");
	if (tc_bzxm_lrsj!=null)
	{
		tc_bzxm_lrsj=tc_bzxm_lrsj.trim();
		if (!(tc_bzxm_lrsj.equals("")))	wheresql+="  and (tc_bzxm.lrsj=TO_DATE('"+tc_bzxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT dm_dqbm.dqmc,bjjbmc,tc_bzxm.xmmc,tc_bzxm.ppmc,tc_bzxm.xh,tc_bzxm.jldw,tc_bzxm.bhsl,tc_bzxm.bz,tc_bzxm.lrr,tc_bzxm.lrsj  ";
	ls_sql+=" FROM dm_dqbm,tc_bzxm,bdm_bjjbbm  ";
    ls_sql+=" where tc_bzxm.dqbm=dm_dqbm.dqbm(+) and tc_bzxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("tc_bzxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","xmmc","tc_bzxm_ppmc","tc_bzxm_xh","tc_bzxm_jldw","tc_bzxm_bhsl","tc_bzxm_bz","tc_bzxm_lrr","tc_bzxm_lrsj"};
	pageObj.setDisColName(disColName);
*/

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
  <B><font size="3">套餐标准项目</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">地区</td>
	<td  width="6%">报价级别</td>
	<td  width="13%">项目名称</td>
	<td  width="14%">品牌</td>
	<td  width="14%">型号</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">包含数量</td>
	<td  width="32%">备注及工艺说明</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
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