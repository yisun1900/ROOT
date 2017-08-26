<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String zwbm=(String)session.getAttribute("zwbm");
String yhdlm=(String)session.getAttribute("yhdlm");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String bj_zdyxmb_dqbm=null;
	String bj_zdyxmb_xmbh=null;
	String bj_zdyxmb_xmmc=null;
	String[] bj_zdyxmb_xmdlbm=null;
	String[] bj_zdyxmb_xmxlbm=null;
	String bj_zdyxmb_smbm=null;
	String bj_zdyxmb_jldwbm=null;

	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_zdyxmb.bjjbbm='"+bjjbbm+"')";
	}


	String shbz=null;
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		if (!(shbz.equals("")))	wheresql+=" and  (bj_zdyxmb.shbz='"+shbz+"')";
	}
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		if (!(lrr.equals("")))	wheresql+=" and  (bj_zdyxmb.lrr='"+lrr+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (bj_zdyxmb.lrsj=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}

	String gycl=null;
	gycl=request.getParameter("gycl");
	if (gycl!=null)
	{
		gycl=cf.GB2Uni(gycl);
		if (!(gycl.equals("")))	wheresql+=" and  (bj_zdyxmb.gycl like '%"+gycl+"%')";
	}
	
	bj_zdyxmb_dqbm=request.getParameter("bj_zdyxmb_dqbm");
	if (!(bj_zdyxmb_dqbm.equals("")))	wheresql+=" and  (bj_zdyxmb.dqbm='"+bj_zdyxmb_dqbm+"')";

	bj_zdyxmb_xmbh=request.getParameter("bj_zdyxmb_xmbh");
	if (bj_zdyxmb_xmbh!=null)
	{
		bj_zdyxmb_xmbh=cf.GB2Uni(bj_zdyxmb_xmbh);
		if (!(bj_zdyxmb_xmbh.equals("")))	wheresql+=" and  (bj_zdyxmb.xmbh='"+bj_zdyxmb_xmbh+"')";
	}
	bj_zdyxmb_xmmc=request.getParameter("bj_zdyxmb_xmmc");
	if (bj_zdyxmb_xmmc!=null)
	{
		bj_zdyxmb_xmmc=cf.GB2Uni(bj_zdyxmb_xmmc);
		if (!(bj_zdyxmb_xmmc.equals("")))	wheresql+=" and  (bj_zdyxmb.xmmc like '%"+bj_zdyxmb_xmmc+"%')";
	}
	bj_zdyxmb_xmdlbm=request.getParameterValues("bj_zdyxmb_xmdlbm");
	if (bj_zdyxmb_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_zdyxmb_xmdlbm,"bj_zdyxmb.xmdlbm");
	}
	bj_zdyxmb_xmxlbm=request.getParameterValues("bj_zdyxmb_xmxlbm");
	if (bj_zdyxmb_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_zdyxmb_xmxlbm,"bj_zdyxmb.xmxlbm");
	}
	bj_zdyxmb_smbm=request.getParameter("bj_zdyxmb_smbm");
	if (bj_zdyxmb_smbm!=null)
	{
		bj_zdyxmb_smbm=cf.GB2Uni(bj_zdyxmb_smbm);
		if (!(bj_zdyxmb_smbm.equals("")))	wheresql+=" and  (bj_zdyxmb.smbm='"+bj_zdyxmb_smbm+"')";
	}
	bj_zdyxmb_jldwbm=request.getParameter("bj_zdyxmb_jldwbm");
	if (bj_zdyxmb_jldwbm!=null)
	{
		bj_zdyxmb_jldwbm=cf.GB2Uni(bj_zdyxmb_jldwbm);
		if (!(bj_zdyxmb_jldwbm.equals("")))	wheresql+=" and  (bj_zdyxmb.jldwbm='"+bj_zdyxmb_jldwbm+"')";
	}

	ls_sql="SELECT bj_zdyxmb.dqbm,dqmc,xmdlmc,xmxlmc,xmflmc,bj_zdyxmb.zdyxmyxq,bj_zdyxmb.xmbh,bj_zdyxmb.bjjbbm,bjjbmc,bj_zdyxmb.xmmc,smmc,jdm_jldwbm.jldwmc,bj_zdyxmb.bj,bj_zdyxmb.clbj,bj_zdyxmb.zcf,bj_zdyxmb.rgbj,bj_zdyxmb.ysf,bj_zdyxmb.jxbj,bj_zdyxmb.shf,bj_zdyxmb.qtf,lrr,lrsj,DECODE(bj_zdyxmb.shbz,'N','申请审核','S','受理申请','Y',' 审核通过','W','审核未通过','C','重新申请') shbz,gycl,flmcgg,bz,DECODE(bj_zdyxmb.sfxycl,'Y','需要','N','否') sfxycl,DECODE(bj_zdyxmb.sfxyyjd,'Y','需要','N','否') sfxyyjd";
	ls_sql+=" FROM bj_zdyxmb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm,bdm_bjjbbm,bdm_xmflbm   ";
	ls_sql+=" where bj_zdyxmb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_zdyxmb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_zdyxmb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_zdyxmb.smbm=bdm_smbm.smbm(+) and bj_zdyxmb.dqbm=dm_dqbm.dqbm(+) and bj_zdyxmb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_zdyxmb.xmflbm=bdm_xmflbm.xmflbm(+)"; 	
	ls_sql+=" and bj_zdyxmb.shbz in('N','W','C')";
	ls_sql+=wheresql;
	ls_sql+=" order by bj_zdyxmb.lrsj desc";

    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("Bj_zdyxmbList.jsp","","","EditBj_zdyxmbMain.jsp?lrr="+lrr);
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"shbz","dqmc","bjjbmc","xmbh","xmmc","jldwmc","bj","clbj","zcf","rgbj","ysf","jxbj","shf","qtf","zdyxmyxq","gycl","flmcgg","xmdlmc","xmxlmc","xmflmc","smmc","lrr","lrsj","sfxycl","sfxyyjd"};
	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"xmbh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Bj_zdyxmbList.jsp?lrr="+lrr};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String lrr=request.getParameter("lrr");
	String[] xmbh = request.getParameterValues("xmbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xmbh,"xmbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[3];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from bj_jzglfxb where lrr='"+lrr+"' and ("+chooseitem+")";
		sql[1]="delete from bj_zdyshjl  where zdyxmlrr='"+lrr+"' and ("+chooseitem+")";
		sql[2]="delete from bj_zdyxmb  where lrr='"+lrr+"' and ("+chooseitem+")";
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
  <B><font size="3">自定义项目维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">审核标志</td>
	<td  width="3%">地区</td>
	<td  width="3%">报价级别</td>
	<td  width="3%">项目编号</td>
	<td  width="8%">项目名称</td>
	<td  width="3%">计量单位</td>
	<td  width="3%">工程预算价</td>
	<td  width="3%">辅材费</td>
	<td  width="3%">主材费</td>
	<td  width="3%">人工费</td>
	<td  width="3%">运输费</td>
	<td  width="3%">机械费</td>
	<td  width="3%">损耗费</td>
	<td  width="3%">其它费</td>
	<td  width="3%">自定义项目有效期</td>
	<td  width="13%">工艺材料简介</td>
	<td  width="9%">辅料名称规格</td>
	<td  width="3%">项目大类</td>
	<td  width="4%">项目小类</td>
	<td  width="4%">项目分类</td>
	<td  width="3%">饰面</td>
	<td  width="4%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="2%">是否需要材料</td>
	<td  width="2%">是否需预交底</td>
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