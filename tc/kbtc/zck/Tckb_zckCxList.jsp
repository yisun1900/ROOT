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
	String tckb_zck_dqbm=null;
	String tckb_zck_bjjbbm=null;
	String tckb_zck_cpbm=null;
	String cpdl=null;
	String cpxl=null;
	String tckb_zck_cpmc=null;
	String ppmc=null;
	String tckb_zck_xh=null;
	String tckb_zck_xh2=null;
	String tckb_zck_gg=null;
	String tckb_zck_jldw=null;
	String tckb_zck_xuhao=null;
	String tckb_zck_lrr=null;
	String tckb_zck_lrsj=null;

	String cllx=null;
	cllx=request.getParameter("cllx");
	if (cllx!=null)
	{
		cllx=cf.GB2Uni(cllx);
		if (!(cllx.equals("")))	wheresql+=" and  (tckb_zck.cllx='"+cllx+"')";
	}

	String sfkgdj=null;
	sfkgdj=request.getParameter("sfkgdj");
	if (sfkgdj!=null)
	{
		sfkgdj=cf.GB2Uni(sfkgdj);
		if (!(sfkgdj.equals("")))	wheresql+=" and  (tckb_zck.sfkgdj='"+sfkgdj+"')";
	}

	String kbcpbm=null;
	kbcpbm=request.getParameter("kbcpbm");
	if (kbcpbm!=null)
	{
		kbcpbm=cf.GB2Uni(kbcpbm);
		if (!(kbcpbm.equals("")))	wheresql+=" and  (tckb_zck.kbcpbm='"+kbcpbm+"')";
	}

	String kbwlbm=null;
	kbwlbm=request.getParameter("kbwlbm");
	if (kbwlbm!=null)
	{
		kbwlbm=cf.GB2Uni(kbwlbm);
		if (!(kbwlbm.equals("")))	wheresql+=" and  (tckb_zck.kbwlbm='"+kbwlbm+"')";
	}

	String sfxclxs=null;
	sfxclxs=request.getParameter("sfxclxs");
	if (sfxclxs!=null)
	{
		sfxclxs=cf.GB2Uni(sfxclxs);
		if (!(sfxclxs.equals("")))	wheresql+=" and  (tckb_zck.sfxclxs='"+sfxclxs+"')";
	}

	String gysmc=null;
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (tckb_zck.gysmc='"+gysmc+"')";
	}
	
	
	tckb_zck_dqbm=request.getParameter("tckb_zck_dqbm");
	if (tckb_zck_dqbm!=null)
	{
		tckb_zck_dqbm=cf.GB2Uni(tckb_zck_dqbm);
		if (!(tckb_zck_dqbm.equals("")))	wheresql+=" and  (tckb_zck.dqbm='"+tckb_zck_dqbm+"')";
	}
	tckb_zck_bjjbbm=request.getParameter("tckb_zck_bjjbbm");
	if (tckb_zck_bjjbbm!=null)
	{
		tckb_zck_bjjbbm=cf.GB2Uni(tckb_zck_bjjbbm);
		if (!(tckb_zck_bjjbbm.equals("")))	wheresql+=" and  (tckb_zck.bjjbbm='"+tckb_zck_bjjbbm+"')";
	}
	tckb_zck_cpbm=request.getParameter("tckb_zck_cpbm");
	if (tckb_zck_cpbm!=null)
	{
		tckb_zck_cpbm=cf.GB2Uni(tckb_zck_cpbm);
		if (!(tckb_zck_cpbm.equals("")))	wheresql+=" and  (tckb_zck.cpbm='"+tckb_zck_cpbm+"')";
	}

	cpdl=request.getParameter("cpdl");
	if (cpdl!=null)
	{
		cpdl=cf.GB2Uni(cpdl);
		if (!(cpdl.equals("")))	wheresql+=" and  (tckb_zck.cpdl='"+cpdl+"')";
	}
	cpxl=request.getParameter("cpxl");
	if (cpxl!=null)
	{
		cpxl=cf.GB2Uni(cpxl);
		if (!(cpxl.equals("")))	wheresql+=" and  (tckb_zck.cpxl='"+cpxl+"')";
	}
	tckb_zck_cpmc=request.getParameter("tckb_zck_cpmc");
	if (tckb_zck_cpmc!=null)
	{
		tckb_zck_cpmc=cf.GB2Uni(tckb_zck_cpmc);
		if (!(tckb_zck_cpmc.equals("")))	wheresql+=" and  (tckb_zck.cpmc like '%"+tckb_zck_cpmc+"%')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (tckb_zck.ppmc='"+ppmc+"')";
	}
	tckb_zck_xh=request.getParameter("tckb_zck_xh");
	if (tckb_zck_xh!=null)
	{
		tckb_zck_xh=cf.GB2Uni(tckb_zck_xh);
		if (!(tckb_zck_xh.equals("")))	wheresql+=" and  (tckb_zck.xh='"+tckb_zck_xh+"')";
	}
	
	tckb_zck_xh2=request.getParameter("tckb_zck_xh2");
	if (tckb_zck_xh2!=null)
	{
		tckb_zck_xh2=cf.GB2Uni(tckb_zck_xh2);
		if (!(tckb_zck_xh2.equals("")))	wheresql+=" and  (tckb_zck.xh like '%"+tckb_zck_xh2+"%')";
	}
	tckb_zck_gg=request.getParameter("tckb_zck_gg");
	if (tckb_zck_gg!=null)
	{
		tckb_zck_gg=cf.GB2Uni(tckb_zck_gg);
		if (!(tckb_zck_gg.equals("")))	wheresql+=" and  (tckb_zck.gg='"+tckb_zck_gg+"')";
	}
	tckb_zck_jldw=request.getParameter("tckb_zck_jldw");
	if (tckb_zck_jldw!=null)
	{
		tckb_zck_jldw=cf.GB2Uni(tckb_zck_jldw);
		if (!(tckb_zck_jldw.equals("")))	wheresql+=" and  (tckb_zck.jldw='"+tckb_zck_jldw+"')";
	}

	tckb_zck_xuhao=request.getParameter("tckb_zck_xuhao");
	if (tckb_zck_xuhao!=null)
	{
		tckb_zck_xuhao=tckb_zck_xuhao.trim();
		if (!(tckb_zck_xuhao.equals("")))	wheresql+=" and (tckb_zck.xuhao="+tckb_zck_xuhao+") ";
	}
	tckb_zck_lrr=request.getParameter("tckb_zck_lrr");
	if (tckb_zck_lrr!=null)
	{
		tckb_zck_lrr=cf.GB2Uni(tckb_zck_lrr);
		if (!(tckb_zck_lrr.equals("")))	wheresql+=" and  (tckb_zck.lrr='"+tckb_zck_lrr+"')";
	}

	tckb_zck_lrsj=request.getParameter("tckb_zck_lrsj");
	if (tckb_zck_lrsj!=null)
	{
		tckb_zck_lrsj=tckb_zck_lrsj.trim();
		if (!(tckb_zck_lrsj.equals("")))	wheresql+="  and (tckb_zck.lrsj>=TO_DATE('"+tckb_zck_lrsj+"','YYYY/MM/DD'))";
	}
	tckb_zck_lrsj=request.getParameter("tckb_zck_lrsj2");
	if (tckb_zck_lrsj!=null)
	{
		tckb_zck_lrsj=tckb_zck_lrsj.trim();
		if (!(tckb_zck_lrsj.equals("")))	wheresql+="  and (tckb_zck.lrsj<=TO_DATE('"+tckb_zck_lrsj+"','YYYY/MM/DD'))";
	}

	String sfyx=null;
	sfyx=request.getParameter("sfyx");
	if (sfyx!=null)
	{
		sfyx=cf.GB2Uni(sfyx);
		if (!(sfyx.equals("")))	wheresql+=" and  (tckb_zck.sfyx='"+sfyx+"')";
	}
	String yxkssj=null;
	yxkssj=request.getParameter("yxkssj");
	if (yxkssj!=null)
	{
		yxkssj=yxkssj.trim();
		if (!(yxkssj.equals("")))	wheresql+="  and (tckb_zck.yxkssj>=TO_DATE('"+yxkssj+"','YYYY/MM/DD'))";
	}
	yxkssj=request.getParameter("yxkssj2");
	if (yxkssj!=null)
	{
		yxkssj=yxkssj.trim();
		if (!(yxkssj.equals("")))	wheresql+="  and (tckb_zck.yxkssj<=TO_DATE('"+yxkssj+"','YYYY/MM/DD'))";
	}
	String yxjzsj=null;
	yxjzsj=request.getParameter("yxjzsj");
	if (yxjzsj!=null)
	{
		yxjzsj=yxjzsj.trim();
		if (!(yxjzsj.equals("")))	wheresql+="  and (tckb_zck.yxjzsj>=TO_DATE('"+yxjzsj+"','YYYY/MM/DD'))";
	}
	yxjzsj=request.getParameter("yxjzsj2");
	if (yxjzsj!=null)
	{
		yxjzsj=yxjzsj.trim();
		if (!(yxjzsj.equals("")))	wheresql+="  and (tckb_zck.yxjzsj<=TO_DATE('"+yxjzsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT tckb_zck.dqbm,dm_dqbm.dqmc,tckb_zck.bjjbbm,bjjbmc,tckb_zck.cpbm,tckb_zck.kbcpbm,tckb_zck.kbwlbm,DECODE(tckb_zck.yxthsj,'Y','是','N','否') yxthsj,tckb_zck.cpdl,tckb_zck.cpxl,tckb_zck.cpmc,tckb_zck.ppmc,tckb_zck.xh,tckb_zck.gg,tckb_zck.cptz,tckb_zck.czlx,tckb_zck.cpks,tckb_zck.cplx,tckb_zck.jldw,tckb_zck.xdjldw,tckb_zck.xdb,tckb_zck.sh||'%' sh, DECODE(tckb_zck.sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理') sfxclxs,tckb_zck.jsj,tckb_zck.lsj,tckb_zck.sjj,DECODE(tckb_zck.sfkgdj,'Y','可改','N','否') sfkgdj,DECODE(tckb_zck.cllx,'1','包内产品','2','包外产品') cllx,tckb_zck.xuhao,tckb_zck.gysmc,DECODE(tckb_zck.sfyx,'1','正在销售','2','停止销售','3','阶段销售','4','售前核实') sfyx,tckb_zck.yxkssj,tckb_zck.yxjzsj,tckb_zck.lrr,tckb_zck.lrsj,tckb_zck.bz  ";
	ls_sql+=" FROM tckb_zck,dm_dqbm,bdm_bjjbbm  ";
    ls_sql+=" where tckb_zck.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckb_zck.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckb_zck.dqbm,tckb_zck.bjjbbm,tckb_zck.kbcpbm,tckb_zck.cpdl,tckb_zck.cpxl,tckb_zck.cpbm";
    pageObj.sql=ls_sql;

//	out.println(ls_sql);

//进行对象初始化
	pageObj.initPage("Tckb_zckCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","bjjbmc","cpbm","kbcpbm","kbwlbm","yxthsj","cpmc","ppmc","xh","gg","cptz","czlx","cpks","cplx","jldw","xdjldw","xdb","sh","sfxclxs","lsj","sjj","sfkgdj","cllx","cpdl","cpxl","gysmc","sfyx","yxkssj","yxjzsj","xuhao","lrr","lrsj","bz"};
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
	pageObj.printPageLink(390);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">地区</td>
	<td  width="2%">报价级别</td>
	<td  width="3%">产品编码</td>
	<td  width="3%">科宝产品编码</td>
	<td  width="3%">科宝物料编码</td>
	<td  width="2%">允许替换升级</td>
	<td  width="5%">产品名称</td>
	<td  width="4%">品牌</td>
	<td  width="4%">型号</td>
	<td  width="4%">规格</td>
	<td  width="5%">产品特征</td>
	<td  width="3%">材质类型</td>
	<td  width="3%">产品款式</td>
	<td  width="3%">产品类型</td>
	<td  width="2%">报价计量单位</td>
	<td  width="2%">下单计量单位</td>
	<td  width="2%">下单比</td>
	<td  width="2%">损耗</td>
	<td  width="3%">是否需处理小数</td>
	<td  width="2%">零售价</td>
	<td  width="2%">包内价</td>
	<td  width="2%">是否可改单价</td>
	<td  width="3%">材料类型</td>
	<td  width="3%">产品大类</td>
	<td  width="3%">产品小类</td>
	<td  width="6%">供应商</td>
	<td  width="2%">是否有效</td>
	<td  width="3%">有效开始时间</td>
	<td  width="3%">有效结束时间</td>
	<td  width="2%">排序序号</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
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