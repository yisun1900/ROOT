<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bianhao=null;
String yhmc=null;
String xb=null;
java.sql.Date csrq=null;
String sfzszg=null;
String mz=null;
long sg=0;
long tz=0;
String xx=null;
String hf=null;
String zzmm=null;
String sjsjb=null;
String zcmc=null;
String zyzzzs=null;
String xlbm=null;
String zy=null;
java.sql.Date cjgzsj=null;
String xuewei=null;
String byyx=null;
String zz=null;
String yzbm=null;
String dh=null;
String bgdh=null;
String jtdh=null;
String email=null;
String sfzh=null;
String sfzdz=null;
long gznx=0;
String jjlxr=null;
String jjlxrdz=null;
String lxrdh=null;
String xzzwbm=null;
String sfytj=null;
java.sql.Date tjrq=null;
String sfqs=null;
String dhsfgb=null;
String zwpj=null;
String ssfgs=null;
String dwbh=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
String sfydbs=null;
String qgzdw=null;
double wgzsj=0;
java.sql.Date syjzrq=null;
String gzlb=null;
double syqgz=0;
double zzgz=0;
double jbgz=0;
double glgz=0;
double gwgz=0;
double khgz=0;
double buzhu=0;
double jtbt=0;
double cb=0;
double dhbt=0;
long kqhm=0;

String sjsbh=null;
long rzcs=0;
java.sql.Date rzsj=null;
java.sql.Date gqpxkssj=null;
java.sql.Date gqpxjssj=null;
bianhao=cf.GB2Uni(request.getParameter("bianhao"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
xb=cf.GB2Uni(request.getParameter("xb"));
ls=request.getParameter("csrq");
try{
	if (!(ls.equals("")))  csrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����csrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
sfzszg=cf.GB2Uni(request.getParameter("sfzszg"));
mz=cf.GB2Uni(request.getParameter("mz"));
ls=request.getParameter("sg");
try{
	if (!(ls.equals("")))  sg=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sg������");
	return;
}
catch (Exception e){
	out.println("<BR>[���(cm)]����ת����������:"+e);
	return;
}
ls=request.getParameter("tz");
try{
	if (!(ls.equals("")))  tz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tz������");
	return;
}
catch (Exception e){
	out.println("<BR>[����(KG)]����ת����������:"+e);
	return;
}
xx=cf.GB2Uni(request.getParameter("xx"));
hf=cf.GB2Uni(request.getParameter("hf"));
zzmm=cf.GB2Uni(request.getParameter("zzmm"));
sjsjb=cf.GB2Uni(request.getParameter("sjsjb"));
zcmc=cf.GB2Uni(request.getParameter("zcmc"));
zyzzzs=cf.GB2Uni(request.getParameter("zyzzzs"));
xlbm=cf.GB2Uni(request.getParameter("xlbm"));
zy=cf.GB2Uni(request.getParameter("zy"));
ls=request.getParameter("cjgzsj");
try{
	if (!(ls.equals("")))  cjgzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cjgzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ҵʱ��]����ת����������:"+e);
	return;
}
xuewei=cf.GB2Uni(request.getParameter("xuewei"));
byyx=cf.GB2Uni(request.getParameter("byyx"));
zz=cf.GB2Uni(request.getParameter("zz"));
yzbm=cf.GB2Uni(request.getParameter("yzbm"));
dh=cf.GB2Uni(request.getParameter("dh"));
bgdh=cf.GB2Uni(request.getParameter("bgdh"));
jtdh=cf.GB2Uni(request.getParameter("jtdh"));
email=cf.GB2Uni(request.getParameter("email"));
sfzh=cf.GB2Uni(request.getParameter("sfzh"));
sfzdz=cf.GB2Uni(request.getParameter("sfzdz"));
ls=request.getParameter("gznx");
try{
	if (!(ls.equals("")))  gznx=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gznx������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
jjlxr=cf.GB2Uni(request.getParameter("jjlxr"));
jjlxrdz=cf.GB2Uni(request.getParameter("jjlxrdz"));
lxrdh=cf.GB2Uni(request.getParameter("lxrdh"));
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));
sfytj=cf.GB2Uni(request.getParameter("sfytj"));
ls=request.getParameter("tjrq");
try{
	if (!(ls.equals("")))  tjrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tjrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
sfqs=cf.GB2Uni(request.getParameter("sfqs"));
dhsfgb=cf.GB2Uni(request.getParameter("dhsfgb"));
zwpj=cf.GB2Uni(request.getParameter("zwpj"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
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
sfydbs=cf.GB2Uni(request.getParameter("sfydbs"));
qgzdw=cf.GB2Uni(request.getParameter("qgzdw"));
ls=request.getParameter("wgzsj");
try{
	if (!(ls.equals("")))  wgzsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wgzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[δ����ʱ��(��)]����ת����������:"+e);
	return;
}
ls=request.getParameter("syjzrq");
try{
	if (!(ls.equals("")))  syjzrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����syjzrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ý�������]����ת����������:"+e);
	return;
}
gzlb=cf.GB2Uni(request.getParameter("gzlb"));
ls=request.getParameter("syqgz");
try{
	if (!(ls.equals("")))  syqgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����syqgz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ڹ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zzgz");
try{
	if (!(ls.equals("")))  zzgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zzgz������");
	return;
}
catch (Exception e){
	out.println("<BR>[ת������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jbgz");
try{
	if (!(ls.equals("")))  jbgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jbgz������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("glgz");
try{
	if (!(ls.equals("")))  glgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����glgz������");
	return;
}
catch (Exception e){
	out.println("<BR>[���乤��]����ת����������:"+e);
	return;
}
ls=request.getParameter("gwgz");
try{
	if (!(ls.equals("")))  gwgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gwgz������");
	return;
}
catch (Exception e){
	out.println("<BR>[��λ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("khgz");
try{
	if (!(ls.equals("")))  khgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khgz������");
	return;
}
catch (Exception e){
	out.println("<BR>[���˹���]����ת����������:"+e);
	return;
}
ls=request.getParameter("buzhu");
try{
	if (!(ls.equals("")))  buzhu=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����buzhu������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("jtbt");
try{
	if (!(ls.equals("")))  jtbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jtbt������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͨ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("cb");
try{
	if (!(ls.equals("")))  cb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cb������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ͳ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("dhbt");
try{
	if (!(ls.equals("")))  dhbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dhbt������");
	return;
}
catch (Exception e){
	out.println("<BR>[�绰����]����ת����������:"+e);
	return;
}
ls=request.getParameter("kqhm");
try{
	if (!(ls.equals("")))  kqhm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kqhm������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ں���]����ת����������:"+e);
	return;
}
sjsbh=cf.GB2Uni(request.getParameter("sjsbh"));
ls=request.getParameter("rzcs");
try{
	if (!(ls.equals("")))  rzcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����rzcs������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ְ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����rzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ְ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("gqpxkssj");
try{
	if (!(ls.equals("")))  gqpxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gqpxkssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ��ѵ��ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("gqpxjssj");
try{
	if (!(ls.equals("")))  gqpxjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gqpxjssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ��ѵ����ʱ��]����ת����������:"+e);
	return;
}

String hjszd=null;
String dacfd=null;
java.sql.Date dazrsj=null;
java.sql.Date dazcsj=null;
String dazchc=null;
String dabgfjs=null;
hjszd=cf.GB2Uni(request.getParameter("hjszd"));
dacfd=cf.GB2Uni(request.getParameter("dacfd"));
ls=request.getParameter("dazrsj");
try{
	if (!(ls.equals("")))  dazrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dazrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ת��ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("dazcsj");
try{
	if (!(ls.equals("")))  dazcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dazcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ת��ʱ��]����ת����������:"+e);
	return;
}
dazchc=cf.GB2Uni(request.getParameter("dazchc"));
dabgfjs=cf.GB2Uni(request.getParameter("dabgfjs"));

int xuhao=0;
ls=request.getParameter("xuhao");
try{
	if (!(ls.equals("")))  xuhao=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xuhao������");
	return;
}
catch (Exception e){
	out.println("<BR>[���]����ת����������:"+e);
	return;
}



String whereygbh=null;
whereygbh=cf.GB2Uni(request.getParameter("whereygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jcyhmc=null;
	ls_sql="select yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh!='"+whereygbh+"' and bianhao='"+bianhao+"' and ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jcyhmc=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (jcyhmc!=null)
	{
		out.println("���󣡸�[����]�ѱ���"+jcyhmc+"��ʹ��");
		return;
	}

	jcyhmc=null;
	ls_sql="select yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh!='"+whereygbh+"' and sfzh='"+sfzh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jcyhmc=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (jcyhmc!=null)
	{
		out.println("���󣡸�[���֤��]�ѱ���"+jcyhmc+"��ʹ��");
		return;
	}

	String zwbm=null;
	ls_sql="select gzbm";
	ls_sql+=" from  dm_xzzwbm";
	ls_sql+=" where xzzwmc='"+xzzwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zwbm=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (zwbm==null)
	{
		out.println("���󣡹��ֲ����ڣ�"+ls_sql);
		return;
	}

	ls_sql="update sq_yhxx set bianhao=?,yhmc=?,xb=?,csrq=?,sfzszg=?,mz=?,sg=?,tz=?,xx=?,hf=?";
	ls_sql+=" ,zzmm=?,sjsjb=?,zcmc=?,zyzzzs=?,xlbm=?,zy=?,cjgzsj=?,xuewei=?,byyx=?,zz=?";
	ls_sql+=" ,yzbm=?,dh=?,bgdh=?,jtdh=?,email=?,sfzh=?,sfzdz=?,gznx=?,jjlxr=?,jjlxrdz=?";
	ls_sql+=" ,lxrdh=?,zwbm=?,xzzwbm=?,sfytj=?,tjrq=?,sfqs=?,dhsfgb=?,zwpj=?,ssfgs=?,dwbh=?";
	ls_sql+=" ,lrr=?,lrsj=?,bz=?,sfydbs=?,qgzdw=?,wgzsj=?,syjzrq=?,gzlb=?,syqgz=?,zzgz=?";
	ls_sql+=" ,jbgz=?,glgz=?,gwgz=?,khgz=?,buzhu=?,jtbt=?,cb=?,dhbt=?,kqhm=?,sjsbh=?";
	ls_sql+=" ,rzcs=?,rzsj=?,gqpxkssj=?,gqpxjssj=?,hjszd=?,dacfd=?,dazrsj=?,dazcsj=?,dazchc=?,dabgfjs=?,xuhao=? ";
	ls_sql+=" where  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bianhao);
	ps.setString(2,yhmc);
	ps.setString(3,xb);
	ps.setDate(4,csrq);
	ps.setString(5,sfzszg);
	ps.setString(6,mz);
	ps.setLong(7,sg);
	ps.setLong(8,tz);
	ps.setString(9,xx);
	ps.setString(10,hf);

	ps.setString(11,zzmm);
	ps.setString(12,sjsjb);
	ps.setString(13,zcmc);
	ps.setString(14,zyzzzs);
	ps.setString(15,xlbm);
	ps.setString(16,zy);
	ps.setDate(17,cjgzsj);
	ps.setString(18,xuewei);
	ps.setString(19,byyx);
	ps.setString(20,zz);

	ps.setString(21,yzbm);
	ps.setString(22,dh);
	ps.setString(23,bgdh);
	ps.setString(24,jtdh);
	ps.setString(25,email);
	ps.setString(26,sfzh);
	ps.setString(27,sfzdz);
	ps.setLong(28,gznx);
	ps.setString(29,jjlxr);
	ps.setString(30,jjlxrdz);

	ps.setString(31,lxrdh);
	ps.setString(32,zwbm);
	ps.setString(33,xzzwbm);
	ps.setString(34,sfytj);
	ps.setDate(35,tjrq);
	ps.setString(36,sfqs);
	ps.setString(37,dhsfgb);
	ps.setString(38,zwpj);
	ps.setString(39,ssfgs);
	ps.setString(40,dwbh);

	ps.setString(41,lrr);
	ps.setDate(42,lrsj);
	ps.setString(43,bz);
	ps.setString(44,sfydbs);
	ps.setString(45,qgzdw);
	ps.setDouble(46,wgzsj);
	ps.setDate(47,syjzrq);
	ps.setString(48,gzlb);
	ps.setDouble(49,syqgz);
	ps.setDouble(50,zzgz);

	ps.setDouble(51,jbgz);
	ps.setDouble(52,glgz);
	ps.setDouble(53,gwgz);
	ps.setDouble(54,khgz);
	ps.setDouble(55,buzhu);
	ps.setDouble(56,jtbt);
	ps.setDouble(57,cb);
	ps.setDouble(58,dhbt);
	ps.setLong(59,kqhm);
	ps.setString(60,sjsbh);

	ps.setLong(61,rzcs);
	ps.setDate(62,rzsj);
	ps.setDate(63,gqpxkssj);
	ps.setDate(64,gqpxjssj);
	ps.setString(65,hjszd);
	ps.setString(66,dacfd);
	ps.setDate(67,dazrsj);
	ps.setDate(68,dazcsj);
	ps.setString(69,dazchc);
	ps.setString(70,dabgfjs);
	ps.setInt(71,xuhao);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>