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
	String bj_gzbjb_xmbh=null;
	String bj_gzbjb_xmmc=null;
	String[] bj_gzbjb_xmdlbm=null;
	String[] bj_gzbjb_xmxlbm=null;
	String bj_gzbjb_smbm=null;
	String bj_gzbjb_jldwbm=null;

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

	String bj_gzbjb_dqbm=null;
	bj_gzbjb_dqbm=request.getParameter("bj_gzbjb_dqbm");
	if (!(bj_gzbjb_dqbm.equals("")))	wheresql+=" and  (bj_gzbjb.dqbm='"+bj_gzbjb_dqbm+"')";

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
	ls_sql="SELECT bj_gzbjb.dqbm,xmdlmc,xmxlmc ,bj_gzbjb.xh,bj_gzbjb.xmbh,DECODE(bj_gzbjb.sfbxx,'1','<font color=\"#FF0000\">必选</font>','2','非必选','3','<font color=\"#0000FF\">不可选</font>') sfbxx,bj_gzbjb.bjjbbm,bjjbmc,bj_gzbjb.xmmc,jdm_jldwbm.jldwmc,smmc,DECODE(sfxycl,'1','需要','2','不需要') sfxycl,cbenj,sgdbj,bj_gzbjb.bj,clf,DECODE(bjlx,'1','标准','2','自定义') bjlx,lrr,lrsj,DECODE(shbz,'N','未审核','Y','已审核') shbz,gycl,zcmc,zcgg,zcf,rgf,glfbl||'%' glfbl,jjf,dqmc";
	ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm,bdm_bjjbbm  ";
    ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_gzbjb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=wheresql;
    ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xmbh,bj_gzbjb.bjjbbm,bj_gzbjb.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_gzbjbList.jsp","SelectBj_gzbjb.jsp","","EditBj_gzbjb.jsp?dqbm="+bj_gzbjb_dqbm);
	pageObj.setPageRow(39);//设置每页显示记录数
//设置显示列
	String[] disColName={"xmbh","xmmc","sfbxx","xmdlmc","xmxlmc","dqmc","sfxycl","jldwmc","smmc","bjlx","bjjbmc","cbenj","sgdbj","bj","zcmc","zcgg","zcf","clf","rgf","jjf","glfbl","gycl","lrr","lrsj","shbz","xh"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xmbh","bjjbbm"};
	pageObj.setKey(keyName);

//	pageObj.alignStr[11]="align='left'";
//设置按钮参数
	String[] buttonName={"批量修改","删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"EnterTjgs.jsp?dqbm="+bj_gzbjb_dqbm,"Bj_gzbjbList.jsp?dqbm="+bj_gzbjb_dqbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1,0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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

//	pageObj.alignStr[16]="align='left'";
//	pageObj.alignStr[25]="align='left'";
//	pageObj.alignStr[34]="align='left'";

}
else//非第一次进入此页，不需要初始化
{
	String dqbm=request.getParameter("dqbm");
	String chooseitem = request.getParameter("chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from bj_gzglfxb where dqbm='"+dqbm+"' and ("+chooseitem+")";
		sql[1]="delete from bj_gzbjb where dqbm='"+dqbm+"' and ("+chooseitem+")";
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

 <div align="center"> <B><font size="3">查询结果</font></B>
</div>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">项目编号</td>
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
	<td  width="3%">成本价</td>
	<td  width="3%">施工队报价</td>

	<td  width="3%">客户报价</td>
	<td  width="7%">主材名称</td>
	<td  width="7%">主材规格</td>
	<td  width="3%">主材费</td>
	<td  width="3%">辅材费</td>
	<td  width="2%">人工费</td>
	<td  width="2%">机械费</td>
	<td  width="2%">管理费百分比</td>
	<td  width="16%">工艺材料简介</td>

	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="2%">审核标志</td>
	<td  width="2%">序号</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printPageLinkTr();
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