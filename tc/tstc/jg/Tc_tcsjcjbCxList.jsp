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
	//String tc_tcsjcjb_bjbbh=null;
	String tc_tcsjcjb_dqbm=null;
	String tc_tcsjcjb_bjjbbm=null;
	String tc_tcsjcjb_bjjbbm1=null;
	String tcsjflbm=null;
	String tc_tcsjcjb_jldw=null;
	//tc_tcsjcjb_bjbbh=request.getParameter("tc_tcsjcjb_bjbbh");
	//if (tc_tcsjcjb_bjbbh!=null)
	//{
	//	tc_tcsjcjb_bjbbh=cf.GB2Uni(tc_tcsjcjb_bjbbh);
	//	if (!(tc_tcsjcjb_bjbbh.equals("")))	wheresql+=" and  (tc_tcsjcjb.bjbbh='"+tc_tcsjcjb_bjbbh+"')";
	//}
	tc_tcsjcjb_dqbm=request.getParameter("tc_tcsjcjb_dqbm");
	if (tc_tcsjcjb_dqbm!=null)
	{
		tc_tcsjcjb_dqbm=cf.GB2Uni(tc_tcsjcjb_dqbm);
		if (!(tc_tcsjcjb_dqbm.equals("")))	wheresql+=" and  (tc_tcsjcjb.dqbm='"+tc_tcsjcjb_dqbm+"')";
	}
	tc_tcsjcjb_bjjbbm=request.getParameter("tc_tcsjcjb_bjjbbm");
	if (tc_tcsjcjb_bjjbbm!=null)
	{
		tc_tcsjcjb_bjjbbm=cf.GB2Uni(tc_tcsjcjb_bjjbbm);
		if (!(tc_tcsjcjb_bjjbbm.equals("")))	wheresql+=" and  (tc_tcsjcjb.bjjbbm='"+tc_tcsjcjb_bjjbbm+"')";
	}
	tc_tcsjcjb_bjjbbm1=request.getParameter("tc_tcsjcjb_bjjbbm1");
	if (tc_tcsjcjb_bjjbbm1!=null)
	{
		tc_tcsjcjb_bjjbbm1=cf.GB2Uni(tc_tcsjcjb_bjjbbm1);
		if (!(tc_tcsjcjb_bjjbbm1.equals("")))	wheresql+=" and  (tc_tcsjcjb.bjjbbm1='"+tc_tcsjcjb_bjjbbm1+"')";
	}
	tcsjflbm=request.getParameter("tcsjflbm");
	if (tcsjflbm!=null)
	{
		tcsjflbm=cf.GB2Uni(tcsjflbm);
		if (!(tcsjflbm.equals("")))	wheresql+=" and  (tc_tcsjcjb.tcsjflbm='"+tcsjflbm+"')";
	}
	tc_tcsjcjb_jldw=request.getParameter("tc_tcsjcjb_jldw");
	if (tc_tcsjcjb_jldw!=null)
	{
		tc_tcsjcjb_jldw=cf.GB2Uni(tc_tcsjcjb_jldw);
		if (!(tc_tcsjcjb_jldw.equals("")))	wheresql+=" and  (tc_tcsjcjb.jldw='"+tc_tcsjcjb_jldw+"')";
	}

	String sjsfycx=null;
	sjsfycx=request.getParameter("sjsfycx");
	if (sjsfycx!=null)
	{
		if (!(sjsfycx.equals("")))	wheresql+=" and  (tc_tcsjcjb.sjsfycx='"+sjsfycx+"')";
	}
	String cxkssj=null;
	cxkssj=request.getParameter("cxkssj");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (tc_tcsjcjb.cxkssj>=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	cxkssj=request.getParameter("cxkssj2");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (tc_tcsjcjb.cxkssj<=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	String cxjssj=null;
	cxjssj=request.getParameter("cxjssj");
	if (cxjssj!=null)
	{
		if (!(cxjssj.equals("")))	wheresql+="  and (tc_tcsjcjb.cxjssj>=TO_DATE('"+cxjssj+"','YYYY/MM/DD'))";
	}
	cxjssj=request.getParameter("cxjssj2");
	if (cxjssj!=null)
	{
		if (!(cxjssj.equals("")))	wheresql+="  and (tc_tcsjcjb.cxjssj<=TO_DATE('"+cxjssj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_tcsjcjb.dqbm,dm_dqbm.dqmc,tc_tcsjcjb.bjjbbm,a.bjjbmc,tc_tcsjcjb.bjjbbm1,b.bjjbmc bjjbmc1,tc_tcsjcjb.tcsjflbm,tcsjflmc,tc_tcsjcjb.jldw,tc_tcsjcjb.sjcj,DECODE(sjsfycx,'1','无促销','2','<font color=\"#FF0000\">无数量限制促销</font>','3','<font color=\"#0000FF\">有数量限制促销</font>') sjsfycx,cxkssj,cxjssj,cxsjcj  ";
	ls_sql+=" FROM tc_tcsjcjb,dm_dqbm,bdm_bjjbbm a,bdm_bjjbbm b,bdm_tcsjflbm  ";
    ls_sql+=" where tc_tcsjcjb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_tcsjcjb.bjjbbm=a.bjjbbm(+)";
    ls_sql+=" and tc_tcsjcjb.bjjbbm1=b.bjjbbm(+)";
    ls_sql+=" and tc_tcsjcjb.tcsjflbm=bdm_tcsjflbm.tcsjflbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by  tc_tcsjcjb.dqbm,tc_tcsjcjb.tcsjflbm,tc_tcsjcjb.bjjbbm,tc_tcsjcjb.bjjbbm1";
    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("Tc_tcsjcjbList.jsp","","","");
//	pageObj.setPageRow(100);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","tcsjflmc","bjjbmc","bjjbmc1","jldw","sjcj","sjsfycx","cxsjcj","cxkssj","cxjssj"};
	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"dqbm","bjjbbm","bjjbbm1","tcsjflbm"};
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
  <B><font size="3">套餐升级差价表－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">地区</td>
	<td  width="13%">套餐升级分类</td>
	<td  width="7%">原报价级别</td>
	<td  width="7%">升级报价级别</td>
	<td  width="6%">计量单位</td>
	<td  width="8%">升级差价</td>
	<td  width="9%">升级是否有促销</td>
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