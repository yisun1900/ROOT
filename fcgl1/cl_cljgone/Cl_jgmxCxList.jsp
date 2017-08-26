<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
%>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cl_jgmx_dwbh=null;
	String cl_jgmx_clbm=null;
	String cl_jgmx_cjjsj=null;
	String cl_jgmx_gdj=null;
	String cl_jgmx_ckmc=null;
	String cl_jgmx_sfrk=null;
	String cl_clbm_clmc=null;
	String cl_clbm_clgg=null;
	String cl_clbm_jldwmc=null;
	String cl_clbm_qybfb=null;
	String cl_clbm_lrjsfs=null;
	String cl_clbm_lrbfb=null;
	String cl_clbm_cldlmc=null;

	String xjgsfgx=null;
	xjgsfgx=request.getParameter("xjgsfgx");
	if (xjgsfgx!=null)
	{
		xjgsfgx=cf.GB2Uni(xjgsfgx);
		if (!(xjgsfgx.equals("")))	wheresql+=" and  (cl_jgmx.xjgsfgx='"+xjgsfgx+"')";
	}

	String wxr=null;
	wxr=request.getParameter("wxr");
	if (wxr!=null)
	{
		wxr=cf.GB2Uni(wxr);
		if (!(wxr.equals("")))	wheresql+=" and  (cl_clbm.wxr='"+wxr+"')";
	}
	
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
	cl_jgmx_cjjsj=request.getParameter("cl_jgmx_cjjsj");
	if (cl_jgmx_cjjsj!=null)
	{
		cl_jgmx_cjjsj=cl_jgmx_cjjsj.trim();
		if (!(cl_jgmx_cjjsj.equals("")))	wheresql+=" and  (cl_jgmx.cjjsj="+cl_jgmx_cjjsj+") ";
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
		if (!(cl_clbm_clmc.equals("")))	wheresql+=" and  (cl_clbm.clmc like '%"+cl_clbm_clmc+"%')";
	}
	cl_clbm_clgg=request.getParameter("cl_clbm_clgg");
	if (cl_clbm_clgg!=null)
	{
		cl_clbm_clgg=cf.GB2Uni(cl_clbm_clgg);
		if (!(cl_clbm_clgg.equals("")))	wheresql+=" and  (cl_clbm.clgg like '%"+cl_clbm_clgg+"%')";
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
		ls_sql="SELECT sq_dwxx.dwmc,cl_clbm.cldlmc,cl_jgmx.clbm,cl_clbm.clmc,cl_clbm.clgg,cl_clbm.jldwmc, DECODE(cl_clbm.lrjsfs,'1','差价','2','百分比'),cl_clbm.lrbfb,cl_jgmx.cjjsj,cl_jgmx.gdj,DECODE(xjgsfgx,'1','未更新','2','更新') xjgsfgx,xjgsxsj,xcjjsj,xgdj, DECODE(cl_jgmx.sfrk,'Y','是','N','否'),cl_jgmx.ckmc,cl_jgmx.tzr,cl_jgmx.tzsj ";
	}
	else{
		ls_sql="SELECT sq_dwxx.dwmc,cl_clbm.cldlmc,cl_jgmx.clbm,cl_clbm.clmc,cl_clbm.clgg,cl_clbm.jldwmc, DECODE(cl_clbm.lrjsfs,'1','差价','2','百分比'),cl_clbm.lrbfb,0 as cjjsj,cl_jgmx.gdj,DECODE(xjgsfgx,'1','未更新','2','更新') xjgsfgx,xjgsxsj,0 xcjjsj,xgdj, DECODE(cl_jgmx.sfrk,'Y','是','N','否'),cl_jgmx.ckmc,cl_jgmx.tzr,cl_jgmx.tzsj";
	}
	
	ls_sql+=" FROM sq_dwxx,cl_clbm,cl_jgmx  ";
    ls_sql+=" where cl_jgmx.dwbh=sq_dwxx.dwbh and cl_jgmx.clbm=cl_clbm.clbm";

 	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and cl_jgmx.dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" andcl_jgmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
    ls_sql+=" order by cl_jgmx.dwbh,cl_clbm.cldlmc,cl_jgmx.clbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cl_jgmxCxList.jsp","","","");
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">分公司</td>
	<td  width="6%">材料大类</td>
	<td  width="6%">材料编码</td>
	<td  width="11%">材料名称</td>
	<td  width="9%">材料规格</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">利润计算方式</td>
	<td  width="4%">利润百分比</td>
	<td  width="5%">与厂家结算价</td>
	<td  width="5%">工队价</td>

	<td  width="4%">新价格是否更新</td>
	<td  width="5%">新价格生效时间</td>
	<td  width="5%">新与厂家结算价</td>
	<td  width="5%">新工队价</td>

	<td  width="4%">是否入库</td>
	<td  width="8%">仓库名称</td>
	<td  width="4%">调整人</td>
	<td  width="5%">调整时间</td>
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