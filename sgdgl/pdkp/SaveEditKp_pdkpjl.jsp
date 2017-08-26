<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgsbh=null;
java.sql.Date qssj=null;
java.sql.Date jzsj=null;
double sgdpdze=0;
double ajqz=0;
double bjqz=0;
double cjqz=0;
double djqz=0;
double ajddbl=0;
double ajzdbl=0;
double ajxdbl=0;
double bjddbl=0;
double bjzdbl=0;
double bjxdbl=0;
double cjddbl=0;
double cjzdbl=0;
double cjxdbl=0;
double djddbl=0;
double djzdbl=0;
double djxdbl=0;
double ajzdjde=0;
double bjzdjde=0;
double cjzdjde=0;
double djzdjde=0;

double zsdpdze=0;
double zsajqz=0;
double zsbjqz=0;
double zscjqz=0;
double zsdjqz=0;

double zsajddbl=0;
double zsajzdbl=0;
double zsajxdbl=0;
double zsbjddbl=0;
double zsbjzdbl=0;
double zsbjxdbl=0;
double zscjddbl=0;
double zscjzdbl=0;
double zscjxdbl=0;
double zsdjddbl=0;
double zsdjzdbl=0;
double zsdjxdbl=0;
double zsajzdjde=0;
double zsbjzdjde=0;
double zscjzdjde=0;
double zsdjzdjde=0;

String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
ls=request.getParameter("qssj");
try{
	if (!(ls.equals("")))  qssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考评起始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jzsj");
try{
	if (!(ls.equals("")))  jzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考评截止时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgdpdze");
try{
	if (!(ls.equals("")))  sgdpdze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgdpdze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[非直属队派单总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ajqz");
try{
	if (!(ls.equals("")))  ajqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ajqz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[A级队权重]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bjqz");
try{
	if (!(ls.equals("")))  bjqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bjqz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[B级队权重]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cjqz");
try{
	if (!(ls.equals("")))  cjqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cjqz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[C级队权重]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("djqz");
try{
	if (!(ls.equals("")))  djqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djqz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[D级队权重]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ajddbl");
try{
	if (!(ls.equals("")))  ajddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ajddbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[A级队接大单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ajzdbl");
try{
	if (!(ls.equals("")))  ajzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ajzdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[A级队接中单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ajxdbl");
try{
	if (!(ls.equals("")))  ajxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ajxdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[A级队接小单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bjddbl");
try{
	if (!(ls.equals("")))  bjddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bjddbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[B级队接大单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bjzdbl");
try{
	if (!(ls.equals("")))  bjzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bjzdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[B级队接中单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bjxdbl");
try{
	if (!(ls.equals("")))  bjxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bjxdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[B级队接小单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cjddbl");
try{
	if (!(ls.equals("")))  cjddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cjddbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[C级队接大单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cjzdbl");
try{
	if (!(ls.equals("")))  cjzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cjzdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[C级队接中单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cjxdbl");
try{
	if (!(ls.equals("")))  cjxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cjxdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[C级队接小单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("djddbl");
try{
	if (!(ls.equals("")))  djddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djddbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[D级队接大单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("djzdbl");
try{
	if (!(ls.equals("")))  djzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djzdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[D级队接中单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("djxdbl");
try{
	if (!(ls.equals("")))  djxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djxdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[D级队接小单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ajzdjde");
try{
	if (!(ls.equals("")))  ajzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ajzdjde不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[A级队单组最大接单额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bjzdjde");
try{
	if (!(ls.equals("")))  bjzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bjzdjde不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[B级队单组最大接单额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cjzdjde");
try{
	if (!(ls.equals("")))  cjzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cjzdjde不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[C级队单组最大接单额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("djzdjde");
try{
	if (!(ls.equals("")))  djzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djzdjde不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[D级队单组最大接单额]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("zsdpdze");
try{
	if (!(ls.equals("")))  zsdpdze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsdpdze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属队派单总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsajqz");
try{
	if (!(ls.equals("")))  zsajqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsajqz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属A级队权重]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsbjqz");
try{
	if (!(ls.equals("")))  zsbjqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsbjqz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属B级队权重]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zscjqz");
try{
	if (!(ls.equals("")))  zscjqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zscjqz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属C级队权重]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsdjqz");
try{
	if (!(ls.equals("")))  zsdjqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsdjqz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属D级队权重]类型转换发生意外:"+e);
	return;
}




ls=request.getParameter("zsajddbl");
try{
	if (!(ls.equals("")))  zsajddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsajddbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属A级队接大单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsajzdbl");
try{
	if (!(ls.equals("")))  zsajzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsajzdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属A级队接中单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsajxdbl");
try{
	if (!(ls.equals("")))  zsajxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsajxdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属A级队接小单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsbjddbl");
try{
	if (!(ls.equals("")))  zsbjddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsbjddbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属B级队接大单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsbjzdbl");
try{
	if (!(ls.equals("")))  zsbjzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsbjzdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属B级队接中单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsbjxdbl");
try{
	if (!(ls.equals("")))  zsbjxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsbjxdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属B级队接小单比例]类型转换发生意外:"+e);
	return;
}


ls=request.getParameter("zscjddbl");
try{
	if (!(ls.equals("")))  zscjddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zscjddbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属C级队接大单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zscjzdbl");
try{
	if (!(ls.equals("")))  zscjzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zscjzdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属C级队接中单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zscjxdbl");
try{
	if (!(ls.equals("")))  zscjxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zscjxdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属C级队接小单比例]类型转换发生意外:"+e);
	return;
}


ls=request.getParameter("zsdjddbl");
try{
	if (!(ls.equals("")))  zsdjddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsdjddbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属D级队接大单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsdjzdbl");
try{
	if (!(ls.equals("")))  zsdjzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsdjzdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属D级队接中单比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsdjxdbl");
try{
	if (!(ls.equals("")))  zsdjxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsdjxdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属D级队接小单比例]类型转换发生意外:"+e);
	return;
}


ls=request.getParameter("zsajzdjde");
try{
	if (!(ls.equals("")))  zsajzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsajzdjde不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属A级队单组最大接单额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsbjzdjde");
try{
	if (!(ls.equals("")))  zsbjzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsbjzdjde不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属B级队单组最大接单额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zscjzdjde");
try{
	if (!(ls.equals("")))  zscjzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zscjzdjde不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属C级队单组最大接单额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsdjzdjde");
try{
	if (!(ls.equals("")))  zsdjzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsdjzdjde不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[直属D级队单组最大接单额]类型转换发生意外:"+e);
	return;
}

int kxsgds=0;
ls=request.getParameter("kxsgds");
try{
	if (!(ls.equals("")))  kxsgds=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kxsgds不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[派单时可选施工队数]类型转换发生意外:"+e);
	return;
}

lrr=cf.GB2Uni(request.getParameter("lrr"));
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
bz=cf.GB2Uni(request.getParameter("bz"));

String kpjlh=cf.GB2Uni(request.getParameter("kpjlh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	
	ls_sql="update kp_pdkpjl set kpjlh=?,fgsbh=?,qssj=?,jzsj=?,sgdpdze=?,ajqz=?,bjqz=?,cjqz=?,djqz=?,ajddbl=?,ajzdbl=?,ajxdbl=?,bjddbl=?,bjzdbl=?,bjxdbl=?,cjddbl=?,cjzdbl=?,cjxdbl=?,djddbl=?,djzdbl=?,djxdbl=?,ajzdjde=?,bjzdjde=?,cjzdjde=?,djzdjde=?   ,sgdpkzf=?,mfkjde=?   ,zsdpdze=?,zsajqz=?,zsbjqz=?,zscjqz=?,zsdjqz=?,zsajddbl=?,zsajzdbl=?,zsajxdbl=?,zsbjddbl=?,zsbjzdbl=?,zsbjxdbl=?,zscjddbl=?,zscjzdbl=?,zscjxdbl=?,zsdjddbl=?,zsdjzdbl=?,zsdjxdbl=?,zsajzdjde=?,zsbjzdjde=?,zscjzdjde=?,zsdjzdjde=?    ,zsdkpzf=?,zsmfkjde=?,lrr=?,lrsj=?,bz=?,kxsgds=? ";
	ls_sql+=" where kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kpjlh);
	ps.setString(2,fgsbh);
	ps.setDate(3,qssj);
	ps.setDate(4,jzsj);
	ps.setDouble(5,sgdpdze);
	ps.setDouble(6,ajqz);
	ps.setDouble(7,bjqz);
	ps.setDouble(8,cjqz);
	ps.setDouble(9,djqz);
	ps.setDouble(10,ajddbl);
	ps.setDouble(11,ajzdbl);
	ps.setDouble(12,ajxdbl);
	ps.setDouble(13,bjddbl);
	ps.setDouble(14,bjzdbl);
	ps.setDouble(15,bjxdbl);
	ps.setDouble(16,cjddbl);
	ps.setDouble(17,cjzdbl);
	ps.setDouble(18,cjxdbl);
	ps.setDouble(19,djddbl);
	ps.setDouble(20,djzdbl);
	ps.setDouble(21,djxdbl);
	ps.setDouble(22,ajzdjde);
	ps.setDouble(23,bjzdjde);
	ps.setDouble(24,cjzdjde);
	ps.setDouble(25,djzdjde);

	ps.setLong(26,0);
	ps.setDouble(27,0);

	ps.setDouble(28,zsdpdze);
	ps.setDouble(29,zsajqz);
	ps.setDouble(30,zsbjqz);
	ps.setDouble(31,zscjqz);
	ps.setDouble(32,zsdjqz);
	ps.setDouble(33,zsajddbl);
	ps.setDouble(34,zsajzdbl);
	ps.setDouble(35,zsajxdbl);
	ps.setDouble(36,zsbjddbl);
	ps.setDouble(37,zsbjzdbl);
	ps.setDouble(38,zsbjxdbl);
	ps.setDouble(39,zscjddbl);
	ps.setDouble(40,zscjzdbl);
	ps.setDouble(41,zscjxdbl);
	ps.setDouble(42,zsdjddbl);
	ps.setDouble(43,zsdjzdbl);
	ps.setDouble(44,zsdjxdbl);

	ps.setDouble(45,zsajzdjde);
	ps.setDouble(46,zsbjzdjde);
	ps.setDouble(47,zscjzdjde);
	ps.setDouble(48,zsdjzdjde);

	ps.setLong(49,0);
	ps.setDouble(50,0);

	ps.setString(51,lrr);
	ps.setDate(52,lrsj);
	ps.setString(53,bz);
	ps.setInt(54,kxsgds);
	ps.executeUpdate();
	ps.close();

	
	
	ls_sql=" delete from kp_pdkpmx ";
	ls_sql+=" where kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	ls_sql=" delete from kp_pdkpdxdf ";
	ls_sql+=" where kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>