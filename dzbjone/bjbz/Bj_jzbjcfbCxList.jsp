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
	String dqbm=null;
	String bjjbbm=null;
	String bj_jzbjcfb_fxmbh=null;
	String bj_jzbjcfb_xmbh=null;
	String bj_jzbjcfb_xmmc=null;
	String bj_jzbjcfb_xmdlbm=null;
	String bj_jzbjcfb_xmxlbm=null;
	String bj_jzbjcfb_smbm=null;
	String bj_jzbjcfb_lrsj=null;

	
	String fxmmc=null;
	fxmmc=request.getParameter("fxmmc");
	if (fxmmc!=null)
	{
		fxmmc=cf.GB2Uni(fxmmc);
		if (!(fxmmc.equals("")))	wheresql+=" and  (bj_jzbjb.fxmmc like '%"+bj_jzbjcfb_xmmc+"%')";
	}
	
	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (dqbm!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (bj_jzbjcfb.bjbbh='"+bjbbh+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.dqbm='"+dqbm+"')";
	}
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.bjjbbm='"+bjjbbm+"')";
	}
	bj_jzbjcfb_fxmbh=request.getParameter("bj_jzbjcfb_fxmbh");
	if (bj_jzbjcfb_fxmbh!=null)
	{
		bj_jzbjcfb_fxmbh=cf.GB2Uni(bj_jzbjcfb_fxmbh);
		if (!(bj_jzbjcfb_fxmbh.equals("")))	wheresql+=" and  (bj_jzbjcfb.fxmbh='"+bj_jzbjcfb_fxmbh+"')";
	}
	bj_jzbjcfb_xmbh=request.getParameter("bj_jzbjcfb_xmbh");
	if (bj_jzbjcfb_xmbh!=null)
	{
		bj_jzbjcfb_xmbh=cf.GB2Uni(bj_jzbjcfb_xmbh);
		if (!(bj_jzbjcfb_xmbh.equals("")))	wheresql+=" and  (bj_jzbjcfb.xmbh='"+bj_jzbjcfb_xmbh+"')";
	}
	bj_jzbjcfb_xmmc=request.getParameter("bj_jzbjcfb_xmmc");
	if (bj_jzbjcfb_xmmc!=null)
	{
		bj_jzbjcfb_xmmc=cf.GB2Uni(bj_jzbjcfb_xmmc);
		if (!(bj_jzbjcfb_xmmc.equals("")))	wheresql+=" and  (bj_jzbjcfb.xmmc like '%"+bj_jzbjcfb_xmmc+"%')";
	}
	bj_jzbjcfb_xmdlbm=request.getParameter("bj_jzbjcfb_xmdlbm");
	if (bj_jzbjcfb_xmdlbm!=null)
	{
		bj_jzbjcfb_xmdlbm=cf.GB2Uni(bj_jzbjcfb_xmdlbm);
		if (!(bj_jzbjcfb_xmdlbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.xmdlbm='"+bj_jzbjcfb_xmdlbm+"')";
	}
	bj_jzbjcfb_xmxlbm=request.getParameter("bj_jzbjcfb_xmxlbm");
	if (bj_jzbjcfb_xmxlbm!=null)
	{
		bj_jzbjcfb_xmxlbm=cf.GB2Uni(bj_jzbjcfb_xmxlbm);
		if (!(bj_jzbjcfb_xmxlbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.xmxlbm='"+bj_jzbjcfb_xmxlbm+"')";
	}
	bj_jzbjcfb_smbm=request.getParameter("bj_jzbjcfb_smbm");
	if (bj_jzbjcfb_smbm!=null)
	{
		bj_jzbjcfb_smbm=cf.GB2Uni(bj_jzbjcfb_smbm);
		if (!(bj_jzbjcfb_smbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.smbm='"+bj_jzbjcfb_smbm+"')";
	}
	bj_jzbjcfb_lrsj=request.getParameter("bj_jzbjcfb_lrsj");
	if (bj_jzbjcfb_lrsj!=null)
	{
		bj_jzbjcfb_lrsj=bj_jzbjcfb_lrsj.trim();
		if (!(bj_jzbjcfb_lrsj.equals("")))	wheresql+="  and (bj_jzbjcfb.lrsj>=TO_DATE('"+bj_jzbjcfb_lrsj+"','YYYY/MM/DD'))";
	}
	bj_jzbjcfb_lrsj=request.getParameter("bj_jzbjcfb_lrsj2");
	if (bj_jzbjcfb_lrsj!=null)
	{
		bj_jzbjcfb_lrsj=bj_jzbjcfb_lrsj.trim();
		if (!(bj_jzbjcfb_lrsj.equals("")))	wheresql+="  and (bj_jzbjcfb.lrsj<=TO_DATE('"+bj_jzbjcfb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT bj_jzbjcfb.bjbbh,dqmc,bjjbmc,bj_jzbjcfb.fxmbh,bj_jzbjb.xmmc fxmmc,bj_jzbjcfb.xmbh,bj_jzbjcfb.xmmc,xmdlmc,xmxlmc,smmc,jldwmc,bj_jzbjcfb.clbj,bj_jzbjcfb.zcf,bj_jzbjcfb.rgbj,bj_jzbjcfb.ysf,bj_jzbjcfb.jxbj,bj_jzbjcfb.shf,bj_jzbjcfb.qtf,bj_jzbjcfb.bj,bj_jzbjcfb.gycl,bj_jzbjcfb.flmcgg,bj_jzbjcfb.lrr,bj_jzbjcfb.lrsj,bj_jzbjcfb.bz  ";
	ls_sql+=" FROM bdm_bjjbbm,bj_jzbjcfb,bj_jzbjb,dm_dqbm,jdm_jldwbm,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm  ";
    ls_sql+=" where bj_jzbjcfb.bjjbbm=bdm_bjjbbm.bjjbbm(+) ";
    ls_sql+=" and bj_jzbjcfb.bjbbh=bj_jzbjb.bjbbh and bj_jzbjcfb.dqbm=bj_jzbjb.dqbm and bj_jzbjcfb.bjjbbm=bj_jzbjb.bjjbbm and bj_jzbjcfb.fxmbh=bj_jzbjb.xmbh";
    ls_sql+=" and bj_jzbjcfb.dqbm=dm_dqbm.dqbm(+) ";
    ls_sql+=" and bj_jzbjcfb.jldwbm=jdm_jldwbm.jldwbm(+) ";
    ls_sql+=" and bj_jzbjcfb.xmdlbm=bdm_xmdlbm.xmdlbm(+) ";
    ls_sql+=" and bj_jzbjcfb.xmxlbm=bdm_xmxlbm.xmxlbm(+) ";
    ls_sql+=" and bj_jzbjcfb.smbm=bdm_smbm.smbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_jzbjcfb.bjbbh,bj_jzbjcfb.dqbm,bj_jzbjcfb.bjjbbm,bj_jzbjcfb.fxmbh,bj_jzbjcfb.xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_jzbjcfbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

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
  <B><font size="3">拆分报价查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">报价版本号</td>
	<td  width="3%">地区</td>
	<td  width="3%">报价级别</td>
	<td  width="4%">父项目编号</td>
	<td  width="7%">父项目名称</td>
	<td  width="4%">项目编号</td>
	<td  width="7%">项目名称</td>
	<td  width="4%">项目大类</td>
	<td  width="4%">项目小类</td>
	<td  width="3%">饰面</td>
	<td  width="2%">计量单位</td>
	<td  width="2%">辅材费</td>
	<td  width="2%">主材费</td>
	<td  width="2%">人工费</td>
	<td  width="2%">运输费</td>
	<td  width="2%">机械费</td>
	<td  width="2%">损耗费</td>
	<td  width="2%">其它费</td>
	<td  width="3%">工程预算价</td>
	<td  width="12%">工艺做法及材料</td>
	<td  width="12%">辅料名称规格</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="18%">备注</td>
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