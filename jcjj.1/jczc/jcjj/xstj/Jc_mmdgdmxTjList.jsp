<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String crm_khxx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qye=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_dwbh=null;
	String jc_mmdgdmx_yddbh=null;
	String jc_mmdgdmx_mmdglxbm=null;
	String jc_mmdgdmx_mlx=null;
	String jc_mmdgdmx_mmxh=null;
	String jc_mmdgdmx_ysbm=null;
	String jc_mmdgdmx_czbm=null;
	String jc_mmdgdmx_azwzbm=null;
	String jc_mmdgdmx_kqfxbm=null;
	String jc_mmdgdmx_dczlbm=null;
	String jc_mmdgdmx_ctbs=null;
	String jc_mmdgdmx_dsk=null;
	String jc_mmdgdmx_sfysblm=null;
	String jc_mmdgdmx_blxhbm=null;
	String jc_mmdgdmx_sfsmjcc=null;
	String jc_mmdgdmx_sfydc=null;
	String jc_mmdgdmx_lx=null;
	String jc_mmdgdmx_sfzdjj=null;
	String jc_mmydd_clgw=null;
	String jc_mmydd_ztjjgw=null;
	String jc_mmydd_xmzy=null;
	String jc_mmydd_pdgc=null;
	String jc_mmydd_htrq=null;
	String jc_mmydd_htqdr=null;
	String jc_mmydd_tdsj=null;
	String jc_mmydd_mmcljs=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	crm_khxx_khbh=request.getParameter("crm_khxx_khbh");
	if (crm_khxx_khbh!=null)
	{
		crm_khxx_khbh=cf.GB2Uni(crm_khxx_khbh);
		if (!(crm_khxx_khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+crm_khxx_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qye=request.getParameter("crm_khxx_qye");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye>="+crm_khxx_qye+") ";
	}
	crm_khxx_qye=request.getParameter("crm_khxx_qye2");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye<="+crm_khxx_qye+") ";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	jc_mmdgdmx_yddbh=request.getParameter("jc_mmdgdmx_yddbh");
	if (jc_mmdgdmx_yddbh!=null)
	{
		jc_mmdgdmx_yddbh=cf.GB2Uni(jc_mmdgdmx_yddbh);
		if (!(jc_mmdgdmx_yddbh.equals("")))	wheresql+=" and  (jc_mmdgdmx.yddbh='"+jc_mmdgdmx_yddbh+"')";
	}
	jc_mmdgdmx_mmdglxbm=request.getParameter("jc_mmdgdmx_mmdglxbm");
	if (jc_mmdgdmx_mmdglxbm!=null)
	{
		jc_mmdgdmx_mmdglxbm=cf.GB2Uni(jc_mmdgdmx_mmdglxbm);
		if (!(jc_mmdgdmx_mmdglxbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.mmdglxbm='"+jc_mmdgdmx_mmdglxbm+"')";
	}
	jc_mmdgdmx_mlx=request.getParameter("jc_mmdgdmx_mlx");
	if (jc_mmdgdmx_mlx!=null)
	{
		jc_mmdgdmx_mlx=cf.GB2Uni(jc_mmdgdmx_mlx);
		if (!(jc_mmdgdmx_mlx.equals("")))	wheresql+=" and  (jc_mmdgdmx.mlx='"+jc_mmdgdmx_mlx+"')";
	}
	jc_mmdgdmx_mmxh=request.getParameter("jc_mmdgdmx_mmxh");
	if (jc_mmdgdmx_mmxh!=null)
	{
		jc_mmdgdmx_mmxh=cf.GB2Uni(jc_mmdgdmx_mmxh);
		if (!(jc_mmdgdmx_mmxh.equals("")))	wheresql+=" and  (jc_mmdgdmx.mmxh='"+jc_mmdgdmx_mmxh+"')";
	}
	jc_mmdgdmx_ysbm=request.getParameter("jc_mmdgdmx_ysbm");
	if (jc_mmdgdmx_ysbm!=null)
	{
		jc_mmdgdmx_ysbm=cf.GB2Uni(jc_mmdgdmx_ysbm);
		if (!(jc_mmdgdmx_ysbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.ysbm='"+jc_mmdgdmx_ysbm+"')";
	}
	jc_mmdgdmx_czbm=request.getParameter("jc_mmdgdmx_czbm");
	if (jc_mmdgdmx_czbm!=null)
	{
		jc_mmdgdmx_czbm=cf.GB2Uni(jc_mmdgdmx_czbm);
		if (!(jc_mmdgdmx_czbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.czbm='"+jc_mmdgdmx_czbm+"')";
	}
	jc_mmdgdmx_azwzbm=request.getParameter("jc_mmdgdmx_azwzbm");
	if (jc_mmdgdmx_azwzbm!=null)
	{
		jc_mmdgdmx_azwzbm=cf.GB2Uni(jc_mmdgdmx_azwzbm);
		if (!(jc_mmdgdmx_azwzbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.azwzbm='"+jc_mmdgdmx_azwzbm+"')";
	}
	jc_mmdgdmx_kqfxbm=request.getParameter("jc_mmdgdmx_kqfxbm");
	if (jc_mmdgdmx_kqfxbm!=null)
	{
		jc_mmdgdmx_kqfxbm=cf.GB2Uni(jc_mmdgdmx_kqfxbm);
		if (!(jc_mmdgdmx_kqfxbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.kqfxbm='"+jc_mmdgdmx_kqfxbm+"')";
	}
	jc_mmdgdmx_dczlbm=request.getParameter("jc_mmdgdmx_dczlbm");
	if (jc_mmdgdmx_dczlbm!=null)
	{
		jc_mmdgdmx_dczlbm=cf.GB2Uni(jc_mmdgdmx_dczlbm);
		if (!(jc_mmdgdmx_dczlbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.dczlbm='"+jc_mmdgdmx_dczlbm+"')";
	}
	jc_mmdgdmx_ctbs=request.getParameter("jc_mmdgdmx_ctbs");
	if (jc_mmdgdmx_ctbs!=null)
	{
		jc_mmdgdmx_ctbs=cf.GB2Uni(jc_mmdgdmx_ctbs);
		if (!(jc_mmdgdmx_ctbs.equals("")))	wheresql+=" and  (jc_mmdgdmx.ctbs='"+jc_mmdgdmx_ctbs+"')";
	}
	jc_mmdgdmx_dsk=request.getParameter("jc_mmdgdmx_dsk");
	if (jc_mmdgdmx_dsk!=null)
	{
		jc_mmdgdmx_dsk=cf.GB2Uni(jc_mmdgdmx_dsk);
		if (!(jc_mmdgdmx_dsk.equals("")))	wheresql+=" and  (jc_mmdgdmx.dsk='"+jc_mmdgdmx_dsk+"')";
	}
	jc_mmdgdmx_sfysblm=request.getParameter("jc_mmdgdmx_sfysblm");
	if (jc_mmdgdmx_sfysblm!=null)
	{
		jc_mmdgdmx_sfysblm=cf.GB2Uni(jc_mmdgdmx_sfysblm);
		if (!(jc_mmdgdmx_sfysblm.equals("")))	wheresql+=" and  (jc_mmdgdmx.sfysblm='"+jc_mmdgdmx_sfysblm+"')";
	}
	jc_mmdgdmx_blxhbm=request.getParameter("jc_mmdgdmx_blxhbm");
	if (jc_mmdgdmx_blxhbm!=null)
	{
		jc_mmdgdmx_blxhbm=cf.GB2Uni(jc_mmdgdmx_blxhbm);
		if (!(jc_mmdgdmx_blxhbm.equals("")))	wheresql+=" and  (jc_mmdgdmx.blxhbm='"+jc_mmdgdmx_blxhbm+"')";
	}
	jc_mmdgdmx_sfsmjcc=request.getParameter("jc_mmdgdmx_sfsmjcc");
	if (jc_mmdgdmx_sfsmjcc!=null)
	{
		jc_mmdgdmx_sfsmjcc=cf.GB2Uni(jc_mmdgdmx_sfsmjcc);
		if (!(jc_mmdgdmx_sfsmjcc.equals("")))	wheresql+=" and  (jc_mmdgdmx.sfsmjcc='"+jc_mmdgdmx_sfsmjcc+"')";
	}
	jc_mmdgdmx_sfydc=request.getParameter("jc_mmdgdmx_sfydc");
	if (jc_mmdgdmx_sfydc!=null)
	{
		jc_mmdgdmx_sfydc=cf.GB2Uni(jc_mmdgdmx_sfydc);
		if (!(jc_mmdgdmx_sfydc.equals("")))	wheresql+=" and  (jc_mmdgdmx.sfydc='"+jc_mmdgdmx_sfydc+"')";
	}
	jc_mmdgdmx_lx=request.getParameter("jc_mmdgdmx_lx");
	if (jc_mmdgdmx_lx!=null)
	{
		jc_mmdgdmx_lx=cf.GB2Uni(jc_mmdgdmx_lx);
		if (!(jc_mmdgdmx_lx.equals("")))	wheresql+=" and  (jc_mmdgdmx.lx='"+jc_mmdgdmx_lx+"')";
	}
	jc_mmdgdmx_sfzdjj=request.getParameter("jc_mmdgdmx_sfzdjj");
	if (jc_mmdgdmx_sfzdjj!=null)
	{
		jc_mmdgdmx_sfzdjj=cf.GB2Uni(jc_mmdgdmx_sfzdjj);
		if (!(jc_mmdgdmx_sfzdjj.equals("")))	wheresql+=" and  (jc_mmdgdmx.sfzdjj='"+jc_mmdgdmx_sfzdjj+"')";
	}
	jc_mmydd_clgw=request.getParameter("jc_mmydd_clgw");
	if (jc_mmydd_clgw!=null)
	{
		jc_mmydd_clgw=cf.GB2Uni(jc_mmydd_clgw);
		if (!(jc_mmydd_clgw.equals("")))	wheresql+=" and  (jc_mmydd.clgw='"+jc_mmydd_clgw+"')";
	}
	jc_mmydd_ztjjgw=request.getParameter("jc_mmydd_ztjjgw");
	if (jc_mmydd_ztjjgw!=null)
	{
		jc_mmydd_ztjjgw=cf.GB2Uni(jc_mmydd_ztjjgw);
		if (!(jc_mmydd_ztjjgw.equals("")))	wheresql+=" and  (jc_mmydd.ztjjgw='"+jc_mmydd_ztjjgw+"')";
	}
	jc_mmydd_xmzy=request.getParameter("jc_mmydd_xmzy");
	if (jc_mmydd_xmzy!=null)
	{
		jc_mmydd_xmzy=cf.GB2Uni(jc_mmydd_xmzy);
		if (!(jc_mmydd_xmzy.equals("")))	wheresql+=" and  (jc_mmydd.xmzy='"+jc_mmydd_xmzy+"')";
	}
	jc_mmydd_pdgc=request.getParameter("jc_mmydd_pdgc");
	if (jc_mmydd_pdgc!=null)
	{
		jc_mmydd_pdgc=cf.GB2Uni(jc_mmydd_pdgc);
		if (!(jc_mmydd_pdgc.equals("")))	wheresql+=" and  (jc_mmydd.pdgc='"+jc_mmydd_pdgc+"')";
	}
	jc_mmydd_htrq=request.getParameter("jc_mmydd_htrq");
	if (jc_mmydd_htrq!=null)
	{
		jc_mmydd_htrq=jc_mmydd_htrq.trim();
		if (!(jc_mmydd_htrq.equals("")))	wheresql+="  and (jc_mmydd.htrq>=TO_DATE('"+jc_mmydd_htrq+"','YYYY/MM/DD'))";
	}
	jc_mmydd_htrq=request.getParameter("jc_mmydd_htrq2");
	if (jc_mmydd_htrq!=null)
	{
		jc_mmydd_htrq=jc_mmydd_htrq.trim();
		if (!(jc_mmydd_htrq.equals("")))	wheresql+="  and (jc_mmydd.htrq<=TO_DATE('"+jc_mmydd_htrq+"','YYYY/MM/DD'))";
	}
	jc_mmydd_htqdr=request.getParameter("jc_mmydd_htqdr");
	if (jc_mmydd_htqdr!=null)
	{
		jc_mmydd_htqdr=cf.GB2Uni(jc_mmydd_htqdr);
		if (!(jc_mmydd_htqdr.equals("")))	wheresql+=" and  (jc_mmydd.htqdr='"+jc_mmydd_htqdr+"')";
	}
	jc_mmydd_tdsj=request.getParameter("jc_mmydd_tdsj");
	if (jc_mmydd_tdsj!=null)
	{
		jc_mmydd_tdsj=jc_mmydd_tdsj.trim();
		if (!(jc_mmydd_tdsj.equals("")))	wheresql+="  and (jc_mmydd.tdsj>=TO_DATE('"+jc_mmydd_tdsj+"','YYYY/MM/DD'))";
	}
	jc_mmydd_tdsj=request.getParameter("jc_mmydd_tdsj2");
	if (jc_mmydd_tdsj!=null)
	{
		jc_mmydd_tdsj=jc_mmydd_tdsj.trim();
		if (!(jc_mmydd_tdsj.equals("")))	wheresql+="  and (jc_mmydd.tdsj<=TO_DATE('"+jc_mmydd_tdsj+"','YYYY/MM/DD'))";
	}
	jc_mmydd_mmcljs=request.getParameter("jc_mmydd_mmcljs");
	if (jc_mmydd_mmcljs!=null)
	{
		jc_mmydd_mmcljs=cf.GB2Uni(jc_mmydd_mmcljs);
		if (!(jc_mmydd_mmcljs.equals("")))	wheresql+=" and  (jc_mmydd.mmcljs='"+jc_mmydd_mmcljs+"')";
	}
%>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

int khs=0;
int dds=0;
int htsl=0;
int zjhsl=0;
double zjhje=0;

try {
	conn=cf.getConnection();

	ls_sql=" select count(distinct jc_mmydd.khbh),count(distinct jc_mmdgdmx.yddbh),sum(jc_mmdgdmx.sl),sum(jc_mmdgdmx.zjhsl),sum(jc_mmdgdmx.zjhsl*jc_mmdgdmx.dj)";
	ls_sql+=" FROM jc_mmdgdmx,jc_mmydd,crm_khxx,dm_czbm,jc_blbj,jc_mmdglx,jdm_azwzbm,jdm_mlx,jdm_mmczbm,sq_gysxx  ";
	ls_sql+=" where jc_mmdgdmx.yddbh=jc_mmydd.yddbh and jc_mmydd.khbh=crm_khxx.khbh";
	ls_sql+=" and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and  jc_mmdgdmx.blxhbm=jc_blbj.blxhbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) ";
	ls_sql+=" and jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm(+)";
	ls_sql+=" and jc_mmydd.pdgc=sq_gysxx.gysbh(+)";
	ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khs=rs.getInt(1);
		dds=rs.getInt(2);
		htsl=rs.getInt(3);
		zjhsl=rs.getInt(4);
		zjhje=rs.getDouble(5);
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>



<%

	String tj1=cf.GB2Uni(request.getParameter("tj1"));
	String tj2=cf.GB2Uni(request.getParameter("tj2"));
	String tj3=cf.GB2Uni(request.getParameter("tj3"));
	String tj4=cf.GB2Uni(request.getParameter("tj4"));
	String tj5=cf.GB2Uni(request.getParameter("tj5"));
	String tj6=cf.GB2Uni(request.getParameter("tj6"));
	String tj1name=cf.GB2Uni(request.getParameter("tj1name"));
	String tj2name=cf.GB2Uni(request.getParameter("tj2name"));
	String tj3name=cf.GB2Uni(request.getParameter("tj3name"));
	String tj4name=cf.GB2Uni(request.getParameter("tj4name"));
	String tj5name=cf.GB2Uni(request.getParameter("tj5name"));
	String tj6name=cf.GB2Uni(request.getParameter("tj6name"));

	String groupsql="";
	String selectgroupsql="";
	int groupsl=0;
	if (tj1!=null)
	{
		if (!(tj1.equals("")))
		{
			groupsql+=","+tj1;
			selectgroupsql+=","+tj1;
			groupsl++;
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			groupsql+=","+tj2;
			selectgroupsql+=","+tj2;
			groupsl++;
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			groupsql+=","+tj3;
			selectgroupsql+=","+tj3;
			groupsl++;
		}
	}
	if (tj4!=null)
	{
		if (!(tj4.equals("")))
		{
			groupsql+=","+tj4;
			selectgroupsql+=","+tj4;
			groupsl++;
		}
	}
	if (tj5!=null)
	{
		if (!(tj5.equals("")))
		{
			groupsql+=","+tj5;
			selectgroupsql+=","+tj5;
			groupsl++;
		}
	}
	if (tj6!=null)
	{
		if (!(tj6.equals("")))
		{
			groupsql+=","+tj6;
			selectgroupsql+=","+tj6;
			groupsl++;
		}
	}
	if (groupsl==0)
	{
		out.println("请选择统计列");
		return;
	}
	else{
		groupsql=" group by "+groupsql.substring(1);
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(distinct jc_mmydd.khbh),count(distinct jc_mmdgdmx.yddbh),sum(jc_mmdgdmx.sl),sum(jc_mmdgdmx.zjhsl),sum(jc_mmdgdmx.zjhsl*jc_mmdgdmx.dj),'<img src=\"/images/ColuGif.gif\" width=\"'||ROUND(sum(jc_mmdgdmx.zjhsl*jc_mmdgdmx.dj)*100/"+zjhje+",2)||'\" height=\"14\">'||ROUND(sum(jc_mmdgdmx.zjhsl*jc_mmdgdmx.dj)*100/"+zjhje+",2)||'%'";
	}
%>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
<%
	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj3name+"</td>");
	}
	if (!tj4name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj4name+"</td>");
	}
	if (!tj5name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj5name+"</td>");
	}
	if (!tj6name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj6name+"</td>");
	}

%>
	<td  width="6%">客户数</td>
	<td  width="6%">订单数</td>
	<td  width="8%">合同数量</td>
	<td  width="8%">增减后数量</td>
	<td  width="13%">增减后金额</td>
	<td  width="20%">金额所占比率</td>
</tr>
<%

	ls_sql=selectgroupsql;
	ls_sql+=" FROM jc_mmdgdmx,jc_mmydd,crm_khxx,dm_czbm,jc_blbj,jc_mmdglx,jdm_azwzbm,jdm_mlx,jdm_mmczbm,sq_gysxx  ";
	ls_sql+=" where jc_mmdgdmx.yddbh=jc_mmydd.yddbh and jc_mmydd.khbh=crm_khxx.khbh";
	ls_sql+=" and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and  jc_mmdgdmx.blxhbm=jc_blbj.blxhbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) ";
	ls_sql+=" and jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm(+)";
	ls_sql+=" and jc_mmydd.pdgc=sq_gysxx.gysbh(+)";
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);

	pageObj.alignStr[groupsl+5]="align='left'";


//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	if (tj1!=null)
	{
		if (!(tj1.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj1,"1");//列参数对象加入Hash表
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj2,"1");//列参数对象加入Hash表
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj3,"1");//列参数对象加入Hash表
		}
	}
	if (tj4!=null)
	{
		if (!(tj4.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj4,"1");//列参数对象加入Hash表
		}
	}
	if (tj5!=null)
	{
		if (!(tj5.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj5,"1");//列参数对象加入Hash表
		}
	}
	if (tj6!=null)
	{
		if (!(tj6.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj6,"1");//列参数对象加入Hash表
		}
	}
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

<tr bgcolor="#FFFFFF" align='center'>
  <td colspan="<%=groupsl%>">小 计</td>
  <td ><%=khs%></td>
  <td ><%=dds%></td>
  <td ><%=htsl%></td>
  <td ><%=zjhsl%></td>
  <td ><%=zjhje%></td>
  <td align='left'><img src="/images/ColuGif.gif" width="100" height="14"></td>
</tr>
</table>

</body>
</html>