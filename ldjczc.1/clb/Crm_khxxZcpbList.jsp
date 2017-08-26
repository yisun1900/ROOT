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
  <B><font size="3">个性化主材配比查询
  <BR>(签约时间：<%=qyrq%>--<%=qyrq2%>)</font></b>
</CENTER>
<DIV onselectstart="return false" style="BORDER-RIGHT: #808080 2px solid; BORDER-TOP: #808080 2px solid; DISPLAY: inline; OVERFLOW: auto; BORDER-LEFT: #808080 2px solid; WIDTH: 100%; CURSOR: default; BORDER-BOTTOM: #808080 2px solid; HEIGHT:95%"> 


<TABLE style="DISPLAY: inline; BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=2 border=1 width="220%" style='FONT-SIZE: 13px'>
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
	<td  width="2%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">序号</td>
	<td  width="4%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">姓名</td>
	<td  width="6%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签约时间</td>
	<td  width="7%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">店面</td>
	<td  width="4%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">设计师</td>
	<td  width="5%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">材料员</td>
	<td  width="5%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">主材配比</td>
	<td  width="12%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">房屋地址</td>
	<td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工队</td>
	<td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">客户经理</td>
	<td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">店面业务</td>
	<td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">记入业绩时间</td>
	<td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">客户是否结算</td>
	<td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工队是否结算</td>
	<td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工面积</td>
	<td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">平米造价</td>

	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折前签约报价</td>
	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后合同金额</td>
	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工额</td>
	<td  width="6%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">主材金额</td>
</tr>

<%

	int row=0;

	String getkhbh=null;
	String khxm=null;
	String fwdz=null;
	String getsjs=null;
	String sgdmc=null;
	String getzjxm=null;
	String getkhjl=null;
	String getclgw=null;
	String hxmc=null;
	double tcbzjg=0;
	String bjjbmc=null;
	int fwmj=0;
	int pmjj=0;
	double wdzgce=0;
	double qye=0;
	double zqgczjf=0;
	double zhzjxje=0;

	double qytcbl=0;
	double ztcbl=0;

	String getqyrq=null;
	String getyjjzsj=null;
	String khjsbzmc=null;
	String gdjsjdmc=null;
	String getdwbh=null;
	String getdwmc=null;


	
	double xjtcbzjg=0;
	int xjfwmj=0;
	double xjwdzgce=0;
	double xjqye=0;
	double xjzqgczjf=0;
	double xjzhzjxje=0;
	
	double xjzcje=0;//优惠前结算金额
	
	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}

	
	ls_sql="SELECT crm_khxx.khbh,khxm,fwdz,sjs,zjxm,khjl,clgw,fwmj,crm_khxx.wdzgce,crm_khxx.qye,zqgczjf,zhzjxje ";
	ls_sql+=" ,sgdmc,qyrq,yjjzsj,DECODE(khjsbz,'N','未结算','Y','结算','2','审批同意','3','审批不同意') khjsbzmc,gdjsjdmc ";
	ls_sql+=" ,crm_khxx.dwbh,dwmc";
	ls_sql+=" FROM crm_khxx,sq_sgd,bdm_bjjbbm,dm_gdjsjd,sq_dwxx";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and bdm_bjjbbm.lx='1'";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and crm_khxx.gdjsjd=dm_gdjsjd.gdjsjd(+)";
    ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=ordersql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getdwbh=rs.getString("dwbh");
		getdwmc=rs.getString("dwmc");
		getkhbh=rs.getString("khbh");
		khxm=cf.fillHtml(rs.getString("khxm"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		getsjs=cf.fillHtml(rs.getString("sjs"));
		getzjxm=cf.fillHtml(rs.getString("zjxm"));
		getkhjl=cf.fillHtml(rs.getString("khjl"));
		getclgw=cf.fillHtml(rs.getString("clgw"));

		fwmj=rs.getInt("fwmj");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zqgczjf=rs.getDouble("zqgczjf");
		zhzjxje=rs.getDouble("zhzjxje");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		getqyrq=cf.fillHtml(rs.getDate("qyrq"));
		getyjjzsj=cf.fillHtml(rs.getDate("yjjzsj"));
		khjsbzmc=cf.fillHtml(rs.getString("khjsbzmc"));
		gdjsjdmc=cf.fillHtml(rs.getString("gdjsjdmc"));


		xjfwmj+=fwmj;
		xjwdzgce+=wdzgce;
		xjqye+=qye;
		xjzqgczjf+=zqgczjf;
		xjzhzjxje+=zhzjxje;


		row++;


		if (fwmj!=0)
		{
			pmjj=(int)wdzgce/fwmj;
		}
		else{
			pmjj=0;
		}

		double zcje=0;//优惠前结算金额
		ls_sql=" SELECT sum(hkze+zjhze)";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where khbh='"+getkhbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zcje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		
		xjzcje+=zcje;
		

		double zcpb=0;//结算优惠金额
		if ((zqgczjf+zhzjxje)!=0)
		{
			zcpb=cf.round(zcje*100/(zqgczjf+zhzjxje),2);
		}
		else{
			zcpb=0;
		}



		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=row%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=getkhbh%>" target="_blank"><%=khxm%></A></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=getqyrq%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=getdwmc%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=getsjs%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=getclgw%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=zcpb%>%</td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=fwdz%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=sgdmc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=getzjxm%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=getkhjl%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=getyjjzsj%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=khjsbzmc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=gdjsjdmc%></td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=fwmj%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=pmjj%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=wdzgce%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qye%></td>



			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.round(zqgczjf+zhzjxje,2)%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=zcje%></td>
		</tr>
		<%

	}
	rs.close();
	ps.close();


	if (xjfwmj!=0)
	{
		pmjj=(int)xjwdzgce/xjfwmj;
	}
	else{
		pmjj=0;
	}

	double zcpb=0;//结算优惠金额
	if ((xjzqgczjf+xjzhzjxje)!=0)
	{
		zcpb=cf.round(xjzcje*100/(xjzqgczjf+xjzhzjxje),2);
	}
	else{
		zcpb=0;
	}

%>
<tr bgcolor="#FFFFFF"  align="center">
	<td colspan="6" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">小计</td>
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=zcpb%>%</td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=fwmj%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=pmjj%></td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjwdzgce)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjqye)%></td>


	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzqgczjf+xjzhzjxje)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=xjzcje%></td>
</tr>
</table>
</DIV>

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

