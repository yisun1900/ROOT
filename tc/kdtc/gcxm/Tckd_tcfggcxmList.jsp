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
	String tckd_tcfggcxm_dqbm=null;
	String tckd_tcfggcxm_bjjbbm=null;
	String tckd_tcfggcxm_xmbh=null;
	String tckd_tcfggcxm_lrr=null;
	String tckd_tcfggcxm_lrsj=null;

	String fgmc=null;
	fgmc=request.getParameter("fgmc");
	if (fgmc!=null)
	{
		fgmc=cf.GB2Uni(fgmc);
		if (!(fgmc.equals("")))	wheresql+=" and  (tckd_tcfggcxm.fgmc='"+fgmc+"')";
	}

	String hxbm=null;
	hxbm=request.getParameter("hxbm");
	if (hxbm!=null)
	{
		hxbm=cf.GB2Uni(hxbm);
		if (!(hxbm.equals("")))	wheresql+=" and  (tckd_tcfggcxm.hxbm='"+hxbm+"')";
	}

	String xmmc=null;
	xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc like '%"+xmmc+"%')";
	}
	
	tckd_tcfggcxm_dqbm=request.getParameter("tckd_tcfggcxm_dqbm");
	if (tckd_tcfggcxm_dqbm!=null)
	{
		tckd_tcfggcxm_dqbm=cf.GB2Uni(tckd_tcfggcxm_dqbm);
		if (!(tckd_tcfggcxm_dqbm.equals("")))	wheresql+=" and  (tckd_tcfggcxm.dqbm='"+tckd_tcfggcxm_dqbm+"')";
	}
	tckd_tcfggcxm_bjjbbm=request.getParameter("tckd_tcfggcxm_bjjbbm");
	if (tckd_tcfggcxm_bjjbbm!=null)
	{
		tckd_tcfggcxm_bjjbbm=cf.GB2Uni(tckd_tcfggcxm_bjjbbm);
		if (!(tckd_tcfggcxm_bjjbbm.equals("")))	wheresql+=" and  (tckd_tcfggcxm.bjjbbm='"+tckd_tcfggcxm_bjjbbm+"')";
	}
	tckd_tcfggcxm_xmbh=request.getParameter("tckd_tcfggcxm_xmbh");
	if (tckd_tcfggcxm_xmbh!=null)
	{
		tckd_tcfggcxm_xmbh=cf.GB2Uni(tckd_tcfggcxm_xmbh);
		if (!(tckd_tcfggcxm_xmbh.equals("")))	wheresql+=" and  (tckd_tcfggcxm.xmbh='"+tckd_tcfggcxm_xmbh+"')";
	}
	tckd_tcfggcxm_lrr=request.getParameter("tckd_tcfggcxm_lrr");
	if (tckd_tcfggcxm_lrr!=null)
	{
		tckd_tcfggcxm_lrr=cf.GB2Uni(tckd_tcfggcxm_lrr);
		if (!(tckd_tcfggcxm_lrr.equals("")))	wheresql+=" and  (tckd_tcfggcxm.lrr='"+tckd_tcfggcxm_lrr+"')";
	}
	tckd_tcfggcxm_lrsj=request.getParameter("tckd_tcfggcxm_lrsj");
	if (tckd_tcfggcxm_lrsj!=null)
	{
		tckd_tcfggcxm_lrsj=tckd_tcfggcxm_lrsj.trim();
		if (!(tckd_tcfggcxm_lrsj.equals("")))	wheresql+="  and (tckd_tcfggcxm.lrsj>=TO_DATE('"+tckd_tcfggcxm_lrsj+"','YYYY/MM/DD'))";
	}
	tckd_tcfggcxm_lrsj=request.getParameter("tckd_tcfggcxm_lrsj2");
	if (tckd_tcfggcxm_lrsj!=null)
	{
		tckd_tcfggcxm_lrsj=tckd_tcfggcxm_lrsj.trim();
		if (!(tckd_tcfggcxm_lrsj.equals("")))	wheresql+="  and (tckd_tcfggcxm.lrsj<=TO_DATE('"+tckd_tcfggcxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tckd_tcfggcxm.dqbm,dm_dqbm.dqmc,tckd_tcfggcxm.bjjbbm,bjjbmc,fgmc,tckd_tcfggcxm.hxbm,hxmc,jgwzbm,tckd_tcfggcxm.xmbh,tckd_tcfggcxm.bzsl,tckd_tcfggcxm.lrr,tckd_tcfggcxm.lrsj  ";
	ls_sql+=" FROM tckd_tcfggcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm  ";
    ls_sql+=" where tckd_tcfggcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckd_tcfggcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckd_tcfggcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckd_tcfggcxm.dqbm,tckd_tcfggcxm.bjjbbm,fgmc,tckd_tcfggcxm.hxbm,jgwzbm,tckd_tcfggcxm.xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tckd_tcfggcxmList.jsp","","","EditTckd_tcfggcxm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","bjjbmc","fgmc","hxmc","jgwzbm","xmbh","bzsl","lrr","lrsj"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"dqbm","bjjbbm","fgmc","hxbm","jgwzbm","xmbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tckd_tcfggcxmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
		sql[0]="delete from tckd_tcfggcxm where "+chooseitem;
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
	<td  width="7%">地区</td>
	<td  width="9%">报价级别</td>
	<td  width="9%">风格名称</td>
	<td  width="8%">户型</td>
	<td  width="8%">结构位置</td>
	<td  width="10%">项目编号</td>
	<td  width="6%">标准数量</td>
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