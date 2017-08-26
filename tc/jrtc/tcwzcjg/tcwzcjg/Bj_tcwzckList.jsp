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
	String bj_tcwzck_dqbm=null;
	String bj_tcwzck_cpbm=null;
	String bj_tcwzck_cldlbm=null;
	String bj_tcwzck_clxlbm=null;
	String bj_tcwzck_cpmc=null;
	String ppmc=null;
	String bj_tcwzck_xh=null;
	String bj_tcwzck_xh2=null;
	String bj_tcwzck_gg=null;
	String bj_tcwzck_jldw=null;
	String bj_tcwzck_lrr=null;
	String bj_tcwzck_lrsj=null;

	String jsfs=null;
	jsfs=request.getParameter("jsfs");
	if (jsfs!=null)
	{
		jsfs=cf.GB2Uni(jsfs);
		if (!(jsfs.equals("")))	wheresql+=" and  (bj_tcwzck.jsfs='"+jsfs+"')";
	}

	String jjfs=null;
	jjfs=request.getParameter("jjfs");
	if (jjfs!=null)
	{
		jjfs=cf.GB2Uni(jjfs);
		if (!(jjfs.equals("")))	wheresql+=" and  (bj_tcwzck.jjfs='"+jjfs+"')";
	}

	String sfkgdj=null;
	sfkgdj=request.getParameter("sfkgdj");
	if (sfkgdj!=null)
	{
		sfkgdj=cf.GB2Uni(sfkgdj);
		if (!(sfkgdj.equals("")))	wheresql+=" and  (bj_tcwzck.sfkgdj='"+sfkgdj+"')";
	}

	String sfxclxs=null;
	sfxclxs=request.getParameter("sfxclxs");
	if (sfxclxs!=null)
	{
		sfxclxs=cf.GB2Uni(sfxclxs);
		if (!(sfxclxs.equals("")))	wheresql+=" and  (bj_tcwzck.sfxclxs='"+sfxclxs+"')";
	}

	String gysmc=null;
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (bj_tcwzck.gysmc='"+gysmc+"')";
	}
	
	
	bj_tcwzck_dqbm=request.getParameter("bj_tcwzck_dqbm");
	if (bj_tcwzck_dqbm!=null)
	{
		bj_tcwzck_dqbm=cf.GB2Uni(bj_tcwzck_dqbm);
		if (!(bj_tcwzck_dqbm.equals("")))	wheresql+=" and  (bj_tcwzck.dqbm='"+bj_tcwzck_dqbm+"')";
	}
	bj_tcwzck_cpbm=request.getParameter("bj_tcwzck_cpbm");
	if (bj_tcwzck_cpbm!=null)
	{
		bj_tcwzck_cpbm=cf.GB2Uni(bj_tcwzck_cpbm);
		if (!(bj_tcwzck_cpbm.equals("")))	wheresql+=" and  (bj_tcwzck.cpbm='"+bj_tcwzck_cpbm+"')";
	}
	bj_tcwzck_cldlbm=request.getParameter("bj_tcwzck_cldlbm");
	if (bj_tcwzck_cldlbm!=null)
	{
		bj_tcwzck_cldlbm=cf.GB2Uni(bj_tcwzck_cldlbm);
		if (!(bj_tcwzck_cldlbm.equals("")))	wheresql+=" and  (bj_tcwzck.tccpdlbm='"+bj_tcwzck_cldlbm+"')";
	}
	bj_tcwzck_clxlbm=request.getParameter("bj_tcwzck_clxlbm");
	if (bj_tcwzck_clxlbm!=null)
	{
		bj_tcwzck_clxlbm=cf.GB2Uni(bj_tcwzck_clxlbm);
		if (!(bj_tcwzck_clxlbm.equals("")))	wheresql+=" and  (bj_tcwzck.tccplbbm='"+bj_tcwzck_clxlbm+"')";
	}
	bj_tcwzck_cpmc=request.getParameter("bj_tcwzck_cpmc");
	if (bj_tcwzck_cpmc!=null)
	{
		bj_tcwzck_cpmc=cf.GB2Uni(bj_tcwzck_cpmc);
		if (!(bj_tcwzck_cpmc.equals("")))	wheresql+=" and  (bj_tcwzck.cpmc like '%"+bj_tcwzck_cpmc+"%')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (bj_tcwzck.ppmc='"+ppmc+"')";
	}
	bj_tcwzck_xh=request.getParameter("bj_tcwzck_xh");
	if (bj_tcwzck_xh!=null)
	{
		bj_tcwzck_xh=cf.GB2Uni(bj_tcwzck_xh);
		if (!(bj_tcwzck_xh.equals("")))	wheresql+=" and  (bj_tcwzck.xh='"+bj_tcwzck_xh+"')";
	}
	
	bj_tcwzck_xh2=request.getParameter("bj_tcwzck_xh2");
	if (bj_tcwzck_xh2!=null)
	{
		bj_tcwzck_xh2=cf.GB2Uni(bj_tcwzck_xh2);
		if (!(bj_tcwzck_xh2.equals("")))	wheresql+=" and  (bj_tcwzck.xh like '%"+bj_tcwzck_xh2+"%')";
	}
	bj_tcwzck_gg=request.getParameter("bj_tcwzck_gg");
	if (bj_tcwzck_gg!=null)
	{
		bj_tcwzck_gg=cf.GB2Uni(bj_tcwzck_gg);
		if (!(bj_tcwzck_gg.equals("")))	wheresql+=" and  (bj_tcwzck.gg='"+bj_tcwzck_gg+"')";
	}
	bj_tcwzck_jldw=request.getParameter("bj_tcwzck_jldw");
	if (bj_tcwzck_jldw!=null)
	{
		bj_tcwzck_jldw=cf.GB2Uni(bj_tcwzck_jldw);
		if (!(bj_tcwzck_jldw.equals("")))	wheresql+=" and  (bj_tcwzck.jldw='"+bj_tcwzck_jldw+"')";
	}
	bj_tcwzck_lrr=request.getParameter("bj_tcwzck_lrr");
	if (bj_tcwzck_lrr!=null)
	{
		bj_tcwzck_lrr=cf.GB2Uni(bj_tcwzck_lrr);
		if (!(bj_tcwzck_lrr.equals("")))	wheresql+=" and  (bj_tcwzck.lrr='"+bj_tcwzck_lrr+"')";
	}

	bj_tcwzck_lrsj=request.getParameter("bj_tcwzck_lrsj");
	if (bj_tcwzck_lrsj!=null)
	{
		bj_tcwzck_lrsj=bj_tcwzck_lrsj.trim();
		if (!(bj_tcwzck_lrsj.equals("")))	wheresql+="  and (bj_tcwzck.lrsj>=TO_DATE('"+bj_tcwzck_lrsj+"','YYYY/MM/DD'))";
	}
	bj_tcwzck_lrsj=request.getParameter("bj_tcwzck_lrsj2");
	if (bj_tcwzck_lrsj!=null)
	{
		bj_tcwzck_lrsj=bj_tcwzck_lrsj.trim();
		if (!(bj_tcwzck_lrsj.equals("")))	wheresql+="  and (bj_tcwzck.lrsj<=TO_DATE('"+bj_tcwzck_lrsj+"','YYYY/MM/DD'))";
	}

	String sfyx=null;
	sfyx=request.getParameter("sfyx");
	if (sfyx!=null)
	{
		sfyx=cf.GB2Uni(sfyx);
		if (!(sfyx.equals("")))	wheresql+=" and  (bj_tcwzck.sfyx='"+sfyx+"')";
	}
	String yxkssj=null;
	yxkssj=request.getParameter("yxkssj");
	if (yxkssj!=null)
	{
		yxkssj=yxkssj.trim();
		if (!(yxkssj.equals("")))	wheresql+="  and (bj_tcwzck.yxkssj>=TO_DATE('"+yxkssj+"','YYYY/MM/DD'))";
	}
	yxkssj=request.getParameter("yxkssj2");
	if (yxkssj!=null)
	{
		yxkssj=yxkssj.trim();
		if (!(yxkssj.equals("")))	wheresql+="  and (bj_tcwzck.yxkssj<=TO_DATE('"+yxkssj+"','YYYY/MM/DD'))";
	}
	String yxjzsj=null;
	yxjzsj=request.getParameter("yxjzsj");
	if (yxjzsj!=null)
	{
		yxjzsj=yxjzsj.trim();
		if (!(yxjzsj.equals("")))	wheresql+="  and (bj_tcwzck.yxjzsj>=TO_DATE('"+yxjzsj+"','YYYY/MM/DD'))";
	}
	yxjzsj=request.getParameter("yxjzsj2");
	if (yxjzsj!=null)
	{
		yxjzsj=yxjzsj.trim();
		if (!(yxjzsj.equals("")))	wheresql+="  and (bj_tcwzck.yxjzsj<=TO_DATE('"+yxjzsj+"','YYYY/MM/DD'))";
	}


	String sfycx=null;
	sfycx=request.getParameter("sfycx");
	if (sfycx!=null)
	{
		sfycx=cf.GB2Uni(sfycx);
		if (!(sfycx.equals("")))	wheresql+=" and  (bj_tcwzck.sfycx='"+sfycx+"')";
	}
	String cxkssj=null;
	cxkssj=request.getParameter("cxkssj");
	if (cxkssj!=null)
	{
		cxkssj=cxkssj.trim();
		if (!(cxkssj.equals("")))	wheresql+="  and (bj_tcwzck.cxkssj>=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	cxkssj=request.getParameter("cxkssj2");
	if (cxkssj!=null)
	{
		cxkssj=cxkssj.trim();
		if (!(cxkssj.equals("")))	wheresql+="  and (bj_tcwzck.cxkssj<=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	String cxjssj=null;
	cxjssj=request.getParameter("cxjssj");
	if (cxjssj!=null)
	{
		cxjssj=cxjssj.trim();
		if (!(cxjssj.equals("")))	wheresql+="  and (bj_tcwzck.cxjssj>=TO_DATE('"+cxjssj+"','YYYY/MM/DD'))";
	}
	cxjssj=request.getParameter("cxjssj2");
	if (cxjssj!=null)
	{
		cxjssj=cxjssj.trim();
		if (!(cxjssj.equals("")))	wheresql+="  and (bj_tcwzck.cxjssj<=TO_DATE('"+cxjssj+"','YYYY/MM/DD'))";
	}


	ls_sql="SELECT bj_tcwzck.dqbm,dm_dqbm.dqmc,bj_tcwzck.cpbm,jxc_cldlbm.cldlmc,clxlmc,bj_tcwzck.cpmc,bj_tcwzck.ppmc,bj_tcwzck.xh,bj_tcwzck.gg,bj_tcwzck.jldw,bj_tcwzck.xdjldw,bj_tcwzck.xdb,bj_tcwzck.dj,DECODE(bj_tcwzck.sfkgdj,'Y','可改','N','否') sfkgdj,DECODE(bj_tcwzck.jsfs,'1','结算价','2','结算比例') jsfs,bj_tcwzck.jsj,bj_tcwzck.jsbl||'%' jsbl,bj_tcwzck.sh||'%' sh,DECODE(bj_tcwzck.sfycx,'Y','有促销','N','无促销') sfycx,bj_tcwzck.cxj,bj_tcwzck.cxkssj,bj_tcwzck.cxjssj,bj_tcwzck.cxjsj,bj_tcwzck.cxjsbl||'%' cxjsbl, DECODE(bj_tcwzck.sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理') sfxclxs ,bj_tcwzck.gysmc,DECODE(bj_tcwzck.sfyx,'1','永远有效','2','无效','3','阶段有效') sfyx,bj_tcwzck.yxkssj,bj_tcwzck.yxjzsj,DECODE(bj_tcwzck.jjfs,'1','套外升级（补差价）','2','套外升级（独立计价）','3','套餐选配') jjfs,bj_tcwzck.lrr,bj_tcwzck.lrsj,bj_tcwzck.bz  ";
	ls_sql+=" FROM bj_tcwzck,dm_dqbm,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where bj_tcwzck.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcwzck.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_tcwzck.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tcwzck.dqbm,bj_tcwzck.tccpdlbm,bj_tcwzck.tccplbbm,bj_tcwzck.cpbm";
    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("Bj_tcwzckList.jsp","","","EditBj_tcwzck.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","cpbm","cpmc","ppmc","xh","gg","jldw","xdjldw","xdb","sh","sfxclxs","dj","sfkgdj","jsfs","jsj","jsbl","sfycx","cxj","cxkssj","cxjssj","cxjsj","cxjsbl","cldlmc","clxlmc","gysmc","sfyx","yxkssj","yxjzsj","jjfs","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息","批量修改【有效标志】","批量修改【促销】"};//按钮的显示名称
	String[] buttonLink={"Bj_tcwzckList.jsp?","PlUpdateYxbz.jsp","PlUpdateCx.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0,1,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String[] cpbm = request.getParameterValues("cpbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cpbm,"cpbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from bj_tcwzck where "+chooseitem;
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
  <B><font size="3">套餐外主材库－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(360);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">地区</td>
	<td  width="3%">产品编码</td>
	<td  width="5%">产品名称</td>
	<td  width="4%">品牌</td>
	<td  width="5%">型号</td>
	<td  width="5%">规格</td>
	<td  width="2%">报价计量单位</td>
	<td  width="2%">下单计量单位</td>
	<td  width="2%">下单比</td>
	<td  width="2%">损耗</td>
	<td  width="2%">是否需处理小数</td>
	<td  width="2%">单价</td>
	<td  width="2%">是否可改单价</td>
	<td  width="2%">结算方式</td>
	<td  width="2%">结算价</td>
	<td  width="2%">结算比例</td>
	<td  width="2%">是否有促销</td>
	<td  width="2%">促销价</td>
	<td  width="3%">促销开始时间</td>
	<td  width="3%">促销结束时间</td>
	<td  width="2%">促销结算价</td>
	<td  width="2%">促销结算比例</td>
	<td  width="4%">产品大类</td>
	<td  width="4%">产品类别</td>
	<td  width="7%">供应商</td>
	<td  width="2%">是否有效</td>
	<td  width="3%">有效开始时间</td>
	<td  width="3%">有效结束时间</td>
	<td  width="3%">计价方式</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="8%">备注</td>
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