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
	out.println("<BR>����qssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("jzsj");
try{
	if (!(ls.equals("")))  jzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ֹʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("sgdpdze");
try{
	if (!(ls.equals("")))  sgdpdze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sgdpdze������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ֱ�����ɵ��ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ajqz");
try{
	if (!(ls.equals("")))  ajqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ajqz������");
	return;
}
catch (Exception e){
	out.println("<BR>[A����Ȩ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("bjqz");
try{
	if (!(ls.equals("")))  bjqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bjqz������");
	return;
}
catch (Exception e){
	out.println("<BR>[B����Ȩ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("cjqz");
try{
	if (!(ls.equals("")))  cjqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cjqz������");
	return;
}
catch (Exception e){
	out.println("<BR>[C����Ȩ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("djqz");
try{
	if (!(ls.equals("")))  djqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����djqz������");
	return;
}
catch (Exception e){
	out.println("<BR>[D����Ȩ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("ajddbl");
try{
	if (!(ls.equals("")))  ajddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ajddbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[A���ӽӴ󵥱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("ajzdbl");
try{
	if (!(ls.equals("")))  ajzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ajzdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[A���ӽ��е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("ajxdbl");
try{
	if (!(ls.equals("")))  ajxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ajxdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[A���ӽ�С������]����ת����������:"+e);
	return;
}
ls=request.getParameter("bjddbl");
try{
	if (!(ls.equals("")))  bjddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bjddbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[B���ӽӴ󵥱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("bjzdbl");
try{
	if (!(ls.equals("")))  bjzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bjzdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[B���ӽ��е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("bjxdbl");
try{
	if (!(ls.equals("")))  bjxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bjxdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[B���ӽ�С������]����ת����������:"+e);
	return;
}
ls=request.getParameter("cjddbl");
try{
	if (!(ls.equals("")))  cjddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cjddbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[C���ӽӴ󵥱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("cjzdbl");
try{
	if (!(ls.equals("")))  cjzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cjzdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[C���ӽ��е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("cjxdbl");
try{
	if (!(ls.equals("")))  cjxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cjxdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[C���ӽ�С������]����ת����������:"+e);
	return;
}
ls=request.getParameter("djddbl");
try{
	if (!(ls.equals("")))  djddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����djddbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[D���ӽӴ󵥱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("djzdbl");
try{
	if (!(ls.equals("")))  djzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����djzdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[D���ӽ��е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("djxdbl");
try{
	if (!(ls.equals("")))  djxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����djxdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[D���ӽ�С������]����ת����������:"+e);
	return;
}
ls=request.getParameter("ajzdjde");
try{
	if (!(ls.equals("")))  ajzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ajzdjde������");
	return;
}
catch (Exception e){
	out.println("<BR>[A���ӵ������ӵ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("bjzdjde");
try{
	if (!(ls.equals("")))  bjzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bjzdjde������");
	return;
}
catch (Exception e){
	out.println("<BR>[B���ӵ������ӵ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("cjzdjde");
try{
	if (!(ls.equals("")))  cjzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cjzdjde������");
	return;
}
catch (Exception e){
	out.println("<BR>[C���ӵ������ӵ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("djzdjde");
try{
	if (!(ls.equals("")))  djzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����djzdjde������");
	return;
}
catch (Exception e){
	out.println("<BR>[D���ӵ������ӵ���]����ת����������:"+e);
	return;
}

ls=request.getParameter("zsdpdze");
try{
	if (!(ls.equals("")))  zsdpdze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsdpdze������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ�����ɵ��ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsajqz");
try{
	if (!(ls.equals("")))  zsajqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsajqz������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��A����Ȩ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsbjqz");
try{
	if (!(ls.equals("")))  zsbjqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsbjqz������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��B����Ȩ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("zscjqz");
try{
	if (!(ls.equals("")))  zscjqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zscjqz������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��C����Ȩ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsdjqz");
try{
	if (!(ls.equals("")))  zsdjqz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsdjqz������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��D����Ȩ��]����ת����������:"+e);
	return;
}




ls=request.getParameter("zsajddbl");
try{
	if (!(ls.equals("")))  zsajddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsajddbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��A���ӽӴ󵥱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsajzdbl");
try{
	if (!(ls.equals("")))  zsajzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsajzdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��A���ӽ��е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsajxdbl");
try{
	if (!(ls.equals("")))  zsajxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsajxdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��A���ӽ�С������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsbjddbl");
try{
	if (!(ls.equals("")))  zsbjddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsbjddbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��B���ӽӴ󵥱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsbjzdbl");
try{
	if (!(ls.equals("")))  zsbjzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsbjzdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��B���ӽ��е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsbjxdbl");
try{
	if (!(ls.equals("")))  zsbjxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsbjxdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��B���ӽ�С������]����ת����������:"+e);
	return;
}


ls=request.getParameter("zscjddbl");
try{
	if (!(ls.equals("")))  zscjddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zscjddbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��C���ӽӴ󵥱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zscjzdbl");
try{
	if (!(ls.equals("")))  zscjzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zscjzdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��C���ӽ��е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zscjxdbl");
try{
	if (!(ls.equals("")))  zscjxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zscjxdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��C���ӽ�С������]����ת����������:"+e);
	return;
}


ls=request.getParameter("zsdjddbl");
try{
	if (!(ls.equals("")))  zsdjddbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsdjddbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��D���ӽӴ󵥱���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsdjzdbl");
try{
	if (!(ls.equals("")))  zsdjzdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsdjzdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��D���ӽ��е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsdjxdbl");
try{
	if (!(ls.equals("")))  zsdjxdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsdjxdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��D���ӽ�С������]����ת����������:"+e);
	return;
}


ls=request.getParameter("zsajzdjde");
try{
	if (!(ls.equals("")))  zsajzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsajzdjde������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��A���ӵ������ӵ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsbjzdjde");
try{
	if (!(ls.equals("")))  zsbjzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsbjzdjde������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��B���ӵ������ӵ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zscjzdjde");
try{
	if (!(ls.equals("")))  zscjzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zscjzdjde������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��C���ӵ������ӵ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zsdjzdjde");
try{
	if (!(ls.equals("")))  zsdjzdjde=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zsdjzdjde������");
	return;
}
catch (Exception e){
	out.println("<BR>[ֱ��D���ӵ������ӵ���]����ת����������:"+e);
	return;
}

int kxsgds=0;
ls=request.getParameter("kxsgds");
try{
	if (!(ls.equals("")))  kxsgds=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kxsgds������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɵ�ʱ��ѡʩ������]����ת����������:"+e);
	return;
}

lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
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
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����:" + e);
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