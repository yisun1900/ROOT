<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//电子报价中级名称
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//电子报价中高级名称
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//电子报价高级名称

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String bj_gzbjb_dqbm=null;
	String bj_gzbjb_xmbh=null;
	String bj_gzbjb_xmmc=null;
	String[] bj_gzbjb_xmdlbm=null;
	String[] bj_gzbjb_xmxlbm=null;
	String bj_gzbjb_smbm=null;
	String bj_gzbjb_jldwbm=null;


	String bjlx=null;
	bjlx=request.getParameter("bjlx");
	if (!(bjlx.equals("")))	wheresql+=" and  (bj_gzbjb.bjlx='"+bjlx+"')";

	String shbz=null;
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		if (!(shbz.equals("")))	wheresql+=" and  (bj_gzbjb.shbz='"+shbz+"')";
	}
	
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		if (!(lrr.equals("")))	wheresql+=" and  (bj_gzbjb.lrr='"+lrr+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj>=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}

	String gycl=null;
	gycl=request.getParameter("gycl");
	if (gycl!=null)
	{
		gycl=cf.GB2Uni(gycl);
		if (!(gycl.equals("")))	wheresql+=" and  (bj_gzbjb.gycl like '%"+gycl+"%')";
	}
	String bgycl=null;
	bgycl=request.getParameter("bgycl");
	if (bgycl!=null)
	{
		bgycl=cf.GB2Uni(bgycl);
		if (!(bgycl.equals("")))	wheresql+=" and  (bj_gzbjb.bgycl like '%"+bgycl+"%')";
	}
	String cgycl=null;
	cgycl=request.getParameter("cgycl");
	if (cgycl!=null)
	{
		cgycl=cf.GB2Uni(cgycl);
		if (!(cgycl.equals("")))	wheresql+=" and  (bj_gzbjb.cgycl like '%"+cgycl+"%')";
	}
	
	
	bj_gzbjb_dqbm=request.getParameter("bj_gzbjb_dqbm");
	if (bj_gzbjb_dqbm!=null)
	{
		bj_gzbjb_dqbm=cf.GB2Uni(bj_gzbjb_dqbm);
		if (!(bj_gzbjb_dqbm.equals("")))	wheresql+=" and  (bj_gzbjb.dqbm='"+bj_gzbjb_dqbm+"')";
	}
	bj_gzbjb_xmbh=request.getParameter("bj_gzbjb_xmbh");
	if (bj_gzbjb_xmbh!=null)
	{
		bj_gzbjb_xmbh=cf.GB2Uni(bj_gzbjb_xmbh);
		if (!(bj_gzbjb_xmbh.equals("")))	wheresql+=" and  (bj_gzbjb.xmbh='"+bj_gzbjb_xmbh+"')";
	}
	bj_gzbjb_xmmc=request.getParameter("bj_gzbjb_xmmc");
	if (bj_gzbjb_xmmc!=null)
	{
		bj_gzbjb_xmmc=cf.GB2Uni(bj_gzbjb_xmmc);
		if (!(bj_gzbjb_xmmc.equals("")))	wheresql+=" and  (bj_gzbjb.xmmc like '%"+bj_gzbjb_xmmc+"%')";
	}
	bj_gzbjb_xmdlbm=request.getParameterValues("bj_gzbjb_xmdlbm");
	if (bj_gzbjb_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_gzbjb_xmdlbm,"bj_gzbjb.xmdlbm");
	}
	bj_gzbjb_xmxlbm=request.getParameterValues("bj_gzbjb_xmxlbm");
	if (bj_gzbjb_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_gzbjb_xmxlbm,"bj_gzbjb.xmxlbm");
	}
	bj_gzbjb_smbm=request.getParameter("bj_gzbjb_smbm");
	if (bj_gzbjb_smbm!=null)
	{
		bj_gzbjb_smbm=cf.GB2Uni(bj_gzbjb_smbm);
		if (!(bj_gzbjb_smbm.equals("")))	wheresql+=" and  (bj_gzbjb.smbm='"+bj_gzbjb_smbm+"')";
	}
	bj_gzbjb_jldwbm=request.getParameter("bj_gzbjb_jldwbm");
	if (bj_gzbjb_jldwbm!=null)
	{
		bj_gzbjb_jldwbm=cf.GB2Uni(bj_gzbjb_jldwbm);
		if (!(bj_gzbjb_jldwbm.equals("")))	wheresql+=" and  (bj_gzbjb.jldwbm='"+bj_gzbjb_jldwbm+"')";
	}

	ls_sql="SELECT bj_gzbjb.dqbm as dqbm,dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,cbenj,sgdbj,bj_gzbjb.bj as bj_gzbjb_bj,bj_gzbjb.bbj as bj_gzbjb_bbj,bj_gzbjb.cbj as bj_gzbjb_cbj,DECODE(bjlx,'1','标准','2','自定义') bjlx,lrr,lrsj,DECODE(shbz,'N','未审核','Y','已审核') shbz,gycl,bgycl,cgycl";
	ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
    ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
    ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=wheresql;
    ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_gzbjbLrList.jsp","SelectLrBj_gzbjb.jsp","InsertBj_gzglfxb.jsp","EditBj_gzglfxb.jsp");
	pageObj.setPageRow(100);//设置每页显示记录数
//设置显示列
	String[] disColName={"dqmc","xmdlmc","xmxlmc","xmbh","bj_gzbjb_xmmc","smmc","cbenj","sgdbj","bj_gzbjb_bj","bj_gzbjb_bbj","bj_gzbjb_cbj","bjlx","jdm_jldwbm_jldwmc","lrr","lrsj","shbz","gycl","bgycl","cgycl"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xmbh","dqbm"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("录入");
	pageObj.setEditStr("维护");

//	pageObj.alignStr[11]="align='left'";
//设置显示合并列

	pageObj.alignStr[16]="align='left'";
	pageObj.alignStr[17]="align='left'";
	pageObj.alignStr[18]="align='left'";

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
  <B><font size="3">录入工料分析</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(370);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">地区</td>
	<td  width="2%">项目大类</td>
	<td  width="3%">项目小类</td>
	<td  width="3%">项目编号</td>
	<td  width="6%">项目名称</td>
	<td  width="2%">饰面</td>
	<td  width="2%">成本价</td>
	<td  width="2%">施工队报价</td>
	<td  width="2%"><%=dzbjzjmc%>报价</td>
	<td  width="2%"><%=dzbjzgjmc%>报价</td>
	<td  width="2%"><%=dzbjgjmc%>报价</td>
	<td  width="2%">报价类型</td>
	<td  width="2%">工程量计量单位</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="2%">审核标志</td>
	<td  width="15%"><%=dzbjzjmc%>工艺材料简介</td>
	<td  width="14%"><%=dzbjzgjmc%>工艺材料简介</td>
	<td  width="14%"><%=dzbjgjmc%>工艺材料简介</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printPageLinkTr();
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