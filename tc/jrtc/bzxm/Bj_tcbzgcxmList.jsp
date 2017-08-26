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
	String bj_tcbzgcxm_bjbbh=null;
	String bj_tcbzgcxm_dqbm=null;
	String bj_tcbzgcxm_bjjbbm=null;
	String bj_tcbzgcxm_xmbh=null;
	String sfxzsl=null;
	String bj_tcbzgcxm_lrr=null;
	String bj_tcbzgcxm_lrsj=null;

	String hxbm=null;
	hxbm=request.getParameter("hxbm");
	if (hxbm!=null)
	{
		hxbm=cf.GB2Uni(hxbm);
		if (!(hxbm.equals("")))	wheresql+=" and  (bj_tcbzgcxm.hxbm='"+hxbm+"')";
	}

	String xmmc=null;
	xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc like '%"+xmmc+"%')";
	}
	
	bj_tcbzgcxm_bjbbh=request.getParameter("bj_tcbzgcxm_bjbbh");
	if (bj_tcbzgcxm_bjbbh!=null)
	{
		bj_tcbzgcxm_bjbbh=cf.GB2Uni(bj_tcbzgcxm_bjbbh);
		if (!(bj_tcbzgcxm_bjbbh.equals("")))	wheresql+=" and  (bj_tcbzgcxm.bjbbh='"+bj_tcbzgcxm_bjbbh+"')";
	}
	bj_tcbzgcxm_dqbm=request.getParameter("bj_tcbzgcxm_dqbm");
	if (bj_tcbzgcxm_dqbm!=null)
	{
		bj_tcbzgcxm_dqbm=cf.GB2Uni(bj_tcbzgcxm_dqbm);
		if (!(bj_tcbzgcxm_dqbm.equals("")))	wheresql+=" and  (bj_tcbzgcxm.dqbm='"+bj_tcbzgcxm_dqbm+"')";
	}
	bj_tcbzgcxm_bjjbbm=request.getParameter("bj_tcbzgcxm_bjjbbm");
	if (bj_tcbzgcxm_bjjbbm!=null)
	{
		bj_tcbzgcxm_bjjbbm=cf.GB2Uni(bj_tcbzgcxm_bjjbbm);
		if (!(bj_tcbzgcxm_bjjbbm.equals("")))	wheresql+=" and  (bj_tcbzgcxm.bjjbbm='"+bj_tcbzgcxm_bjjbbm+"')";
	}
	bj_tcbzgcxm_xmbh=request.getParameter("bj_tcbzgcxm_xmbh");
	if (bj_tcbzgcxm_xmbh!=null)
	{
		bj_tcbzgcxm_xmbh=cf.GB2Uni(bj_tcbzgcxm_xmbh);
		if (!(bj_tcbzgcxm_xmbh.equals("")))	wheresql+=" and  (bj_tcbzgcxm.xmbh='"+bj_tcbzgcxm_xmbh+"')";
	}
	sfxzsl=request.getParameter("sfxzsl");
	if (sfxzsl!=null)
	{
		sfxzsl=cf.GB2Uni(sfxzsl);
		if (!(sfxzsl.equals("")))	wheresql+=" and  (bj_tcbzgcxm.sfxzsl='"+sfxzsl+"')";
	}
	bj_tcbzgcxm_lrr=request.getParameter("bj_tcbzgcxm_lrr");
	if (bj_tcbzgcxm_lrr!=null)
	{
		bj_tcbzgcxm_lrr=cf.GB2Uni(bj_tcbzgcxm_lrr);
		if (!(bj_tcbzgcxm_lrr.equals("")))	wheresql+=" and  (bj_tcbzgcxm.lrr='"+bj_tcbzgcxm_lrr+"')";
	}
	bj_tcbzgcxm_lrsj=request.getParameter("bj_tcbzgcxm_lrsj");
	if (bj_tcbzgcxm_lrsj!=null)
	{
		bj_tcbzgcxm_lrsj=bj_tcbzgcxm_lrsj.trim();
		if (!(bj_tcbzgcxm_lrsj.equals("")))	wheresql+="  and (bj_tcbzgcxm.lrsj>=TO_DATE('"+bj_tcbzgcxm_lrsj+"','YYYY/MM/DD'))";
	}
	bj_tcbzgcxm_lrsj=request.getParameter("bj_tcbzgcxm_lrsj2");
	if (bj_tcbzgcxm_lrsj!=null)
	{
		bj_tcbzgcxm_lrsj=bj_tcbzgcxm_lrsj.trim();
		if (!(bj_tcbzgcxm_lrsj.equals("")))	wheresql+="  and (bj_tcbzgcxm.lrsj<=TO_DATE('"+bj_tcbzgcxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT bj_tcbzgcxm.bjbbh,bj_tcbzgcxm.dqbm,dm_dqbm.dqmc,bj_tcbzgcxm.bjjbbm,bjjbmc,bj_tcbzgcxm.hxbm,hxmc,bj_tcbzgcxm.xmbh,bj_jzbjb.xmmc,bj_tcbzgcxm.bzsl, DECODE(bj_tcbzgcxm.sfxzsl,'1','可增项','2','不可增项','3','不控制') sfxzsl,bj_tcbzgcxm.ccbfjj,bj_tcbzgcxm.lrr,bj_tcbzgcxm.lrsj  ";
	ls_sql+=" FROM bj_tcbzgcxm,dm_dqbm,bdm_bjjbbm,bj_jzbjb,dm_hxbm  ";
    ls_sql+=" where bj_tcbzgcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcbzgcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tcbzgcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and bj_tcbzgcxm.bjbbh=bj_jzbjb.bjbbh(+) and bj_tcbzgcxm.dqbm=bj_jzbjb.dqbm(+) and bj_tcbzgcxm.bjjbbm=bj_jzbjb.bjjbbm(+) and bj_tcbzgcxm.xmbh=bj_jzbjb.xmbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tcbzgcxm.dqbm,bj_tcbzgcxm.bjbbh,bj_tcbzgcxm.bjjbbm,bj_tcbzgcxm.hxbm,bj_tcbzgcxm.xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_tcbzgcxmList.jsp","","","EditBj_tcbzgcxm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"bjbbh","dqmc","bjjbmc","hxmc","xmbh","xmmc","sfxzsl","bzsl","ccbfjj","lrr","lrsj"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"bjbbh","dqbm","bjjbbm","hxbm","xmbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Bj_tcbzgcxmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from bj_tcbzgcxm where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">套餐标准工程项目－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="8%">报价版本号</td>
	<td  width="8%">地区</td>
	<td  width="8%">报价级别</td>
	<td  width="8%">户型</td>
	<td  width="9%">项目编号</td>
	<td  width="21%">项目名称</td>
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