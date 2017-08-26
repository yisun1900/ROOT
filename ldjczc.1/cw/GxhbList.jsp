<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权


String wheresql="";

if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
{
	wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");

if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
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
  <B><font size="3">个性化表
  <BR>(记入业绩时间：<%=yjjzsj%>--<%=yjjzsj2%>)</font></b>
</CENTER>
<DIV onselectstart="return false" style="BORDER-RIGHT: #808080 2px solid; BORDER-TOP: #808080 2px solid; DISPLAY: inline; OVERFLOW: auto; BORDER-LEFT: #808080 2px solid; WIDTH: 100%; CURSOR: default; BORDER-BOTTOM: #808080 2px solid; HEIGHT:95%"> 


<TABLE style="DISPLAY: inline; BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=2 border=1 width="270%" style='FONT-SIZE: 13px'>
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
	<td  width="70px" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">序号</td>
	<td  width="140px" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">姓名</td>
	<td  width="170px" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">记入业绩时间</td>
	<td  width="120px" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">客户是否结算 </td>
	<td  width="140px" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工队是否结算</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工面积</td>
	<td  width="170px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">平米造价</td>

	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折前签约报价</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折扣金额</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">集团承担返券折扣</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后合同金额</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">竣工结算额</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">结算优惠金额</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">其中集团承担优惠</td>

	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">优惠前结算金额</td>

	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">工料合计</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签约提成</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签约提成比例</td>


	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">结算提成</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">总提成比例</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">人工费</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">辅料款</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">工长</td>

	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工成本</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">代购主材提成</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">钢结构支付</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">钢构客户报价</td>
	<td  width="130px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">钢构应付款</td>
</tr>

<%

	int row=0;

	String khbh=null;
	String khxm=null;
	String hxmc=null;
	double tcbzjg=0;
	String bjjbmc=null;
	int fwmj=0;
	int pmjj=0;
	double wdzgce=0;
	double qye=0;
	double zhgczjf=0;
	double zhzjxje=0;

	double qytcbl=0;
	double ztcbl=0;
	String sgdmc=null;

	String getyjjzsj=null;
	String khjsbzmc=null;
	String gdjsjdmc=null;
	String zt=null;


	
	double xjtcbzjg=0;
	int xjfwmj=0;
	double xjwdzgce=0;
	double xjqye=0;
	double xjzhgczjf=0;
	double xjzhzjxje=0;
	
	double xjzqhj=0;//优惠前结算金额
	double xjzhhj=0;//竣工结算额
	double xjyhze=0;//结算优惠金额
	double xjqytc=0;//签约提成
	double xjjstc=0;//结算提成
	double xjyfrgf=0;//人工费
	double xjflk=0;//辅料款
	double xjbcfkhj=0;//施工队结算金额
	double xjsgcb=0;
	
	ls_sql="SELECT crm_khxx.zt,crm_khxx.khbh,khxm,fwmj,crm_khxx.wdzgce,crm_khxx.qye,zhgczjf,zhzjxje ";
	ls_sql+=" ,sgdmc,yjjzsj,DECODE(khjsbz,'N','未结算','Y','已结算','2','审批同意','3','审批不同意') khjsbzmc,gdjsjdmc ";
	ls_sql+=" FROM crm_khxx,sq_sgd,bdm_bjjbbm,dm_gdjsjd";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and bdm_bjjbbm.lx='1'";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and crm_khxx.gdjsjd=dm_gdjsjd.gdjsjd(+)";
	ls_sql+=" and crm_khxx.zt in('2','3','5') ";//N：否；Y：是
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		fwmj=rs.getInt("fwmj");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zhgczjf=rs.getDouble("zhgczjf");
		zhzjxje=rs.getDouble("zhzjxje");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		getyjjzsj=cf.fillHtml(rs.getDate("yjjzsj"));
		khjsbzmc=cf.fillHtml(rs.getString("khjsbzmc"));
		gdjsjdmc=cf.fillHtml(rs.getString("gdjsjdmc"));

		if (zt.equals("3"))
		{
			khxm=khxm+"<font color=\"#FF0000\"><B>(已退单)</B></font>";
		}


		xjfwmj+=fwmj;
		xjwdzgce+=wdzgce;
		xjqye+=qye;
		xjzhgczjf+=zhgczjf;
		xjzhzjxje+=zhzjxje;


		row++;


		if (fwmj!=0)
		{
			pmjj=(int)wdzgce/fwmj;
		}
		else{
			pmjj=0;
		}

		double zqhj=0;//优惠前结算金额
		double zhhj=0;//竣工结算额
		double yhze=0;//结算优惠金额
		ls_sql=" SELECT zqhj,zhhj,yhze";
		ls_sql+=" FROM cw_jrkhjs";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zqhj=rs1.getDouble("zqhj");
			zhhj=rs1.getDouble("zhhj");
			yhze=rs1.getDouble("yhze");
		}
		rs1.close();
		ps1.close();
		
		xjzqhj+=zqhj;
		xjzhhj+=zhhj;
		xjyhze+=yhze;
		
		double qytc=0;//签约提成
		ls_sql=" SELECT jjze";
		ls_sql+=" FROM cw_jrtcmx";
		ls_sql+=" where khbh='"+khbh+"' and lx='1'";//1：签单提成；2：结算提成 
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qytc=rs1.getDouble("jjze");
		}
		rs1.close();
		ps1.close();
		xjqytc+=qytc;
		
		double jstc=0;//结算提成
		ls_sql=" SELECT jjze";
		ls_sql+=" FROM cw_jrtcmx";
		ls_sql+=" where khbh='"+khbh+"' and lx='2'";//1：签单提成；2：结算提成 
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jstc=rs1.getDouble("jjze");
		}
		rs1.close();
		ps1.close();
		xjjstc+=jstc;

		if (qye!=0)
		{
			qytcbl=cf.round(qytc*100/qye,2);
			ztcbl=cf.round((qytc+jstc)*100/qye,2);
		}
		else{
			qytcbl=0;
			ztcbl=0;
		}

		double yfrgf=0;//人工费
		ls_sql="select sum(bcrgf)";
		ls_sql+=" from  cw_jrbgf";
		ls_sql+=" where khbh='"+khbh+"' and clzt!='3'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yfrgf=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		xjyfrgf+=yfrgf;

		double flk=0;//辅料款
		double bcfkhj=0;//施工队结算金额
		ls_sql="select sum(ycflk+bcflk+gsfl+psfl),sum(bcfkhj)";
		ls_sql+=" from  cw_jrsgdjs";
		ls_sql+=" where khbh='"+khbh+"' and clzt!='3'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			flk=rs1.getDouble(1);
			bcfkhj=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();
		xjflk+=flk;
		xjbcfkhj=bcfkhj;

		double sgcb=cf.round(yfrgf+bcfkhj+flk,2);
		xjsgcb+=sgcb;


		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=row%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target='_blank'><%=khxm%></A></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=getyjjzsj%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=khjsbzmc%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=gdjsjdmc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=fwmj%></td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=pmjj%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=wdzgce%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.round(wdzgce-qye,2)%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qye%></td>



			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=zhhj%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=yhze%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=zqhj%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.round(zhgczjf+zhzjxje,2)%></td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qytc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qytcbl%>%</td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=jstc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ztcbl%>%</td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=yfrgf%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=flk%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=sgdmc%></td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=sgcb%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
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
	if (xjqye!=0)
	{
		qytcbl=cf.round(xjqytc*100/xjqye,2);
		ztcbl=cf.round((xjqytc+xjjstc)*100/xjqye,2);
	}
	else{
		qytcbl=0;
		ztcbl=0;
	}

%>
<tr bgcolor="#FFFFFF"  align="center">
	<td colspan="5" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">小计</td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjfwmj)%></td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=pmjj%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjwdzgce)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.round(xjwdzgce-xjqye,2)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjqye)%></td>



	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzhhj)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjyhze)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzqhj)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.round(xjzhgczjf+xjzhzjxje,2)%></td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjqytc)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qytcbl%>%</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjjstc)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ztcbl%>%</td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjyfrgf)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjflk)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjsgcb)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
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

