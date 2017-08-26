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
	String tc_bzgcxm_bjbbh=null;
	String tc_bzgcxm_dqbm=null;
	String tc_bzgcxm_bjjbbm=null;
	String tc_bzgcxm_xmbh=null;
	String sfxzsl=null;
	String tc_bzgcxm_lrr=null;
	String tc_bzgcxm_lrsj=null;

	String hxbm=null;
	hxbm=request.getParameter("hxbm");
	if (hxbm!=null)
	{
		hxbm=cf.GB2Uni(hxbm);
		if (!(hxbm.equals("")))	wheresql+=" and  (tc_bzgcxm.hxbm='"+hxbm+"')";
	}

	String xmmc=null;
	xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc like '%"+xmmc+"%')";
	}
	
	tc_bzgcxm_bjbbh=request.getParameter("tc_bzgcxm_bjbbh");
	if (tc_bzgcxm_bjbbh!=null)
	{
		tc_bzgcxm_bjbbh=cf.GB2Uni(tc_bzgcxm_bjbbh);
		if (!(tc_bzgcxm_bjbbh.equals("")))	wheresql+=" and  (tc_bzgcxm.bjbbh='"+tc_bzgcxm_bjbbh+"')";
	}
	tc_bzgcxm_dqbm=request.getParameter("tc_bzgcxm_dqbm");
	if (tc_bzgcxm_dqbm!=null)
	{
		tc_bzgcxm_dqbm=cf.GB2Uni(tc_bzgcxm_dqbm);
		if (!(tc_bzgcxm_dqbm.equals("")))	wheresql+=" and  (tc_bzgcxm.dqbm='"+tc_bzgcxm_dqbm+"')";
	}
	tc_bzgcxm_bjjbbm=request.getParameter("tc_bzgcxm_bjjbbm");
	if (tc_bzgcxm_bjjbbm!=null)
	{
		tc_bzgcxm_bjjbbm=cf.GB2Uni(tc_bzgcxm_bjjbbm);
		if (!(tc_bzgcxm_bjjbbm.equals("")))	wheresql+=" and  (tc_bzgcxm.bjjbbm='"+tc_bzgcxm_bjjbbm+"')";
	}
	tc_bzgcxm_xmbh=request.getParameter("tc_bzgcxm_xmbh");
	if (tc_bzgcxm_xmbh!=null)
	{
		tc_bzgcxm_xmbh=cf.GB2Uni(tc_bzgcxm_xmbh);
		if (!(tc_bzgcxm_xmbh.equals("")))	wheresql+=" and  (tc_bzgcxm.xmbh='"+tc_bzgcxm_xmbh+"')";
	}
	sfxzsl=request.getParameter("sfxzsl");
	if (sfxzsl!=null)
	{
		sfxzsl=cf.GB2Uni(sfxzsl);
		if (!(sfxzsl.equals("")))	wheresql+=" and  (tc_bzgcxm.sfxzsl='"+sfxzsl+"')";
	}
	tc_bzgcxm_lrr=request.getParameter("tc_bzgcxm_lrr");
	if (tc_bzgcxm_lrr!=null)
	{
		tc_bzgcxm_lrr=cf.GB2Uni(tc_bzgcxm_lrr);
		if (!(tc_bzgcxm_lrr.equals("")))	wheresql+=" and  (tc_bzgcxm.lrr='"+tc_bzgcxm_lrr+"')";
	}
	tc_bzgcxm_lrsj=request.getParameter("tc_bzgcxm_lrsj");
	if (tc_bzgcxm_lrsj!=null)
	{
		tc_bzgcxm_lrsj=tc_bzgcxm_lrsj.trim();
		if (!(tc_bzgcxm_lrsj.equals("")))	wheresql+="  and (tc_bzgcxm.lrsj>=TO_DATE('"+tc_bzgcxm_lrsj+"','YYYY/MM/DD'))";
	}
	tc_bzgcxm_lrsj=request.getParameter("tc_bzgcxm_lrsj2");
	if (tc_bzgcxm_lrsj!=null)
	{
		tc_bzgcxm_lrsj=tc_bzgcxm_lrsj.trim();
		if (!(tc_bzgcxm_lrsj.equals("")))	wheresql+="  and (tc_bzgcxm.lrsj<=TO_DATE('"+tc_bzgcxm_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT tc_bzgcxm.bjbbh,tc_bzgcxm.dqbm,dm_dqbm.dqmc,tc_bzgcxm.bjjbbm,bjjbmc,tc_bzgcxm.hxbm,hxmc,tc_bzgcxm.xmbh,bj_jzbjb.xmmc,tc_bzgcxm.bzsl, DECODE(tc_bzgcxm.sfxzsl,'1','可增项','2','不可增项','3','不控制') sfxzsl,tc_bzgcxm.ccbfjj,tc_bzgcxm.lrr,tc_bzgcxm.lrsj  ";
	ls_sql+=" FROM tc_bzgcxm,dm_dqbm,bdm_bjjbbm,bj_jzbjb,dm_hxbm  ";
    ls_sql+=" where tc_bzgcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_bzgcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_bzgcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tc_bzgcxm.bjbbh=bj_jzbjb.bjbbh(+) and tc_bzgcxm.dqbm=bj_jzbjb.dqbm(+) and tc_bzgcxm.bjjbbm=bj_jzbjb.bjjbbm(+) and tc_bzgcxm.xmbh=bj_jzbjb.xmbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_bzgcxm.dqbm,tc_bzgcxm.bjbbh,tc_bzgcxm.bjjbbm,tc_bzgcxm.hxbm,tc_bzgcxm.xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_bzgcxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"bjbbh","dqmc","bjjbmc","hxmc","xmbh","xmmc","sfxzsl","bzsl","ccbfjj","lrr","lrsj"};
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
  <B><font size="3">套餐标准工程项目－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">报价版本号</td>
	<td  width="7%">地区</td>
	<td  width="9%">报价级别</td>
	<td  width="8%">户型</td>
	<td  width="10%">项目编号</td>
	<td  width="26%">项目名称</td>
	<td  width="6%">是否限制数量</td>
	<td  width="6%">标准数量</td>
	<td  width="6%">超出部分加价</td>
	<td  width="5%">录入人</td>
	<td  width="8%">录入时间</td>
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