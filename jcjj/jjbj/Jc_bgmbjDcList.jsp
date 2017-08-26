<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String xcmbm=null;
	String xcmlxbm=null;
	String bklxxh=null;
	String mbcl=null;
	String xbpz=null;
	String zsxt=null;
	String jjfs=null;
	String pmdj=null;
	String ymdj=null;
	String zpmc=null;
	String lrr=null;
	String lrsj=null;
	xcmbm=request.getParameter("xcmbm");
	if (xcmbm!=null)
	{
		xcmbm=cf.GB2Uni(xcmbm);
		if (!(xcmbm.equals("")))	wheresql+=" and  (jc_bgmbj.xcmbm='"+xcmbm+"')";
	}
	xcmlxbm=request.getParameter("xcmlxbm");
	if (xcmlxbm!=null)
	{
		xcmlxbm=cf.GB2Uni(xcmlxbm);
		if (!(xcmlxbm.equals("")))	wheresql+=" and  (jc_bgmbj.xcmlxbm='"+xcmlxbm+"')";
	}
	bklxxh=request.getParameter("bklxxh");
	if (bklxxh!=null)
	{
		bklxxh=cf.GB2Uni(bklxxh);
		if (!(bklxxh.equals("")))	wheresql+=" and  (jc_bgmbj.bklxxh='"+bklxxh+"')";
	}
	mbcl=request.getParameter("mbcl");
	if (mbcl!=null)
	{
		mbcl=cf.GB2Uni(mbcl);
		if (!(mbcl.equals("")))	wheresql+=" and  (jc_bgmbj.mbcl='"+mbcl+"')";
	}
	xbpz=request.getParameter("xbpz");
	if (xbpz!=null)
	{
		xbpz=cf.GB2Uni(xbpz);
		if (!(xbpz.equals("")))	wheresql+=" and  (jc_bgmbj.xbpz='"+xbpz+"')";
	}
	zsxt=request.getParameter("zsxt");
	if (zsxt!=null)
	{
		zsxt=cf.GB2Uni(zsxt);
		if (!(zsxt.equals("")))	wheresql+=" and  (jc_bgmbj.zsxt='"+zsxt+"')";
	}
	jjfs=request.getParameter("jjfs");
	if (jjfs!=null)
	{
		jjfs=cf.GB2Uni(jjfs);
		if (!(jjfs.equals("")))	wheresql+=" and  (jc_bgmbj.jjfs='"+jjfs+"')";
	}
	pmdj=request.getParameter("pmdj");
	if (pmdj!=null)
	{
		pmdj=pmdj.trim();
		if (!(pmdj.equals("")))	wheresql+=" and  (jc_bgmbj.pmdj="+pmdj+") ";
	}
	ymdj=request.getParameter("ymdj");
	if (ymdj!=null)
	{
		ymdj=ymdj.trim();
		if (!(ymdj.equals("")))	wheresql+=" and  (jc_bgmbj.ymdj="+ymdj+") ";
	}
	zpmc=request.getParameter("zpmc");
	if (zpmc!=null)
	{
		zpmc=cf.GB2Uni(zpmc);
		if (!(zpmc.equals("")))	wheresql+=" and  (jc_bgmbj.zpmc='"+zpmc+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (jc_bgmbj.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jc_bgmbj.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jc_bgmbj.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT '',xcmlxmc,bklxxh,mbcl,xbpz,zsxt,DECODE(jjfs,'1','平米单价','2','平米单价加封边延米单价') jjfs,pmdj,ymdj,jc_bgmbj.zpmc,bz";
	ls_sql+=" FROM jc_bgmbj,jdm_xcmlxbm  ";
    ls_sql+=" where jc_bgmbj.xcmlxbm=jdm_xcmlxbm.xcmlxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by xcmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<table border="1" width="200%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="5%">型材门类型</td>
	<td align="left" width="9%"><strong>推拉门</strong>：边框型号；
	<strong>吸塑</strong>：刀型；<strong>包覆</strong>：刀型；<strong>板材铝门</strong>：门型</td>
	<td align="left" width="11%"><strong>推拉门</strong>：材料；<strong>吸塑</strong>：花色；<strong>包覆</strong>：花色；
	<strong>板材铝门</strong>：材料</td>
	<td  width="9%">芯板配置</td>
	<td  width="11%">装饰线条</td>
	<td  width="5%">计价方式</td>
	<td  width="4%">平米单价</td>
	<td  width="4%">延米单价</td>
	<td  width="8%">照片名称</td>
	<td  width="32%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
%> 
</table>

</body>
</html>