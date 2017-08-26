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
	
	
	bj_jzbjb_dqbm=request.getParameter("bj_jzbjb_dqbm");
	if (bj_jzbjb_dqbm!=null)
	{
		bj_jzbjb_dqbm=cf.GB2Uni(bj_jzbjb_dqbm);
		if (!(bj_jzbjb_dqbm.equals("")))	wheresql+=" and  (bj_gzbjb.dqbm='"+bj_jzbjb_dqbm+"')";
	}
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

	
	ls_sql="SELECT wybh,bj_gzbjb.dqbm as dqbm,dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,cbenj,sgdbj,bj_gzbjb.bj as bj_gzbjb_bj,clf,bj_gzbjb.bbj as bj_gzbjb_bbj,bclf,bj_gzbjb.cbj as bj_gzbjb_cbj,cclf,DECODE(bjlx,'1','标准','2','自定义') bjlx,lrr,lrsj,DECODE(shbz,'N','未审核','Y','已审核') shbz,gycl,bgycl,cgycl,zcmc,zcgg,zcf,rgf,glfbl,jjf,lrbl,bzcmc,bzcgg,bzcf,brgf,bglfbl,bjjf,blrbl,czcmc,czcgg,czcf,crgf,cglfbl,cjjf,clrbl";
	ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
    ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
    ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=wheresql;
    ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_jzbjbList.jsp","Selectbj_jzbjb.jsp","","EditBj_jzbjb1.jsp");
	pageObj.setPageRow(100);//设置每页显示记录数
//设置显示列
	String[] disColName={"dqmc","xmdlmc","xmxlmc","xh","xmbh","bj_gzbjb_xmmc","smmc","cbenj","sgdbj","bj_gzbjb_bj","zcmc","zcgg","zcf","clf","rgf","jjf","glfbl","lrbl","bj_gzbjb_bbj","bzcmc","bzcgg","bzcf","bclf","brgf","bjjf","bglfbl","blrbl","bj_gzbjb_cbj","czcmc","czcgg","czcf","cclf","crgf","cjjf","cglfbl","clrbl","bjlx","jdm_jldwbm_jldwmc","lrr","lrsj","shbz","gycl","bgycl","cgycl"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"wybh"};
	pageObj.setKey(keyName);

//	pageObj.alignStr[11]="align='left'";
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Bj_jzbjbList1.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("xmdlmc","1");//列参数对象加入Hash表
	spanColHash.put("xmxlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] wybh = request.getParameterValues("wybh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(wybh,"wybh"));

	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from bj_gzbjb where "+chooseitem;
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(500);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="1%">地区</td>
	<td  width="2%">项目大类</td>
	<td  width="2%">项目小类</td>
	<td  width="1%">序号</td>
	<td  width="2%">项目编号</td>
	<td  width="3%">项目名称</td>
	<td  width="2%">饰面</td>
	<td  width="2%">成本价</td>
	<td  width="2%">施工队报价</td>
	<td  width="2%"><%=dzbjzjmc%>报价</td>
	<td  width="3%"><%=dzbjzjmc%>主材名称</td>
	<td  width="3%"><%=dzbjzjmc%>主材规格</td>
	<td  width="2%"><%=dzbjzjmc%>主材费</td>
	<td  width="2%"><%=dzbjzjmc%>材料费</td>
	<td  width="2%"><%=dzbjzjmc%>人工费</td>
	<td  width="2%"><%=dzbjzjmc%>机械费</td>
	
	<td  width="2%"><%=dzbjzjmc%>管理费百分比</td>
	<td  width="2%"><%=dzbjzjmc%>利润百分比</td>
	<td  width="2%"><%=dzbjzgjmc%>报价</td>
	<td  width="3%"><%=dzbjzgjmc%>主材名称</td>
	<td  width="3%"><%=dzbjzgjmc%>主材规格</td>
	<td  width="2%"><%=dzbjzgjmc%>主材费</td>
	<td  width="2%"><%=dzbjzgjmc%>人工费</td>
	<td  width="2%"><%=dzbjzgjmc%>机械费</td>
	<td  width="2%"><%=dzbjzgjmc%>材料费</td>
	<td  width="2%"><%=dzbjzgjmc%>管理费百分比</td>
	<td  width="2%"><%=dzbjzgjmc%>利润百分比</td>
	<td  width="2%"><%=dzbjgjmc%>报价</td>
	<td  width="3%"><%=dzbjgjmc%>主材名称</td>
	<td  width="3%"><%=dzbjgjmc%>主材规格</td>
	<td  width="2%"><%=dzbjgjmc%>主材费</td>
	<td  width="2%"><%=dzbjgjmc%>材料费</td>
	<td  width="2%"><%=dzbjgjmc%>人工费</td>
	<td  width="2%"><%=dzbjgjmc%>机械费</td>
	<td  width="2%"><%=dzbjgjmc%>管理费百分比</td>
	<td  width="2%"><%=dzbjgjmc%>利润百分比</td>
	<td  width="2%">报价类型</td>
	<td  width="2%">工程量计量单位</td>
	<td  width="2%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="2%">审核标志</td>
	<td  width="4%"><%=dzbjzjmc%>工艺材料简介</td>
	<td  width="4%"><%=dzbjzgjmc%>工艺材料简介</td>
	<td  width="4%"><%=dzbjgjmc%>工艺材料简介</td>
</tr>
<%
	pageObj.displayDate();
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