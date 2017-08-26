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
	String tckd_tcsjcjb_dqbm=null;
	String tckd_tcsjcjb_bjjbbm=null;
	String tckd_tcsjcjb_bjjbbm1=null;
	String tccplbbm=null;
	String tckd_tcsjcjb_jldw=null;

	tckd_tcsjcjb_dqbm=request.getParameter("tckd_tcsjcjb_dqbm");
	if (tckd_tcsjcjb_dqbm!=null)
	{
		tckd_tcsjcjb_dqbm=cf.GB2Uni(tckd_tcsjcjb_dqbm);
		if (!(tckd_tcsjcjb_dqbm.equals("")))	wheresql+=" and  (tckd_tcsjcjb.dqbm='"+tckd_tcsjcjb_dqbm+"')";
	}
	tckd_tcsjcjb_bjjbbm=request.getParameter("tckd_tcsjcjb_bjjbbm");
	if (tckd_tcsjcjb_bjjbbm!=null)
	{
		tckd_tcsjcjb_bjjbbm=cf.GB2Uni(tckd_tcsjcjb_bjjbbm);
		if (!(tckd_tcsjcjb_bjjbbm.equals("")))	wheresql+=" and  (tckd_tcsjcjb.bjjbbm='"+tckd_tcsjcjb_bjjbbm+"')";
	}
	tckd_tcsjcjb_bjjbbm1=request.getParameter("tckd_tcsjcjb_bjjbbm1");
	if (tckd_tcsjcjb_bjjbbm1!=null)
	{
		tckd_tcsjcjb_bjjbbm1=cf.GB2Uni(tckd_tcsjcjb_bjjbbm1);
		if (!(tckd_tcsjcjb_bjjbbm1.equals("")))	wheresql+=" and  (tckd_tcsjcjb.bjjbbm1='"+tckd_tcsjcjb_bjjbbm1+"')";
	}
	tccplbbm=request.getParameter("tccplbbm");
	if (tccplbbm!=null)
	{
		tccplbbm=cf.GB2Uni(tccplbbm);
		if (!(tccplbbm.equals("")))	wheresql+=" and  (tckd_tcsjcjb.tccplbbm='"+tccplbbm+"')";
	}
	tckd_tcsjcjb_jldw=request.getParameter("tckd_tcsjcjb_jldw");
	if (tckd_tcsjcjb_jldw!=null)
	{
		tckd_tcsjcjb_jldw=cf.GB2Uni(tckd_tcsjcjb_jldw);
		if (!(tckd_tcsjcjb_jldw.equals("")))	wheresql+=" and  (tckd_tcsjcjb.jldw='"+tckd_tcsjcjb_jldw+"')";
	}

	String sjsfycx=null;
	sjsfycx=request.getParameter("sjsfycx");
	if (sjsfycx!=null)
	{
		if (!(sjsfycx.equals("")))	wheresql+=" and  (tckd_tcsjcjb.sjsfycx='"+sjsfycx+"')";
	}
	String cxkssj=null;
	cxkssj=request.getParameter("cxkssj");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (tckd_tcsjcjb.cxkssj>=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	cxkssj=request.getParameter("cxkssj2");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (tckd_tcsjcjb.cxkssj<=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	String cxjssj=null;
	cxjssj=request.getParameter("cxjssj");
	if (cxjssj!=null)
	{
		if (!(cxjssj.equals("")))	wheresql+="  and (tckd_tcsjcjb.cxjssj>=TO_DATE('"+cxjssj+"','YYYY/MM/DD'))";
	}
	cxjssj=request.getParameter("cxjssj2");
	if (cxjssj!=null)
	{
		if (!(cxjssj.equals("")))	wheresql+="  and (tckd_tcsjcjb.cxjssj<=TO_DATE('"+cxjssj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT tckd_tcsjcjb.dqbm,dm_dqbm.dqmc,tckd_tcsjcjb.bjjbbm,a.bjjbmc,tckd_tcsjcjb.bjjbbm1,b.bjjbmc bjjbmc1,tckd_tcsjcjb.tccplbbm,clxlmc,tckd_tcsjcjb.jldw,tckd_tcsjcjb.sjcj,DECODE(sjsfycx,'1','无促销','2','<font color=\"#FF0000\">无数量限制促销</font>','3','<font color=\"#0000FF\">有数量限制促销</font>') sjsfycx,cxkssj,cxjssj,cxsjcj  ";
	ls_sql+=" FROM tckd_tcsjcjb,dm_dqbm,jdm_bjjbbm a,jdm_bjjbbm b,jxc_clxlbm  ";
    ls_sql+=" where tckd_tcsjcjb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckd_tcsjcjb.bjjbbm=a.bjjbbm(+)";
    ls_sql+=" and tckd_tcsjcjb.bjjbbm1=b.bjjbbm(+)";
    ls_sql+=" and tckd_tcsjcjb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckd_tcsjcjb.dqbm,tckd_tcsjcjb.tccplbbm,tckd_tcsjcjb.bjjbbm,tckd_tcsjcjb.bjjbbm1";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tckd_tcsjcjbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","clxlmc","bjjbmc","bjjbmc1","jldw","sjcj","sjsfycx","cxsjcj","cxkssj","cxjssj"};
	pageObj.setDisColName(disColName);
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
  <B><font size="3">套餐升级差价表－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">地区</td>
	<td  width="14%">产品类别</td>
	<td  width="8%">原报价级别</td>
	<td  width="8%">升级报价级别</td>
	<td  width="6%">计量单位</td>
	<td  width="9%">升级差价</td>
	<td  width="11%">升级是否有促销</td>
	<td  width="8%">促销升级差价</td>
	<td  width="9%">促销开始时间</td>
	<td  width="9%">促销结束时间</td>
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