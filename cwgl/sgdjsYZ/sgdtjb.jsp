<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
		String zgsmc=(String)session.getAttribute("zgsmc");
%>
<html>
<head>
<title>统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body <body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<center><B>工队结算查询报表</B></center><BR>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String sjfw=null;
    String sjfw2=null;

    sjfw=request.getParameter("sjfw");
    sjfw2=request.getParameter("sjfw2");
	
	String cxrq=request.getParameter("cxrq");
	String cxrq2=request.getParameter("cxrq2");

	Connection conn  = null;
	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	String ls_sql=null;
	ResultSet rs=null;
	String sgdmc=null;
	String mmsl=null;
	int lx=0;
	double pjje=0;
	int lx1=0;
	double htje1=0;
	double htje=0;
	int lx2=0;
	double htje2=0;
	int lx3=0;
	double htje3=0;
	int lx4=0;
	int  htje4=0;
	int jskh=0;
	double gdjskze=0;
	double pjtdje=0;
	double pjtdl=0;
	double zt_fkje3=0;
    double sum_glf=0;
	double total_glf=0;
	String sgd="";

	//查询中用到的接收变量
	String wheresql="";
	String cw_gdjsjl_khbh=null;
	String cw_gdjsjl_sgd=null;
	String cw_gdjsjl_jzbz=null;
	String cw_gdjsjl_zkl=null;
	String cw_gdjsjl_tdjs=null;
	String cw_gdjsjl_glftd=null;
	String cw_gdjsjl_jsr=null;
	String cw_gdjsjl_jssj=null;
	String cw_gdjsjl_jsdw=null;
	String cw_gdjsjl_jsjd=null;
	String cw_gdjsjl_gdjsjlh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sjs=null;
	String crm_khxx_hth=null;
	String crm_khxx_zjxm=null;
	String cw_gdjsjl_spjl=null;
	String cw_gdjsjl_spr=null;
	String cw_gdjsjl_spsj=null;
	String cw_gdjsjl_cwjsr=null;
	String cw_gdjsjl_cwjssj=null;
	int htje11=0;
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	/***********************************************************************************
	***下边的内容为时间控制查询(这里的变量cxrq,cxrq2),不知道你接受过来的时间是不是这个变量.如果不是,把它替换成你自己的就可以.
	**
	*/
	if (sjfw!=null){
		if (!(sjfw.equals(""))) wheresql+="and (cw_gdjsjl.jssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD'))";

	}
	if (sjfw2!=null){
		if (!(sjfw2.equals(""))) wheresql+="and (cw_gdjsjl.jssj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD'))";

	}
	//********************************************************************************

	cw_gdjsjl_khbh=request.getParameter("cw_gdjsjl_khbh");
	if (cw_gdjsjl_khbh!=null)
	{
		cw_gdjsjl_khbh=cf.GB2Uni(cw_gdjsjl_khbh);
		if (!(cw_gdjsjl_khbh.equals("")))	wheresql+=" and  (cw_gdjsjl.khbh='"+cw_gdjsjl_khbh+"')";
		//out.print(wheresql);
	}
	//out.print(1);
	cw_gdjsjl_sgd=request.getParameter("cw_gdjsjl_sgd");
	//out.print(3);
	if (cw_gdjsjl_sgd!=null)
	{
		cw_gdjsjl_sgd=cf.GB2Uni(cw_gdjsjl_sgd);
		//out.print(4);
		if (!(cw_gdjsjl_sgd.equals("")))	wheresql+=" and  (cw_gdjsjl.sgd='"+cw_gdjsjl_sgd+"')";
	}
	//out.print(2);
	cw_gdjsjl_jzbz=request.getParameter("cw_gdjsjl_jzbz");
	if (cw_gdjsjl_jzbz!=null)
	{
		cw_gdjsjl_jzbz=cf.GB2Uni(cw_gdjsjl_jzbz);
		if (!(cw_gdjsjl_jzbz.equals("")))	wheresql+=" and  (cw_gdjsjl.jzbz='"+cw_gdjsjl_jzbz+"')";
	}
	cw_gdjsjl_zkl=request.getParameter("cw_gdjsjl_zkl");
	if (cw_gdjsjl_zkl!=null)
	{
		cw_gdjsjl_zkl=cw_gdjsjl_zkl.trim();
		if (!(cw_gdjsjl_zkl.equals("")))	wheresql+=" and  (cw_gdjsjl.zkl="+cw_gdjsjl_zkl+") ";
	}
	cw_gdjsjl_tdjs=request.getParameter("cw_gdjsjl_tdjs");
	if (cw_gdjsjl_tdjs!=null)
	{
		cw_gdjsjl_tdjs=cf.GB2Uni(cw_gdjsjl_tdjs);
		if (!(cw_gdjsjl_tdjs.equals("")))	wheresql+=" and  (cw_gdjsjl.tdjs='"+cw_gdjsjl_tdjs+"')";
	}
	cw_gdjsjl_glftd=request.getParameter("cw_gdjsjl_glftd");
	if (cw_gdjsjl_glftd!=null)
	{
		cw_gdjsjl_glftd=cw_gdjsjl_glftd.trim();
		if (!(cw_gdjsjl_glftd.equals("")))	wheresql+=" and  (cw_gdjsjl.glftd="+cw_gdjsjl_glftd+") ";
	}
	cw_gdjsjl_jsr=request.getParameter("cw_gdjsjl_jsr");
	if (cw_gdjsjl_jsr!=null)
	{
		cw_gdjsjl_jsr=cf.GB2Uni(cw_gdjsjl_jsr);
		if (!(cw_gdjsjl_jsr.equals("")))	wheresql+=" and  (cw_gdjsjl.jsr='"+cw_gdjsjl_jsr+"')";
	}
	cw_gdjsjl_jssj=request.getParameter("cw_gdjsjl_jssj");
	if (cw_gdjsjl_jssj!=null)
	{
		cw_gdjsjl_jssj=cw_gdjsjl_jssj.trim();
		if (!(cw_gdjsjl_jssj.equals("")))	wheresql+="  and (cw_gdjsjl.jssj>=TO_DATE('"+cw_gdjsjl_jssj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_jssj=request.getParameter("cw_gdjsjl_jssj2");
	if (cw_gdjsjl_jssj!=null)
	{
		cw_gdjsjl_jssj=cw_gdjsjl_jssj.trim();
		if (!(cw_gdjsjl_jssj.equals("")))	wheresql+="  and (cw_gdjsjl.jssj<=TO_DATE('"+cw_gdjsjl_jssj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_jsdw=request.getParameter("cw_gdjsjl_jsdw");
	if (cw_gdjsjl_jsdw!=null)
	{
		cw_gdjsjl_jsdw=cf.GB2Uni(cw_gdjsjl_jsdw);
		if (!(cw_gdjsjl_jsdw.equals("")))	wheresql+=" and  (cw_gdjsjl.jsdw='"+cw_gdjsjl_jsdw+"')";
	}
	cw_gdjsjl_jsjd=request.getParameter("cw_gdjsjl_jsjd");
	if (cw_gdjsjl_jsjd!=null)
	{
		cw_gdjsjl_jsjd=cf.GB2Uni(cw_gdjsjl_jsjd);
		if (!(cw_gdjsjl_jsjd.equals("")))	wheresql+=" and  (cw_gdjsjl.jsjd='"+cw_gdjsjl_jsjd+"')";
	}
	cw_gdjsjl_gdjsjlh=request.getParameter("cw_gdjsjl_gdjsjlh");
	if (cw_gdjsjl_gdjsjlh!=null)
	{
		cw_gdjsjl_gdjsjlh=cf.GB2Uni(cw_gdjsjl_gdjsjlh);
		if (!(cw_gdjsjl_gdjsjlh.equals("")))	wheresql+=" and  (cw_gdjsjl.gdjsjlh='"+cw_gdjsjl_gdjsjlh+"')";
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
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	cw_gdjsjl_spjl=request.getParameter("cw_gdjsjl_spjl");
	if (cw_gdjsjl_spjl!=null)
	{
		cw_gdjsjl_spjl=cf.GB2Uni(cw_gdjsjl_spjl);
		if (!(cw_gdjsjl_spjl.equals("")))	wheresql+=" and  (cw_gdjsjl.spjl='"+cw_gdjsjl_spjl+"')";
	}
	cw_gdjsjl_spr=request.getParameter("cw_gdjsjl_spr");
	if (cw_gdjsjl_spr!=null)
	{
		cw_gdjsjl_spr=cf.GB2Uni(cw_gdjsjl_spr);
		if (!(cw_gdjsjl_spr.equals("")))	wheresql+=" and  (cw_gdjsjl.spr='"+cw_gdjsjl_spr+"')";
	}
	cw_gdjsjl_spsj=request.getParameter("cw_gdjsjl_spsj");
	if (cw_gdjsjl_spsj!=null)
	{
		cw_gdjsjl_spsj=cw_gdjsjl_spsj.trim();
		if (!(cw_gdjsjl_spsj.equals("")))	wheresql+="  and (cw_gdjsjl.spsj>=TO_DATE('"+cw_gdjsjl_spsj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_spsj=request.getParameter("cw_gdjsjl_spsj2");
	if (cw_gdjsjl_spsj!=null)
	{
		cw_gdjsjl_spsj=cw_gdjsjl_spsj.trim();
		if (!(cw_gdjsjl_spsj.equals("")))	wheresql+="  and (cw_gdjsjl.spsj<=TO_DATE('"+cw_gdjsjl_spsj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_cwjsr=request.getParameter("cw_gdjsjl_cwjsr");
	if (cw_gdjsjl_cwjsr!=null)
	{
		cw_gdjsjl_cwjsr=cf.GB2Uni(cw_gdjsjl_cwjsr);
		if (!(cw_gdjsjl_cwjsr.equals("")))	wheresql+=" and  (cw_gdjsjl.cwjsr='"+cw_gdjsjl_cwjsr+"')";
	}
	cw_gdjsjl_cwjssj=request.getParameter("cw_gdjsjl_cwjssj");
	if (cw_gdjsjl_cwjssj!=null)
	{
		cw_gdjsjl_cwjssj=cw_gdjsjl_cwjssj.trim();
		if (!(cw_gdjsjl_cwjssj.equals("")))	wheresql+="  and (cw_gdjsjl.cwjssj>=TO_DATE('"+cw_gdjsjl_cwjssj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_cwjssj=request.getParameter("cw_gdjsjl_cwjssj2");
	if (cw_gdjsjl_cwjssj!=null)
	{
		cw_gdjsjl_cwjssj=cw_gdjsjl_cwjssj.trim();
		if (!(cw_gdjsjl_cwjssj.equals("")))	wheresql+="  and (cw_gdjsjl.cwjssj<=TO_DATE('"+cw_gdjsjl_cwjssj+"','YYYY/MM/DD'))";
	}
%>
<table  width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:12">
  <tr bgcolor="#CCCCCC"  align="center">
    <td  width="11%">施工队</td>
    <td  width="13%">结算的客户数</td>
    <td  width="15%">结算的总金额</td>
    <td  width="13%">提点总金额</td>
    <td  width="21%">平均提点金额</td>
    <td  width="14%">平均提点率(%)</td>
    <td  width="13%">查看明细</td>
  </tr>
  <%

try {
	conn=cf.getConnection();
	/**
        //int pjje111=0;
        ls_sql="select  (sum(((cw_gdjsjl.glftd*cw_gdjsjl.sptdjsje)/100))/sum(sptdjsje))*100 pjje,sum(((cw_gdjsjl.glftd*cw_gdjsjl.sptdjsje)/100)) as sum_glf from cw_gdjsjl,sq_sgd,crm_khxx where";
		ls_sql+=" cw_gdjsjl.sgd=sq_sgd.sgd and cw_gdjsjl.khbh=crm_khxx.khbh(+) and tdjsje>0 ";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		//out.print(ls_sql);
		rs =ps.executeQuery(ls_sql);
	   if (rs.next())
	   {
		pjje=rs.getDouble(1);
		total_glf=rs.getDouble(2);
		//pjje111=(int)pjje;
	    }	
	    rs.close();
	    ps.close();
    **/
	//
	
		ls_sql="select sgdmc,cw_gdjsjl.sgd,count(*) jskh,sum(sptdjsje) gdjskze,sum(((cw_gdjsjl.glftd*cw_gdjsjl.sptdjsje)/100)) as sum_glf,trunc(sum(((cw_gdjsjl.glftd*cw_gdjsjl.sptdjsje)/100))/count(*)) pjtdje,sum((cw_gdjsjl.glftd*cw_gdjsjl.sptdjsje))/sum(sptdjsje) pjtdl  from cw_gdjsjl,sq_sgd,crm_khxx where";
		ls_sql+=" cw_gdjsjl.sgd=sq_sgd.sgd(+) and cw_gdjsjl.khbh=crm_khxx.khbh and sptdjsje>0 and glftd>0 ";
		ls_sql+=wheresql;
		ls_sql+=" group by sgdmc,cw_gdjsjl.sgd ";
		ls_sql+=" order by sgdmc ";
		
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		//out.print(ls_sql);
		while (rs.next())
		{
				sgdmc=rs.getString("sgdmc");
				sgd=rs.getString("sgd");
				jskh=rs.getInt("jskh");
				gdjskze=rs.getDouble("gdjskze");
				sum_glf=rs.getDouble("sum_glf");
				pjtdje=rs.getDouble("pjtdje");
				pjtdl=rs.getDouble("pjtdl");
				htje1=(htje1+gdjskze);//小计工队结算款总额
				htje2=htje2+pjtdje;//小计平均提点金额
				lx4=lx4+jskh;//结算的客户数小计
			    total_glf=(total_glf+sum_glf);
				//htje11=(int)htje1;
				//pjje=(htje2/htje11)*100;
			
				
		%>
  <tr align="center">
    <td  width="11%"><%=sgdmc%></td>
    <td  width="13%"><%=jskh%></td>
    <td  width="15%"><%=cf.formatDouble(gdjskze)%></td>
    <td  width="13%"><%=cf.formatDouble(sum_glf)%></td>
    <td  width="21%"><%=cf.formatDouble(pjtdje)%></td>
    <td  width="14%"><%=cf.formatDouble(pjtdl)%></td>
	 <td  width="13%"><a href="viewsgd.jsp?sgd=<%=sgd%>" target="_blank">明细</a></td>
  </tr>
  <%	}
		rs.close();
		ps.close();
		if(total_glf==0)
	    {
		      out.print("本时间段内没有结算的施工队!");
		      return;
	    }	
	
		%>
  <tr align="center">
    <td  width="11%">合计</td>
    <td  width="13%"><%=lx4%></td>
    <td  width="15%"><%=cf.formatDouble(htje1)%></td>
    <td  width="13%"><%=cf.formatDouble(total_glf)%></td>
    <td  width="21%"><%=cf.formatDouble(htje2)%></td>
    <td  width="14%"><%=cf.formatDouble(total_glf*100/htje1)%></td>
    <td  width="13%">&nbsp;</td>
  </tr>
  <%
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
</table>
</body>
</html>