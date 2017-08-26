<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String kkbbz=(String)session.getAttribute("kkbbz");
String zwbm=(String)session.getAttribute("zwbm");
String yhdlm=(String)session.getAttribute("yhdlm");

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

	String sfbxx=null;
	sfbxx=request.getParameter("sfbxx");
	if (sfbxx!=null)
	{
		if (!(sfbxx.equals("")))	wheresql+=" and  (bj_gzbjb.sfbxx='"+sfbxx+"')";
	}

	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_gzbjb.bjjbbm='"+bjjbbm+"')";
	}
	
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

	ls_sql="SELECT bj_gzbjb.xmbh,bj_gzbjb.xmmc,DECODE(bj_gzbjb.sfbxx,'1','<font color=\"#FF0000\">必选</font>','2','非必选','3','<font color=\"#0000FF\">不可选</font>') sfbxx,xmdlmc,xmxlmc,dqmc,DECODE(sfxycl,'1','需要','2','不需要') sfxycl,jdm_jldwbm.jldwmc,smmc,DECODE(bjlx,'1','标准','2','自定义') bjlx,bjjbmc,bj_gzbjb.bj,zcmc,zcgg,zcf,clf,rgf,jjf,glfbl||'%',gycl,lrr,lrsj,DECODE(shbz,'N','未审核','Y','已审核') shbz,bj_gzbjb.xh";
	ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm,bdm_bjjbbm  ";
	ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_gzbjb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
	if (zwbm.equals("04"))//家装设计师
	{
		ls_sql+=" and bj_gzbjb.bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"')";
	}
	ls_sql+=wheresql;
	ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh,bj_gzbjb.bjjbbm";
	
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_gzbjbCxList.jsp","SelectCxBj_gzbjb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
//	String[] disColName={"dqmc","xmdlmc","xmxlmc","xh","xmbh","bj_jzbjb_xmmc","smmc","jdm_jldwbm_jldwmc","bj_jzbjb_bj","bj_jzbjb_bbj","bj_jzbjb_cbj","bjlx","lrr","lrsj","shbz","gycl","bgycl","cgycl"};
//	pageObj.setDisColName(disColName);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("xmbh","1");//列参数对象加入Hash表
	spanColHash.put("xmmc","1");//列参数对象加入Hash表
	spanColHash.put("sfbxx","1");//列参数对象加入Hash表
	spanColHash.put("xmdlmc","1");//列参数对象加入Hash表
	spanColHash.put("xmxlmc","1");//列参数对象加入Hash表
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("sfxycl","1");//列参数对象加入Hash表
	spanColHash.put("jldwmc","1");//列参数对象加入Hash表
	spanColHash.put("smmc","1");//列参数对象加入Hash表
	spanColHash.put("bjlx","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
	pageObj.alignStr[18]="align='left'";
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);

%>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">项目编号</td>
	<td  width="7%">项目名称</td>
	<td  width="3%">是否必选项</td>
	<td  width="4%">项目大类</td>
	<td  width="4%">项目小类</td>
	<td  width="3%">地区</td>
	<td  width="2%">是否需要主材</td>
	<td  width="2%">计量单位</td>
	<td  width="4%">饰面</td>
	<td  width="2%">报价类型</td>
	<td  width="3%">报价级别</td>

	<td  width="3%">客户报价</td>
	<td  width="7%">主材名称</td>
	<td  width="7%">主材规格</td>
	<td  width="3%">主材费</td>
	<td  width="3%">辅材费</td>
	<td  width="3%">人工费</td>
	<td  width="3%">机械费</td>
	<td  width="2%">管理费百分比</td>
	<td  width="22%">工艺材料简介</td>

	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="2%">审核标志</td>
	<td  width="2%">序号</td>
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