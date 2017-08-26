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
	String tc_yhlbmx_lbxmbm=null;
	String tc_yhlbmx_dqbm=null;
	String tc_yhlbmx_bjjbbm=null;
	String tc_yhlbmx_lbmc=null;
	String tc_yhlbmx_xmmc=null;
	String tc_yhlbmx_ppmc=null;
	String tc_yhlbmx_xh=null;
	String tc_yhlbmx_jldw=null;
	String tc_yhlbmx_dj=null;
	String tc_yhlbmx_lrr=null;
	String tc_yhlbmx_lrsj=null;
	tc_yhlbmx_lbxmbm=request.getParameter("tc_yhlbmx_lbxmbm");
	if (tc_yhlbmx_lbxmbm!=null)
	{
		tc_yhlbmx_lbxmbm=cf.GB2Uni(tc_yhlbmx_lbxmbm);
		if (!(tc_yhlbmx_lbxmbm.equals("")))	wheresql+=" and  (tc_yhlbmx.lbxmbm='"+tc_yhlbmx_lbxmbm+"')";
	}
	tc_yhlbmx_dqbm=request.getParameter("tc_yhlbmx_dqbm");
	if (tc_yhlbmx_dqbm!=null)
	{
		tc_yhlbmx_dqbm=cf.GB2Uni(tc_yhlbmx_dqbm);
		if (!(tc_yhlbmx_dqbm.equals("")))	wheresql+=" and  (tc_yhlbmx.dqbm='"+tc_yhlbmx_dqbm+"')";
	}
	tc_yhlbmx_bjjbbm=request.getParameter("tc_yhlbmx_bjjbbm");
	if (tc_yhlbmx_bjjbbm!=null)
	{
		tc_yhlbmx_bjjbbm=cf.GB2Uni(tc_yhlbmx_bjjbbm);
		if (!(tc_yhlbmx_bjjbbm.equals("")))	wheresql+=" and  (tc_yhlbmx.bjjbbm='"+tc_yhlbmx_bjjbbm+"')";
	}
	tc_yhlbmx_lbmc=request.getParameter("tc_yhlbmx_lbmc");
	if (tc_yhlbmx_lbmc!=null)
	{
		tc_yhlbmx_lbmc=cf.GB2Uni(tc_yhlbmx_lbmc);
		if (!(tc_yhlbmx_lbmc.equals("")))	wheresql+=" and  (tc_yhlbmx.lbmc='"+tc_yhlbmx_lbmc+"')";
	}
	tc_yhlbmx_xmmc=request.getParameter("tc_yhlbmx_xmmc");
	if (tc_yhlbmx_xmmc!=null)
	{
		tc_yhlbmx_xmmc=cf.GB2Uni(tc_yhlbmx_xmmc);
		if (!(tc_yhlbmx_xmmc.equals("")))	wheresql+=" and  (tc_yhlbmx.xmmc='"+tc_yhlbmx_xmmc+"')";
	}
	tc_yhlbmx_ppmc=request.getParameter("tc_yhlbmx_ppmc");
	if (tc_yhlbmx_ppmc!=null)
	{
		tc_yhlbmx_ppmc=cf.GB2Uni(tc_yhlbmx_ppmc);
		if (!(tc_yhlbmx_ppmc.equals("")))	wheresql+=" and  (tc_yhlbmx.ppmc='"+tc_yhlbmx_ppmc+"')";
	}
	tc_yhlbmx_xh=request.getParameter("tc_yhlbmx_xh");
	if (tc_yhlbmx_xh!=null)
	{
		tc_yhlbmx_xh=cf.GB2Uni(tc_yhlbmx_xh);
		if (!(tc_yhlbmx_xh.equals("")))	wheresql+=" and  (tc_yhlbmx.xh='"+tc_yhlbmx_xh+"')";
	}
	tc_yhlbmx_jldw=request.getParameter("tc_yhlbmx_jldw");
	if (tc_yhlbmx_jldw!=null)
	{
		tc_yhlbmx_jldw=cf.GB2Uni(tc_yhlbmx_jldw);
		if (!(tc_yhlbmx_jldw.equals("")))	wheresql+=" and  (tc_yhlbmx.jldw='"+tc_yhlbmx_jldw+"')";
	}
	tc_yhlbmx_dj=request.getParameter("tc_yhlbmx_dj");
	if (tc_yhlbmx_dj!=null)
	{
		tc_yhlbmx_dj=tc_yhlbmx_dj.trim();
		if (!(tc_yhlbmx_dj.equals("")))	wheresql+=" and  (tc_yhlbmx.dj="+tc_yhlbmx_dj+") ";
	}
	tc_yhlbmx_lrr=request.getParameter("tc_yhlbmx_lrr");
	if (tc_yhlbmx_lrr!=null)
	{
		tc_yhlbmx_lrr=cf.GB2Uni(tc_yhlbmx_lrr);
		if (!(tc_yhlbmx_lrr.equals("")))	wheresql+=" and  (tc_yhlbmx.lrr='"+tc_yhlbmx_lrr+"')";
	}
	tc_yhlbmx_lrsj=request.getParameter("tc_yhlbmx_lrsj");
	if (tc_yhlbmx_lrsj!=null)
	{
		tc_yhlbmx_lrsj=tc_yhlbmx_lrsj.trim();
		if (!(tc_yhlbmx_lrsj.equals("")))	wheresql+="  and (tc_yhlbmx.lrsj=TO_DATE('"+tc_yhlbmx_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_yhlbmx.lbxmbm,dm_dqbm.dqmc,bjjbmc,tc_yhlbmx.lbmc,tc_yhlbmx.xmmc,tc_yhlbmx.ppmc,tc_yhlbmx.xh,tc_yhlbmx.jldw,tc_yhlbmx.zqdj,tc_yhlbmx.dj,tc_yhlbmx.sjzj,tc_yhlbmx.sl,DECODE(tc_yhlbmx.lx,'1','工程','2','主材'),tc_yhlbmx.bz,tc_yhlbmx.lrr,tc_yhlbmx.lrsj  ";
	ls_sql+=" FROM dm_dqbm,tc_yhlbmx,bdm_bjjbbm  ";
    ls_sql+=" where tc_yhlbmx.dqbm=dm_dqbm.dqbm(+) and tc_yhlbmx.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_yhlbmx.dqbm,tc_yhlbmx.bjjbbm,tc_yhlbmx.lbmc,tc_yhlbmx.lbxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_yhlbmxCxList.jsp","","","");
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
  <B><font size="3">套餐优惠礼包明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(240);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">礼包项目编码</td>
	<td  width="4%">地区</td>
	<td  width="5%">报价级别</td>
	<td  width="7%">礼包名称</td>
	<td  width="12%">项目名称</td>
	<td  width="8%">品牌</td>
	<td  width="11%">型号</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">折前单价</td>
	<td  width="4%">优惠单价</td>
	<td  width="4%">升级折价</td>
	<td  width="3%">数量</td>
	<td  width="3%">类型</td>
	<td  width="19%">备注及工艺说明</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
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