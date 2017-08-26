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



String wheresql="";


String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权


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
  <B><font size="3">套餐表
  <BR>(记入业绩时间：<%=yjjzsj%>--<%=yjjzsj2%>)</font></b>
</CENTER>
<DIV onselectstart="return false" style="BORDER-RIGHT: #808080 2px solid; BORDER-TOP: #808080 2px solid; DISPLAY: inline; OVERFLOW: auto; BORDER-LEFT: #808080 2px solid; WIDTH: 100%; CURSOR: default; BORDER-BOTTOM: #808080 2px solid; HEIGHT:95%"> 


<TABLE style="DISPLAY: inline; BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=2 border=1 width="2500%" style='FONT-SIZE: 13px'>
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
	<td  width="70px" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">序号</td>
	<td  width="140px" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">姓名</td>
	<td  width="150px" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">记入业绩时间</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">客户是否结算 </td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工队是否结算</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">户型</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">价位</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">套餐名称</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签约变动</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">面积</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">主材</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">远程费</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工面积</td>

	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">平米造价</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折前签约报价</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签约施工工料</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折扣金额</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">集团承担返券折扣</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后合同金额</td>

	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">竣工结算额</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">结算优惠金额</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">其中集团承担优惠</td>

	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">优惠前结算金额</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">主材增减</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工增减</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签约时套餐外主材增项</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">工料合计</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签约提成</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签约提成比例</td>


	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">结算提成</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">总提成比例</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">人工费</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">辅料款</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">工长</td>

	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工成本占施工收入比例</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工成本占套餐总额比例</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">主材成本占套餐总额比例</td>

	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">主材成本</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">超市主材</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">石材合计</td>


	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">吊顶</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">瓷砖</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">洁具</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">地板</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">橱柜</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">淋浴房</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">壁纸</td>
	<td  width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">门</td>

<%
	//套餐品牌
	String ppmc=null;	
	ls_sql=" select ppmc ";
	ls_sql+=" from jxc_ppxx ";
	ls_sql+=" where pplb in('1','3')";
	ls_sql+=" and cldl in('壁纸类','橱柜类','瓷砖类','地板类','吊顶类','木门类','卫浴类','石材')";
	ls_sql+=" order by ppmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ppmc=rs.getString("ppmc");

		%>
		<td width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><%=ppmc%></td>
		<%
	}
	rs.close();
	ps.close();

	//选配品牌
	String[] pps=new String[300];
	int ppsl=0;
	ls_sql=" select distinct ppbm ";
	ls_sql+=" from  jc_zcdd,crm_khxx";
	ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
	ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=wheresql;
	
	ls_sql+=" and ddlx='C'";//C:选配主材
	ls_sql+=" order by ppbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ppmc=rs.getString("ppbm");

		pps[ppsl]=ppmc;
		ppsl++;

		%>
		<td width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">[<%=ppmc%>]实收款</td>
		<td width="150px" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">[<%=ppmc%>]结算额</td>
		<%
	}
	rs.close();
	ps.close();

%>

	
</tr>

<%

	int row=0;

	String khbh=null;
	String khxm=null;
	String hxmc=null;
	double tcbzjg=0;
	String bjjbmc=null;
	double qybd=0;
	double tcmjzjje=0;
	double zc=0;
	double gc=0;
	double tcqtsf=0;
	int fwmj=0;
	int pmjj=0;
	double wdzgce=0;
	double qye=0;
	double tcsgze=0;
	double gczjx=0;
	double tcwzjzc=0;
	double tcsgzezjx=0;

	double qytcbl=0;
	double ztcbl=0;
	String sgdmc=null;

	double cbsrb=0;
	double cbzeb=0;
	double zczeb=0;

	double cszc=0;

	String getyjjzsj=null;
	String khjsbzmc=null;
	String gdjsjdmc=null;
	String zt=null;


	double xjtcbzjg=0;
	double xjqybd=0;
	double xjtcmjzjje=0;
	double xjzc=0;
	double xjgc=0;
	double xjtcqtsf=0;
	int xjfwmj=0;
	double xjwdzgce=0;
	double xjqye=0;
	double xjtcsgze=0;
	double xjgczjx=0;
	double xjtcwzjzc=0;
	double xjtcsgzezjx=0;


	double xjcbsrb=0;
	double xjcbzeb=0;
	double xjzczeb=0;

	double xjcszc=0;
	
	double xjzqhj=0;//优惠前结算金额
	double xjzhhj=0;//竣工结算额
	double xjyhze=0;//结算优惠金额
	double xjqytc=0;//签约提成
	double xjjstc=0;//结算提成
	double xjyfrgf=0;//人工费
	double xjflk=0;//辅料款
	double xjbcfkhj=0;//施工队结算金额
	double xjsgcb=0;
	double xjzccbze=0;//主材成本总额
	double xjsc=0;//石材合计
	double xjdd=0;//吊顶
	double xjcz=0;//瓷砖
	double xjjj=0;//洁具
	double xjdb=0;//地板
	double xjcg=0;//橱柜
	double xjbz=0;//壁纸
	double xjmm=0;//门

	ls_sql="SELECT crm_khxx.zt,crm_khxx.khbh,khxm,hxmc,crm_tckhqye.tcbzjg,bjjbmc,crm_khxx.wdzgce-crm_tckhqye.tcbzjg qybd,crm_tckhqye.tcmjzjje";
	ls_sql+=" ,crm_tckhqye.tcwzjzc+crm_tckhqye.tczcsjcj+crm_tckhqye.tczccljj+crm_tckhqye.tcxsfzc-crm_tckhqye.tczcjm+crm_tckhqye.tcdpsj+crm_tckhqye.tcdpdlsf+crm_tckhqye.tcxpx zc ";
	ls_sql+=" ,crm_tckhqye.tcwsgzj+crm_tckhqye.tcwgccljj gc,crm_tckhqye.tcqtsf,fwmj,'' cz,'' sg ,zqqtsf,fwmj,crm_khxx.wdzgce,crm_khxx.qye ";
	ls_sql+=" ,crm_tckhqye.tcsgze,crm_tckhqye.tcwsgzjzjx+crm_tckhqye.tcwgccljjzjx gczjx,crm_tckhqye.tcwzjzc,crm_tckhqye.tcsgzezjx ";
	ls_sql+=" ,sgdmc,yjjzsj,DECODE(khjsbz,'N','未结算','Y','已结算','2','审批同意','3','审批不同意') khjsbzmc,gdjsjdmc ";

	ls_sql+=" FROM crm_khxx,crm_tckhqye,sq_sgd,dm_hxbm,bdm_bjjbbm,dm_gdjsjd";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.khbh=crm_tckhqye.khbh(+)";
    ls_sql+=" and bdm_bjjbbm.lx='2'";
    ls_sql+=" and crm_khxx.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and crm_khxx.gdjsjd=dm_gdjsjd.gdjsjd(+)";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		hxmc=rs.getString("hxmc");

		tcbzjg=rs.getDouble("tcbzjg");
		bjjbmc=rs.getString("bjjbmc");
		qybd=rs.getDouble("qybd");
		tcmjzjje=rs.getDouble("tcmjzjje");
		zc=rs.getDouble("zc");
		gc=rs.getDouble("gc");
		tcqtsf=rs.getDouble("tcqtsf");
		fwmj=rs.getInt("fwmj");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		tcsgze=rs.getDouble("tcsgze");
		gczjx=rs.getDouble("gczjx");
		tcwzjzc=rs.getDouble("tcwzjzc");
		tcsgzezjx=rs.getDouble("tcsgzezjx");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		getyjjzsj=cf.fillHtml(rs.getDate("yjjzsj"));
		khjsbzmc=cf.fillHtml(rs.getString("khjsbzmc"));
		gdjsjdmc=cf.fillHtml(rs.getString("gdjsjdmc"));

		if (zt.equals("3"))
		{
			khxm=khxm+"<font color=\"#FF0000\"><B>(已退单)</B></font>";
		}


		xjtcbzjg+=tcbzjg;
		xjqybd+=qybd;
		xjtcmjzjje+=tcmjzjje;
		xjzc+=zc;
		xjgc+=gc;
		xjtcqtsf+=tcqtsf;
		xjfwmj+=fwmj;
		xjwdzgce+=wdzgce;
		xjqye+=qye;
		xjtcsgze+=tcsgze;
		xjgczjx+=gczjx;
		xjtcwzjzc+=tcwzjzc;
		xjtcsgzezjx+=tcsgzezjx;

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
		xjbcfkhj+=bcfkhj;

		double sgcb=cf.round(yfrgf+bcfkhj+flk,2);
		xjsgcb+=sgcb;

		//施工成本占施工收入比例
		if ((tcsgzezjx+tcsgze)!=0)
		{
			cbsrb=cf.round(sgcb*100/(tcsgzezjx+tcsgze),2);
		}
		else{
			cbsrb=0;
		}

		//施工成本占套餐总额比例
		if (qye!=0)
		{
			cbzeb=cf.round(sgcb*100/qye,2);
		}
		else{
			cbzeb=0;
		}


		double zccbze=0;//主材成本总额
		ls_sql="select sum(zjxcbze+cbze)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and jc_zcdd.zcdlbm in('壁纸类','橱柜类','瓷砖类','地板类','吊顶类','木门类','卫浴类','石材')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zccbze=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();


		cszc=0;
		ls_sql="SELECT sum(sl*jsj) ";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.sfcscp='Y'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cszc=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		xjcszc+=cszc;


		zccbze+=cszc;//主材成本=主材成本+超市主材
		zccbze=cf.round(zccbze,2);
		xjzccbze+=zccbze;

		//主材成本占套餐总额比例
		if (qye!=0)
		{
			zczeb=cf.round(zccbze*100/qye,2);
		}
		else{
			zczeb=0;
		}


		double sc=0;//石材合计
		ls_sql="select sum(zjxcbze+cbze)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and jc_zcdd.zcdlbm='石材'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sc=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		xjsc+=sc;

		double dd=0;//吊顶
		ls_sql="select sum(zjxcbze+cbze)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and jc_zcdd.zcdlbm='吊顶类'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			dd=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		xjdd+=dd;

		double cz=0;//瓷砖
		ls_sql="select sum(zjxcbze+cbze)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and jc_zcdd.zcdlbm='瓷砖类'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cz=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		xjcz+=cz;

		double jj=0;//洁具
		ls_sql="select sum(zjxcbze+cbze)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and jc_zcdd.zcdlbm='卫浴类'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		xjjj+=jj;

		double db=0;//地板
		ls_sql="select sum(zjxcbze+cbze)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and jc_zcdd.zcdlbm='地板类'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			db=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		xjdb+=db;

		double cg=0;//橱柜
		ls_sql="select sum(zjxcbze+cbze)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and jc_zcdd.zcdlbm='橱柜类'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cg=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		xjcg+=cg;

		double bz=0;//壁纸
		ls_sql="select sum(zjxcbze+cbze)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and jc_zcdd.zcdlbm='壁纸类'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			bz=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		xjbz+=bz;

		double mm=0;//门
		ls_sql="select sum(zjxcbze+cbze)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and jc_zcdd.zcdlbm='木门类'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			mm=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		xjmm+=mm;


		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=row%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target='_blank'><%=khxm%></A></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=getyjjzsj%></td>
			<td style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=khjsbzmc%></td>
			<td style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=gdjsjdmc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=hxmc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=tcbzjg%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=bjjbmc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qybd%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=tcmjzjje%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=zc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=gc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=tcqtsf%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=fwmj%></td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=pmjj%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=wdzgce%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=tcsgze%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.round(wdzgce-qye,2)%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qye%></td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=zhhj%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=yhze%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=zqhj%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=gczjx%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=tcwzjzc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.round(tcsgzezjx+tcsgze,2)%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qytc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qytcbl%>%</td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=jstc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ztcbl%>%</td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=yfrgf%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=flk%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=sgdmc%></td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cbsrb%>%</td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cbzeb%>%</td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=zczeb%>%</td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=zccbze%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cszc%></td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=sc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=dd%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cz%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=jj%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=db%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cg%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=bz%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=mm%></td>

			<%
			//套餐品牌
			ls_sql=" select ppmc ";
			ls_sql+=" from jxc_ppxx ";
			ls_sql+=" where pplb in('1','3')";
			ls_sql+=" and cldl in('壁纸类','橱柜类','瓷砖类','地板类','吊顶类','木门类','卫浴类','石材')";
			ls_sql+=" order by ppmc";
			ps2= conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			while (rs2.next())
			{
				ppmc=rs2.getString("ppmc");

				double ddcbze=0;
				ls_sql="select sum(zjxcbze+cbze)";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where khbh='"+khbh+"'";
				ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
				ls_sql+=" and jc_zcdd.ppbm='"+ppmc+"'";
				ls_sql+=" and jc_zcdd.zcdlbm in('壁纸类','橱柜类','瓷砖类','地板类','吊顶类','木门类','卫浴类','石材')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					ddcbze=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				%>
				<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ddcbze%></td>
				<%
			}
			rs2.close();
			ps2.close();

					
			//选配品牌
			for (int i=0;i<ppsl ;i++ )
			{
				ppmc=pps[i];

				//销售额
				//结算额
				double ddcbze=0;
				double ddxse=0;
				ls_sql="select sum(jc_zcdd.zjxcbze+jc_zcdd.cbze),sum(jc_zcdd.hkze+jc_zcdd.zjhze)";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
				ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
				ls_sql+=" and jc_zcdd.ppbm='"+ppmc+"'";
				ls_sql+=" and jc_zcdd.ddlx='C'";//C:选配主材
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					ddcbze=rs1.getDouble(1);
					ddxse=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				//实收款
				double ddssk=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  jc_zcdd,cw_khfkjl";
				ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
				ls_sql+=" and cw_khfkjl.khbh='"+khbh+"'";
				ls_sql+=" and  jc_zcdd.ddbh=cw_khfkjl.ddbh";
				ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
				ls_sql+=" and jc_zcdd.ppbm='"+ppmc+"'";
				ls_sql+=" and jc_zcdd.ddlx='C'";//C:选配主材

				ls_sql+=" and cw_khfkjl.scbz='N' and cw_khfkjl.fklxbm='23'";//21:木门；22:橱柜；23:主材；24：家具
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					ddssk=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				%>
				<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ddssk%></td>
				<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ddcbze%></td>
				<%
			}
			%>

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
	//施工成本占施工收入比例
	if ((xjtcsgzezjx+xjtcsgze)!=0)
	{
		cbsrb=cf.round(xjsgcb*100/(xjtcsgzezjx+xjtcsgze),2);
	}
	else{
		cbsrb=0;
	}

	//施工成本占套餐总额比例
	if (xjqye!=0)
	{
		cbzeb=cf.round(xjsgcb*100/xjqye,2);
	}
	else{
		cbzeb=0;
	}
	//主材成本占套餐总额比例
	if (qye!=0)
	{
		zczeb=cf.round(xjzccbze*100/xjqye,2);
	}
	else{
		zczeb=0;
	}
%>

<tr bgcolor="#FFFFFF"  align="center">
	<td colspan="3" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">合计</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjqybd)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjtcmjzjje)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzc)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjgc)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjtcqtsf)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjfwmj)%></td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=pmjj%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjwdzgce)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjtcsgze)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.round(xjwdzgce-xjqye,2)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjqye)%></td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzhhj)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjyhze)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzqhj)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjgczjx)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjtcwzjzc)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.round(xjtcsgzezjx+xjtcsgze,2)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjqytc)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qytcbl%>%</td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjjstc)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ztcbl%>%</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjyfrgf)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjflk)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cbsrb%>%</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cbzeb%>%</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=zczeb%>%</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzccbze)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjcszc)%></td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjsc)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjdd)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjcz)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjjj)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjdb)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjcg)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjbz)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjmm)%></td>

	<%
	//套餐品牌
	ls_sql=" select ppmc ";
	ls_sql+=" from jxc_ppxx ";
	ls_sql+=" where pplb in('1','3')";
	ls_sql+=" and cldl in('壁纸类','橱柜类','瓷砖类','地板类','吊顶类','木门类','卫浴类','石材')";
	ls_sql+=" order by ppmc";
	ps2= conn.prepareStatement(ls_sql);
	rs2=ps2.executeQuery();
	while (rs2.next())
	{
		ppmc=rs2.getString("ppmc");



		double ddcbze=0;
		ls_sql="select sum(jc_zcdd.zjxcbze+jc_zcdd.cbze)";
		ls_sql+=" from  jc_zcdd,crm_khxx,bdm_bjjbbm";
		ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and jc_zcdd.ppbm='"+ppmc+"'";
		ls_sql+=" and jc_zcdd.zcdlbm in('壁纸类','橱柜类','瓷砖类','地板类','吊顶类','木门类','卫浴类','石材')";
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh(+)";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm";
		ls_sql+=" and bdm_bjjbbm.lx='2'";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ddcbze=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		%>
		<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(ddcbze)%></td>
		<%
	}
	rs2.close();
	ps2.close();


	//选配品牌
	for (int i=0;i<ppsl ;i++ )
	{
		ppmc=pps[i];

		//销售额
		//结算额
		double ddcbze=0;
		double ddxse=0;
		ls_sql="select sum(jc_zcdd.zjxcbze+jc_zcdd.cbze),sum(jc_zcdd.hkze+jc_zcdd.zjhze)";
		ls_sql+=" from  jc_zcdd,crm_khxx,bdm_bjjbbm";
		ls_sql+=" where jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and jc_zcdd.ppbm='"+ppmc+"'";
		ls_sql+=" and jc_zcdd.ddlx='C'";//C:选配主材
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm";
		ls_sql+=" and bdm_bjjbbm.lx='2'";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ddcbze=rs1.getDouble(1);
			ddxse=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		//实收款
		double ddssk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  jc_zcdd,cw_khfkjl,crm_khxx,bdm_bjjbbm";
		ls_sql+=" where  jc_zcdd.ddbh=cw_khfkjl.ddbh";
		ls_sql+=" and  jc_zcdd.khbh=cw_khfkjl.khbh";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and jc_zcdd.ppbm='"+ppmc+"'";
		ls_sql+=" and jc_zcdd.ddlx='C'";//C:选配主材

		ls_sql+=" and cw_khfkjl.scbz='N' and cw_khfkjl.fklxbm='23'";//21:木门；22:橱柜；23:主材；24：家具
		
		ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm";
		ls_sql+=" and bdm_bjjbbm.lx='2'";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ddssk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		%>
		<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ddssk%></td>
		<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ddcbze%></td>
		<%
	}

	%>

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

