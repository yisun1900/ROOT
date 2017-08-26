<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cxhdmc=null;
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
cxhdmc=cf.GB2Uni(request.getParameter("cxhdmc"));

double gcfzk=0;
ls=request.getParameter("gcfzk");
try{
	if (!(ls.equals("")))  gcfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gcfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程费折扣]类型转换发生意外:"+e);
	return;
}
double glfzk=0;
ls=request.getParameter("glfzk");
try{
	if (!(ls.equals("")))  glfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费折扣]类型转换发生意外:"+e);
	return;
}

String hdlx=cf.GB2Uni(request.getParameter("hdlx"));
String zklx=cf.GB2Uni(request.getParameter("zklx"));

int dj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订金]类型转换发生意外:"+e);
	return;
}

String bz=null;
bz=cf.GB2Uni(request.getParameter("bz"));

java.sql.Date kssj=null;
java.sql.Date cxjssj=null;
java.sql.Date qdjssj=null;

ls=request.getParameter("kssj");
try{
	if (!(ls.equals("")))  kssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxjssj");
try{
	if (!(ls.equals("")))  cxjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxjssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销结束时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qdjssj");
try{
	if (!(ls.equals("")))  qdjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qdjssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签单结束时间]类型转换发生意外:"+e);
	return;
}
String kgxqthd=cf.GB2Uni(request.getParameter("kgxqthd"));
double sjzk=0;
ls=request.getParameter("sjzk");
try{
	if (!(ls.equals("")))  sjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金折扣]类型转换发生意外:"+e);
	return;
}
double sjfzk=0;
ls=request.getParameter("sjfzk");
try{
	if (!(ls.equals("")))  sjfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费折扣]类型转换发生意外:"+e);
	return;
}
double gcfjzk=0;
ls=request.getParameter("gcfjzk");
try{
	if (!(ls.equals("")))  gcfjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gcfjzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程费净折扣]类型转换发生意外:"+e);
	return;
}
double jzk=0;
ls=request.getParameter("jzk");
try{
	if (!(ls.equals("")))  jzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[全单净折扣]类型转换发生意外:"+e);
	return;
}
double clfzk=0;
ls=request.getParameter("clfzk");
try{
	if (!(ls.equals("")))  clfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[辅材费折扣]类型转换发生意外:"+e);
	return;
}

double zcfzk=0;
ls=request.getParameter("zcfzk");
try{
	if (!(ls.equals("")))  zcfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材费折扣]类型转换发生意外:"+e);
	return;
}

double rgfzk=0;
ls=request.getParameter("rgfzk");
try{
	if (!(ls.equals("")))  rgfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rgfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[人工费折扣]类型转换发生意外:"+e);
	return;
}

double ysfzk=0;
ls=request.getParameter("ysfzk");
try{
	if (!(ls.equals("")))  ysfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ysfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[运输费折扣]类型转换发生意外:"+e);
	return;
}

double jxfzk=0;
ls=request.getParameter("jxfzk");
try{
	if (!(ls.equals("")))  jxfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jxfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[机械费折扣]类型转换发生意外:"+e);
	return;
}

double shfzk=0;
ls=request.getParameter("shfzk");
try{
	if (!(ls.equals("")))  shfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[损耗费折扣]类型转换发生意外:"+e);
	return;
}

double qtfzk=0;
ls=request.getParameter("qtfzk");
try{
	if (!(ls.equals("")))  qtfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它费折扣]类型转换发生意外:"+e);
	return;
}

String zjxzklx=cf.GB2Uni(request.getParameter("zjxzklx"));
double gczxzk=0;
ls=request.getParameter("gczxzk");
try{
	if (!(ls.equals("")))  gczxzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gczxzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程费增减项折扣]类型转换发生意外:"+e);
	return;
}
double gcjxzk=0;
ls=request.getParameter("gcjxzk");
try{
	if (!(ls.equals("")))  gcjxzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gcjxzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程减项折扣]类型转换发生意外:"+e);
	return;
}
double zxglfzk=0;
ls=request.getParameter("zxglfzk");
try{
	if (!(ls.equals("")))  zxglfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zxglfzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增项管理费折扣]类型转换发生意外:"+e);
	return;
}
double jxglfzk=0;
ls=request.getParameter("jxglfzk");
try{
	if (!(ls.equals("")))  jxglfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jxglfzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[减项管理费折扣]类型转换发生意外:"+e);
	return;
}
double zxsjzk=0;
ls=request.getParameter("zxsjzk");
try{
	if (!(ls.equals("")))  zxsjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zxsjzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增项税金折扣]类型转换发生意外:"+e);
	return;
}
double jxsjzk=0;
ls=request.getParameter("jxsjzk");
try{
	if (!(ls.equals("")))  jxsjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jxsjzk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[减项税金折扣]类型转换发生意外:"+e);
	return;
}

String yxscdz=cf.GB2Uni(request.getParameter("yxscdz"));

String oldkssj=cf.GB2Uni(request.getParameter("oldkssj"));
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cxhd";
	ls_sql+=" where  fgsbh='"+fgsbh+"' and cxhdmc='"+cxhdmc+"' and cxhdbm!='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("！错误，促销活动["+cxhdmc+"]已存在");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_cxhd set cxhdmc=?,dj=?,gcfzk=?,glfzk=?,sjzk=?,sjfzk=?   ,zjxzklx=?,gczxzk=?,gcjxzk=?,zxglfzk=?,jxglfzk=?,zxsjzk=?,jxsjzk=?  ,clfzk=?,zcfzk=?,rgfzk=?,ysfzk=?,jxfzk=?,shfzk=?,qtfzk=?    ,gcfjzk=?,jzk=?,hdlx=?,zklx=?,bz=?,kgxqthd=?,yxscdz=?";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdmc);
	ps.setLong(2,dj);
	ps.setDouble(3,gcfzk);
	ps.setDouble(4,glfzk);
	ps.setDouble(5,sjzk);
	ps.setDouble(6,sjfzk);

	ps.setString(7,zjxzklx);
	ps.setDouble(8,gczxzk);
	ps.setDouble(9,gcjxzk);
	ps.setDouble(10,zxglfzk);
	ps.setDouble(11,jxglfzk);
	ps.setDouble(12,zxsjzk);
	ps.setDouble(13,jxsjzk);

	ps.setDouble(14,clfzk);
	ps.setDouble(15,zcfzk);
	ps.setDouble(16,rgfzk);
	ps.setDouble(17,ysfzk);
	ps.setDouble(18,jxfzk);
	ps.setDouble(19,shfzk);
	ps.setDouble(20,qtfzk);

	ps.setDouble(21,gcfjzk);
	ps.setDouble(22,jzk);
	ps.setString(23,hdlx);
	ps.setString(24,zklx);
	ps.setString(25,bz);
	ps.setString(26,kgxqthd);
	ps.setString(27,yxscdz);
	ps.executeUpdate();
	ps.close();

		
	ls_sql="update jc_cxhdsj set cxhdmc=?,kssj=?,cxjssj=?,qdjssj=?";
	ls_sql+=" where cxhdbm='"+cxhdbm+"' and kssj=TO_DATE('"+oldkssj+"','YYYY-MM-DD')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdmc);
	ps.setDate(2,kssj);
	ps.setDate(3,cxjssj);
	ps.setDate(4,qdjssj);
	ps.executeUpdate();
	ps.close();
		

	ls_sql="update jc_cxhdxq set cxhdmc=? ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdmc);
	ps.executeUpdate();
	ps.close();
		
	ls_sql="update jc_cxhdyjxs set cxhdmc=? ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdmc);
	ps.executeUpdate();
	ps.close();
		
	ls_sql="update jc_cxhddm set cxhdmc=? ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdmc);
	ps.executeUpdate();
	ps.close();
		
	ls_sql="update jc_hdzsxx set cxhdmc=? ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdmc);
	ps.executeUpdate();
	ps.close();
		
	ls_sql="update jc_hddxzsxx set cxhdmc=? ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdmc);
	ps.executeUpdate();
	ps.close();
		
	ls_sql="update jc_hdbfxmdz set cxhdmc=? ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdmc);
	ps.executeUpdate();
	ps.close();
		
	ls_sql="update jc_hddjj set cxhdmc=? ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdmc);
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
	out.print("Exception: " + e);
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