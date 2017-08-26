<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String jc_cgdd_ddbh=null;
	String jc_cgdd_khbh=null;
	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	String jc_cgdd_jhccsj=null;
	String jc_cgdd_cgsjs=null;
	String jc_cgdd_sccsj=null;
	String jc_cgdd_jhfcsj=null;
	String jc_cgdd_sfcsj=null;
	String jc_cgdd_qhtsj=null;
	String jctdyybm=null;
	String jc_cgdd_jhazrq=null;
	String jc_cgdd_sazrq=null;
	String jc_cgdd_clzt=null;
	String jc_cgdd_khlx=null;
	String jc_cgdd_lrr=null;
	String jc_cgdd_lrsj=null;
	String jc_cgdd_dwbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;

	String sdks=request.getParameter("sdks");
	if (sdks!=null)
	{
		sdks=cf.GB2Uni(sdks);
		if (!(sdks.equals("")))	wheresql+=" and  (jc_cgdd.sdks='"+sdks+"')";
	}
	String xtbc=request.getParameter("xtbc");
	if (xtbc!=null)
	{
		xtbc=cf.GB2Uni(xtbc);
		if (!(xtbc.equals("")))	wheresql+=" and  (jc_cgdd.xtbc='"+xtbc+"')";
	}
	String cghs=request.getParameter("cghs");
	if (cghs!=null)
	{
		cghs=cf.GB2Uni(cghs);
		if (!(cghs.equals("")))	wheresql+=" and  (jc_cgdd.cghs='"+cghs+"')";
	}
	String tmpp=request.getParameter("tmpp");
	if (tmpp!=null)
	{
		tmpp=cf.GB2Uni(tmpp);
		if (!(tmpp.equals("")))	wheresql+=" and  (jc_cgdd.tmpp='"+tmpp+"')";
	}
	String tmhs=request.getParameter("tmhs");
	if (tmhs!=null)
	{
		tmhs=cf.GB2Uni(tmhs);
		if (!(tmhs.equals("")))	wheresql+=" and  (jc_cgdd.tmhs='"+tmhs+"')";
	}
	String blcz=request.getParameter("blcz");
	if (blcz!=null)
	{
		blcz=cf.GB2Uni(blcz);
		if (!(blcz.equals("")))	wheresql+=" and  (jc_cgdd.blcz='"+blcz+"')";
	}
	String jiaolian=request.getParameter("jiaolian");
	if (jiaolian!=null)
	{
		jiaolian=cf.GB2Uni(jiaolian);
		if (!(jiaolian.equals("")))	wheresql+=" and  (jc_cgdd.jiaolian='"+jiaolian+"')";
	}


	String crm_khxx_wjbz=null;
	crm_khxx_wjbz=request.getParameter("crm_khxx_wjbz");
	if (crm_khxx_wjbz!=null)
	{
		if (crm_khxx_wjbz.equals("1"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4'))";
		}
		else if (crm_khxx_wjbz.equals("2"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('5'))";
		}
	}

	String crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	String jc_cgdd_tdsj=null;
	jc_cgdd_tdsj=request.getParameter("jc_cgdd_tdsj");
	if (jc_cgdd_tdsj!=null)
	{
		if (!(jc_cgdd_tdsj.equals("")))	wheresql+="  and (jc_cgdd.tdsj>=TO_DATE('"+jc_cgdd_tdsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_tdsj=request.getParameter("jc_cgdd_tdsj2");
	if (jc_cgdd_tdsj!=null)
	{
		if (!(jc_cgdd_tdsj.equals("")))	wheresql+="  and (jc_cgdd.tdsj<=TO_DATE('"+jc_cgdd_tdsj+"','YYYY/MM/DD'))";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	
	
	String pdgc=null;
	pdgc=request.getParameter("pdgc");
	if (pdgc!=null)
	{
		pdgc=cf.GB2Uni(pdgc);
		if (!(pdgc.equals("")))	wheresql+=" and  (jc_cgdd.pdgc='"+pdgc+"')";
	}
	String sfpsjs=null;
	sfpsjs=request.getParameter("sfpsjs");
	if (sfpsjs!=null)
	{
		sfpsjs=cf.GB2Uni(sfpsjs);
		if (!(sfpsjs.equals("")))	wheresql+=" and  (jc_cgdd.sfpsjs='"+sfpsjs+"')";
	}

	jc_cgdd_ddbh=request.getParameter("jc_cgdd_ddbh");
	if (jc_cgdd_ddbh!=null)
	{
		jc_cgdd_ddbh=cf.GB2Uni(jc_cgdd_ddbh);
		if (!(jc_cgdd_ddbh.equals("")))	wheresql+=" and  (jc_cgdd.ddbh='"+jc_cgdd_ddbh+"')";
	}
	jc_cgdd_khbh=request.getParameter("jc_cgdd_khbh");
	if (jc_cgdd_khbh!=null)
	{
		jc_cgdd_khbh=cf.GB2Uni(jc_cgdd_khbh);
		if (!(jc_cgdd_khbh.equals("")))	wheresql+=" and  (jc_cgdd.khbh='"+jc_cgdd_khbh+"')";
	}
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_cgdd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_cgdd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_cgdd.xmzy='"+xmzy+"')";
	}
	jc_cgdd_jhccsj=request.getParameter("jc_cgdd_jhccsj");
	if (jc_cgdd_jhccsj!=null)
	{
		jc_cgdd_jhccsj=jc_cgdd_jhccsj.trim();
		if (!(jc_cgdd_jhccsj.equals("")))	wheresql+="  and (jc_cgdd.jhccsj>=TO_DATE('"+jc_cgdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhccsj=request.getParameter("jc_cgdd_jhccsj2");
	if (jc_cgdd_jhccsj!=null)
	{
		jc_cgdd_jhccsj=jc_cgdd_jhccsj.trim();
		if (!(jc_cgdd_jhccsj.equals("")))	wheresql+="  and (jc_cgdd.jhccsj<=TO_DATE('"+jc_cgdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_cgsjs=request.getParameter("jc_cgdd_cgsjs");
	if (jc_cgdd_cgsjs!=null)
	{
		jc_cgdd_cgsjs=cf.GB2Uni(jc_cgdd_cgsjs);
		if (!(jc_cgdd_cgsjs.equals("")))	wheresql+=" and  (jc_cgdd.cgsjs like '%"+jc_cgdd_cgsjs+"%')";
	}
	jc_cgdd_sccsj=request.getParameter("jc_cgdd_sccsj");
	if (jc_cgdd_sccsj!=null)
	{
		jc_cgdd_sccsj=jc_cgdd_sccsj.trim();
		if (!(jc_cgdd_sccsj.equals("")))	wheresql+="  and (jc_cgdd.sccsj>=TO_DATE('"+jc_cgdd_sccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sccsj=request.getParameter("jc_cgdd_sccsj2");
	if (jc_cgdd_sccsj!=null)
	{
		jc_cgdd_sccsj=jc_cgdd_sccsj.trim();
		if (!(jc_cgdd_sccsj.equals("")))	wheresql+="  and (jc_cgdd.sccsj<=TO_DATE('"+jc_cgdd_sccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhfcsj=request.getParameter("jc_cgdd_jhfcsj");
	if (jc_cgdd_jhfcsj!=null)
	{
		jc_cgdd_jhfcsj=jc_cgdd_jhfcsj.trim();
		if (!(jc_cgdd_jhfcsj.equals("")))	wheresql+="  and (jc_cgdd.jhfcsj>=TO_DATE('"+jc_cgdd_jhfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhfcsj=request.getParameter("jc_cgdd_jhfcsj2");
	if (jc_cgdd_jhfcsj!=null)
	{
		jc_cgdd_jhfcsj=jc_cgdd_jhfcsj.trim();
		if (!(jc_cgdd_jhfcsj.equals("")))	wheresql+="  and (jc_cgdd.jhfcsj<=TO_DATE('"+jc_cgdd_jhfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sfcsj=request.getParameter("jc_cgdd_sfcsj");
	if (jc_cgdd_sfcsj!=null)
	{
		jc_cgdd_sfcsj=jc_cgdd_sfcsj.trim();
		if (!(jc_cgdd_sfcsj.equals("")))	wheresql+="  and (jc_cgdd.sfcsj>=TO_DATE('"+jc_cgdd_sfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sfcsj=request.getParameter("jc_cgdd_sfcsj2");
	if (jc_cgdd_sfcsj!=null)
	{
		jc_cgdd_sfcsj=jc_cgdd_sfcsj.trim();
		if (!(jc_cgdd_sfcsj.equals("")))	wheresql+="  and (jc_cgdd.sfcsj<=TO_DATE('"+jc_cgdd_sfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_qhtsj=request.getParameter("jc_cgdd_qhtsj");
	if (jc_cgdd_qhtsj!=null)
	{
		jc_cgdd_qhtsj=jc_cgdd_qhtsj.trim();
		if (!(jc_cgdd_qhtsj.equals("")))	wheresql+="  and (jc_cgdd.qhtsj>=TO_DATE('"+jc_cgdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_qhtsj=request.getParameter("jc_cgdd_qhtsj2");
	if (jc_cgdd_qhtsj!=null)
	{
		jc_cgdd_qhtsj=jc_cgdd_qhtsj.trim();
		if (!(jc_cgdd_qhtsj.equals("")))	wheresql+="  and (jc_cgdd.qhtsj<=TO_DATE('"+jc_cgdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jctdyybm=request.getParameter("jctdyybm");
	if (jctdyybm!=null)
	{
		jctdyybm=cf.GB2Uni(jctdyybm);
		if (!(jctdyybm.equals("")))	wheresql+=" and  (jc_cgdd.jctdyybm='"+jctdyybm+"')";
	}
	jc_cgdd_jhazrq=request.getParameter("jc_cgdd_jhazrq");
	if (jc_cgdd_jhazrq!=null)
	{
		jc_cgdd_jhazrq=jc_cgdd_jhazrq.trim();
		if (!(jc_cgdd_jhazrq.equals("")))	wheresql+="  and (jc_cgdd.jhazrq>=TO_DATE('"+jc_cgdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhazrq=request.getParameter("jc_cgdd_jhazrq2");
	if (jc_cgdd_jhazrq!=null)
	{
		jc_cgdd_jhazrq=jc_cgdd_jhazrq.trim();
		if (!(jc_cgdd_jhazrq.equals("")))	wheresql+="  and (jc_cgdd.jhazrq<=TO_DATE('"+jc_cgdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sazrq=request.getParameter("jc_cgdd_sazrq");
	if (jc_cgdd_sazrq!=null)
	{
		jc_cgdd_sazrq=jc_cgdd_sazrq.trim();
		if (!(jc_cgdd_sazrq.equals("")))	wheresql+="  and (jc_cgdd.sazrq>=TO_DATE('"+jc_cgdd_sazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sazrq=request.getParameter("jc_cgdd_sazrq2");
	if (jc_cgdd_sazrq!=null)
	{
		jc_cgdd_sazrq=jc_cgdd_sazrq.trim();
		if (!(jc_cgdd_sazrq.equals("")))	wheresql+="  and (jc_cgdd.sazrq<=TO_DATE('"+jc_cgdd_sazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_clzt=request.getParameter("jc_cgdd_clzt");
	if (jc_cgdd_clzt!=null)
	{
		jc_cgdd_clzt=cf.GB2Uni(jc_cgdd_clzt);
		if (!(jc_cgdd_clzt.equals("")))	wheresql+=" and  (jc_cgdd.clzt='"+jc_cgdd_clzt+"')";
	}
	jc_cgdd_khlx=request.getParameter("jc_cgdd_khlx");
	if (jc_cgdd_khlx!=null)
	{
		jc_cgdd_khlx=cf.GB2Uni(jc_cgdd_khlx);
		if (!(jc_cgdd_khlx.equals("")))	wheresql+=" and  (jc_cgdd.khlx='"+jc_cgdd_khlx+"')";
	}
	jc_cgdd_lrr=request.getParameter("jc_cgdd_lrr");
	if (jc_cgdd_lrr!=null)
	{
		jc_cgdd_lrr=cf.GB2Uni(jc_cgdd_lrr);
		if (!(jc_cgdd_lrr.equals("")))	wheresql+=" and  (jc_cgdd.lrr='"+jc_cgdd_lrr+"')";
	}
	jc_cgdd_lrsj=request.getParameter("jc_cgdd_lrsj");
	if (jc_cgdd_lrsj!=null)
	{
		jc_cgdd_lrsj=jc_cgdd_lrsj.trim();
		if (!(jc_cgdd_lrsj.equals("")))	wheresql+="  and (jc_cgdd.lrsj>=TO_DATE('"+jc_cgdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_lrsj=request.getParameter("jc_cgdd_lrsj2");
	if (jc_cgdd_lrsj!=null)
	{
		jc_cgdd_lrsj=jc_cgdd_lrsj.trim();
		if (!(jc_cgdd_lrsj.equals("")))	wheresql+="  and (jc_cgdd.lrsj<=TO_DATE('"+jc_cgdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_dwbh=request.getParameter("jc_cgdd_dwbh");
	if (jc_cgdd_dwbh!=null)
	{
		jc_cgdd_dwbh=cf.GB2Uni(jc_cgdd_dwbh);
		if (!(jc_cgdd_dwbh.equals("")))	wheresql+=" and  (jc_cgdd.dwbh='"+jc_cgdd_dwbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
%>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

int khs=0;
int dds=0;

double gtbfje=0;
double tmbfje=0;
double wjhtze=0;
double dqhtze=0;
double htze=0;

double gtzjje=0;
double tmzjje=0;
double wjzjje=0;
double dqzjje=0;
double zjhze=0;


try {
	conn=cf.getConnection();

	ls_sql=" select count(distinct jc_cgdd.khbh),count(distinct jc_cgdd.ddbh),sum(jc_cgdd.gtbfje),sum(jc_cgdd.tmbfje),sum(jc_cgdd.wjhtze),sum(jc_cgdd.dqhtze),sum(jc_cgdd.htze),sum(jc_cgdd.gtzjje),sum(jc_cgdd.tmzjje),sum(jc_cgdd.wjzjje),sum(jc_cgdd.dqzjje),sum(jc_cgdd.zjhze)";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx,sq_gysxx";
    ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) ";
	ls_sql+=" and jc_cgdd.pdgc=sq_gysxx.gysbh(+)  ";
	ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khs=rs.getInt(1);
		dds=rs.getInt(2);
		gtbfje=rs.getDouble(3);
		tmbfje=rs.getDouble(4);
		wjhtze=rs.getDouble(5);
		dqhtze=rs.getDouble(6);
		htze=rs.getDouble(7);
		gtzjje=rs.getDouble(8);
		tmzjje=rs.getDouble(9);
		wjzjje=rs.getDouble(10);
		dqzjje=rs.getDouble(11);
		zjhze=rs.getDouble(12);
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
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(distinct jc_cgdd.khbh),count(distinct jc_cgdd.ddbh),sum(jc_cgdd.gtbfje),sum(jc_cgdd.tmbfje),sum(jc_cgdd.wjhtze),sum(jc_cgdd.dqhtze),sum(jc_cgdd.htze),sum(jc_cgdd.gtzjje),sum(jc_cgdd.tmzjje),sum(jc_cgdd.wjzjje),sum(jc_cgdd.dqzjje),sum(jc_cgdd.zjhze),'<img src=\"/images/ColuGif.gif\" width=\"'||ROUND(sum(jc_cgdd.zjhze)*100/"+zjhze+",2)||'\" height=\"14\">'||ROUND(sum(jc_cgdd.zjhze)*100/"+zjhze+",2)||'%'";
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
	<td  width="8%">柜体合同金额</td>
	<td  width="8%">台面合同金额</td>
	<td  width="8%">五金合同金额</td>
	<td  width="8%">电器合同金额</td>
	<td  width="8%">合同总额</td>

	<td  width="8%">柜体增减后金额</td>
	<td  width="8%">台面增减后金额</td>
	<td  width="8%">五金增减后金额</td>
	<td  width="8%">电器增减后金额</td>
	<td  width="8%">增减后总额</td>

	<td  width="20%">金额所占比率</td>


</tr>
<%

	ls_sql=selectgroupsql;
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx,sq_gysxx";
    ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) ";
	ls_sql+=" and jc_cgdd.pdgc=sq_gysxx.gysbh(+)  ";
	ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);

	pageObj.alignStr[groupsl+12]="align='left'";


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
  <td ><%=gtbfje%></td>
  <td ><%=tmbfje%></td>
  <td ><%=wjhtze%></td>
  <td ><%=dqhtze%></td>
  <td ><%=htze%></td>
  <td ><%=gtzjje%></td>
  <td ><%=tmzjje%></td>
  <td ><%=wjzjje%></td>
  <td ><%=dqzjje%></td>
  <td ><%=zjhze%></td>
  <td align='left'><img src="/images/ColuGif.gif" width="100" height="14"></td>
</tr>
</table>

</body>
</html>