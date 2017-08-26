<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

<body bgcolor="#FFFFFF" >

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}


	String jxc_ckd_ckph=null;
	String jxc_ckd_lrsj=null;
	String jxc_ckd_ckdzt=null;
	String jxc_ckd_cksj=null;
	String lydh=null;
	String jxc_ckd_lrr=null;
	String jxc_ckd_jhshsj=null;

	jxc_ckd_ckph=request.getParameter("jxc_ckd_ckph");
	if (jxc_ckd_ckph!=null)
	{
		jxc_ckd_ckph=cf.GB2Uni(jxc_ckd_ckph);
		if (!(jxc_ckd_ckph.equals("")))	wheresql+=" and  (jxc_ckmx.ckph='"+jxc_ckd_ckph+"')";
	}

	jxc_ckd_lrsj=request.getParameter("jxc_ckd_lrsj");
	if (jxc_ckd_lrsj!=null)
	{
		jxc_ckd_lrsj=jxc_ckd_lrsj.trim();
		if (!(jxc_ckd_lrsj.equals("")))	wheresql+="  and (jxc_ckd.lrsj>=TO_DATE('"+jxc_ckd_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_lrsj=request.getParameter("jxc_ckd_lrsj2");
	if (jxc_ckd_lrsj!=null)
	{
		jxc_ckd_lrsj=jxc_ckd_lrsj.trim();
		if (!(jxc_ckd_lrsj.equals("")))	wheresql+="  and (jxc_ckd.lrsj<=TO_DATE('"+jxc_ckd_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	jxc_ckd_ckdzt=request.getParameter("jxc_ckd_ckdzt");
	if (jxc_ckd_ckdzt!=null)
	{
		jxc_ckd_ckdzt=cf.GB2Uni(jxc_ckd_ckdzt);
		if (!(jxc_ckd_ckdzt.equals("")))	wheresql+=" and  (jxc_ckd.ckdzt='"+jxc_ckd_ckdzt+"')";
	}
	jxc_ckd_cksj=request.getParameter("jxc_ckd_cksj");
	if (jxc_ckd_cksj!=null)
	{
		jxc_ckd_cksj=jxc_ckd_cksj.trim();
		if (!(jxc_ckd_cksj.equals("")))	wheresql+="  and (jxc_ckd.cksj>=TO_DATE('"+jxc_ckd_cksj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_cksj=request.getParameter("jxc_ckd_cksj2");
	if (jxc_ckd_cksj!=null)
	{
		jxc_ckd_cksj=jxc_ckd_cksj.trim();
		if (!(jxc_ckd_cksj.equals("")))	wheresql+="  and (jxc_ckd.cksj<=TO_DATE('"+jxc_ckd_cksj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	lydh=request.getParameter("lydh");
	if (lydh!=null)
	{
		lydh=lydh.trim();
		if (!(lydh.equals("")))	wheresql+=" and  (jxc_ckd.lydh='"+lydh+"')";
	}
	jxc_ckd_lrr=request.getParameter("jxc_ckd_lrr");
	if (jxc_ckd_lrr!=null)
	{
		jxc_ckd_lrr=cf.GB2Uni(jxc_ckd_lrr);
		if (!(jxc_ckd_lrr.equals("")))	wheresql+=" and  (jxc_ckd.lrr='"+jxc_ckd_lrr+"')";
	}
	jxc_ckd_jhshsj=request.getParameter("jxc_ckd_jhshsj");
	if (jxc_ckd_jhshsj!=null)
	{
		jxc_ckd_jhshsj=jxc_ckd_jhshsj.trim();
		if (!(jxc_ckd_jhshsj.equals("")))	wheresql+="  and (jxc_ckd.jhshsj>=TO_DATE('"+jxc_ckd_jhshsj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_jhshsj=request.getParameter("jxc_ckd_jhshsj2");
	if (jxc_ckd_jhshsj!=null)
	{
		jxc_ckd_jhshsj=jxc_ckd_jhshsj.trim();
		if (!(jxc_ckd_jhshsj.equals("")))	wheresql+="  and (jxc_ckd.jhshsj<=TO_DATE('"+jxc_ckd_jhshsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}


	String cldlbm=null;
	String clxlbm=null;
	String jxc_ckmx_clbm=null;
	String jxc_ckmx_clmc=null;
	String jxc_ckmx_clmc2=null;
	String jxc_ckmx_xh=null;
	String jxc_ckmx_gg=null;
	String jxc_ckmx_nbbm=null;
	String jxc_ckmx_ppmc=null;
	String jxc_ckmx_gysmc=null;
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (jxc_ckmx.cldlbm='"+cldlbm+"')";
	}
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (jxc_ckmx.clxlbm='"+clxlbm+"')";
	}
	jxc_ckmx_clbm=request.getParameter("jxc_ckmx_clbm");
	if (jxc_ckmx_clbm!=null)
	{
		jxc_ckmx_clbm=cf.GB2Uni(jxc_ckmx_clbm);
		if (!(jxc_ckmx_clbm.equals("")))	wheresql+=" and  (jxc_ckmx.clbm='"+jxc_ckmx_clbm+"')";
	}
	jxc_ckmx_clbm=request.getParameter("jxc_ckmx_clbm");
	if (jxc_ckmx_clbm!=null)
	{
		jxc_ckmx_clbm=cf.GB2Uni(jxc_ckmx_clbm);
		if (!(jxc_ckmx_clbm.equals("")))	wheresql+=" and  (jxc_ckmx.clbm='"+jxc_ckmx_clbm+"')";
	}
	jxc_ckmx_clmc=request.getParameter("jxc_ckmx_clmc");
	if (jxc_ckmx_clmc!=null)
	{
		jxc_ckmx_clmc=cf.GB2Uni(jxc_ckmx_clmc);
		if (!(jxc_ckmx_clmc.equals("")))	wheresql+=" and  (jxc_ckmx.clmc='"+jxc_ckmx_clmc+"')";
	}
	jxc_ckmx_clmc2=request.getParameter("jxc_ckmx_clmc2");
	if (jxc_ckmx_clmc2!=null)
	{
		jxc_ckmx_clmc2=cf.GB2Uni(jxc_ckmx_clmc2);
		if (!(jxc_ckmx_clmc2.equals("")))	wheresql+=" and  (jxc_ckmx.clmc like '%"+jxc_ckmx_clmc2+"%')";
	}
	jxc_ckmx_xh=request.getParameter("jxc_ckmx_xh");
	if (jxc_ckmx_xh!=null)
	{
		jxc_ckmx_xh=cf.GB2Uni(jxc_ckmx_xh);
		if (!(jxc_ckmx_xh.equals("")))	wheresql+=" and  (jxc_ckmx.xh like '%"+jxc_ckmx_xh+"%')";
	}
	jxc_ckmx_gg=request.getParameter("jxc_ckmx_gg");
	if (jxc_ckmx_gg!=null)
	{
		jxc_ckmx_gg=cf.GB2Uni(jxc_ckmx_gg);
		if (!(jxc_ckmx_gg.equals("")))	wheresql+=" and  (jxc_ckmx.gg like '%"+jxc_ckmx_gg+"%')";
	}
	jxc_ckmx_nbbm=request.getParameter("jxc_ckmx_nbbm");
	if (jxc_ckmx_nbbm!=null)
	{
		jxc_ckmx_nbbm=cf.GB2Uni(jxc_ckmx_nbbm);
		if (!(jxc_ckmx_nbbm.equals("")))	wheresql+=" and  (jxc_ckmx.nbbm='"+jxc_ckmx_nbbm+"')";
	}
	jxc_ckmx_ppmc=request.getParameter("jxc_ckmx_ppmc");
	if (jxc_ckmx_ppmc!=null)
	{
		jxc_ckmx_ppmc=cf.GB2Uni(jxc_ckmx_ppmc);
		if (!(jxc_ckmx_ppmc.equals("")))	wheresql+=" and  (jxc_ckmx.ppmc='"+jxc_ckmx_ppmc+"')";
	}
	jxc_ckmx_gysmc=request.getParameter("jxc_ckmx_gysmc");
	if (jxc_ckmx_gysmc!=null)
	{
		jxc_ckmx_gysmc=cf.GB2Uni(jxc_ckmx_gysmc);
		if (!(jxc_ckmx_gysmc.equals("")))	wheresql+=" and  (jxc_ckmx.gysmc='"+jxc_ckmx_gysmc+"')";
	}
%>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

double cksl=0;
double ckje=0;

try {
	conn=cf.getConnection();

	ls_sql=" select sum(jxc_ckmx.cksl),sum(jxc_ckmx.ckje)";
	ls_sql+=" FROM jxc_ckd,jxc_ckmx,crm_khxx,sq_sgd,sq_dwxx  ";
    ls_sql+=" where jxc_ckmx.ckph=jxc_ckd.ckph(+) and jxc_ckd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and jxc_ckd.ckcllx='1' and jxc_ckd.cklx='P'";//0：主材；1：辅材
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cksl=rs.getDouble(1);
		ckje=rs.getDouble(2);
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
		selectgroupsql=" select "+selectgroupsql.substring(1)+",sum(jxc_ckmx.cksl),sum(jxc_ckmx.ckje)";
	}
%>

<center>出库单明细统计</center>
<table class="LockHeadTable" ROWHEADNUM=1 COLHEADNUM=1 ROWHEADSTYLE="background:#CC6600; color:white;" COLHEADSTYLE="background:#CCCCCC; color:black;" FOCUSSTYLE="background-image: url(/images/bg.normal.gif);" width="100%" border="1" cellpadding="3" cellspacing="0" align="center" style="FONT-SIZE:12">

<tr bgcolor="#CCCCCC"  align="center"  >
<%

	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"8%\" >"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj3name+"</td>");
	}
	if (!tj4name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj4name+"</td>");
	}
	if (!tj5name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj5name+"</td>");
	}
	if (!tj6name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj6name+"</td>");
	}

%>

	<td  width="5%">出库数量</td>
	<td  width="8%">出库金额</td>
</tr>
<%

	ls_sql=selectgroupsql;

	ls_sql+=" FROM jxc_ckd,jxc_ckmx,crm_khxx,sq_sgd,sq_dwxx  ";
    ls_sql+=" where jxc_ckmx.ckph=jxc_ckd.ckph(+) and jxc_ckd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and jxc_ckd.ckcllx='1' and jxc_ckd.cklx='P'";//0：主材；1：辅材
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);


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

<tr bgcolor="#FFFFFF" align='center' >
  <td colspan="<%=groupsl%>">小 计</td>
  <td ><%=cksl%></td>
  <td ><%=ckje%></td>
</tr>
</table>


</body>
</html>




