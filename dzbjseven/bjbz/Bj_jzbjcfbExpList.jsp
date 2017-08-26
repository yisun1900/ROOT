<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='150133'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[导出－拆分报价]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String dqbm=null;
	String bjjbbm=null;
	String bj_jzbjcfb_fxmbh=null;
	String bj_jzbjcfb_xmbh=null;
	String bj_jzbjcfb_xmmc=null;
	String bj_jzbjcfb_xmdlbm=null;
	String bj_jzbjcfb_xmxlbm=null;
	String bj_jzbjcfb_smbm=null;
	String bj_jzbjcfb_lrsj=null;

	
	String fxmmc=null;
	fxmmc=request.getParameter("fxmmc");
	if (fxmmc!=null)
	{
		fxmmc=cf.GB2Uni(fxmmc);
		if (!(fxmmc.equals("")))	wheresql+=" and  (bj_jzbjb.fxmmc like '%"+bj_jzbjcfb_xmmc+"%')";
	}
	
	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (dqbm!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (bj_jzbjcfb.bjbbh='"+bjbbh+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.dqbm='"+dqbm+"')";
	}
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.bjjbbm='"+bjjbbm+"')";
	}
	bj_jzbjcfb_fxmbh=request.getParameter("bj_jzbjcfb_fxmbh");
	if (bj_jzbjcfb_fxmbh!=null)
	{
		bj_jzbjcfb_fxmbh=cf.GB2Uni(bj_jzbjcfb_fxmbh);
		if (!(bj_jzbjcfb_fxmbh.equals("")))	wheresql+=" and  (bj_jzbjcfb.fxmbh='"+bj_jzbjcfb_fxmbh+"')";
	}
	bj_jzbjcfb_xmbh=request.getParameter("bj_jzbjcfb_xmbh");
	if (bj_jzbjcfb_xmbh!=null)
	{
		bj_jzbjcfb_xmbh=cf.GB2Uni(bj_jzbjcfb_xmbh);
		if (!(bj_jzbjcfb_xmbh.equals("")))	wheresql+=" and  (bj_jzbjcfb.xmbh='"+bj_jzbjcfb_xmbh+"')";
	}
	bj_jzbjcfb_xmmc=request.getParameter("bj_jzbjcfb_xmmc");
	if (bj_jzbjcfb_xmmc!=null)
	{
		bj_jzbjcfb_xmmc=cf.GB2Uni(bj_jzbjcfb_xmmc);
		if (!(bj_jzbjcfb_xmmc.equals("")))	wheresql+=" and  (bj_jzbjcfb.xmmc like '%"+bj_jzbjcfb_xmmc+"%')";
	}
	bj_jzbjcfb_xmdlbm=request.getParameter("bj_jzbjcfb_xmdlbm");
	if (bj_jzbjcfb_xmdlbm!=null)
	{
		bj_jzbjcfb_xmdlbm=cf.GB2Uni(bj_jzbjcfb_xmdlbm);
		if (!(bj_jzbjcfb_xmdlbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.xmdlbm='"+bj_jzbjcfb_xmdlbm+"')";
	}
	bj_jzbjcfb_xmxlbm=request.getParameter("bj_jzbjcfb_xmxlbm");
	if (bj_jzbjcfb_xmxlbm!=null)
	{
		bj_jzbjcfb_xmxlbm=cf.GB2Uni(bj_jzbjcfb_xmxlbm);
		if (!(bj_jzbjcfb_xmxlbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.xmxlbm='"+bj_jzbjcfb_xmxlbm+"')";
	}
	bj_jzbjcfb_smbm=request.getParameter("bj_jzbjcfb_smbm");
	if (bj_jzbjcfb_smbm!=null)
	{
		bj_jzbjcfb_smbm=cf.GB2Uni(bj_jzbjcfb_smbm);
		if (!(bj_jzbjcfb_smbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.smbm='"+bj_jzbjcfb_smbm+"')";
	}
	bj_jzbjcfb_lrsj=request.getParameter("bj_jzbjcfb_lrsj");
	if (bj_jzbjcfb_lrsj!=null)
	{
		bj_jzbjcfb_lrsj=bj_jzbjcfb_lrsj.trim();
		if (!(bj_jzbjcfb_lrsj.equals("")))	wheresql+="  and (bj_jzbjcfb.lrsj>=TO_DATE('"+bj_jzbjcfb_lrsj+"','YYYY/MM/DD'))";
	}
	bj_jzbjcfb_lrsj=request.getParameter("bj_jzbjcfb_lrsj2");
	if (bj_jzbjcfb_lrsj!=null)
	{
		bj_jzbjcfb_lrsj=bj_jzbjcfb_lrsj.trim();
		if (!(bj_jzbjcfb_lrsj.equals("")))	wheresql+="  and (bj_jzbjcfb.lrsj<=TO_DATE('"+bj_jzbjcfb_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT bj_jzbjcfb.fxmbh,bj_jzbjb.xmmc fxmmc,xmdlmc,xmxlmc,bj_jzbjcfb.xmbh,bj_jzbjcfb.xmmc,smmc,jldwmc,bj_jzbjcfb.bj,bj_jzbjcfb.clbj,bj_jzbjcfb.zcf,bj_jzbjcfb.rgbj,bj_jzbjcfb.ysf,bj_jzbjcfb.jxbj,bj_jzbjcfb.shf,bj_jzbjcfb.qtf,bj_jzbjcfb.gycl,bj_jzbjcfb.flmcgg,bj_jzbjcfb.bz  ";
	ls_sql+=" FROM bj_jzbjcfb,bj_jzbjb,jdm_jldwbm,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm  ";
    ls_sql+=" where bj_jzbjcfb.bjbbh=bj_jzbjb.bjbbh and bj_jzbjcfb.dqbm=bj_jzbjb.dqbm and bj_jzbjcfb.bjjbbm=bj_jzbjb.bjjbbm and bj_jzbjcfb.fxmbh=bj_jzbjb.xmbh";
    ls_sql+=" and bj_jzbjcfb.jldwbm=jdm_jldwbm.jldwbm(+) ";
    ls_sql+=" and bj_jzbjcfb.xmdlbm=bdm_xmdlbm.xmdlbm(+) ";
    ls_sql+=" and bj_jzbjcfb.xmxlbm=bdm_xmxlbm.xmxlbm(+) ";
    ls_sql+=" and bj_jzbjcfb.smbm=bdm_smbm.smbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_jzbjcfb.bjbbh,bj_jzbjcfb.dqbm,bj_jzbjcfb.bjjbbm,bj_jzbjcfb.fxmbh,bj_jzbjcfb.xmbh";
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
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">父项目编号</td>
	<td  width="9%">父项目名称</td>
	<td  width="4%">项目大类</td>
	<td  width="4%">项目小类</td>
	<td  width="4%">项目编号</td>
	<td  width="9%">项目名称</td>
	<td  width="4%">饰面</td>
	<td  width="3%">计量单位</td>
	<td  width="3%">工程预算价</td>
	<td  width="3%">辅材费</td>
	<td  width="3%">主材费</td>
	<td  width="3%">人工费</td>
	<td  width="3%">运输费</td>
	<td  width="3%">机械费</td>
	<td  width="3%">损耗费</td>
	<td  width="3%">其它费</td>
	<td  width="12%">工艺做法及材料</td>
	<td  width="12%">辅料名称规格</td>
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