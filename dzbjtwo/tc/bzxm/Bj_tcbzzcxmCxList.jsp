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
	String bj_tcbzzcxm_bjbbh=null;
	String bj_tcbzzcxm_dqbm=null;
	String bj_tcbzzcxm_bjjbbm=null;
	String bj_tcbzzcxm_hxbm=null;
	String bj_tcbzzcxm_jgwzbm=null;
	String bj_tcbzzcxm_tccplbbm=null;
	String sfxzsl=null;
	String bj_tcbzzcxm_lrr=null;
	String bj_tcbzzcxm_lrsj=null;

	String sfyqxtpp=null;
	sfyqxtpp=request.getParameter("sfyqxtpp");
	if (sfyqxtpp!=null)
	{
		sfyqxtpp=cf.GB2Uni(sfyqxtpp);
		if (!(sfyqxtpp.equals("")))	wheresql+=" and  (bj_tcbzzcxm.sfyqxtpp='"+sfyqxtpp+"')";
	}

	String tcsjflbm=null;
	tcsjflbm=request.getParameter("tcsjflbm");
	if (tcsjflbm!=null)
	{
		tcsjflbm=cf.GB2Uni(tcsjflbm);
		if (!(tcsjflbm.equals("")))	wheresql+=" and  (bj_tcbzzcxm.tcsjflbm='"+tcsjflbm+"')";
	}

	String sfbxx=null;
	sfbxx=request.getParameter("sfbxx");
	if (sfbxx!=null)
	{
		sfbxx=cf.GB2Uni(sfbxx);
		if (!(sfbxx.equals("")))	wheresql+=" and  (bj_tcbzzcxm.sfbxx='"+sfbxx+"')";
	}
	String sfyxsj=null;
	sfyxsj=request.getParameter("sfyxsj");
	if (sfyxsj!=null)
	{
		sfyxsj=cf.GB2Uni(sfyxsj);
		if (!(sfyxsj.equals("")))	wheresql+=" and  (bj_tcbzzcxm.sfyxsj='"+sfyxsj+"')";
	}

	bj_tcbzzcxm_bjbbh=request.getParameter("bj_tcbzzcxm_bjbbh");
	if (bj_tcbzzcxm_bjbbh!=null)
	{
		bj_tcbzzcxm_bjbbh=cf.GB2Uni(bj_tcbzzcxm_bjbbh);
		if (!(bj_tcbzzcxm_bjbbh.equals("")))	wheresql+=" and  (bj_tcbzzcxm.bjbbh='"+bj_tcbzzcxm_bjbbh+"')";
	}
	bj_tcbzzcxm_dqbm=request.getParameter("bj_tcbzzcxm_dqbm");
	if (bj_tcbzzcxm_dqbm!=null)
	{
		bj_tcbzzcxm_dqbm=cf.GB2Uni(bj_tcbzzcxm_dqbm);
		if (!(bj_tcbzzcxm_dqbm.equals("")))	wheresql+=" and  (bj_tcbzzcxm.dqbm='"+bj_tcbzzcxm_dqbm+"')";
	}
	bj_tcbzzcxm_bjjbbm=request.getParameter("bj_tcbzzcxm_bjjbbm");
	if (bj_tcbzzcxm_bjjbbm!=null)
	{
		bj_tcbzzcxm_bjjbbm=cf.GB2Uni(bj_tcbzzcxm_bjjbbm);
		if (!(bj_tcbzzcxm_bjjbbm.equals("")))	wheresql+=" and  (bj_tcbzzcxm.bjjbbm='"+bj_tcbzzcxm_bjjbbm+"')";
	}
	bj_tcbzzcxm_hxbm=request.getParameter("bj_tcbzzcxm_hxbm");
	if (bj_tcbzzcxm_hxbm!=null)
	{
		bj_tcbzzcxm_hxbm=cf.GB2Uni(bj_tcbzzcxm_hxbm);
		if (!(bj_tcbzzcxm_hxbm.equals("")))	wheresql+=" and  (bj_tcbzzcxm.hxbm='"+bj_tcbzzcxm_hxbm+"')";
	}
	bj_tcbzzcxm_jgwzbm=request.getParameter("bj_tcbzzcxm_jgwzbm");
	if (bj_tcbzzcxm_jgwzbm!=null)
	{
		bj_tcbzzcxm_jgwzbm=cf.GB2Uni(bj_tcbzzcxm_jgwzbm);
		if (!(bj_tcbzzcxm_jgwzbm.equals("")))	wheresql+=" and  (bj_tcbzzcxm.jgwzbm='"+bj_tcbzzcxm_jgwzbm+"')";
	}
	bj_tcbzzcxm_tccplbbm=request.getParameter("bj_tcbzzcxm_tccplbbm");
	if (bj_tcbzzcxm_tccplbbm!=null)
	{
		bj_tcbzzcxm_tccplbbm=cf.GB2Uni(bj_tcbzzcxm_tccplbbm);
		if (!(bj_tcbzzcxm_tccplbbm.equals("")))	wheresql+=" and  (bj_tcbzzcxm.tccplbbm='"+bj_tcbzzcxm_tccplbbm+"')";
	}
	sfxzsl=request.getParameter("sfxzsl");
	if (sfxzsl!=null)
	{
		sfxzsl=cf.GB2Uni(sfxzsl);
		if (!(sfxzsl.equals("")))	wheresql+=" and  (bj_tcbzzcxm.sfxzsl='"+sfxzsl+"')";
	}
	bj_tcbzzcxm_lrr=request.getParameter("bj_tcbzzcxm_lrr");
	if (bj_tcbzzcxm_lrr!=null)
	{
		bj_tcbzzcxm_lrr=cf.GB2Uni(bj_tcbzzcxm_lrr);
		if (!(bj_tcbzzcxm_lrr.equals("")))	wheresql+=" and  (bj_tcbzzcxm.lrr='"+bj_tcbzzcxm_lrr+"')";
	}
	bj_tcbzzcxm_lrsj=request.getParameter("bj_tcbzzcxm_lrsj");
	if (bj_tcbzzcxm_lrsj!=null)
	{
		bj_tcbzzcxm_lrsj=bj_tcbzzcxm_lrsj.trim();
		if (!(bj_tcbzzcxm_lrsj.equals("")))	wheresql+="  and (bj_tcbzzcxm.lrsj>=TO_DATE('"+bj_tcbzzcxm_lrsj+"','YYYY/MM/DD'))";
	}
	bj_tcbzzcxm_lrsj=request.getParameter("bj_tcbzzcxm_lrsj2");
	if (bj_tcbzzcxm_lrsj!=null)
	{
		bj_tcbzzcxm_lrsj=bj_tcbzzcxm_lrsj.trim();
		if (!(bj_tcbzzcxm_lrsj.equals("")))	wheresql+="  and (bj_tcbzzcxm.lrsj<=TO_DATE('"+bj_tcbzzcxm_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT bj_tcbzzcxm.bjbbh,bj_tcbzzcxm.dqbm,dm_dqbm.dqmc,bj_tcbzzcxm.bjjbbm,bjjbmc,bj_tcbzzcxm.hxbm,hxmc,bj_tcbzzcxm.jgwzbm,bj_tcbzzcxm.tccplbbm,clxlmc,bj_tcbzzcxm.bzsl,DECODE(bj_tcbzzcxm.sfxzsl,'1','可增项','2','不可增项','3','不控制') sfxzsl,bj_tcbzzcxm.ccbfjj,DECODE(bj_tcbzzcxm.sfbxx,'Y','是','N','否') sfbxx,DECODE(bj_tcbzzcxm.sfyxsj,'Y','是','N','否') sfyxsj,tcsjflmc,DECODE(bj_tcbzzcxm.sfyqxtpp,'Y','是','N','否') sfyqxtpp,bj_tcbzzcxm.lrr,bj_tcbzzcxm.lrsj  ";
	ls_sql+=" FROM bj_tcbzzcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm,jxc_clxlbm,bj_tcsjflbm  ";
    ls_sql+=" where bj_tcbzzcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcbzzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tcbzzcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and bj_tcbzzcxm.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=" and bj_tcbzzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tcbzzcxm.dqbm,bj_tcbzzcxm.bjbbh,bj_tcbzzcxm.bjjbbm,bj_tcbzzcxm.hxbm,bj_tcbzzcxm.jgwzbm,bj_tcbzzcxm.tccplbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_tcbzzcxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"bjbbh","dqmc","bjjbmc","hxmc","jgwzbm","clxlmc","sfxzsl","bzsl","ccbfjj","sfbxx","sfyxsj","tcsjflmc","sfyqxtpp","lrr","lrsj"};
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
  <B><font size="3">套餐标准主材项目－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">报价版本号</td>
	<td  width="6%">地区</td>
	<td  width="7%">报价级别</td>
	<td  width="7%">户型</td>
	<td  width="7%">结构位置</td>
	<td  width="12%">产品类别</td>
	<td  width="6%">是否限制数量</td>
	<td  width="6%">标准数量</td>
	<td  width="6%">超出部分加价</td>
	<td  width="4%">是否必选项</td>
	<td  width="5%">升级是否收费</td>
	<td  width="12%">套餐升级分类</td>
	<td  width="5%">是否要求相同品牌</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
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