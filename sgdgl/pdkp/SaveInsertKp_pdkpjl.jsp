<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kpjlh=null;
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
kpjlh=request.getParameter("kpjlh");
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sqkpjlh=null;//���ڿ�����¼��
	ls_sql=" select kpjlh";
	ls_sql+=" from  kp_pdkpjl";
	ls_sql+=" where zxbz='Y' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqkpjlh=rs.getString("kpjlh");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql=" update kp_pdkpjl set zxbz='N' where kpjlh='"+sqkpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into kp_pdkpjl ( kpjlh,fgsbh,qssj,jzsj,kxsgds,sgdpdze,sgdpdde,sgdpzde,sgdpxde,sgdsqze";
	ls_sql+=" ,sgdsqdde,sgdsqzde,sgdsqxde,sgdbcze,sgdbcdde,sgdbczde,sgdbcxde,sgdkpdze,sgdkpdde,sgdkpzde ";
	ls_sql+=" ,sgdkpxde,sgdspdze,sgdspdde,sgdspzde,sgdspxde,sgdpkzf,mfkjde,zsdpdze,zsdpdde,zsdpzde";
	ls_sql+=" ,zsdpxde,zsdsqze,zsdsqdde,zsdsqzde,zsdsqxde,zsdbcze,zsdbcdde,zsdbczde,zsdbcxde,zsdkpdze";
	ls_sql+=" ,zsdkpdde,zsdkpzde,zsdkpxde,zsdspdze,zsdspdde,zsdspzde,zsdspxde,zsdkpzf,zsmfkjde,sqkpjlh";
	ls_sql+=" ,sqsjqye,sqddqye,sqzdqye,sqxdqye,sqddsjbl,sqzdsjbl,sqxdsjbl,ajqz,bjqz,cjqz";
	ls_sql+=" ,djqz,ajddbl,ajzdbl,ajxdbl,bjddbl,bjzdbl,bjxdbl,cjddbl,cjzdbl,cjxdbl";
	ls_sql+=" ,djddbl,djzdbl,djxdbl,ajzdjde,bjzdjde,cjzdjde,djzdjde,zsajqz,zsbjqz,zscjqz";
	ls_sql+=" ,zsdjqz,zsajddbl,zsajzdbl,zsajxdbl,zsbjddbl,zsbjzdbl,zsbjxdbl,zscjddbl,zscjzdbl,zscjxdbl";
	ls_sql+=" ,zsdjddbl,zsdjzdbl,zsdjxdbl,zsajzdjde,zsbjzdjde,zscjzdjde,zsdjzdjde,lrr,lrsj,zxbz  ,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+="         ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+="         ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kpjlh);
	ps.setString(2,fgsbh);
	ps.setDate(3,qssj);
	ps.setDate(4,jzsj);
	ps.setInt(5,kxsgds);
	ps.setDouble(6,sgdpdze);
	ps.setDouble(7,0);
	ps.setDouble(8,0);
	ps.setDouble(9,0);
	ps.setDouble(10,0);

	ps.setDouble(11,0);
	ps.setDouble(12,0);
	ps.setDouble(13,0);
	ps.setLong(14,0);
	ps.setDouble(15,0);
	ps.setDouble(16,0);
	ps.setDouble(17,0);
	ps.setDouble(18,0);
	ps.setDouble(19,0);
	ps.setLong(20,0);

	ps.setDouble(21,0);
	ps.setDouble(22,0);
	ps.setDouble(23,0);
	ps.setLong(24,0);
	ps.setDouble(25,0);
	ps.setDouble(26,0);
	ps.setDouble(27,0);
	ps.setDouble(28,zsdpdze);
	ps.setDouble(29,0);
	ps.setLong(30,0);

	ps.setDouble(31,0);
	ps.setDouble(32,0);
	ps.setDouble(33,0);
	ps.setLong(34,0);
	ps.setDouble(35,0);
	ps.setDouble(36,0);
	ps.setDouble(37,0);
	ps.setDouble(38,0);
	ps.setDouble(39,0);
	ps.setLong(40,0);

	ps.setDouble(41,0);
	ps.setDouble(42,0);
	ps.setDouble(43,0);
	ps.setLong(44,0);
	ps.setDouble(45,0);
	ps.setDouble(46,0);
	ps.setDouble(47,0);
	ps.setDouble(48,0);
	ps.setDouble(49,0);
	ps.setString(50,sqkpjlh);

	ps.setDouble(51,0);
	ps.setDouble(52,0);
	ps.setDouble(53,0);
	ps.setDouble(54,0);
	ps.setDouble(55,0);
	ps.setDouble(56,0);
	ps.setDouble(57,0);
	ps.setDouble(58,ajqz);
	ps.setDouble(59,bjqz);
	ps.setDouble(60,cjqz);

	ps.setDouble(61,djqz);
	ps.setDouble(62,ajddbl);
	ps.setDouble(63,ajzdbl);
	ps.setDouble(64,ajxdbl);
	ps.setDouble(65,bjddbl);
	ps.setDouble(66,bjzdbl);
	ps.setDouble(67,bjxdbl);
	ps.setDouble(68,cjddbl);
	ps.setDouble(69,cjzdbl);
	ps.setDouble(70,cjxdbl);

	ps.setDouble(71,djddbl);
	ps.setDouble(72,djzdbl);
	ps.setDouble(73,djxdbl);
	ps.setDouble(74,ajzdjde);

	ps.setDouble(75,bjzdjde);
	ps.setDouble(76,cjzdjde);
	ps.setDouble(77,djzdjde);
	ps.setDouble(78,zsajqz);
	ps.setDouble(79,zsbjqz);
	ps.setDouble(80,zscjqz);

	ps.setDouble(81,zsdjqz);
	ps.setDouble(82,zsajddbl);
	ps.setDouble(83,zsajzdbl);
	ps.setDouble(84,zsajxdbl);
	ps.setDouble(85,zsbjddbl);
	ps.setDouble(86,zsbjzdbl);
	ps.setDouble(87,zsbjxdbl);
	ps.setDouble(88,zscjddbl);
	ps.setDouble(89,zscjzdbl);
	ps.setDouble(90,zscjxdbl);

	ps.setDouble(91,zsdjddbl);
	ps.setDouble(92,zsdjzdbl);
	ps.setDouble(93,zsdjxdbl);
	ps.setDouble(94,zsajzdjde);
	ps.setDouble(95,zsbjzdjde);
	ps.setDouble(96,zscjzdjde);
	ps.setDouble(97,zsdjzdjde);
	ps.setString(98,lrr);
	ps.setDate(99,lrsj);
	ps.setString(100,"Y");

	ps.setString(101,bz);
	ps.executeUpdate();
	ps.close();

	ls_sql =" insert into kp_pdkprgdf (kpjlh,sgd,gcjxje,gcjxdf,phjcdf,tsgxdf,kpbz) ";
	ls_sql+=" select '"+kpjlh+"',sgd,0,0,0,0,'N' ";
	ls_sql+=" from sq_sgd";
	ls_sql+=" where ssfgs='"+fgsbh+"' and cxbz='N'";
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
	out.print("<BR>����ʧ��,��������: " + e);
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