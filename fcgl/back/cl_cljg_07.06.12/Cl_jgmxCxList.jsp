<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
%>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cl_jgmx_dwbh=null;
	String cl_jgmx_clbm=null;
	String cl_jgmx_cj=null;
	String cl_jgmx_cjjsj=null;
	String cl_jgmx_fgsdj=null;
	String cl_jgmx_gdj=null;
	String cl_jgmx_ckmc=null;
	String cl_jgmx_sfrk=null;
	String cl_clbm_clmc=null;
	String cl_clbm_clgg=null;
	String cl_clbm_cldj=null;
	String cl_clbm_jldwmc=null;
	String cl_clbm_qybfb=null;
	String cl_clbm_lrjsfs=null;
	String cl_clbm_lrbfb=null;
	String cl_clbm_cldlmc=null;
	cl_jgmx_dwbh=request.getParameter("cl_jgmx_dwbh");
	if (cl_jgmx_dwbh!=null)
	{
		cl_jgmx_dwbh=cf.GB2Uni(cl_jgmx_dwbh);
		if (!(cl_jgmx_dwbh.equals("")))	wheresql+=" and  (cl_jgmx.dwbh='"+cl_jgmx_dwbh+"')";
	}
	cl_jgmx_clbm=request.getParameter("cl_jgmx_clbm");
	if (cl_jgmx_clbm!=null)
	{
		cl_jgmx_clbm=cf.GB2Uni(cl_jgmx_clbm);
		if (!(cl_jgmx_clbm.equals("")))	wheresql+=" and  (cl_jgmx.clbm='"+cl_jgmx_clbm+"')";
	}
	cl_jgmx_cj=request.getParameter("cl_jgmx_cj");
	if (cl_jgmx_cj!=null)
	{
		cl_jgmx_cj=cl_jgmx_cj.trim();
		if (!(cl_jgmx_cj.equals("")))	wheresql+=" and  (cl_jgmx.cj="+cl_jgmx_cj+") ";
	}
	cl_jgmx_cjjsj=request.getParameter("cl_jgmx_cjjsj");
	if (cl_jgmx_cjjsj!=null)
	{
		cl_jgmx_cjjsj=cl_jgmx_cjjsj.trim();
		if (!(cl_jgmx_cjjsj.equals("")))	wheresql+=" and  (cl_jgmx.cjjsj="+cl_jgmx_cjjsj+") ";
	}
	cl_jgmx_fgsdj=request.getParameter("cl_jgmx_fgsdj");
	if (cl_jgmx_fgsdj!=null)
	{
		cl_jgmx_fgsdj=cl_jgmx_fgsdj.trim();
		if (!(cl_jgmx_fgsdj.equals("")))	wheresql+=" and  (cl_jgmx.fgsdj="+cl_jgmx_fgsdj+") ";
	}
	cl_jgmx_gdj=request.getParameter("cl_jgmx_gdj");
	if (cl_jgmx_gdj!=null)
	{
		cl_jgmx_gdj=cl_jgmx_gdj.trim();
		if (!(cl_jgmx_gdj.equals("")))	wheresql+=" and  (cl_jgmx.gdj="+cl_jgmx_gdj+") ";
	}
	cl_jgmx_ckmc=request.getParameter("cl_jgmx_ckmc");
	if (cl_jgmx_ckmc!=null)
	{
		cl_jgmx_ckmc=cf.GB2Uni(cl_jgmx_ckmc);
		if (!(cl_jgmx_ckmc.equals("")))	wheresql+=" and  (cl_jgmx.ckmc='"+cl_jgmx_ckmc+"')";
	}
	cl_jgmx_sfrk=request.getParameter("cl_jgmx_sfrk");
	if (cl_jgmx_sfrk!=null)
	{
		cl_jgmx_sfrk=cf.GB2Uni(cl_jgmx_sfrk);
		if (!(cl_jgmx_sfrk.equals("")))	wheresql+=" and  (cl_jgmx.sfrk='"+cl_jgmx_sfrk+"')";
	}
	cl_clbm_clmc=request.getParameter("cl_clbm_clmc");
	if (cl_clbm_clmc!=null)
	{
		cl_clbm_clmc=cf.GB2Uni(cl_clbm_clmc);
		if (!(cl_clbm_clmc.equals("")))	wheresql+=" and  (cl_clbm.clmc='"+cl_clbm_clmc+"')";
	}
	cl_clbm_clgg=request.getParameter("cl_clbm_clgg");
	if (cl_clbm_clgg!=null)
	{
		cl_clbm_clgg=cf.GB2Uni(cl_clbm_clgg);
		if (!(cl_clbm_clgg.equals("")))	wheresql+=" and  (cl_clbm.clgg='"+cl_clbm_clgg+"')";
	}
	cl_clbm_cldj=request.getParameter("cl_clbm_cldj");
	if (cl_clbm_cldj!=null)
	{
		cl_clbm_cldj=cl_clbm_cldj.trim();
		if (!(cl_clbm_cldj.equals("")))	wheresql+=" and  (cl_clbm.cldj="+cl_clbm_cldj+") ";
	}
	cl_clbm_jldwmc=request.getParameter("cl_clbm_jldwmc");
	if (cl_clbm_jldwmc!=null)
	{
		cl_clbm_jldwmc=cf.GB2Uni(cl_clbm_jldwmc);
		if (!(cl_clbm_jldwmc.equals("")))	wheresql+=" and  (cl_clbm.jldwmc='"+cl_clbm_jldwmc+"')";
	}
	cl_clbm_qybfb=request.getParameter("cl_clbm_qybfb");
	if (cl_clbm_qybfb!=null)
	{
		cl_clbm_qybfb=cl_clbm_qybfb.trim();
		if (!(cl_clbm_qybfb.equals("")))	wheresql+=" and  (cl_clbm.qybfb="+cl_clbm_qybfb+") ";
	}
	cl_clbm_lrjsfs=request.getParameter("cl_clbm_lrjsfs");
	if (cl_clbm_lrjsfs!=null)
	{
		cl_clbm_lrjsfs=cf.GB2Uni(cl_clbm_lrjsfs);
		if (!(cl_clbm_lrjsfs.equals("")))	wheresql+=" and  (cl_clbm.lrjsfs='"+cl_clbm_lrjsfs+"')";
	}
	cl_clbm_lrbfb=request.getParameter("cl_clbm_lrbfb");
	if (cl_clbm_lrbfb!=null)
	{
		cl_clbm_lrbfb=cl_clbm_lrbfb.trim();
		if (!(cl_clbm_lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb="+cl_clbm_lrbfb+") ";
	}
	cl_clbm_cldlmc=request.getParameter("cl_clbm_cldlmc");
	if (cl_clbm_cldlmc!=null)
	{
		cl_clbm_cldlmc=cf.GB2Uni(cl_clbm_cldlmc);
		if (!(cl_clbm_cldlmc.equals("")))	wheresql+=" and  (cl_clbm.cldlmc='"+cl_clbm_cldlmc+"')";
	}

	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		ls_sql="SELECT cl_jgmx.dwbh as dwbh,sq_dwxx.dwmc as sq_dwxx_dwmc,cl_jgmx.clbm as clbm,cl_jgmx.cj as cl_jgmx_cj,cl_jgmx.cjjsj as cl_jgmx_cjjsj,cl_jgmx.fgsdj as cl_jgmx_fgsdj,cl_jgmx.gdj as cl_jgmx_gdj,cl_jgmx.ckmc as cl_jgmx_ckmc, DECODE(cl_jgmx.sfrk,'Y','是','N','否') as cl_jgmx_sfrk,cl_clbm.clmc as cl_clbm_clmc,cl_clbm.clgg as cl_clbm_clgg,cl_clbm.cldj as cl_clbm_cldj,cl_clbm.jldwmc as cl_clbm_jldwmc, DECODE(cl_clbm.lrjsfs,'1','差价方式','2','百分比方式') as cl_clbm_lrjsfs,cl_clbm.lrbfb as cl_clbm_lrbfb,cl_clbm.cldlmc as cl_clbm_cldlmc  ";
	}
	else{
		ls_sql="SELECT cl_jgmx.dwbh as dwbh,sq_dwxx.dwmc as sq_dwxx_dwmc,cl_jgmx.clbm as clbm,cl_jgmx.cj as cl_jgmx_cj,0 as cl_jgmx_cjjsj,cl_jgmx.fgsdj as cl_jgmx_fgsdj,cl_jgmx.gdj as cl_jgmx_gdj,cl_jgmx.ckmc as cl_jgmx_ckmc, DECODE(cl_jgmx.sfrk,'Y','是','N','否') as cl_jgmx_sfrk,cl_clbm.clmc as cl_clbm_clmc,cl_clbm.clgg as cl_clbm_clgg,cl_clbm.cldj as cl_clbm_cldj,cl_clbm.jldwmc as cl_clbm_jldwmc, DECODE(cl_clbm.lrjsfs,'1','差价方式','2','百分比方式') as cl_clbm_lrjsfs,cl_clbm.lrbfb as cl_clbm_lrbfb,cl_clbm.cldlmc as cl_clbm_cldlmc  ";
	}
	
	ls_sql+=" FROM sq_dwxx,cl_clbm,cl_jgmx  ";
    ls_sql+=" where cl_jgmx.dwbh=sq_dwxx.dwbh and cl_jgmx.clbm=cl_clbm.clbm";
    ls_sql+=wheresql;
    ls_sql+=" order by cl_jgmx.dwbh,cl_clbm.cldlmc,cl_jgmx.clbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cl_jgmxCxList.jsp","SelectCxCl_jgmx.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"sq_dwxx_dwmc","cl_clbm_cldlmc","cl_clbm_clmc","cl_clbm_clgg","cl_clbm_cldj","cl_clbm_jldwmc","cl_clbm_lrjsfs","cl_clbm_lrbfb","cl_jgmx_cj","cl_jgmx_cjjsj","cl_jgmx_fgsdj","cl_jgmx_gdj","cl_jgmx_ckmc","cl_jgmx_sfrk"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"dwbh","clbm"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sq_dwxx_dwmc","1");//列参数对象加入Hash表
	spanColHash.put("cl_clbm_cldlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">分公司</td>
	<td  width="9%">材料大类</td>
	<td  width="11%">材料名称</td>
	<td  width="11%">材料规格</td>
	<td  width="5%">材料单价</td>
	<td  width="5%">计量单位</td>
	<td  width="6%">利润计算方式</td>
	<td  width="5%">利润百分比</td>
	<td  width="5%">厂价</td>
	<td  width="5%">与厂家结算价</td>
	<td  width="5%">分公司材料单价</td>
	<td  width="5%">工队价</td>
	<td  width="10%">仓库名称</td>
	<td  width="4%">是否入库</td>
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