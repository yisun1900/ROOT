<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String sgd=null;
String jzbz=null;
double wdzgce=0;
double qye=0;
double zkl=0;
double zhzjxje=0;
double khjskze=0;
double khsskze=0;
double sjcb=0;
double dejsje=0;
String tdjs=null;
String jsr=null;
java.sql.Date jssj=null;
String jsdw=null;
String bz=null;
String gdjsjlh=null;
gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
jzbz=cf.GB2Uni(request.getParameter("jzbz"));
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
ls=request.getParameter("zhzjxje");
try{
	if (!(ls.equals("")))  zhzjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjxje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khjskze");
try{
	if (!(ls.equals("")))  khjskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khjskze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户结算金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khsskze");
try{
	if (!(ls.equals("")))  khsskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khsskze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程实收款总额]类型转换发生意外:"+e);
	return;
}

tdjs=cf.GB2Uni(request.getParameter("tdjs"));

jsr=cf.GB2Uni(request.getParameter("jsr"));
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
jsdw=cf.GB2Uni(request.getParameter("jsdw"));
bz=cf.GB2Uni(request.getParameter("bz"));

double hbssk=0;
double tdjsje=0;
ls=request.getParameter("hbssk");
try{
	if (!(ls.equals("")))  hbssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hbssk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[环保项目实收款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tdjsje");
try{
	if (!(ls.equals("")))  tdjsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tdjsje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[提点基数金额]类型转换发生意外:"+e);
	return;
}

double gckk=0;
double sjsfy=0;
double sgdfy=0;
double zjfy=0;
double gsfy=0;
double qtfy=0;

double cbje=0;
double gdjskze=0;   //2008-01-25  修改
double sgdglftd=0;
//double sgdjsje=0;
double glftd=0;
double bk=0;
double jsglftd=0;

ls=request.getParameter("gdjskze");
try{
	if (!(ls.equals("")))  gdjskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gdjskze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工队结算款总额]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("gckk");
try{
	if (!(ls.equals("")))  gckk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gckk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程扣款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjsfy");
try{
	if (!(ls.equals("")))  sjsfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjsfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgdfy");
try{
	if (!(ls.equals("")))  sgdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgdfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjfy");
try{
	if (!(ls.equals("")))  zjfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[质检承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gsfy");
try{
	if (!(ls.equals("")))  gsfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gsfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[公司承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtfy");
try{
	if (!(ls.equals("")))  qtfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它方承担费用]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("glftd");
try{
	if (!(ls.equals("")))  glftd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glftd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费提点]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cbje");
try{
	if (!(ls.equals("")))  cbje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cbje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[基价金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgdglftd");
try{
	if (!(ls.equals("")))  sgdglftd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgdglftd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[定额结算施工队管理费提点]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("jsglftd");
try{
	if (!(ls.equals("")))  jsglftd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jsglftd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队结算费率]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("glftd");
try{
	if (!(ls.equals("")))  glftd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glftd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费提点]类型转换发生意外:"+e);
	return;
}
String jsfs=cf.GB2Uni(request.getParameter("jsfs"));

double sjsfk=0;
ls=request.getParameter("sjsfk");
try{
	if (!(ls.equals("")))  sjsfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjsfk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计师罚款]类型转换发生意外:"+e);
	return;
}
double sgdfk=0;
ls=request.getParameter("sgdfk");
try{
	if (!(ls.equals("")))  sgdfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgdfk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队罚款]类型转换发生意外:"+e);
	return;
}

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

	if (gdjsjd.equals("1"))//0：未结算；1：已结算
	{
		out.println("错误！已结算");
		return;
	}
	int count=0;
    ls_sql="select count(*)";
	ls_sql+=" from  bj_clckd";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count<=0)
	{
		out.println("<BR>错误！该客户没有出库单记录，不允许用[内部定额]方式结算！");
		//return;
	}	
	conn.setAutoCommit(false);
	
	ls_sql="update crm_khxx set gdjsjd='1',gdjsjlh='"+gdjsjlh+"',khjsje=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,khjskze);
	ps.executeUpdate();
	ps.close();
    
	if (jsfs.equals("2"))
	{
	   glftd=100.00-jsglftd;
	   //cbje=sjcb;
	}
	ls_sql="insert into cw_gdjsjl ( khbh,sgd,jzbz,wdzgce,qye,zkl,zjxje,khjskze,khsskze,sjcb,tdjs,jsr,jssj,jsdw,jsjd,fkbz,bz,gdjsjlh,tdjsje,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy,dejsje,jsfs,sjsfk,sgdfk,cbje,sgdglftd,glftd,bk,gdjskze) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,sgd);
	ps.setString(3,jzbz);
	ps.setDouble(4,wdzgce);
	ps.setDouble(5,qye);
	ps.setDouble(6,zkl);
	ps.setDouble(7,zhzjxje);
	ps.setDouble(8,khjskze);
	ps.setDouble(9,khsskze);
	ps.setDouble(10,sjcb);
	ps.setString(11,tdjs);
	ps.setString(12,jsr);
	ps.setDate(13,jssj);
	ps.setString(14,jsdw);
	ps.setString(15,"1");
	ps.setString(16,"1");
	ps.setString(17,bz);
	ps.setString(18,gdjsjlh);
	ps.setDouble(19,tdjsje);
	ps.setDouble(20,gckk);
	ps.setDouble(21,sjsfy);
	ps.setDouble(22,sgdfy);
	ps.setDouble(23,zjfy);
	ps.setDouble(24,gsfy);
	ps.setDouble(25,qtfy);
	ps.setString(26,jsfs);
	ps.setDouble(27,sjsfk);
	ps.setDouble(28,sgdfk);
	ps.setDouble(29,cbje);
	ps.setDouble(30,sgdglftd);
	ps.setDouble(31,glftd);
	ps.setDouble(32,bk);
	ps.setDouble(33,gdjskze);
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