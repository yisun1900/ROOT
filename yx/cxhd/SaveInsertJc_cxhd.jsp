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


String hdlx=cf.GB2Uni(request.getParameter("hdlx"));

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

double fxgck =0;
ls=request.getParameter("fxgck");
try{
	if (!(ls.equals("")))  fxgck =Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fxgck 不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[多倍返现工程款]类型转换发生意外:"+e);
	return;
}

double fxzck =0;
ls=request.getParameter("fxzck");
try{
	if (!(ls.equals("")))  fxzck =Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fxzck不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[多倍返现主材款]类型转换发生意外:"+e);
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

String zklx=cf.GB2Uni(request.getParameter("zklx"));
double zdzk=0;
ls=request.getParameter("zdzk");
try{
	if (!(ls.equals("")))  zdzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zdzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[整单折扣]类型转换发生意外:"+e);
	return;
}

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
double qtsfxmzk=0;
ls=request.getParameter("qtsfxmzk");
try{
	if (!(ls.equals("")))  qtsfxmzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtsfxmzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它收费项目折扣]类型转换发生意外:"+e);
	return;
}


String zjxzklx=cf.GB2Uni(request.getParameter("zjxzklx"));
String sfybfxmzk=cf.GB2Uni(request.getParameter("sfybfxmzk"));



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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cxhd";
	ls_sql+=" where  fgsbh='"+fgsbh+"' and cxhdmc='"+cxhdmc+"'";
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

	if (zklx.equals("4"))//4：无折扣；1：整单打折；2：单项打折；3：部分费用打折
	{
		//整单打折
		zdzk=10;

		//单项打折
		gcfzk=10;
		glfzk=10;
		sjzk=10;
		sjfzk=10;
		qtsfxmzk=10;

		zjxzklx="1";//增减项折扣类型  1：同合同；2：独立折扣
		sfybfxmzk="N";//部分项目独立打折  Y：是；N：否

		//部分费用打折
		clfzk=10;
		zcfzk=10;
		rgfzk=10;
		ysfzk=10;
		jxfzk=10;
		shfzk=10;
		qtfzk=10;
	}
	else if (zklx.equals("1"))//1：整单打折；2：单项打折；3：部分费用打折
	{
		//单项打折
		gcfzk=10;
		glfzk=10;
		sjzk=10;
		sjfzk=10;
		qtsfxmzk=10;

		zjxzklx="1";//增减项折扣类型  1：同合同；2：独立折扣
		sfybfxmzk="N";//部分项目独立打折  Y：是；N：否

		//部分费用打折
		clfzk=10;
		zcfzk=10;
		rgfzk=10;
		ysfzk=10;
		jxfzk=10;
		shfzk=10;
		qtfzk=10;
	}
	else if (zklx.equals("2"))//1：整单打折；2：单项打折；3：部分费用打折
	{
		//整单打折
		zdzk=10;

		//部分费用打折
		clfzk=10;
		zcfzk=10;
		rgfzk=10;
		ysfzk=10;
		jxfzk=10;
		shfzk=10;
		qtfzk=10;
	}
	else{
		//整单打折
		zdzk=10;

		//单项打折
		gcfzk=10;

		zjxzklx="1";//增减项折扣类型  1：同合同；2：独立折扣
		sfybfxmzk="N";//部分项目独立打折  Y：是；N：否
	}

	conn.setAutoCommit(false);

	int cxhdbm=0;
	ls_sql="select NVL(max(cxhdbm),0)";
	ls_sql+=" from  jc_cxhd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdbm=rs.getInt(1);
	}
	rs.close();
	ps.close();

	cxhdbm++;


	ls_sql="insert into jc_cxhd (cxhdbm,cxhdmc,fgsbh,dj,fxgck,fxzck,hdlx,zklx,zdzk,gcfzk  ,glfzk,sjzk,sjfzk,qtsfxmzk,kgxqthd,zjxzklx,sfybfxmzk,jsbz,spbz,bz) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,cxhdbm);
	ps.setString(2,cxhdmc);
	ps.setString(3,fgsbh);
	ps.setInt(4,dj);
	ps.setDouble(5,fxgck);
	ps.setDouble(6,fxzck);
	ps.setString(7,hdlx);
	ps.setString(8,zklx);
	ps.setDouble(9,zdzk);
	ps.setDouble(10,gcfzk);

	ps.setDouble(11,glfzk);
	ps.setDouble(12,sjzk);
	ps.setDouble(13,sjfzk);
	ps.setDouble(14,qtsfxmzk);
	ps.setString(15,kgxqthd);
	ps.setString(16,zjxzklx);
	ps.setString(17,sfybfxmzk);
	ps.setString(18,"N");//N：未结束；Y：结束 
	ps.setString(19,"N");//N：未审批；Y：审批
	ps.setString(20,bz);

	ps.executeUpdate();
	ps.close();

	
	ls_sql="delete from jc_cxhdsj  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_cxhdxq  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_cxhddm  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_cxhdyjxs  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_hdzsxx  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_hddxzsxx  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_hdbfxmdz  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_cxhdbffyzk  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_cxhdzjxzk  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_hddjj  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_cxhdfqbz  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into jc_cxhdsj ( cxhdbm,cxhdmc,fgsbh,kssj,cxjssj,qdjssj) ";
	ls_sql+=" values ( ?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,cxhdbm);
	ps.setString(2,cxhdmc);
	ps.setString(3,fgsbh);
	ps.setDate(4,kssj);
	ps.setDate(5,cxjssj);
	ps.setDate(6,qdjssj);
	ps.executeUpdate();
	ps.close();


	if (zklx.equals("3"))//1：整单打折；2：单项打折；3：部分费用打折
	{
		//调整部分费用折扣（crm_tzbffyzk）
		ls_sql="insert into jc_cxhdbffyzk (cxhdbm,clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk)";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,cxhdbm);
		ps.setDouble(2,clfzk);
		ps.setDouble(3,zcfzk);
		ps.setDouble(4,rgfzk);
		ps.setDouble(5,ysfzk);
		ps.setDouble(6,jxfzk);
		ps.setDouble(7,shfzk);
		ps.setDouble(8,qtfzk);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();
	
	response.sendRedirect("EditJc_cxhd.jsp?lx=1&cxhdbm="+cxhdbm);

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL" + ls_sql);
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