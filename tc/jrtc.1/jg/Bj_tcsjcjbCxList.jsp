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
	String bj_tcsjcjb_bjbbh=null;
	String bj_tcsjcjb_dqbm=null;
	String bj_tcsjcjb_bjjbbm=null;
	String bj_tcsjcjb_bjjbbm1=null;
	String tcsjflbm=null;
	String bj_tcsjcjb_jldw=null;
	bj_tcsjcjb_bjbbh=request.getParameter("bj_tcsjcjb_bjbbh");
	if (bj_tcsjcjb_bjbbh!=null)
	{
		bj_tcsjcjb_bjbbh=cf.GB2Uni(bj_tcsjcjb_bjbbh);
		if (!(bj_tcsjcjb_bjbbh.equals("")))	wheresql+=" and  (bj_tcsjcjb.bjbbh='"+bj_tcsjcjb_bjbbh+"')";
	}
	bj_tcsjcjb_dqbm=request.getParameter("bj_tcsjcjb_dqbm");
	if (bj_tcsjcjb_dqbm!=null)
	{
		bj_tcsjcjb_dqbm=cf.GB2Uni(bj_tcsjcjb_dqbm);
		if (!(bj_tcsjcjb_dqbm.equals("")))	wheresql+=" and  (bj_tcsjcjb.dqbm='"+bj_tcsjcjb_dqbm+"')";
	}
	bj_tcsjcjb_bjjbbm=request.getParameter("bj_tcsjcjb_bjjbbm");
	if (bj_tcsjcjb_bjjbbm!=null)
	{
		bj_tcsjcjb_bjjbbm=cf.GB2Uni(bj_tcsjcjb_bjjbbm);
		if (!(bj_tcsjcjb_bjjbbm.equals("")))	wheresql+=" and  (bj_tcsjcjb.bjjbbm='"+bj_tcsjcjb_bjjbbm+"')";
	}
	bj_tcsjcjb_bjjbbm1=request.getParameter("bj_tcsjcjb_bjjbbm1");
	if (bj_tcsjcjb_bjjbbm1!=null)
	{
		bj_tcsjcjb_bjjbbm1=cf.GB2Uni(bj_tcsjcjb_bjjbbm1);
		if (!(bj_tcsjcjb_bjjbbm1.equals("")))	wheresql+=" and  (bj_tcsjcjb.bjjbbm1='"+bj_tcsjcjb_bjjbbm1+"')";
	}
	tcsjflbm=request.getParameter("tcsjflbm");
	if (tcsjflbm!=null)
	{
		tcsjflbm=cf.GB2Uni(tcsjflbm);
		if (!(tcsjflbm.equals("")))	wheresql+=" and  (bj_tcsjcjb.tcsjflbm='"+tcsjflbm+"')";
	}
	bj_tcsjcjb_jldw=request.getParameter("bj_tcsjcjb_jldw");
	if (bj_tcsjcjb_jldw!=null)
	{
		bj_tcsjcjb_jldw=cf.GB2Uni(bj_tcsjcjb_jldw);
		if (!(bj_tcsjcjb_jldw.equals("")))	wheresql+=" and  (bj_tcsjcjb.jldw='"+bj_tcsjcjb_jldw+"')";
	}

	String sjsfycx=null;
	sjsfycx=request.getParameter("sjsfycx");
	if (sjsfycx!=null)
	{
		if (!(sjsfycx.equals("")))	wheresql+=" and  (bj_tcsjcjb.sjsfycx='"+sjsfycx+"')";
	}
	String cxkssj=null;
	cxkssj=request.getParameter("cxkssj");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (bj_tcsjcjb.cxkssj>=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	cxkssj=request.getParameter("cxkssj2");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (bj_tcsjcjb.cxkssj<=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	String cxjssj=null;
	cxjssj=request.getParameter("cxjssj");
	if (cxjssj!=null)
	{
		if (!(cxjssj.equals("")))	wheresql+="  and (bj_tcsjcjb.cxjssj>=TO_DATE('"+cxjssj+"','YYYY/MM/DD'))";
	}
	cxjssj=request.getParameter("cxjssj2");
	if (cxjssj!=null)
	{
		if (!(cxjssj.equals("")))	wheresql+="  and (bj_tcsjcjb.cxjssj<=TO_DATE('"+cxjssj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT bj_tcsjcjb.bjbbh,bj_tcsjcjb.dqbm,dm_dqbm.dqmc,bj_tcsjcjb.bjjbbm,a.bjjbmc,bj_tcsjcjb.bjjbbm1,b.bjjbmc bjjbmc1,bj_tcsjcjb.tcsjflbm,tcsjflmc,bj_tcsjcjb.jldw,bj_tcsjcjb.sjcj,DECODE(sjsfycx,'1','无促销','2','<font color=\"#FF0000\">无数量限制促销</font>','3','<font color=\"#0000FF\">有数量限制促销</font>') sjsfycx,cxkssj,cxjssj,cxsjcj  ";
	ls_sql+=" FROM bj_tcsjcjb,dm_dqbm,bdm_bjjbbm a,bdm_bjjbbm b,bj_tcsjflbm  ";
    ls_sql+=" where bj_tcsjcjb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcsjcjb.bjjbbm=a.bjjbbm(+)";
    ls_sql+=" and bj_tcsjcjb.bjjbbm1=b.bjjbbm(+)";
    ls_sql+=" and bj_tcsjcjb.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tcsjcjb.bjbbh,bj_tcsjcjb.dqbm,bj_tcsjcjb.tcsjflbm,bj_tcsjcjb.bjjbbm,bj_tcsjcjb.bjjbbm1";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_tcsjcjbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"bjbbh","dqmc","tcsjflmc","bjjbmc","bjjbmc1","jldw","sjcj","sjsfycx","cxsjcj","cxkssj","cxjssj"};
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
	<td  width="10%">报价版本号</td>
	<td  width="8%">地区</td>
	<td  width="14%">套餐升级分类</td>
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