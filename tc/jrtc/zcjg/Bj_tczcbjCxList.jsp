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
	String bj_tczcbj_dqbm=null;
	String bj_tczcbj_bjjbbm=null;
	String bj_tczcbj_cpbm=null;
	String bj_tczcbj_sku=null;
	String bj_tczcjxc_cldlbm=null;
	String bj_tczcjxc_clxlbm=null;
	String bj_tczcbj_cpmc=null;
	String ppmc=null;
	String bj_tczcbj_xh=null;
	String bj_tczcbj_xh2=null;
	String bj_tczcbj_gg=null;
	String bj_tczcbj_jldw=null;
	String bj_tczcbj_sfcscp=null;
	String bj_tczcbj_xuhao=null;
	String bj_tczcbj_lrr=null;
	String bj_tczcbj_lrsj=null;

	String ppmc1=null;
	ppmc1=request.getParameter("ppmc1");
	if (ppmc1!=null)
	{
		ppmc1=cf.GB2Uni(ppmc1);
		if (!(ppmc1.equals("")))	wheresql+=" and  (bj_tczcbj.ppmc like '%"+ppmc1+"%')";
	}

	String gysmc1=null;
	gysmc1=request.getParameter("gysmc1");
	if (gysmc1!=null)
	{
		gysmc1=cf.GB2Uni(gysmc1);
		if (!(gysmc1.equals("")))	wheresql+=" and  (bj_tczcbj.gysmc like '%"+gysmc1+"%')";
	}

	String sfkgdj=null;
	sfkgdj=request.getParameter("sfkgdj");
	if (sfkgdj!=null)
	{
		sfkgdj=cf.GB2Uni(sfkgdj);
		if (!(sfkgdj.equals("")))	wheresql+=" and  (bj_tczcbj.sfkgdj='"+sfkgdj+"')";
	}

	String tcsjflbm=null;
	tcsjflbm=request.getParameter("tcsjflbm");
	if (tcsjflbm!=null)
	{
		tcsjflbm=cf.GB2Uni(tcsjflbm);
		if (!(tcsjflbm.equals("")))	wheresql+=" and  (bj_tczcbj.tcsjflbm='"+tcsjflbm+"')";
	}

	String sfxclxs=null;
	sfxclxs=request.getParameter("sfxclxs");
	if (sfxclxs!=null)
	{
		sfxclxs=cf.GB2Uni(sfxclxs);
		if (!(sfxclxs.equals("")))	wheresql+=" and  (bj_tczcbj.sfxclxs='"+sfxclxs+"')";
	}

	String gysmc=null;
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (bj_tczcbj.gysmc='"+gysmc+"')";
	}
	
	
	bj_tczcbj_dqbm=request.getParameter("bj_tczcbj_dqbm");
	if (bj_tczcbj_dqbm!=null)
	{
		bj_tczcbj_dqbm=cf.GB2Uni(bj_tczcbj_dqbm);
		if (!(bj_tczcbj_dqbm.equals("")))	wheresql+=" and  (bj_tczcbj.dqbm='"+bj_tczcbj_dqbm+"')";
	}
	bj_tczcbj_bjjbbm=request.getParameter("bj_tczcbj_bjjbbm");
	if (bj_tczcbj_bjjbbm!=null)
	{
		bj_tczcbj_bjjbbm=cf.GB2Uni(bj_tczcbj_bjjbbm);
		if (!(bj_tczcbj_bjjbbm.equals("")))	wheresql+=" and  (bj_tczcbj.bjjbbm='"+bj_tczcbj_bjjbbm+"')";
	}
	bj_tczcbj_cpbm=request.getParameter("bj_tczcbj_cpbm");
	if (bj_tczcbj_cpbm!=null)
	{
		bj_tczcbj_cpbm=cf.GB2Uni(bj_tczcbj_cpbm);
		if (!(bj_tczcbj_cpbm.equals("")))	wheresql+=" and  (bj_tczcbj.cpbm='"+bj_tczcbj_cpbm+"')";
	}
	bj_tczcbj_sku=request.getParameter("bj_tczcbj_sku");
	if (bj_tczcbj_sku!=null)
	{
		bj_tczcbj_sku=cf.GB2Uni(bj_tczcbj_sku);
		if (!(bj_tczcbj_sku.equals("")))	wheresql+=" and  (bj_tczcbj.sku='"+bj_tczcbj_sku+"')";
	}
	bj_tczcjxc_cldlbm=request.getParameter("bj_tczcjxc_cldlbm");
	if (bj_tczcjxc_cldlbm!=null)
	{
		bj_tczcjxc_cldlbm=cf.GB2Uni(bj_tczcjxc_cldlbm);
		if (!(bj_tczcjxc_cldlbm.equals("")))	wheresql+=" and  (bj_tczcbj.tccpdlbm='"+bj_tczcjxc_cldlbm+"')";
	}
	bj_tczcjxc_clxlbm=request.getParameter("bj_tczcjxc_clxlbm");
	if (bj_tczcjxc_clxlbm!=null)
	{
		bj_tczcjxc_clxlbm=cf.GB2Uni(bj_tczcjxc_clxlbm);
		if (!(bj_tczcjxc_clxlbm.equals("")))	wheresql+=" and  (bj_tczcbj.tccplbbm='"+bj_tczcjxc_clxlbm+"')";
	}
	bj_tczcbj_cpmc=request.getParameter("bj_tczcbj_cpmc");
	if (bj_tczcbj_cpmc!=null)
	{
		bj_tczcbj_cpmc=cf.GB2Uni(bj_tczcbj_cpmc);
		if (!(bj_tczcbj_cpmc.equals("")))	wheresql+=" and  (bj_tczcbj.cpmc like '%"+bj_tczcbj_cpmc+"%')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (bj_tczcbj.ppmc='"+ppmc+"')";
	}
	bj_tczcbj_xh=request.getParameter("bj_tczcbj_xh");
	if (bj_tczcbj_xh!=null)
	{
		bj_tczcbj_xh=cf.GB2Uni(bj_tczcbj_xh);
		if (!(bj_tczcbj_xh.equals("")))	wheresql+=" and  (bj_tczcbj.xh='"+bj_tczcbj_xh+"')";
	}
	
	bj_tczcbj_xh2=request.getParameter("bj_tczcbj_xh2");
	if (bj_tczcbj_xh2!=null)
	{
		bj_tczcbj_xh2=cf.GB2Uni(bj_tczcbj_xh2);
		if (!(bj_tczcbj_xh2.equals("")))	wheresql+=" and  (bj_tczcbj.xh like '%"+bj_tczcbj_xh2+"%')";
	}
	bj_tczcbj_gg=request.getParameter("bj_tczcbj_gg");
	if (bj_tczcbj_gg!=null)
	{
		bj_tczcbj_gg=cf.GB2Uni(bj_tczcbj_gg);
		if (!(bj_tczcbj_gg.equals("")))	wheresql+=" and  (bj_tczcbj.gg='"+bj_tczcbj_gg+"')";
	}
	bj_tczcbj_jldw=request.getParameter("bj_tczcbj_jldw");
	if (bj_tczcbj_jldw!=null)
	{
		bj_tczcbj_jldw=cf.GB2Uni(bj_tczcbj_jldw);
		if (!(bj_tczcbj_jldw.equals("")))	wheresql+=" and  (bj_tczcbj.jldw='"+bj_tczcbj_jldw+"')";
	}
	bj_tczcbj_sfcscp=request.getParameter("bj_tczcbj_sfcscp");
	if (bj_tczcbj_sfcscp!=null)
	{
		bj_tczcbj_sfcscp=cf.GB2Uni(bj_tczcbj_sfcscp);
		if (!(bj_tczcbj_sfcscp.equals("")))	wheresql+=" and  (bj_tczcbj.sfcscp='"+bj_tczcbj_sfcscp+"')";
	}
	bj_tczcbj_xuhao=request.getParameter("bj_tczcbj_xuhao");
	if (bj_tczcbj_xuhao!=null)
	{
		bj_tczcbj_xuhao=bj_tczcbj_xuhao.trim();
		if (!(bj_tczcbj_xuhao.equals("")))	wheresql+=" and (bj_tczcbj.xuhao="+bj_tczcbj_xuhao+") ";
	}
	bj_tczcbj_lrr=request.getParameter("bj_tczcbj_lrr");
	if (bj_tczcbj_lrr!=null)
	{
		bj_tczcbj_lrr=cf.GB2Uni(bj_tczcbj_lrr);
		if (!(bj_tczcbj_lrr.equals("")))	wheresql+=" and  (bj_tczcbj.lrr='"+bj_tczcbj_lrr+"')";
	}

	bj_tczcbj_lrsj=request.getParameter("bj_tczcbj_lrsj");
	if (bj_tczcbj_lrsj!=null)
	{
		bj_tczcbj_lrsj=bj_tczcbj_lrsj.trim();
		if (!(bj_tczcbj_lrsj.equals("")))	wheresql+="  and (bj_tczcbj.lrsj>=TO_DATE('"+bj_tczcbj_lrsj+"','YYYY/MM/DD'))";
	}
	bj_tczcbj_lrsj=request.getParameter("bj_tczcbj_lrsj2");
	if (bj_tczcbj_lrsj!=null)
	{
		bj_tczcbj_lrsj=bj_tczcbj_lrsj.trim();
		if (!(bj_tczcbj_lrsj.equals("")))	wheresql+="  and (bj_tczcbj.lrsj<=TO_DATE('"+bj_tczcbj_lrsj+"','YYYY/MM/DD'))";
	}

	String sfyx=null;
	sfyx=request.getParameter("sfyx");
	if (sfyx!=null)
	{
		sfyx=cf.GB2Uni(sfyx);
		if (!(sfyx.equals("")))	wheresql+=" and  (bj_tczcbj.sfyx='"+sfyx+"')";
	}
	String yxkssj=null;
	yxkssj=request.getParameter("yxkssj");
	if (yxkssj!=null)
	{
		yxkssj=yxkssj.trim();
		if (!(yxkssj.equals("")))	wheresql+="  and (bj_tczcbj.yxkssj>=TO_DATE('"+yxkssj+"','YYYY/MM/DD'))";
	}
	yxkssj=request.getParameter("yxkssj2");
	if (yxkssj!=null)
	{
		yxkssj=yxkssj.trim();
		if (!(yxkssj.equals("")))	wheresql+="  and (bj_tczcbj.yxkssj<=TO_DATE('"+yxkssj+"','YYYY/MM/DD'))";
	}
	String yxjzsj=null;
	yxjzsj=request.getParameter("yxjzsj");
	if (yxjzsj!=null)
	{
		yxjzsj=yxjzsj.trim();
		if (!(yxjzsj.equals("")))	wheresql+="  and (bj_tczcbj.yxjzsj>=TO_DATE('"+yxjzsj+"','YYYY/MM/DD'))";
	}
	yxjzsj=request.getParameter("yxjzsj2");
	if (yxjzsj!=null)
	{
		yxjzsj=yxjzsj.trim();
		if (!(yxjzsj.equals("")))	wheresql+="  and (bj_tczcbj.yxjzsj<=TO_DATE('"+yxjzsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT bj_tczcbj.dqbm,dm_dqbm.dqmc,bj_tczcbj.bjjbbm,bjjbmc,bj_tczcbj.cpbm,bj_tczcbj.sku,jxc_cldlbm.cldlmc,clxlmc,tcsjflmc,bj_tczcbj.cpmc,bj_tczcbj.ppmc,bj_tczcbj.xh,bj_tczcbj.gg,bj_tczcbj.jldw,bj_tczcbj.xdjldw,bj_tczcbj.xdb,bj_tczcbj.dj,bj_tczcbj.tccldj,DECODE(bj_tczcbj.sfkgdj,'Y','可改','N','否') sfkgdj,bj_tczcbj.jsj,bj_tczcbj.sh||'%' sh, DECODE(bj_tczcbj.sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理') sfxclxs, DECODE(bj_tczcbj.sfcscp,'Y','是','N','否') sfcscp,bj_tczcbj.xuhao,bj_tczcbj.gysmc,DECODE(bj_tczcbj.sfyx,'1','永远有效','2','无效','3','阶段有效') sfyx,bj_tczcbj.yxkssj,bj_tczcbj.yxjzsj,bj_tczcbj.lrr,bj_tczcbj.lrsj,DECODE(bj_tczcbj.cllx,'1','旧','2','新材料') cllx,bj_tczcbj.bz  ";
	ls_sql+=" FROM bj_tczcbj,dm_dqbm,jxc_cldlbm,jxc_clxlbm,bdm_bjjbbm,bj_tcsjflbm  ";
    ls_sql+=" where bj_tczcbj.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tczcbj.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_tczcbj.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_tczcbj.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tczcbj.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tczcbj.dqbm,bj_tczcbj.bjjbbm,bj_tczcbj.tccpdlbm,bj_tczcbj.tccplbbm,bj_tczcbj.cpbm";
    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("Bj_tczcbjCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","bjjbmc","cpbm","cpmc","ppmc","xh","gg","jldw","xdjldw","xdb","sh","sfxclxs","dj","tccldj","sfkgdj","cldlmc","clxlmc","tcsjflmc","gysmc","sfyx","yxkssj","yxjzsj","sfcscp","sku","xuhao","lrr","lrsj","cllx","bz"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
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
  <B><font size="3">套餐主材库－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">地区</td>
	<td  width="3%">报价级别</td>
	<td  width="4%">产品编码</td>
	<td  width="6%">产品名称</td>
	<td  width="5%">品牌</td>
	<td  width="6%">型号</td>
	<td  width="5%">规格</td>
	<td  width="2%">报价计量单位</td>
	<td  width="2%">下单计量单位</td>
	<td  width="2%">下单比</td>
	<td  width="2%">损耗</td>
	<td  width="3%">是否需处理小数</td>
	<td  width="3%">套餐内单价</td>
	<td  width="3%">套餐超量单价</td>
	<td  width="2%">是否可改单价</td>
	<td  width="5%">产品大类</td>
	<td  width="3%">产品类别</td>
	<td  width="3%">套餐升级分类</td>
	<td  width="8%">供应商</td>
	<td  width="3%">是否有效</td>
	<td  width="3%">有效开始时间</td>
	<td  width="3%">有效结束时间</td>
	<td  width="2%">是否超市产品</td>
	<td  width="4%">SKU号</td>
	<td  width="2%">排序序号</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="2%">材料类型</td>
	<td  width="9%">备注</td>
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