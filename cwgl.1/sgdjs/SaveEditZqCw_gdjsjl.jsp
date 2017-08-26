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
	out.println("<BR>变量tlk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标准材料费比率]类型转换发生意外:"+e);
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

	if (!gdjsjd.equals("2"))//0：未结算；1：完工结算； 2：中期结算
	{
		out.println("错误！结算状态不正确");
		return;
	}


	ls_sql="update cw_gdjsjl set gdjsjlh=?,khbh=?,sgd=?,khlx=?,cxhdbm=?,zkl=?,wdzgce=?,qye=?,zjxje=?,zhzjxje=? ";
	ls_sql+=" ,zqwgzj=?,zhwgzj=?,khsskze=?,gdjskze=?,clf=?,bzclfbl=?,psgjgff=? ";
	ls_sql+=" ,ysf=?,lbcb=?,kqtk=?,jkje=?,sqgz=? ";
	ls_sql+=" ,jslx=?,jsdw=?,jsr=?,jssj=?,bz=?";
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
	ps.setDouble(14,gdjskze);
	ps.setDouble(15,clf);
	ps.setDouble(16,bzclfbl);
	ps.setDouble(17,psgjgff);

	ps.setDouble(18,ysf);
	ps.setDouble(19,lbcb);
	ps.setDouble(20,kqtk);
	ps.setDouble(21,jkje);
	ps.setDouble(22,sqgz);

	ps.setString(23,jslx);
	ps.setString(24,jsdw);
	ps.setString(25,jsr);
	ps.setDate(26,jssj);
	ps.setString(27,bz);
	ps.executeUpdate();
	ps.close();

		
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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
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


