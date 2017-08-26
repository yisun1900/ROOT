<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";

	String cldlbm=null;
	String clxlbm=null;
	String clbm=null;
	String nbbm=null;

	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (jxc_clbm.cldlbm='"+cldlbm+"')";
	}
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (jxc_clbm.clxlbm='"+clxlbm+"')";
	}
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (jxc_clbm.clbm='"+clbm+"')";
	}
	nbbm=request.getParameter("nbbm");
	if (nbbm!=null)
	{
		nbbm=cf.GB2Uni(nbbm);
		if (!(nbbm.equals("")))	wheresql+=" and  (jxc_clbm.nbbm='"+nbbm+"')";
	}


	String clmc=null;
	String xh=null;
	String gg=null;
	String ppmc=null;
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (jxc_clbm.clmc like '%"+clmc+"%')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=cf.GB2Uni(xh);
		if (!(xh.equals("")))	wheresql+=" and  (jxc_clbm.xh like '%"+xh+"%')";
	}
	gg=request.getParameter("gg");
	if (gg!=null)
	{
		gg=cf.GB2Uni(gg);
		if (!(gg.equals("")))	wheresql+=" and  (jxc_clbm.gg like '%"+gg+"%')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jxc_clbm.ppmc='"+ppmc+"')";
	}

	String jldwbm=null;
	String bzjldwbm=null;
	jldwbm=request.getParameter("jldwbm");
	if (jldwbm!=null)
	{
		jldwbm=cf.GB2Uni(jldwbm);
		if (!(jldwbm.equals("")))	wheresql+=" and  (jxc_clbm.jldwbm='"+jldwbm+"')";
	}
	bzjldwbm=request.getParameter("bzjldwbm");
	if (bzjldwbm!=null)
	{
		bzjldwbm=cf.GB2Uni(bzjldwbm);
		if (!(bzjldwbm.equals("")))	wheresql+=" and  (jxc_clbm.bzjldwbm='"+bzjldwbm+"')";
	}
	
	String djzl=null;
	String cgzq=null;
	String bzq=null;
	String bztxq=null;
	String lrsj=null;
	djzl=request.getParameter("djzl");
	if (djzl!=null)
	{
		djzl=djzl.trim();
		if (!(djzl.equals("")))	wheresql+=" and (jxc_clbm.djzl<="+djzl+") ";
	}
	djzl=request.getParameter("djzl2");
	if (djzl!=null)
	{
		djzl=djzl.trim();
		if (!(djzl.equals("")))	wheresql+=" and (jxc_clbm.djzl>="+djzl+") ";
	}
	cgzq=request.getParameter("cgzq");
	if (cgzq!=null)
	{
		cgzq=cgzq.trim();
		if (!(cgzq.equals("")))	wheresql+=" and (jxc_clbm.cgzq<="+cgzq+") ";
	}
	cgzq=request.getParameter("cgzq2");
	if (cgzq!=null)
	{
		cgzq=cgzq.trim();
		if (!(cgzq.equals("")))	wheresql+=" and (jxc_clbm.cgzq>="+cgzq+") ";
	}
	bzq=request.getParameter("bzq");
	if (bzq!=null)
	{
		bzq=bzq.trim();
		if (!(bzq.equals("")))	wheresql+=" and (jxc_clbm.bzq<="+bzq+") ";
	}
	bzq=request.getParameter("bzq2");
	if (bzq!=null)
	{
		bzq=bzq.trim();
		if (!(bzq.equals("")))	wheresql+=" and (jxc_clbm.bzq>="+bzq+") ";
	}
	bztxq=request.getParameter("bztxq");
	if (bztxq!=null)
	{
		bztxq=bztxq.trim();
		if (!(bztxq.equals("")))	wheresql+=" and (jxc_clbm.bztxq<="+bztxq+") ";
	}
	bztxq=request.getParameter("bztxq2");
	if (bztxq!=null)
	{
		bztxq=bztxq.trim();
		if (!(bztxq.equals("")))	wheresql+=" and (jxc_clbm.bztxq>="+bztxq+") ";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jxc_clbm.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jxc_clbm.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}


	ls_sql="SELECT cldlbm,clxlbm,nbbm,clmc,xh,gg,jldwbm,bzjldwbm,bzgg,djzl,clcd,clkd,clgd,cgzq,bzq,bztxq,ppmc,DECODE(cglb,'J','集团采购','D','地方采购'),jxc_clbm.bz ";
	ls_sql+=" FROM jxc_clbm  ";
    ls_sql+=" where jxc_clbm.cllb='1'";//0：主材；1：辅材
    ls_sql+=wheresql;
    ls_sql+=" order by cldlbm,clxlbm,nbbm,clmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//设置每页显示记录数


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">材料大类</td>
	<td  width="5%">材料小类</td>
	<td  width="5%">内部编码</td>
	<td  width="8%">材料名称</td>

	<td  width="5%">型号</td>
	<td  width="5%">规格</td>
	<td  width="3%">计量单位</td>
	<td  width="3%">包装计量单位</td>
	<td  width="3%">包装规格</td>
	<td  width="3%">单件重量（KG）</td>
	<td  width="3%">长度(CM)</td>
	<td  width="3%">宽度(CM)</td>
	<td  width="3%">高度(CM)</td>
	<td  width="3%">采购周期（天）</td>
	<td  width="3%">保质期（天）</td>
	<td  width="3%">保质提醒期（天）</td>
	<td  width="8%">子品牌</td>
	<td  width="3%">采购类别</td>
	<td  width="11%">备注</td>


</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>
</body>
</html>