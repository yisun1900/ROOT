<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj= new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String cpbm=null;
	String cpmc=null;
	String dqbm=null;
	String jgwzbm=null;
	String xh=null;
	String gg=null;
	String ppmc=null;
	String gysmc=null;
	String lrr=null;
	String lrsj=null;

	String tcmc=null;
	tcmc=request.getParameter("tcmc");
	if (tcmc!=null)
	{
		tcmc=cf.GB2Uni(tcmc);
		if (!(tcmc.equals("")))	wheresql+=" and  (tcmc like '%"+tcmc+"%')";
	}
	
	cpbm=request.getParameter("cpbm");
	if (cpbm!=null)
	{
		cpbm=cf.GB2Uni(cpbm);
		if (!(cpbm.equals("")))	wheresql+=" and  (cpbm='"+cpbm+"')";
	}
	cpmc=request.getParameter("cpmc");
	if (cpmc!=null)
	{
		cpmc=cf.GB2Uni(cpmc);
		if (!(cpmc.equals("")))	wheresql+=" and  (cpmc like '%"+cpmc+"%')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_cltczcmx.dqbm='"+dqbm+"')";
	}
	jgwzbm=request.getParameter("jgwzbm");
	if (jgwzbm!=null)
	{
		jgwzbm=cf.GB2Uni(jgwzbm);
		if (!(jgwzbm.equals("")))	wheresql+=" and  (jgwzbm='"+jgwzbm+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=cf.GB2Uni(xh);
		if (!(xh.equals("")))	wheresql+=" and  (xh='"+xh+"')";
	}
	gg=request.getParameter("gg");
	if (gg!=null)
	{
		gg=cf.GB2Uni(gg);
		if (!(gg.equals("")))	wheresql+=" and  (gg='"+gg+"')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (ppmc='"+ppmc+"')";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (gysmc='"+gysmc+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tcmc,jgwzbm,cpmc,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,bz ";
	ls_sql+=" FROM bj_cltczcmx ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_cltczcmx.dqbm,jgwzbm,cpmc,xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="190%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">套餐名称</td>
	<td  width="4%">房间位置</td>
	<td  width="9%">产品名称</td>
	<td  width="9%">型号</td>
	<td  width="9%">规格</td>
	<td  width="6%">品牌</td>
	<td  width="12%">供应商名称</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">原单价</td>
	<td  width="4%">套餐单价</td>
	<td  width="4%">升级折价</td>
	<td  width="4%">结算价</td>
	<td  width="12%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
</body>
</html>