<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//电子报价中级名称
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//电子报价中高级名称
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//电子报价高级名称

String dybjjb=(String)session.getAttribute("bjjb");
if (dybjjb==null)
{
	dybjjb="";
}

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String bj_jzbjb_dqbm=null;
	String bj_jzbjb_xmbh=null;
	String bj_jzbjb_xmmc=null;
	String[] bj_jzbjb_xmdlbm=null;
	String[] bj_jzbjb_xmxlbm=null;
	String bj_jzbjb_smbm=null;
	String bj_jzbjb_jldwbm=null;



	String bjlx=null;
	bjlx=request.getParameter("bjlx");
	if (bjlx!=null)
	{
		if (!(bjlx.equals("")))	wheresql+=" and  (bj_gzbjb.bjlx='"+bjlx+"')";
	}
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

	
	bj_jzbjb_dqbm=request.getParameter("bj_jzbjb_dqbm");
	if (!(bj_jzbjb_dqbm.equals("")))	wheresql+=" and  (bj_gzbjb.dqbm='"+bj_jzbjb_dqbm+"')";


	bj_jzbjb_xmbh=request.getParameter("bj_jzbjb_xmbh");
	if (bj_jzbjb_xmbh!=null)
	{
		bj_jzbjb_xmbh=cf.GB2Uni(bj_jzbjb_xmbh);
		if (!(bj_jzbjb_xmbh.equals("")))	wheresql+=" and  (bj_gzbjb.xmbh='"+bj_jzbjb_xmbh+"')";
	}
	bj_jzbjb_xmmc=request.getParameter("bj_jzbjb_xmmc");
	if (bj_jzbjb_xmmc!=null)
	{
		bj_jzbjb_xmmc=cf.GB2Uni(bj_jzbjb_xmmc);
		if (!(bj_jzbjb_xmmc.equals("")))	wheresql+=" and  (bj_gzbjb.xmmc like '%"+bj_jzbjb_xmmc+"%')";
	}
	bj_jzbjb_xmdlbm=request.getParameterValues("bj_jzbjb_xmdlbm");
	if (bj_jzbjb_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb_xmdlbm,"bj_gzbjb.xmdlbm");
	}
	bj_jzbjb_xmxlbm=request.getParameterValues("bj_jzbjb_xmxlbm");
	if (bj_jzbjb_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb_xmxlbm,"bj_gzbjb.xmxlbm");
	}
	bj_jzbjb_smbm=request.getParameter("bj_jzbjb_smbm");
	if (bj_jzbjb_smbm!=null)
	{
		bj_jzbjb_smbm=cf.GB2Uni(bj_jzbjb_smbm);
		if (!(bj_jzbjb_smbm.equals("")))	wheresql+=" and  (bj_gzbjb.smbm='"+bj_jzbjb_smbm+"')";
	}
	bj_jzbjb_jldwbm=request.getParameter("bj_jzbjb_jldwbm");
	if (bj_jzbjb_jldwbm!=null)
	{
		bj_jzbjb_jldwbm=cf.GB2Uni(bj_jzbjb_jldwbm);
		if (!(bj_jzbjb_jldwbm.equals("")))	wheresql+=" and  (bj_gzbjb.jldwbm='"+bj_jzbjb_jldwbm+"')";
	}

	if (dybjjb.equals("A"))
	{
		ls_sql="SELECT dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_jzbjb_xmmc,smmc,bj_gzbjb.bj as bj_jzbjb_bj,clf,DECODE(bjlx,'1','标准','2','自定义') bjlx,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,lrr,lrsj,DECODE(shbz,'N','未审核','Y','已审核') shbz,gycl,wybh";
		ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
		ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
	}
	else if (dybjjb.equals("B"))
	{
		ls_sql="SELECT dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_jzbjb_xmmc,smmc,bj_gzbjb.bj as bj_jzbjb_bj,clf,bj_gzbjb.bbj as bj_jzbjb_bbj,bclf,DECODE(bjlx,'1','标准','2','自定义') bjlx,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,lrr,lrsj,DECODE(shbz,'N','未审核','Y','已审核') shbz,gycl,bgycl,wybh";
		ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
		ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
	}
	else if (dybjjb.equals("C"))
	{
		ls_sql="SELECT dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_jzbjb_xmmc,smmc,bj_gzbjb.cbj as bj_jzbjb_cbj,cclf,DECODE(bjlx,'1','标准','2','自定义') bjlx,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,lrr,lrsj,DECODE(shbz,'N','未审核','Y','已审核') shbz,cgycl,wybh";
		ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
		ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
	}
	else if (dybjjb.equals("D"))
	{
		ls_sql="SELECT dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_jzbjb_xmmc,smmc,bj_gzbjb.bj as bj_jzbjb_bj,clf,bj_gzbjb.bbj as bj_jzbjb_bbj,bclf,bj_gzbjb.cbj as bj_jzbjb_cbj,cclf,DECODE(bjlx,'1','标准','2','自定义') bjlx,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,lrr,lrsj,DECODE(shbz,'N','未审核','Y','已审核') shbz,gycl,bgycl,cgycl,wybh";
		ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
		ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
	}
	else if (dybjjb.equals("E"))
	{
		ls_sql="SELECT dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_jzbjb_xmmc,smmc,bj_gzbjb.bbj as bj_jzbjb_bbj,bclf,bj_gzbjb.cbj as bj_jzbjb_cbj,cclf,DECODE(bjlx,'1','标准','2','自定义') bjlx,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,lrr,lrsj,DECODE(shbz,'N','未审核','Y','已审核') shbz,bgycl,cgycl,wybh";
		ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
		ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
	}
	else{
		ls_sql="SELECT dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_jzbjb_xmmc,smmc,bj_gzbjb.bj as bj_jzbjb_bj,clf,bj_gzbjb.bbj as bj_jzbjb_bbj,bclf,bj_gzbjb.cbj as bj_jzbjb_cbj,cclf,DECODE(bjlx,'1','标准','2','自定义') bjlx,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,lrr,lrsj,DECODE(shbz,'N','未审核','Y','已审核') shbz,gycl,bgycl,cgycl";
		ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
		ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
	}
	
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_jzbjbDrList.jsp","SelectDrBj_jzbjb.jsp","","DrBj_jzbjb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"xmbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("导入");


//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("xmdlmc","1");//列参数对象加入Hash表
	spanColHash.put("xmxlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

//	pageObj.alignStr[15]="align='left'";
//	pageObj.alignStr[16]="align='left'";
//	pageObj.alignStr[17]="align='left'";
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<CENTER >
  <B><font size="3">从标准项目导入</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(340);


	if (dybjjb.equals("A"))
	{
		%>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="1%">&nbsp;</td>
			<td  width="2%">地区</td>
			<td  width="3%">项目大类</td>
			<td  width="3%">项目小类</td>
			<td  width="2%">序号</td>
			<td  width="3%">项目编号</td>
			<td  width="5%">项目名称</td>
			<td  width="3%">饰面</td>
			<td  width="2%"><%=dzbjzjmc%>报价</td>
			<td  width="2%"><%=dzbjzjmc%>材料费</td>
			<td  width="2%">报价类型</td>
			<td  width="2%">工程量计量单位</td>
			<td  width="2%">录入人</td>
			<td  width="3%">录入时间</td>
			<td  width="2%">审核标志</td>
			<td  width="22%"><%=dzbjzjmc%>工艺材料简介</td>
			<td  width="2%">编号</td>
		</tr>
		<%
	}
	else if (dybjjb.equals("B"))
	{
		%>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="1%">&nbsp;</td>
			<td  width="2%">地区</td>
			<td  width="3%">项目大类</td>
			<td  width="3%">项目小类</td>
			<td  width="2%">序号</td>
			<td  width="3%">项目编号</td>
			<td  width="5%">项目名称</td>
			<td  width="3%">饰面</td>
			<td  width="2%"><%=dzbjzjmc%>报价</td>
			<td  width="2%"><%=dzbjzjmc%>材料费</td>
			<td  width="2%"><%=dzbjzgjmc%>报价</td>
			<td  width="2%"><%=dzbjzgjmc%>材料用量</td>
			<td  width="2%"><%=dzbjzgjmc%>材料费</td>
			<td  width="2%">报价类型</td>
			<td  width="2%">工程量计量单位</td>
			<td  width="2%">录入人</td>
			<td  width="3%">录入时间</td>
			<td  width="2%">审核标志</td>
			<td  width="21%"><%=dzbjzjmc%>工艺材料简介</td>
			<td  width="21%"><%=dzbjzgjmc%>工艺材料简介</td>
			<td  width="2%">编号</td>
		</tr>
		<%
	}
	else if (dybjjb.equals("C"))
	{
		%>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="1%">&nbsp;</td>
			<td  width="2%">地区</td>
			<td  width="3%">项目大类</td>
			<td  width="3%">项目小类</td>
			<td  width="2%">序号</td>
			<td  width="3%">项目编号</td>
			<td  width="5%">项目名称</td>
			<td  width="3%">饰面</td>
			<td  width="2%"><%=dzbjgjmc%>报价</td>
			<td  width="2%"><%=dzbjgjmc%>材料费</td>
			<td  width="2%">报价类型</td>
			<td  width="2%">工程量计量单位</td>
			<td  width="2%">录入人</td>
			<td  width="3%">录入时间</td>
			<td  width="2%">审核标志</td>
			<td  width="22%"><%=dzbjgjmc%>工艺材料简介</td>
			<td  width="2%">编号</td>
		</tr>
		<%
	}
	else if (dybjjb.equals("D"))
	{
		%>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="2%">&nbsp;</td>
			<td  width="2%">地区</td>
			<td  width="3%">项目大类</td>
			<td  width="3%">项目小类</td>
			<td  width="1%">序号</td>
			<td  width="2%">项目编号</td>
			<td  width="5%">项目名称</td>
			<td  width="3%">饰面</td>
			<td  width="2%"><%=dzbjzjmc%>报价</td>
			<td  width="2%"><%=dzbjzjmc%>材料费</td>
			<td  width="2%"><%=dzbjzgjmc%>报价</td>
			<td  width="2%"><%=dzbjzgjmc%>材料费</td>
			<td  width="2%"><%=dzbjgjmc%>报价</td>
			<td  width="2%"><%=dzbjgjmc%>材料费</td>
			<td  width="2%">报价类型</td>
			<td  width="2%">工程量计量单位</td>
			<td  width="2%">录入人</td>
			<td  width="3%">录入时间</td>
			<td  width="2%">审核标志</td>
			<td  width="16%"><%=dzbjzjmc%>工艺材料简介</td>
			<td  width="16%"><%=dzbjzgjmc%>工艺材料简介</td>
			<td  width="16%"><%=dzbjgjmc%>工艺材料简介</td>
			<td  width="2%">编号</td>
		</tr>
		<%
	}
	else if (dybjjb.equals("E"))
	{
		%>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="1%">&nbsp;</td>
			<td  width="2%">地区</td>
			<td  width="3%">项目大类</td>
			<td  width="3%">项目小类</td>
			<td  width="2%">序号</td>
			<td  width="3%">项目编号</td>
			<td  width="5%">项目名称</td>
			<td  width="3%">饰面</td>
			<td  width="2%"><%=dzbjzgjmc%>报价</td>
			<td  width="2%"><%=dzbjzgjmc%>材料用量</td>
			<td  width="2%"><%=dzbjzgjmc%>材料费</td>
			<td  width="2%"><%=dzbjgjmc%>报价</td>
			<td  width="2%"><%=dzbjgjmc%>材料费</td>
			<td  width="2%">报价类型</td>
			<td  width="2%">工程量计量单位</td>
			<td  width="2%">录入人</td>
			<td  width="3%">录入时间</td>
			<td  width="2%">审核标志</td>
			<td  width="21%"><%=dzbjzgjmc%>工艺材料简介</td>
			<td  width="21%"><%=dzbjgjmc%>工艺材料简介</td>
			<td  width="2%">编号</td>
		</tr>
		<%
	}
	else 
	{
		%>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="1%">&nbsp;</td>
			<td  width="2%">地区</td>
			<td  width="3%">项目大类</td>
			<td  width="3%">项目小类</td>
			<td  width="1%">序号</td>
			<td  width="2%">项目编号</td>
			<td  width="5%">项目名称</td>
			<td  width="3%">饰面</td>
			<td  width="2%"><%=dzbjzjmc%>报价</td>
			<td  width="2%"><%=dzbjzjmc%>材料费</td>
			<td  width="2%"><%=dzbjzgjmc%>报价</td>
			<td  width="2%"><%=dzbjzgjmc%>材料费</td>
			<td  width="2%"><%=dzbjgjmc%>报价</td>
			<td  width="2%"><%=dzbjgjmc%>材料费</td>
			<td  width="2%">报价类型</td>
			<td  width="2%">工程量计量单位</td>
			<td  width="2%">录入人</td>
			<td  width="3%">录入时间</td>
			<td  width="2%">审核标志</td>
			<td  width="16%"><%=dzbjzjmc%>工艺材料简介</td>
			<td  width="16%"><%=dzbjzgjmc%>工艺材料简介</td>
			<td  width="16%"><%=dzbjgjmc%>工艺材料简介</td>
			<td  width="2%">编号</td>
		</tr>
		<%
	}


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

function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}
//-->
</script>
</html>