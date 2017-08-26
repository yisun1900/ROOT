<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010101")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>
<%

String ls=null;
String dwbh=null;
String dwmc=null;
String dwjc=null;
String dwlx=null;
String dwdz=null;
String dwfzr=null;
String dwdh=null;
String dwcz=null;
String email=null;
String bz=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String ssdw=cf.GB2Uni(request.getParameter("ssdw"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String hthqz=cf.GB2Uni(request.getParameter("hthqz"));
String cxbz=cf.GB2Uni(request.getParameter("cxbz"));
dwmc=cf.GB2Uni(request.getParameter("dwmc"));
dwjc=cf.GB2Uni(request.getParameter("dwjc"));
dwlx=cf.GB2Uni(request.getParameter("dwlx"));
dwdz=cf.GB2Uni(request.getParameter("dwdz"));
dwfzr=cf.GB2Uni(request.getParameter("dwfzr"));
dwdh=cf.GB2Uni(request.getParameter("dwdh"));
dwcz=cf.GB2Uni(request.getParameter("dwcz"));
email=cf.GB2Uni(request.getParameter("email"));
bz=cf.GB2Uni(request.getParameter("bz"));
String bianma=cf.GB2Uni(request.getParameter("bianma"));

String ssdqbm=cf.GB2Uni(request.getParameter("ssdqbm"));
String dwflbm=cf.GB2Uni(request.getParameter("dwflbm"));
String ssfw=cf.GB2Uni(request.getParameter("ssfw"));
String dwjb=cf.GB2Uni(request.getParameter("dwjb"));
String dzbjbz=cf.GB2Uni(request.getParameter("dzbjbz"));
String dmxs=cf.GB2Uni(request.getParameter("dmxs"));

java.sql.Date kdsj=null;
java.sql.Date gdsj=null;
ls=request.getParameter("kdsj");
try{
	if (!(ls.equals("")))  kdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[开店时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gdsj");
try{
	if (!(ls.equals("")))  gdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[关店时间]类型转换发生意外:"+e);
	return;
}
int bzrs=0;
ls=request.getParameter("bzrs");
try{
	if (!(ls.equals("")))  bzrs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标准人数]类型转换发生意外:"+e);
	return;
}
double jryjbfb=0;
ls=request.getParameter("jryjbfb");
try{
	if (!(ls.equals("")))  jryjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jryjbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[家装客户计入业绩收款比例]类型转换发生意外:"+e);
	return;
}
double sjjryjbfb=0;
ls=request.getParameter("sjjryjbfb");
try{
	if (!(ls.equals("")))  sjjryjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjjryjbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计客户计入业绩收款比例]类型转换发生意外:"+e);
	return;
}

oracle.sql.CLOB  clob=null;

String jcppbz=cf.GB2Uni(request.getParameter("jcppbz"));
String zcmmbz=cf.GB2Uni(request.getParameter("zcmmbz"));
String mmbz=cf.GB2Uni(request.getParameter("mmbz"));
String cgjjbz=cf.GB2Uni(request.getParameter("cgjjbz"));
String jjbz=cf.GB2Uni(request.getParameter("jjbz"));
String zxkhlrjc=cf.GB2Uni(request.getParameter("zxkhlrjc"));
int zxkhlrts=0;
ls=request.getParameter("zxkhlrts");
try{
	if (!(ls.equals("")))  zxkhlrts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zxkhlrts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[咨询客户提前录入天数]类型转换发生意外:"+e);
	return;
}
String qdkhbljc=cf.GB2Uni(request.getParameter("qdkhbljc"));
int qdkhblts=0;
ls=request.getParameter("qdkhblts");
try{
	if (!(ls.equals("")))  qdkhblts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qdkhblts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签单客户补录允许天数]类型转换发生意外:"+e);
	return;
}
String dzbjjc=cf.GB2Uni(request.getParameter("dzbjjc"));
String hfsjzdsz=cf.GB2Uni(request.getParameter("hfsjzdsz"));
String xmzyglbz=cf.GB2Uni(request.getParameter("xmzyglbz"));
String jjgwglbz=cf.GB2Uni(request.getParameter("jjgwglbz"));
String jcddblxs=cf.GB2Uni(request.getParameter("jcddblxs"));
String jcddmxblxs=cf.GB2Uni(request.getParameter("jcddmxblxs"));

int gdjzrq=0;
ls=request.getParameter("gdjzrq");
try{
	if (!(ls.equals("")))  gdjzrq=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jzrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结转日期]类型转换发生意外:"+e);
	return;
}
int drjs=0;
ls=request.getParameter("drjs");
try{
	if (!(ls.equals("")))  drjs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量drjs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[当日几时]类型转换发生意外:"+e);
	return;
}
String jzyf=cf.GB2Uni(request.getParameter("jzyf"));
String kfdh=cf.GB2Uni(request.getParameter("kfdh"));
String jjsjsglbz=cf.GB2Uni(request.getParameter("jjsjsglbz"));
String sfjms=cf.GB2Uni(request.getParameter("sfjms"));
String cwdm=cf.GB2Uni(request.getParameter("cwdm"));
java.sql.Date khxxglsj=null;
ls=request.getParameter("khxxglsj");
try{
	if (!(ls.equals("")))  khxxglsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khxxglsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户信息过滤时间]类型转换发生意外:"+e);
	return;
}
String djlrfs=cf.GB2Uni(request.getParameter("djlrfs"));
String kgcxhdbl=cf.GB2Uni(request.getParameter("kgcxhdbl"));
String xuhao=cf.GB2Uni(request.getParameter("xuhao"));
double bzlybl=0;
double lyblxx=0;
double lyblsx=0;
ls=request.getParameter("bzlybl");
try{
	if (!(ls.equals("")))  bzlybl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bzlybl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标准领用比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lyblxx");
try{
	if (!(ls.equals("")))  lyblxx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lyblxx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[领用比例下限]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lyblsx");
try{
	if (!(ls.equals("")))  lyblsx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lyblsx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[领用比例上限]类型转换发生意外:"+e);
	return;
}
String dhqh=cf.GB2Uni(request.getParameter("dhqh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (dwbh.length()!=5)
	{
		out.println("错误！编码编码长度必须5位");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="delete from bj_dzbjbz";
	ls_sql+=" where dwbh='"+dwbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_dzbjbz(dwbh,dzbjbz) values('"+dwbh+"',EMPTY_CLOB())";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="select dzbjbz";
	ls_sql+=" from  bj_dzbjbz";
	ls_sql+=" where  (dwbh='"+dwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clob=(oracle.sql.CLOB)rs.getClob("dzbjbz");
	}
	rs.close();
	ps.close();

	clob.putString(1,dzbjbz);

	ls_sql="update bj_dzbjbz set dzbjbz=?";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setClob(1,clob);
	ps.executeUpdate();
	ps.close();
	
	
	ls_sql="insert into sq_dwxx ( dwbh,dwmc,dwjc,dwlx,dwdz,dwfzr,dwdh,dwcz,email,bz   ,ssdw,dqbm,hthqz,cxbz,ssfgs,bianma,ssdqbm,dwflbm,ssfw,dwjb   ,kdsj,gdsj,dmxs,bzrs,jryjbfb,jcppbz,zxkhlrjc,zxkhlrts,qdkhbljc,qdkhblts   ,dzbjjc,hfsjzdsz,xmzyglbz,jjgwglbz,khxxglsj,jcddblxs,gdjzrq,drjs,jzyf,sjjryjbfb   ,kfdh,jjsjsglbz,sfjms,cwdm,jcddmxblxs,zcmmbz,mmbz,cgjjbz,jjbz,djlrfs,kgcxhdbl,xuhao,bzlybl,lyblxx,lyblsx,dhqh) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,UPPER(?),?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,dwmc);
	ps.setString(3,dwjc);
	ps.setString(4,dwlx);
	ps.setString(5,dwdz);
	ps.setString(6,dwfzr);
	ps.setString(7,dwdh);
	ps.setString(8,dwcz);
	ps.setString(9,email);
	ps.setString(10,bz);

	ps.setString(11,ssdw);
	ps.setString(12,dqbm);
	ps.setString(13,hthqz);
	ps.setString(14,cxbz);
	ps.setString(15,ssfgs);
	ps.setString(16,bianma);
	ps.setString(17,ssdqbm);
	ps.setString(18,dwflbm);
	ps.setString(19,ssfw);
	ps.setString(20,dwjb);

	ps.setDate(21,kdsj);
	ps.setDate(22,gdsj);
	ps.setString(23,dmxs);
	ps.setInt(24,bzrs);
	ps.setDouble(25,jryjbfb);
	ps.setString(26,jcppbz);
	ps.setString(27,zxkhlrjc);
	ps.setInt(28,zxkhlrts);
	ps.setString(29,qdkhbljc);
	ps.setInt(30,qdkhblts);

	ps.setString(31,dzbjjc);
	ps.setString(32,hfsjzdsz);
	ps.setString(33,xmzyglbz);
	ps.setString(34,jjgwglbz);
	ps.setDate(35,khxxglsj);
	ps.setString(36,jcddblxs);
	ps.setInt(37,gdjzrq);
	ps.setInt(38,drjs);
	ps.setString(39,jzyf);
	ps.setDouble(40,sjjryjbfb);

	ps.setString(41,kfdh);
	ps.setString(42,jjsjsglbz);
	ps.setString(43,sfjms);
	ps.setString(44,cwdm);
	ps.setString(45,jcddmxblxs);
	ps.setString(46,zcmmbz);
	ps.setString(47,mmbz);
	ps.setString(48,cgjjbz);
	ps.setString(49,jjbz);
	ps.setString(50,djlrfs);
	ps.setString(51,kgcxhdbl);
	ps.setString(52,xuhao);
	ps.setDouble(53,bzlybl);
	ps.setDouble(54,lyblxx);
	ps.setDouble(55,lyblsx);
	ps.setString(56,dhqh);
	ps.executeUpdate();
	ps.close();


	ls_sql="update sq_dwxx set ssdqbm=?,dqbm=?";
	ls_sql+=" where ssfgs='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssdqbm);
	ps.setString(2,dqbm);
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