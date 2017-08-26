<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
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
String jzsjs=cf.GB2Uni(request.getParameter("jzsjs"));
String khjl=cf.GB2Uni(request.getParameter("khjl"));

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

String dzyy=cf.GB2Uni(request.getParameter("dzyy"));
String xclbz="1";//1：非定制式产品；2：定制式产品

String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));

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
	double fdbl=0;
	double cxfdbl=0;
	double khfdbl=0;
	double khcxfdbl=0;
	double tcjrbl=0;
	double tccxjrbl=0;

	double azfjsbl=0;
	double ycfjsbl=0;
	ls_sql="select jxc_ppxx.scsmc,jxc_ppgysdzb.gysmc,sfyyh,yhkssj,yhjzsj,yhnr,jxc_ppgysdzb.fdbl,jxc_ppgysdzb.cxfdbl,jxc_ppgysdzb.khfdbl,jxc_ppgysdzb.khcxfdbl,jxc_ppgysdzb.tcjrbl,jxc_ppgysdzb.tccxjrbl ";
	ls_sql+=" ,jxc_ppgysdzb.azfjsbl,jxc_ppgysdzb.ycfjsbl ";
	ls_sql+=" from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx  ";
	ls_sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
    ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm ";
    ls_sql+=" and jxc_ppxx.pplb='1' ";
    ls_sql+=" and jxc_gysxx.cllx='1' ";
	ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
	ls_sql+=" and jxc_ppgysdzb.ssfgs='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		azfjsbl=rs.getDouble("azfjsbl");
		ycfjsbl=rs.getDouble("ycfjsbl");

		ppmc = rs.getString("scsmc");			    
		gys = rs.getString("gysmc");			    
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=rs.getDate("yhkssj");
		yhjzsj=rs.getDate("yhjzsj");
		yhnr=cf.fillNull(rs.getString("yhnr"));
		fdbl=rs.getDouble("fdbl");
		cxfdbl=rs.getDouble("cxfdbl");
		khfdbl=rs.getDouble("khfdbl");
		khcxfdbl=rs.getDouble("khcxfdbl");
		tcjrbl=rs.getDouble("tcjrbl");
		tccxjrbl=rs.getDouble("tccxjrbl");
	}
	rs.close();
	ps.close();

	if (gys==null)
	{
		out.println("<BR>！！！错误，[品牌]："+ppbm+"无对应的：供应商");
		return;
	}

	if (fdbl==0)
	{
		out.println("<BR>！！！错误，未初始化结算比例");
		return;
	}

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


	conn.setAutoCommit(false);

	//客户编号
	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(khbh))+1,1)";
	ls_sql+=" from  crm_zxkhxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();
	String khbh=cf.addZero(xh,7);

	//客户编号
	while (true)
	{
		khbh=cf.addZero(xh,7);

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			xh++;
		}
		else{
			break;
		}
	}

	//6：散客
	ls_sql="insert into crm_zxkhxx ( khbh,khxm,xb,fwdz,lxfs,lrr,lrsj   ,zxdjbm,ssfgs   ,zxzt,lfbz,ctbz,shbz,sfzdzbj,sjsjsbz,sfjczjz,lfdjbz,hddjbz,sjfbz,cxgtbz,csgtbz,qsjhtbz,ysshbz,bjdysq,xcjdbz ,khlxbm,hdbz,sfxhf,clgw,zxdm) ";
	ls_sql+=" values (               ?   ,?   ,? ,?   ,?   ,?  ,SYSDATE,?     ,?       ,'6' ,'N' ,'N' ,'N' ,'N'    ,'0'    ,'3'    ,'N','N','N','N','N','N','N','0','1','04','1','N',?,?  ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,khxm);
	ps.setString(3,xb);
	ps.setString(4,fwdz);
	ps.setString(5,lxfs);
	ps.setString(6,lrr);
	ps.setString(7,dwbh);
	ps.setString(8,fgsbh);
	ps.setString(9,clgw);
	ps.setString(10,dwbh);
	ps.executeUpdate();
	ps.close();

	
	//2：家装客户；3：退单客户；4：集成客户；5：设计客户；6：散客
	ls_sql="insert into crm_khxx ( khbh,hth,sfzhm,khxm,xb,fwdz,lxfs,qtdh,khlxbm,cqbm,csrq,zybm,fj,dwbh,fgsbh,khjl,xxlysm,sjs,sjsgh,lrsj,lrr,bz    ,zt,tsbz,pdclzt,ybjbz   ,sfxhf,kpbz,bxbz,hfdjbz,sjssjfjsbz,htshbz ,sffj,sfyrz,dalqbz,gdjsjd,sjsjsbz,ywyjsbz,gcjdbm,hdbz,xmzy,zjxwcbz,sffk,wtkhbz,khjsbz,sjhtsjf,wdzgce,qye,zjjsbz,jjwjbz,cdzwjmje,glfjmje,sjjmje,zqsuijin,zqzjxsuijin,sjsbh,ywy,ywyssxz,ywybm,clgw,xjf,hxbm,bjjb,fwmj,fjtcbz,zhhtzcbj,zqhtzcbj,suijin,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,zqqtsf,zhqtsf) ";
	ls_sql+=" select               khbh,hth,sfzhm,khxm,xb,fwdz,lxfs,qtdh,khlxbm,cqbm,csrq,zybm,fj,?   ,ssfgs,khjl,xxlysm,sjs,sjsgh,?   ,?  ,bz    ,'6','N','4'   ,'N'     ,'N'  ,'Y' ,'N' ,'0'   ,'0'       ,'Y'    ,'N' ,'N'  ,'1'   ,'0'   ,'0'    ,'0'    ,'0'   ,'1' ,?   ,'1'    ,'N' ,'N'   ,'N'   ,NVL(sjhtje,0) ,0     ,0  ,'0'   ,'N'   ,0       ,0      ,0     ,0       ,0          ,sjsbh,ywy,ywyssxz,ywybm,clgw,xjf,hxbm,bjjb,fwmj,'M'   ,0       ,0,0,0,0,0,0,0,0";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setDate(2,lrsj);
	ps.setString(3,lrr);
	ps.setString(4,xmzy);
	ps.executeUpdate();
	ps.close();


	int count=0;
	ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String ddbh=khbh+cf.addZero(count+1,2);


	ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,jjsjs,khjl,ddshbz,kjxsj,htshsj";
	ls_sql+=" ,qhtsj,jhtzshsj,zcdlbm,zcxlbm,ppbm,gys,ppmc,zczkl,dzyy,xclbz ";
	ls_sql+=" ,wdzje,hkze,cbze,htcxhdje,zjxcxhdje,sfyyh,yhkssj,yhjzsj,yhnr,fgsbh ";
	ls_sql+=" ,qddm,jzsjs,dwbh,lrr,lrsj,bz,jhshsj,jmje ";
	ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf ";
	ls_sql+=" ,zjxcbze,zqzjhze,zjhze,sfjs,clzt,ddlx,sfck,ycksl,yckje,zsje,zjxzsje,sfkgsl,qtycf,sfjrht ";
	ls_sql+=" ,xshth,zcpclf,fdbl,khfdbl,tcjrbl,tjpclf,tjpfdbl,tjpkhfdbl,tjptcjrbl,azfjsbl,ycfjsbl,htyjjrje,zjxyjjrje,sskje )";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,SYSDATE,?,?,?    ";
	ls_sql+=" ,?,?,?,?   ,0,0,0,0   ,0,0,0,'N','09','E','1',0,0,0,0,'N',0,'N' ";//E：散客
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?,?,?,0,0) ";
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

	ps.setString(31,dwbh);
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
	ps.setDouble(51,azfjsbl);
	ps.setDouble(52,ycfjsbl);
	ps.setDouble(53,htyjjrje);

	ps.executeUpdate();
	ps.close();

	
	conn.commit();

	%>
	<A HREF="InsertJc_zcdd2.jsp?khbh=<%=khbh%>&zt=6">录入新订单</A>

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