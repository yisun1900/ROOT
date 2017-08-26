<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权


ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}


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

String khjl=null;
khjl=request.getParameter("khjl");
if (khjl!=null)
{
	khjl=cf.GB2Uni(khjl);
	if (!(khjl.equals("")))	wheresql+=" and  (crm_khxx.khjl='"+khjl+"')";
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
String clgw=null;
clgw=request.getParameter("clgw");
if (clgw!=null)
{
	clgw=cf.GB2Uni(clgw);
	if (!(clgw.equals("")))	wheresql+=" and  (crm_khxx.clgw='"+clgw+"')";
}


String khbh=null;
String hth=null;
khbh=request.getParameter("khbh");
if (khbh!=null)
{
	khbh=cf.GB2Uni(khbh);
	if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
}
hth=request.getParameter("hth");
if (hth!=null)
{
	hth=cf.GB2Uni(hth);
	if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
}


String crm_khxx_khxm=null;
crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
if (crm_khxx_khxm!=null)
{
	crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
	if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
}
String crm_khxx_khxm2=null;
crm_khxx_khxm2=request.getParameter("crm_khxx_khxm2");
if (crm_khxx_khxm2!=null)
{
	crm_khxx_khxm2=cf.GB2Uni(crm_khxx_khxm2);
	if (!(crm_khxx_khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm2+"%')";
}
String crm_khxx_fwdz=null;
crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
if (crm_khxx_fwdz!=null)
{
	crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
	if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
}
String crm_khxx_fwdz2=null;
crm_khxx_fwdz2=request.getParameter("crm_khxx_fwdz2");
if (crm_khxx_fwdz2!=null)
{
	crm_khxx_fwdz2=cf.GB2Uni(crm_khxx_fwdz2);
	if (!(crm_khxx_fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz2+"%')";
}
String crm_khxx_lxfs=null;
crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
if (crm_khxx_lxfs!=null)
{
	crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
	if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
}
String crm_khxx_lxfs2=null;
crm_khxx_lxfs2=request.getParameter("crm_khxx_lxfs2");
if (crm_khxx_lxfs2!=null)
{
	crm_khxx_lxfs2=cf.GB2Uni(crm_khxx_lxfs2);
	if (!(crm_khxx_lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs2+"%')";
}





String qyrq=null;
qyrq=request.getParameter("qyrq");
if (qyrq!=null)
{
	qyrq=qyrq.trim();
	if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
}
String qyrq2=null;
qyrq2=request.getParameter("qyrq2");
if (qyrq2!=null)
{
	qyrq2=qyrq2.trim();
	if (!(qyrq2.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq2+"','YYYY-MM-DD'))";
}


String lrr=null;
String lrsj=null;
lrr=request.getParameter("lrr");
if (lrr!=null)
{
	lrr=cf.GB2Uni(lrr);
	if (!(lrr.equals("")))	wheresql+=" and  (crm_khxx.lrr='"+lrr+"')";
}
lrsj=request.getParameter("lrsj");
if (lrsj!=null)
{
	lrsj=lrsj.trim();
	if (!(lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
}
lrsj=request.getParameter("lrsj2");
if (lrsj!=null)
{
	lrsj=lrsj.trim();
	if (!(lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
}

String gdjsjd=null;
gdjsjd=request.getParameter("gdjsjd");
if (gdjsjd!=null)
{
	gdjsjd=cf.GB2Uni(gdjsjd);
	if (!(gdjsjd.equals("")))	wheresql+=" and  (crm_khxx.gdjsjd='"+gdjsjd+"')";
}
String khjsbz=null;
khjsbz=request.getParameter("khjsbz");
if (khjsbz!=null)
{
	khjsbz=cf.GB2Uni(khjsbz);
	if (!(khjsbz.equals("")))	wheresql+=" and  (crm_khxx.khjsbz='"+khjsbz+"')";
}



String yjjzsj=null;
yjjzsj=request.getParameter("yjjzsj");
if (yjjzsj!=null)
{
	yjjzsj=yjjzsj.trim();
	if (!(yjjzsj.equals("")))	wheresql+="  and (crm_khxx.yjjzsj>=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
}
String yjjzsj2=null;
yjjzsj2=request.getParameter("yjjzsj2");
if (yjjzsj2!=null)
{
	yjjzsj2=yjjzsj2.trim();
	if (!(yjjzsj2.equals("")))	wheresql+="  and (crm_khxx.yjjzsj<=TO_DATE('"+yjjzsj2+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
}


String ppmc=null;
ppmc=request.getParameter("ppmc");
if (ppmc!=null)
{
	ppmc=cf.GB2Uni(ppmc);
	if (!(ppmc.equals("")))	wheresql+=" and  (bj_khppsjcjb.ppmc='"+ppmc+"')";
}

String ppmc2=null;
ppmc2=request.getParameter("ppmc2");
if (ppmc2!=null)
{
	ppmc2=cf.GB2Uni(ppmc2);
	if (!(ppmc2.equals("")))	wheresql+=" and  (bj_khppsjcjb.ppmc like '%"+ppmc2+"%')";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">品牌升级优惠查询
  <BR>(签约时间：<%=qyrq%>--<%=qyrq2%>)</font></b>
</CENTER>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<TR bgcolor="#CCCCCC"  align="center"  > 
	<td  width="5%" >序号</td>
	<td  width="20%" >品牌</td>

	<td  width="15%" >客户数量</td>
	<td  width="15%" >订货数量</td>
	<td  width="20%" >销售金额</td>
</tr>

<%

	int row=0;

	String getppmc=null;
	String getxh=null;
	String getgg=null;
	String getcpmc=null;
	String getsfyx=null;
	String getyxkssj=null;
	String getyxjzsj=null;

	int khsl=0;
	double xdsl=0;
	double xdje=0;
	
	int xjkhsl=0;
	double xjxdsl=0;
	double xjxdje=0;
	
	ls_sql="SELECT bj_khppsjcjb.ppmc,count(distinct bj_khppsjcjb.khbh) khsl,sum(bj_khppsjcjb.sjsfsl) xdsl,sum(bj_khppsjcjb.sjsfje) xdje";
	ls_sql+=" FROM crm_khxx,bj_khppsjcjb";
    ls_sql+=" where bj_khppsjcjb.khbh=crm_khxx.khbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" group by bj_khppsjcjb.ppmc ";
	ls_sql+=" order by bj_khppsjcjb.ppmc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getppmc=rs.getString("ppmc");

		khsl=rs.getInt("khsl");
		xdsl=rs.getDouble("xdsl");
		xdje=rs.getDouble("xdje");


		xjkhsl+=khsl;
		xjxdsl+=xdsl;
		xjxdje+=xdje;


		row++;


		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td ><%=row%></td>
			<td ><%=getppmc%></td>
			<td ><A HREF="ViewPpsjyhCrm_khxx.jsp?ppmc=<%=getppmc%>&ssfgs=<%=fgs%>&wheresql=<%=wheresql%>" target="_blank"><%=khsl%></A></td>

			<td  ><%=xdsl%></td>
			<td  ><%=xdje%></td>
		</tr>
		<%

	}
	rs.close();
	ps.close();


%>
<tr bgcolor="#FFFFFF"  align="center">
	<td colspan="2" >小计</td>


	<td  ><%=xjkhsl%></td>
	<td  ><%=xjxdsl%></td>
	<td  ><%=xjxdje%></td>
</tr>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

