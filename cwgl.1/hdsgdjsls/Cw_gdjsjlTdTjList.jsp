<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">项目经理结算统计表（提点结算）</font></B> 
</CENTER>
  
<%
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
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	cw_gdjsjl_khbh=request.getParameter("cw_gdjsjl_khbh");
	if (cw_gdjsjl_khbh!=null)
	{
		cw_gdjsjl_khbh=cf.GB2Uni(cw_gdjsjl_khbh);
		if (!(cw_gdjsjl_khbh.equals("")))	wheresql+=" and  (cw_gdjsjl.khbh='"+cw_gdjsjl_khbh+"')";
	}
	cw_gdjsjl_sgd=request.getParameter("cw_gdjsjl_sgd");
	if (cw_gdjsjl_sgd!=null)
	{
		cw_gdjsjl_sgd=cf.GB2Uni(cw_gdjsjl_sgd);
		if (!(cw_gdjsjl_sgd.equals("")))	wheresql+=" and  (cw_gdjsjl.sgd='"+cw_gdjsjl_sgd+"')";
	}
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sgdmc=null;
	String dwmc=null;
	String sjs=null;
	double zkl=0;
	String qyrq=null;
	String fwdz=null;
	double khjskze=0;
	double khsskze=0;
	double sj=0;
	double glftd=0;
	double glf=0;
	double wxj=0;
	double clf=0;
	double zgclf=0;
	double kqtk=0;
	double gdjskze=0;
	String bz=null;

	int row=0;
	ls_sql="SELECT sgdmc,dwmc,sjs,cw_gdjsjl.zkl,qyrq,fwdz,cw_gdjsjl.khjskze,cw_gdjsjl.khsskze,cw_gdjsjl.sj,cw_gdjsjl.wxj";
	ls_sql+=" ,cw_gdjsjl.clf,cw_gdjsjl.zgclf,cw_gdjsjl.kqtk,cw_gdjsjl.gdjskze,cw_gdjsjl.bz,cw_gdjsjl.glftd,cw_gdjsjl.glf ";
	ls_sql+=" FROM cw_gdjsjl,crm_khxx,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjsjl.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_gdjsjl.sgd=sq_sgd.sgd(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by cw_gdjsjl.sgd,cw_gdjsjl.jssj desc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zkl=rs.getDouble("zkl");
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		khjskze=rs.getDouble("khjskze");
		khsskze=rs.getDouble("khsskze");
		sj=rs.getDouble("sj");
		wxj=rs.getDouble("wxj");
		clf=rs.getDouble("clf");
		zgclf=rs.getDouble("zgclf");
		kqtk=rs.getDouble("kqtk");
		gdjskze=rs.getDouble("gdjskze");
		bz=cf.fillHtml(rs.getString("bz"));
		glftd=rs.getDouble("glftd");
		glf=rs.getDouble("glf");

		row++;
		if (row>300)
		{
			out.println("结果不能超过300个工地");
			return;
		}
		
		%> <b>项目经理：</b><%=sgdmc%> <BR>
		
<table border="0" width="100%" cellspacing="0" cellpadding="0"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"  > 
    <td  width="14%"><b>签单部门（设计师）</b></td>
    <td  width="4%"><b>折扣</b></td>
    <td  width="7%"><b>签单日期</b></td>
    <td  width="18%"><b>工程名称</b></td>
    <td  width="6%"><b>结算金额</b></td>
    <td  width="6%"><b>已收款</b></td>
    <td  width="5%"><b>税金</b></td>
    <td  width="5%"><b>提点</b></td>
    <td  width="6%"><b>管理费</b></td>
    <td  width="6%"><b>维修金</b></td>
    <td  width="6%"><b>物流材料</b></td>
    <td  width="6%"><b>外构材料</b></td>
    <td  width="5%"><b>扣款</b></td>
    <td  width="6%"><b>结算金额</b></td>
  </tr>
  <tr bgcolor="#FFFFFF" > 
    <td><%=dwmc%>(<%=sjs%>)</td>
    <td><%=zkl%></td>
    <td><%=qyrq%></td>
    <td><%=fwdz%></td>
    <td><%=khjskze%></td>
    <td><%=khsskze%></td>
    <td><%=sj%></td>
    <td><%=glftd%>%</td>
    <td><%=glf%></td>
    <td><%=wxj%></td>
    <td><%=clf%></td>
    <td><%=zgclf%></td>
    <td><%=kqtk%></td>
    <td><%=gdjskze%></td>
  </tr>
</table>
		<HR>
<b>结算说明：</b><%=bz%> 
<HR>
		<%
	}
	rs.close();
	ps.close();

	if (row==0)
	{
		out.println("无数据");
	}
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
</body>
</html>