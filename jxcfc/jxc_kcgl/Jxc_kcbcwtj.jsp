<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<style type="text/css">
<!--
table,BODY {font-size: 12px}
.STYLE1 {
	font-size: large;
	font-weight: bold;
}
-->
</style>
<table style="word-break:break-all;word-wrap:break-word" id="aDiv" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF" align="left" >
<%
String ls_sql=null;
String wheresql="";
String jxc_kcb_lsh=null;
String jxc_kcb_clmc=null;
String jxc_kcb_cllb=null;
String jxc_kcb_cldlbm=null;
String jxc_kcb_clxlbm=null;
String jxc_kcb_scsmc=null;
String jxc_kcb_ppmc=null;
String jxc_kcb_cllbbm=null;
String jxc_kcb_xh=null;
String jxc_kcb_gg=null;
String jxc_kcb_clysbm=null;
String jxc_kcb_jldwbm=null;
String jxc_kcb_hwbh=null;
String jxc_kcb_pjts=null;
String jxc_kcb_sfyh=null;
String jxc_kcb_cpjb=null;
String jxc_kcb_fgsx=null;
String jxc_kcb_cpsm=null;
String jxc_kcb_cd=null;
String jxc_kcb_zp=null;
String jxc_kcb_cgzq=null;
String jxc_kcb_bz=null;
String jxc_kcb_clbm=null;
String jxc_kcb_hjbh=null;
String jxc_kcb_ckbh=null;
String jxc_kcb_dqbm=null;
String jxc_kcb_cbj=null;
String jxc_kcb_kcsl=null;
String jxc_kcb_kcje=null;
String jxc_kcb_clmc_mh=null;
String jxc_kcb_xh_mh=null;
String jxc_kcb_gg_mh=null;
String jxc_kcb_fgsx_mh=null;
String jxc_kcb_cpsm_mh=null;
String ls="";
jxc_kcb_lsh=request.getParameter("jxc_kcb_lsh");
String[] clbm=request.getParameterValues("clbmlist");
if (clbm!=null)
{
	for (int i=clbm.length-1;i>=0 ; i--)
	{
		ls+=",'"+clbm[i]+"'";
	}
	ls=ls.substring(1);
	if (!(ls.equals("")))	wheresql+="  and (jxc_cljgb.clbm in ("+ls+"))";
}
if (jxc_kcb_lsh!=null)
{
	jxc_kcb_lsh=cf.GB2Uni(jxc_kcb_lsh);
	if (!(jxc_kcb_lsh.equals("")))	wheresql+=" and  (jxc_kcb.lsh='"+jxc_kcb_lsh+"')";
}
jxc_kcb_clmc=request.getParameter("jxc_kcb_clmc");
jxc_kcb_clmc_mh=request.getParameter("jxc_kcb_clmc_mh");
if (jxc_kcb_clmc!=null)
{
	jxc_kcb_clmc=cf.GB2Uni(jxc_kcb_clmc);
	if (!(jxc_kcb_clmc.equals("")))	
	{
		if (jxc_kcb_clmc_mh!=null && jxc_kcb_clmc_mh!="")
			{wheresql+=" and  (jxc_clbm.clmc like '%"+jxc_kcb_clmc+"%')";}
		else
		{wheresql+=" and  (jxc_clbm.clmc='"+jxc_kcb_clmc+"')";}
	}
}
jxc_kcb_cllb=request.getParameter("jxc_kcb_cllb");
if (jxc_kcb_cllb!=null)
{
	jxc_kcb_cllb=cf.GB2Uni(jxc_kcb_cllb);
	if (!(jxc_kcb_cllb.equals("")))	wheresql+=" and  (jxc_clbm.cllb='"+jxc_kcb_cllb+"')";
}
jxc_kcb_cldlbm=request.getParameter("jxc_kcb_cldlbm");
if (jxc_kcb_cldlbm!=null)
{
	jxc_kcb_cldlbm=cf.GB2Uni(jxc_kcb_cldlbm);
	if (!(jxc_kcb_cldlbm.equals("")))	wheresql+=" and  (jxc_clbm.cldlbm='"+jxc_kcb_cldlbm+"')";
}
jxc_kcb_clxlbm=request.getParameter("jxc_kcb_clxlbm");
if (jxc_kcb_clxlbm!=null)
{
	jxc_kcb_clxlbm=cf.GB2Uni(jxc_kcb_clxlbm);
	if (!(jxc_kcb_clxlbm.equals("")))	wheresql+=" and  (jxc_clbm.clxlbm='"+jxc_kcb_clxlbm+"')";
}
jxc_kcb_scsmc=request.getParameter("jxc_kcb_scsmc");
if (jxc_kcb_scsmc!=null)
{
	jxc_kcb_scsmc=cf.GB2Uni(jxc_kcb_scsmc);
	if (!(jxc_kcb_scsmc.equals("")))	wheresql+=" and  (jxc_clbm.scsmc='"+jxc_kcb_scsmc+"')";
}
jxc_kcb_ppmc=request.getParameter("jxc_kcb_ppmc");
if (jxc_kcb_ppmc!=null)
{
	jxc_kcb_ppmc=cf.GB2Uni(jxc_kcb_ppmc);
	if (!(jxc_kcb_ppmc.equals("")))	wheresql+=" and  (jxc_clbm.ppmc='"+jxc_kcb_ppmc+"')";
}
jxc_kcb_cllbbm=request.getParameter("jxc_kcb_cllbbm");
if (jxc_kcb_cllbbm!=null)
{
	jxc_kcb_cllbbm=cf.GB2Uni(jxc_kcb_cllbbm);
	if (!(jxc_kcb_cllbbm.equals("")))	wheresql+=" and  (jxc_clbm.cllbbm='"+jxc_kcb_cllbbm+"')";
}
jxc_kcb_xh=request.getParameter("jxc_kcb_xh");
jxc_kcb_xh_mh=request.getParameter("jxc_kcb_xh_mh");
if (jxc_kcb_xh!=null)
{
	jxc_kcb_xh=cf.GB2Uni(jxc_kcb_xh);
	if (!(jxc_kcb_xh.equals("")))	
	{
		if (jxc_kcb_xh_mh!=null && jxc_kcb_xh_mh!="") 
			{wheresql+=" and  (jxc_clbm.xh like '%"+jxc_kcb_xh+"%')";}
		else
			{wheresql+=" and  (jxc_clbm.xh='"+jxc_kcb_xh+"')";}
	}
}
jxc_kcb_gg=request.getParameter("jxc_kcb_gg");
jxc_kcb_gg_mh=request.getParameter("jxc_kcb_gg_mh");
if (jxc_kcb_gg!=null)
{
	jxc_kcb_gg=cf.GB2Uni(jxc_kcb_gg);
	if (!(jxc_kcb_gg.equals("")))
	{
		if (jxc_kcb_gg_mh!=null && jxc_kcb_gg_mh!="") 
		{wheresql+=" and  (jxc_clbm.gg like '%"+jxc_kcb_gg+"%')";}
		else
		{wheresql+=" and  (jxc_clbm.gg='"+jxc_kcb_gg+"')";}
	}
}
jxc_kcb_clysbm=request.getParameter("jxc_kcb_clysbm");
if (jxc_kcb_clysbm!=null)
{
	jxc_kcb_clysbm=cf.GB2Uni(jxc_kcb_clysbm);
	if (!(jxc_kcb_clysbm.equals("")))	wheresql+=" and  (jxc_clbm.clysbm='"+jxc_kcb_clysbm+"')";
}
jxc_kcb_jldwbm=request.getParameter("jxc_kcb_jldwbm");
if (jxc_kcb_jldwbm!=null)
{
	jxc_kcb_jldwbm=cf.GB2Uni(jxc_kcb_jldwbm);
	if (!(jxc_kcb_jldwbm.equals("")))	wheresql+=" and  (jxc_clbm.jldwbm='"+jxc_kcb_jldwbm+"')";
}
jxc_kcb_hwbh=request.getParameter("jxc_kcb_hwbh");
if (jxc_kcb_hwbh!=null)
{
	jxc_kcb_hwbh=cf.GB2Uni(jxc_kcb_hwbh);
	if (!(jxc_kcb_hwbh.equals("")))	wheresql+=" and  (jxc_kcb.hwbh='"+jxc_kcb_hwbh+"')";
}
jxc_kcb_pjts=request.getParameter("jxc_kcb_pjts");
if (jxc_kcb_pjts!=null)
{
	jxc_kcb_pjts=jxc_kcb_pjts.trim();
	if (!(jxc_kcb_pjts.equals("")))	wheresql+=" and (jxc_clbm.pjts="+jxc_kcb_pjts+") ";
}
jxc_kcb_sfyh=request.getParameter("jxc_kcb_sfyh");
if (jxc_kcb_sfyh!=null)
{
	jxc_kcb_sfyh=cf.GB2Uni(jxc_kcb_sfyh);
	if (!(jxc_kcb_sfyh.equals("")))	wheresql+=" and  (jxc_cljgb.sfyh='"+jxc_kcb_sfyh+"')";
}
jxc_kcb_cpjb=request.getParameter("jxc_kcb_cpjb");
if (jxc_kcb_cpjb!=null)
{
	jxc_kcb_cpjb=cf.GB2Uni(jxc_kcb_cpjb);
	if (!(jxc_kcb_cpjb.equals("")))	wheresql+=" and  (jxc_kcb.cpjb='"+jxc_kcb_cpjb+"')";
}
jxc_kcb_fgsx=request.getParameter("jxc_kcb_fgsx");
jxc_kcb_fgsx_mh=request.getParameter("jxc_kcb_fgsx_mh");
if (jxc_kcb_fgsx!=null)
{
	jxc_kcb_fgsx=cf.GB2Uni(jxc_kcb_fgsx);
	if (!(jxc_kcb_fgsx.equals("")))	
	{
		if (jxc_kcb_fgsx_mh!=null && jxc_kcb_fgsx_mh!="") 
		{wheresql+=" and  (jxc_clbm.fgsx like '%"+jxc_kcb_fgsx+"%')";}
		else
		{wheresql+=" and  (jxc_clbm.fgsx='"+jxc_kcb_fgsx+"')";}
	}
}
jxc_kcb_cpsm=request.getParameter("jxc_kcb_cpsm");
jxc_kcb_cpsm_mh=request.getParameter("jxc_kcb_cpsm_mh");
if (jxc_kcb_cpsm!=null)
{
	jxc_kcb_cpsm=cf.GB2Uni(jxc_kcb_cpsm);
	if (!(jxc_kcb_cpsm.equals("")))	
	{
		if (jxc_kcb_cpsm_mh!=null && jxc_kcb_cpsm_mh!="") 
		{wheresql+=" and  (jxc_clbm.cpsm like '%"+jxc_kcb_cpsm+"%')";}
			else
		{wheresql+=" and  (jxc_clbm.cpsm='"+jxc_kcb_cpsm+"')";}
	}
}
jxc_kcb_cd=request.getParameter("jxc_kcb_cd");
if (jxc_kcb_cd!=null)
{
	jxc_kcb_cd=cf.GB2Uni(jxc_kcb_cd);
	if (!(jxc_kcb_cd.equals("")))	wheresql+=" and  (jxc_clbm.cd='"+jxc_kcb_cd+"')";
}
jxc_kcb_zp=request.getParameter("jxc_kcb_zp");
if (jxc_kcb_zp!=null)
{
	jxc_kcb_zp=cf.GB2Uni(jxc_kcb_zp);
	if (!(jxc_kcb_zp.equals("")))	wheresql+=" and  (jxc_clbm.zp='"+jxc_kcb_zp+"')";
}
jxc_kcb_cgzq=request.getParameter("jxc_kcb_cgzq");
if (jxc_kcb_cgzq!=null)
{
	jxc_kcb_cgzq=jxc_kcb_cgzq.trim();
	if (!(jxc_kcb_cgzq.equals("")))	wheresql+=" and (jxc_clbm.cgzq="+jxc_kcb_cgzq+") ";
}
jxc_kcb_bz=request.getParameter("jxc_kcb_bz");
if (jxc_kcb_bz!=null)
{
	jxc_kcb_bz=cf.GB2Uni(jxc_kcb_bz);
	if (!(jxc_kcb_bz.equals("")))	wheresql+=" and  (jxc_clbm.bz='"+jxc_kcb_bz+"')";
}
jxc_kcb_clbm=request.getParameter("jxc_kcb_clbm");
if (jxc_kcb_clbm!=null)
{
	jxc_kcb_clbm=cf.GB2Uni(jxc_kcb_clbm);
	if (!(jxc_kcb_clbm.equals("")))	wheresql+=" and  (jxc_clbm.clbm='"+jxc_kcb_clbm+"')";
}
jxc_kcb_hjbh=request.getParameter("jxc_kcb_hjbh");
if (jxc_kcb_hjbh!=null)
{
	jxc_kcb_hjbh=cf.GB2Uni(jxc_kcb_hjbh);
	if (!(jxc_kcb_hjbh.equals("")))	wheresql+=" and  (jxc_kcb.hjbh='"+jxc_kcb_hjbh+"')";
}
jxc_kcb_ckbh=request.getParameter("jxc_kcb_ckbh");
if (jxc_kcb_ckbh!=null)
{
	jxc_kcb_ckbh=cf.GB2Uni(jxc_kcb_ckbh);
	if (!(jxc_kcb_ckbh.equals("")))	wheresql+=" and  (jxc_kcb.ckbh='"+jxc_kcb_ckbh+"')";
}
jxc_kcb_dqbm=request.getParameter("jxc_kcb_dqbm");
if (jxc_kcb_dqbm!=null)
{
	jxc_kcb_dqbm=cf.GB2Uni(jxc_kcb_dqbm);
	if (!(jxc_kcb_dqbm.equals("")))	wheresql+=" and  (jxc_cljgb.dqbm='"+jxc_kcb_dqbm+"')";
}
jxc_kcb_cbj=request.getParameter("jxc_kcb_cbj");
if (jxc_kcb_cbj!=null)
{
	jxc_kcb_cbj=jxc_kcb_cbj.trim();
	if (!(jxc_kcb_cbj.equals("")))	wheresql+=" and  (jxc_kcb.rkj="+jxc_kcb_cbj+") ";
}
jxc_kcb_kcsl=request.getParameter("jxc_kcb_kcsl");
if (jxc_kcb_kcsl!=null)
{
	jxc_kcb_kcsl=jxc_kcb_kcsl.trim();
	if (!(jxc_kcb_kcsl.equals("")))	wheresql+=" and (jxc_cljgb.zcpzsl="+jxc_kcb_kcsl+") ";
}
jxc_kcb_kcje=request.getParameter("jxc_kcb_kcje");
if (jxc_kcb_kcje!=null)
{
	jxc_kcb_kcje=jxc_kcb_kcje.trim();
	if (!(jxc_kcb_kcje.equals("")))	wheresql+=" and  (jxc_kcb.kcje="+jxc_kcb_kcje+") ";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String whereclbm=null;
String wheredqbm=null;
String tjnian=request.getParameter("jxc_kcb_nian");
String tjyue=request.getParameter("jxc_kcb_yue");
double jzsl=0;//结转数量
double jzje=0;//结转金额
try {
	conn=cf.getConnection();
	//查询出符合条件的所有编码
	ls_sql="SELECT jxc_clbm.clbm clbm,jxc_cljgb.dqbm dqbm ";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb ";
	ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm ";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		whereclbm=cf.fillNull(rs.getString("clbm"));
		wheredqbm=cf.fillNull(rs.getString("dqbm"));
		//根据编码 查询出详细数据
		//查询上月结转
		ls_sql="SELECT jxc_kcjzmx.clbm clbm,zsl jzsl,jzje ";
		ls_sql+=" FROM jxc_kcjz,jxc_ckmc,jxc_kcjzmx ";
		ls_sql+=" where jxc_kcjz.ckbh=jxc_ckmc.ckbh and jxc_kcjz.jzph=jxc_kcjzmx.jzph ";
		ls_sql+=" and jxc_ckmc.dqbm='"+wheredqbm+"' and jxc_kcjzmx.clbm='"+whereclbm+"' and  to_char(add_months(jxc_kcjz.jzrq,1),'YYYY-MM')='"+tjnian+"-"+tjyue+"' ";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery(ls_sql);
		if (rs2.next())
		{
			whereclbm=cf.fillNull(rs2.getString("clbm"));
			jzsl=rs2.getDouble("jzsl");
			jzje=rs2.getDouble("jzje");
		}
		rs2.close();
		ps2.close();

	}
//	out.print(ls_sql);
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

