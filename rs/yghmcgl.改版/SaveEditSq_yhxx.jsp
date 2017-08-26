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
	out.println("<BR>变量csrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出生日期]类型转换发生意外:"+e);
	return;
}
sfzszg=cf.GB2Uni(request.getParameter("sfzszg"));
mz=cf.GB2Uni(request.getParameter("mz"));
ls=request.getParameter("sg");
try{
	if (!(ls.equals("")))  sg=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[身高(cm)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("tz");
try{
	if (!(ls.equals("")))  tz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[体重(KG)]类型转换发生意外:"+e);
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
	out.println("<BR>变量cjgzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[毕业时间]类型转换发生意外:"+e);
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
	out.println("<BR>变量gznx不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工作年限]类型转换发生意外:"+e);
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
	out.println("<BR>变量tjrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[体检日期]类型转换发生意外:"+e);
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
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
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
	out.println("<BR>变量wgzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[未工作时间(年)]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("syjzrq");
try{
	if (!(ls.equals("")))  syjzrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量syjzrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[试用截至日期]类型转换发生意外:"+e);
	return;
}
gzlb=cf.GB2Uni(request.getParameter("gzlb"));
ls=request.getParameter("syqgz");
try{
	if (!(ls.equals("")))  syqgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量syqgz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[试用期工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zzgz");
try{
	if (!(ls.equals("")))  zzgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zzgz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[转正工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jbgz");
try{
	if (!(ls.equals("")))  jbgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jbgz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[基本工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("glgz");
try{
	if (!(ls.equals("")))  glgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glgz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工龄工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gwgz");
try{
	if (!(ls.equals("")))  gwgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gwgz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[岗位工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("khgz");
try{
	if (!(ls.equals("")))  khgz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khgz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考核工资]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("buzhu");
try{
	if (!(ls.equals("")))  buzhu=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量buzhu不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[补助]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jtbt");
try{
	if (!(ls.equals("")))  jtbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jtbt不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交通补贴]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cb");
try{
	if (!(ls.equals("")))  cb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[餐补]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dhbt");
try{
	if (!(ls.equals("")))  dhbt=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dhbt不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[电话补贴]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kqhm");
try{
	if (!(ls.equals("")))  kqhm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kqhm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考勤号码]类型转换发生意外:"+e);
	return;
}
sjsbh=cf.GB2Uni(request.getParameter("sjsbh"));
ls=request.getParameter("rzcs");
try{
	if (!(ls.equals("")))  rzcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rzcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入职次数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入职日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gqpxkssj");
try{
	if (!(ls.equals("")))  gqpxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gqpxkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[岗前培训开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gqpxjssj");
try{
	if (!(ls.equals("")))  gqpxjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gqpxjssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[岗前培训结束时间]类型转换发生意外:"+e);
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
	out.println("<BR>变量dazrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[档案转入时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dazcsj");
try{
	if (!(ls.equals("")))  dazcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dazcsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[档案转出时间]类型转换发生意外:"+e);
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
	out.println("<BR>变量xuhao不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[序号]类型转换发生意外:"+e);
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
		out.println("错误！该[工号]已被【"+jcyhmc+"】使用");
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
		out.println("错误！该[身份证号]已被【"+jcyhmc+"】使用");
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
		out.println("错误！工种不存在："+ls_sql);
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
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
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