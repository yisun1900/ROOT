<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";

	String dqbm=request.getParameter("dqbm");//地区编码

	String gysmc=null;
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (jxc_cljgb.gysmc='"+gysmc+"')";
	}
	String xsfs=null;
	xsfs=request.getParameter("xsfs");
	if (xsfs!=null)
	{
		xsfs=cf.GB2Uni(xsfs);
		if (!(xsfs.equals("")))	wheresql+=" and  (jxc_cljgb.xsfs='"+xsfs+"')";
	}
	String sfcy=null;
	sfcy=request.getParameter("sfcy");
	if (sfcy!=null)
	{
		sfcy=cf.GB2Uni(sfcy);
		if (!(sfcy.equals("")))	wheresql+=" and  (jxc_cljgb.sfcy='"+sfcy+"')";
	}
	String sfyh=null;
	sfyh=request.getParameter("sfyh");
	if (sfyh!=null)
	{
		sfyh=cf.GB2Uni(sfyh);
		if (!(sfyh.equals("")))	wheresql+=" and  (jxc_cljgb.sfyh='"+sfyh+"')";
	}

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
	ls_sql+=" ,jxc_cljgb.cbj,jxc_cljgb.dfgsjg,jxc_cljgb.dgzjg,DECODE(jxc_cljgb.xsfs,'1','代销品','2','现货销售','3','期货销售','4','虚拟出入库') xsfs,jxc_cljgb.zxqdl,DECODE(jxc_cljgb.sfcy,'Y','是','N','否') sfcy,jxc_cljgb.gysmc";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb,dm_dqbm  ";
    ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
    ls_sql+=" and jxc_cljgb.dqbm=dm_dqbm.dqbm";
    ls_sql+=" and jxc_clbm.cllb='1'";//0：主材；1：辅材
    ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"'";
    ls_sql+=wheresql;
    ls_sql+=" order by cldlbm,clxlbm,clmc,jxc_clbm.clbm";
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
<table border="1" width="290%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
      <td width="4%">材料大类</td>
      <td width="5%">材料小类</td>
	  <td width="4%">内部编码</td>
      <td width="9%">材料名称</td>
      <td width="4%">型号</td>
      <td width="4%">规格</td>
      <td width="2%">计量单位</td>
	  <td width="2%">包装计量单位</td>
	  <td width="2%">包装规格</td>
	  <td width="3%">单件重量（KG）</td>
	  <td width="2%">长度(cm)</td>
	  <td width="2%">宽度(cm)</td>
      <td width="2%">高度(cm)</td>
      <td width="3%">采购周期（天）</td>
      <td width="2%">保质期（天）</td>
      <td width="3%">保质提醒期（天）</td>
      <td width="5%">子品牌</td>
      <td width="3%">采购类别</td>
      <td width="12%">备注</td>

      <td width="3%">成本价</td>
      <td width="3%">对分公司价</td>
      <td width="3%">对工长价</td>
      <td width="3%">销售方式</td>
      <td width="3%">最小起订量</td>
      <td width="3%">是否常用</td>
      <td width="23%">供应商</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>
</body>
</html>