<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));


///////////////基础数据

String sgd=cf.GB2Uni(request.getParameter("sgd"));
String khlx=cf.GB2Uni(request.getParameter("khlx"));
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
double zkl=0;
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折扣率]类型转换发生意外:"+e);
	return;
}

double wdzgce=0;
ls=request.getParameter("wdzgce");
try{
	if (!(ls.equals("")))  wdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wdzgce不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[未打折工程额]类型转换发生意外:"+e);
	return;
}

double qye=0;
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程签约额]类型转换发生意外:"+e);
	return;
}
double zjxje=0;
ls=request.getParameter("zjxje");
try{
	if (!(ls.equals("")))  zjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjxje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项金额]类型转换发生意外:"+e);
	return;
}
double zhzjxje=0;
ls=request.getParameter("zhzjxje");
try{
	if (!(ls.equals("")))  zhzjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zhzjxje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后增减项金额]类型转换发生意外:"+e);
	return;
}
double zqwgzj=0;
ls=request.getParameter("zqwgzj");
try{
	if (!(ls.equals("")))  zqwgzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqwgzj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前完工造价]类型转换发生意外:"+e);
	return;
}
double zhwgzj=0;
ls=request.getParameter("zhwgzj");
try{
	if (!(ls.equals("")))  zhwgzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zhwgzj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后完工造价]类型转换发生意外:"+e);
	return;
}
double khsskze=0;
ls=request.getParameter("khsskze");
try{
	if (!(ls.equals("")))  khsskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khsskze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[家装实收款总额]类型转换发生意外:"+e);
	return;
}
double glftd=0;
ls=request.getParameter("glftd");
try{
	if (!(ls.equals("")))  glftd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glftd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费比率]类型转换发生意外:"+e);
	return;
}
double glf=0;
ls=request.getParameter("glf");
try{
	if (!(ls.equals("")))  glf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费]类型转换发生意外:"+e);
	return;
}
double gdjskze=0;
ls=request.getParameter("gdjskze");
try{
	if (!(ls.equals("")))  gdjskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gdjskze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应付工费]类型转换发生意外:"+e);
	return;
}


///////////////代扣款项目

double clf=0;
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料费]类型转换发生意外:"+e);
	return;
}
double bzclfbl=0;
ls=request.getParameter("bzclfbl");
try{
	if (!(ls.equals("")))  bzclfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzclfbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标准材料费比率]类型转换发生意外:"+e);
	return;
}
double xbclk=0;
ls=request.getParameter("xbclk");
try{
	if (!(ls.equals("")))  xbclk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xbclk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料扣款]类型转换发生意外:"+e);
	return;
}

double psgjgff=0;
ls=request.getParameter("psgjgff");
try{
	if (!(ls.equals("")))  psgjgff=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量psgjgff不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[配送工具工服费]类型转换发生意外:"+e);
	return;
}
double ysf=0;
ls=request.getParameter("ysf");
try{
	if (!(ls.equals("")))  ysf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ysf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[运输费]类型转换发生意外:"+e);
	return;
}
double wxjbfb=0;
ls=request.getParameter("wxjbfb");
try{
	if (!(ls.equals("")))  wxjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wxjbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣质保金百分比]类型转换发生意外:"+e);
	return;
}
double wxj=0;
ls=request.getParameter("wxj");
try{
	if (!(ls.equals("")))  wxj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wxj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣质保金]类型转换发生意外:"+e);
	return;
}
double gcjxkk=0;
ls=request.getParameter("gcjxkk");
try{
	if (!(ls.equals("")))  gcjxkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gcjxkk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程减项扣款]类型转换发生意外:"+e);
	return;
}
double sj=0;
ls=request.getParameter("sj");
try{
	if (!(ls.equals("")))  sj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金]类型转换发生意外:"+e);
	return;
}
double lbcb=0;
ls=request.getParameter("lbcb");
try{
	if (!(ls.equals("")))  lbcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lbcb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[立邦成本]类型转换发生意外:"+e);
	return;
}
double kqtk=0;
ls=request.getParameter("kqtk");
try{
	if (!(ls.equals("")))  kqtk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kqtk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它扣款]类型转换发生意外:"+e);
	return;
}

///////////////结算金额

double jkje=0;
ls=request.getParameter("jkje");
try{
	if (!(ls.equals("")))  jkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[前期已拨工费]类型转换发生意外:"+e);
	return;
}
double sqgz=0;
ls=request.getParameter("sqgz");
try{
	if (!(ls.equals("")))  sqgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqgz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应拨工费]类型转换发生意外:"+e);
	return;
}
double gczxjl=0;
ls=request.getParameter("gczxjl");
try{
	if (!(ls.equals("")))  gczxjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gczxjl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程增项奖励]类型转换发生意外:"+e);
	return;
}
double ycfbk=0;
ls=request.getParameter("ycfbk");
try{
	if (!(ls.equals("")))  ycfbk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ycfbk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[远程费拨款]类型转换发生意外:"+e);
	return;
}



String jslx=cf.GB2Uni(request.getParameter("jslx"));
String jsdw=cf.GB2Uni(request.getParameter("jsdw"));
String jsr=cf.GB2Uni(request.getParameter("jsr"));
java.sql.Date jssj=null;
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算时间]类型转换发生意外:"+e);
	return;
}
String bz=cf.GB2Uni(request.getParameter("bz"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String gdjsjd=null;
	ls_sql="select gdjsjd";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
	}
	rs.close();
	ps.close();

	if (!gdjsjd.equals("1"))//0：未结算；1：完工结算； 2：中期结算
	{
		out.println("错误！未完工结算");
		return;
	}

	double oldwxj=0;
	ls_sql="select wxj";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where gdjsjlh='"+gdjsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldwxj=rs.getDouble("wxj");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update sq_sgd set zbj=zbj-?+?";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,oldwxj);
	ps.setDouble(2,wxj);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_gdjsjl set gdjsjlh=?,khbh=?,sgd=?,khlx=?,cxhdbm=?,zkl=?,wdzgce=?,qye=?,zjxje=?,zhzjxje=? ";
	ls_sql+=" ,zqwgzj=?,zhwgzj=?,khsskze=?,glftd=?,glf=?,gdjskze=?,clf=?,bzclfbl=?,xbclk=?,psgjgff=? ";
	ls_sql+=" ,ysf=?,wxjbfb=?,wxj=?,gcjxkk=?,sj=?,lbcb=?,kqtk=?,jkje=?,sqgz=?,gczxjl=? ";
	ls_sql+=" ,ycfbk=?,jslx=?,jsdw=?,jsr=?,jssj=?,bz=?";
	ls_sql+=" where gdjsjlh='"+gdjsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gdjsjlh);
	ps.setString(2,khbh);
	ps.setString(3,sgd);
	ps.setString(4,khlx);
	ps.setString(5,cxhdbm);
	ps.setDouble(6,zkl);
	ps.setDouble(7,wdzgce);
	ps.setDouble(8,qye);
	ps.setDouble(9,zjxje);
	ps.setDouble(10,zhzjxje);

	ps.setDouble(11,zqwgzj);
	ps.setDouble(12,zhwgzj);
	ps.setDouble(13,khsskze);
	ps.setDouble(14,glftd);
	ps.setDouble(15,glf);
	ps.setDouble(16,gdjskze);
	ps.setDouble(17,clf);
	ps.setDouble(18,bzclfbl);
	ps.setDouble(19,xbclk);
	ps.setDouble(20,psgjgff);

	ps.setDouble(21,ysf);
	ps.setDouble(22,wxjbfb);
	ps.setDouble(23,wxj);
	ps.setDouble(24,gcjxkk);
	ps.setDouble(25,sj);
	ps.setDouble(26,lbcb);
	ps.setDouble(27,kqtk);
	ps.setDouble(28,jkje);
	ps.setDouble(29,sqgz);
	ps.setDouble(30,gczxjl);

	ps.setDouble(31,ycfbk);
	ps.setString(32,jslx);
	ps.setString(33,jsdw);
	ps.setString(34,jsr);
	ps.setDate(35,jssj);
	ps.setString(36,bz);
	ps.executeUpdate();
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
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


