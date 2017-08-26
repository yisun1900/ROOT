<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String khbh=null;
String clgw=null;
String xmzy=null;
String ddshbz=null;
double hkze=0;
double htcxhdje=0;
java.sql.Date jhtzshsj=null;
java.sql.Date kjxsj=null;
java.sql.Date htshsj=null;
String lrr=null;
java.sql.Date qhtsj=null;
java.sql.Date lrsj=null;
String dwbh=null;
String bz=null;
String zt=request.getParameter("zt");
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
clgw=cf.GB2Uni(request.getParameter("clgw"));
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
ddshbz=cf.GB2Uni(request.getParameter("ddshbz"));
ls=request.getParameter("hkze");
try{
	if (!(ls.equals("")))  hkze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hkze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同总额]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("htcxhdje");
try{
	if (!(ls.equals("")))  htcxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htcxhdje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计入促销活动金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhtzshsj");
try{
	if (!(ls.equals("")))  jhtzshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhtzshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划通知送货时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kjxsj");
try{
	if (!(ls.equals("")))  kjxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kjxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[可减项截止时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("htshsj");
try{
	if (!(ls.equals("")))  htshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同送货时间]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("qhtsj");
try{
	if (!(ls.equals("")))  qhtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qhtsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签合同时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
String jjsjs=cf.GB2Uni(request.getParameter("jjsjs"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String qddm=cf.GB2Uni(request.getParameter("qddm"));
String jzsjs=cf.GB2Uni(request.getParameter("jzsjs"));
String khjl=cf.GB2Uni(request.getParameter("khjl"));

//String dgkh=cf.GB2Uni(request.getParameter("dgkh"));
String xshth=cf.GB2Uni(request.getParameter("xshth"));


double zczkl=0;
ls=request.getParameter("zczkl");
try{
	if (!(ls.equals("")))  zczkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zczkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订单折扣]类型转换发生意外:"+e);
	return;
}
double jmje=0;
ls=request.getParameter("jmje");
try{
	if (!(ls.equals("")))  jmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[减免金额]类型转换发生意外:"+e);
	return;
}


double zqclf=0;
ls=request.getParameter("zqclf");
try{
	if (!(ls.equals("")))  zqclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqclf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料费]类型转换发生意外:"+e);
	return;
}
double qtf=0;
ls=request.getParameter("qtf");
try{
	if (!(ls.equals("")))  qtf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[安装辅料加工费]类型转换发生意外:"+e);
	return;
}
double ycf=0;
ls=request.getParameter("ycf");
try{
	if (!(ls.equals("")))  ycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ycf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[远程费]类型转换发生意外:"+e);
	return;
}
double zcpclf=0;
ls=request.getParameter("zcpclf");
try{
	if (!(ls.equals("")))  zcpclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcpclf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[正常品-材料费]类型转换发生意外:"+e);
	return;
}
double tjpclf=0;
ls=request.getParameter("tjpclf");
try{
	if (!(ls.equals("")))  tjpclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tjpclf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特价品-材料费]类型转换发生意外:"+e);
	return;
}



String getddbh=request.getParameter("getddbh");
String sjbh=cf.GB2Uni(request.getParameter("sjbh"));

String dzyy=cf.GB2Uni(request.getParameter("dzyy"));
String xclbz="1";//1：非定制式产品；2：定制式产品

String ddlx="E";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String ppmc=null;
	String gys=null;
	String sfyyh=null;
	java.sql.Date yhkssj=null;
	java.sql.Date yhjzsj=null;
	String yhnr=null;

	double djqcdbl=0;//代金券厂家承担比例
	double azfjsbl=0;
	double ycfjsbl=0;

	double fdbl=0;
	double cxfdbl=0;
	double tcjrbl=0;
	double tccxjrbl=0;
	double khfdbl=0;
	double khcxfdbl=0;

	ls_sql="select gys,ppmc,sfyyh,yhkssj,yhjzsj,yhnr";
	ls_sql+=" ,djqcdbl,azfjsbl,ycfjsbl ";
	ls_sql+=" ,fdbl,tjpfdbl,tcjrbl,tjptcjrbl,khfdbl,tjpkhfdbl";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+getddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ppmc = rs.getString("ppmc");			    
		gys = rs.getString("gys");			    
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=rs.getDate("yhkssj");
		yhjzsj=rs.getDate("yhjzsj");
		yhnr=cf.fillNull(rs.getString("yhnr"));

		djqcdbl=rs.getDouble("djqcdbl");
		azfjsbl=rs.getDouble("azfjsbl");
		ycfjsbl=rs.getDouble("ycfjsbl");

		fdbl=rs.getDouble("fdbl");
		cxfdbl=rs.getDouble("tjpfdbl");
		tcjrbl=rs.getDouble("tcjrbl");
		tccxjrbl=rs.getDouble("tjptcjrbl");
		khfdbl=rs.getDouble("khfdbl");
		khcxfdbl=rs.getDouble("tjpkhfdbl");
	}
	rs.close();
	ps.close();


	String khxm=null;
	String fwdz=null;
	ls_sql="SELECT khxm,fwdz";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);


	double tjpfdbl=cxfdbl;
	double tjpkhfdbl=khcxfdbl;
	double tjptcjrbl=tccxjrbl;
	

	double cbze=zcpclf*fdbl/100+tjpclf*tjpfdbl/100;
	double zhclf=zqclf;

	double wdzje=zqclf+qtf+ycf;
	hkze=wdzje;
	zczkl=10;

	//合同业绩记入金额
	double htyjjrje=0;
	htyjjrje=cf.round(zcpclf*tcjrbl/100,2)+cf.round(tjpclf*tjptcjrbl/100,2);

	ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,jjsjs,khjl,ddshbz,kjxsj,htshsj";
	ls_sql+=" ,qhtsj,jhtzshsj,zcdlbm,zcxlbm,ppbm,gys,ppmc,zczkl,dzyy,xclbz ";
	ls_sql+=" ,wdzje,hkze,cbze,htcxhdje,zjxcxhdje,sfyyh,yhkssj,yhjzsj,yhnr,fgsbh ";
	ls_sql+=" ,qddm,jzsjs,dwbh,lrr,lrsj,bz,jhshsj,jmje ";
	ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf ";
	ls_sql+=" ,zjxcbze,zqzjhze,zjhze,sfjs,clzt,ddlx,sfck,ycksl,yckje,zsje,zjxzsje,sfkgsl,qtycf,sfjrht";
	ls_sql+=" ,xshth,zcpclf,fdbl,khfdbl,tcjrbl,tjpclf,tjpfdbl,tjpkhfdbl,tjptcjrbl,sjbh,azfjsbl,ycfjsbl,htyjjrje,zjxyjjrje,sskje )";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,SYSDATE,?,?,?    ";
	ls_sql+=" ,?,?,?,?   ,0,0,0,0   ,0,0,0,'N','09','"+ddlx+"','1',0,0,0,0,'N',0,'N' ";//9：集成家居主材
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?,?,?,?,0,0) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setString(2,khbh);
	ps.setString(3,clgw);
	ps.setString(4,ztjjgw);
	ps.setString(5,xmzy);
	ps.setString(6,jjsjs);
	ps.setString(7,khjl);
	ps.setString(8,ddshbz);
	ps.setDate(9,kjxsj);
	ps.setDate(10,htshsj);

	ps.setDate(11,qhtsj);
	ps.setDate(12,jhtzshsj);
	ps.setString(13,zcdlbm);
	ps.setString(14,zcxlbm);
	ps.setString(15,ppbm);
	ps.setString(16,gys);
	ps.setString(17,ppmc);
	ps.setDouble(18,zczkl);
	ps.setString(19,dzyy);
	ps.setString(20,xclbz);

	ps.setDouble(21,wdzje);
	ps.setDouble(22,hkze);
	ps.setDouble(23,cbze);
	ps.setDouble(24,htcxhdje);
	ps.setDouble(25,0);
	ps.setString(26,sfyyh);
	ps.setDate(27,yhkssj);
	ps.setDate(28,yhjzsj);
	ps.setString(29,yhnr);
	ps.setString(30,fgsbh);

	ps.setString(31,qddm);
	ps.setString(32,jzsjs);
	ps.setString(33,dwbh);
	ps.setString(34,lrr);
	ps.setString(35,bz);
	ps.setDate(36,htshsj);
	ps.setDouble(37,jmje);
	
	ps.setDouble(38,zqclf);
	ps.setDouble(39,zhclf);
	ps.setDouble(40,ycf);
	ps.setDouble(41,qtf);
	
	ps.setString(42,xshth);
	ps.setDouble(43,zcpclf);
	ps.setDouble(44,fdbl);
	ps.setDouble(45,khfdbl);
	ps.setDouble(46,tcjrbl);
	ps.setDouble(47,tjpclf);
	ps.setDouble(48,tjpfdbl);
	ps.setDouble(49,tjpkhfdbl);
	ps.setDouble(50,tjptcjrbl);
	ps.setString(51,sjbh);
	ps.setDouble(52,azfjsbl);
	ps.setDouble(53,ycfjsbl);
	ps.setDouble(54,htyjjrje);

	ps.executeUpdate();
	ps.close();




	//检查：金额不为负数
	double allwdzje=0;
	double allhkze=0;
	double allzqclf=0;
	double allzhclf=0;
	double allzcpclf=0;
	double alltjpclf=0;
	double allycf=0;
	double allqtf=0;
	ls_sql="select sum(wdzje),sum(hkze),sum(zqclf),sum(zhclf),sum(ycf),sum(qtf),sum(zcpclf),sum(tjpclf)";
	ls_sql+=" from jc_zcdd ";
	ls_sql+=" where ppbm='"+ppbm+"'";
	ls_sql+=" and khbh='"+khbh+"'";
	ls_sql+=" and ddlx='"+ddlx+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		allwdzje=rs.getDouble(1);
		allhkze=rs.getDouble(2);
		allzqclf=rs.getDouble(3);
		allzhclf=rs.getDouble(4);
		allycf=rs.getDouble(5);
		allqtf=rs.getDouble(6);
		allzcpclf=rs.getDouble(7);
		alltjpclf=rs.getDouble(8);

		if (allwdzje<0 )
		{
			conn.rollback();
			out.println("错误！品牌订货总额为负数:"+allwdzje);
			return;
		}
		if ( allhkze<0)
		{
			conn.rollback();
			out.println("错误！品牌订货总额为负数:"+allhkze);
			return;
		}
		if ( allzqclf<0)
		{
			conn.rollback();
			out.println("错误！品牌[折前材料费]为负数:"+allzqclf);
			return;
		}
		if ( allzhclf<0)
		{
			conn.rollback();
			out.println("错误！品牌[折后材料费]为负数:"+allzhclf);
			return;
		}
		if ( allycf<0)
		{
			conn.rollback();
			out.println("错误！品牌[远程费]为负数:"+allycf);
			return;
		}
		if ( allqtf<0)
		{
			conn.rollback();
			out.println("错误！品牌[其它费]为负数:"+allqtf);
			return;
		}
		if ( allzcpclf<0)
		{
			conn.rollback();
			out.println("错误！品牌[正常品材料费]为负数:"+allzcpclf);
			return;
		}
		if ( alltjpclf<0)
		{
			conn.rollback();
			out.println("错误！品牌[特价品材料费]为负数:"+alltjpclf);
			return;
		}

	}
	rs.close();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>