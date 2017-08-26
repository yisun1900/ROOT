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


long kqhm=0;
String sjsbh=null;
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
int rzcs=0;
ls=request.getParameter("rzcs");
try{
	if (!(ls.equals("")))  rzcs=Integer.parseInt(ls.trim());
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
sjsbh=cf.GB2Uni(request.getParameter("sjsbh"));

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



Connection conn  = null;
ResultSet rs=null;
PreparedStatement ps=null;
String ls_sql=null;
int ygbh=0;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select count(*)";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where bianhao='"+bianhao+"' and ssfgs='"+ssfgs+"' and sfzszg in('Y','N')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！该[工号]已存在");
		return;
	}

	String jcyhmc=null;
	ls_sql="select yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where sfzh='"+sfzh+"'";
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

	ls_sql="select NVL(max(ygbh),0)";
	ls_sql+=" from  sq_yhxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygbh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ygbh++;

	int rzxh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  rs_yhrzjl";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rzxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	rzxh++;

	conn.setAutoCommit(false);

	ls_sql="insert into sq_yhxx ( ygbh,bianhao,yhmc,xb,csrq,sfzszg,mz,sg,tz,xx";
	ls_sql+=" ,hf,zzmm,sjsjb,zcmc,zyzzzs,xlbm,zy,cjgzsj,xuewei,byyx";
	ls_sql+=" ,zz,yzbm,dh,bgdh,jtdh,email,sfzh,sfzdz,gznx,jjlxr";
	ls_sql+=" ,jjlxrdz,lxrdh,zwbm,xzzwbm,sfytj,tjrq,sfqs,dhsfgb,zwpj,ssfgs";
	ls_sql+=" ,dwbh,lrr,lrsj,bz,sfydbs,qgzdw,wgzsj,syjzrq,kqhm,sjsbh";
	ls_sql+=" ,rzcs,rzsj,gqpxkssj,gqpxjssj,rzxh,hjszd,dacfd,dazrsj,dazcsj,dazchc ";
	ls_sql+=" ,dabgfjs,xuhao";
	ls_sql+=" ,ckjgbz,zdyhbz,kdlxtbz,sjxzbz   ,ipxzbz,wkxzbz,khdhbz,kkglfx,kfgssq,kzdzfs,zkl ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+="  ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+="  ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+="  ,?,?";
	ls_sql+="  ,'N','N','N','N'   ,'N','N','N','N','0','2',10) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,ygbh);
	ps.setString(2,bianhao);
	ps.setString(3,yhmc);
	ps.setString(4,xb);
	ps.setDate(5,csrq);
	ps.setString(6,sfzszg);
	ps.setString(7,mz);
	ps.setLong(8,sg);
	ps.setLong(9,tz);
	ps.setString(10,xx);

	ps.setString(11,hf);
	ps.setString(12,zzmm);
	ps.setString(13,sjsjb);
	ps.setString(14,zcmc);
	ps.setString(15,zyzzzs);
	ps.setString(16,xlbm);
	ps.setString(17,zy);
	ps.setDate(18,cjgzsj);
	ps.setString(19,xuewei);
	ps.setString(20,byyx);

	ps.setString(21,zz);
	ps.setString(22,yzbm);
	ps.setString(23,dh);
	ps.setString(24,bgdh);
	ps.setString(25,jtdh);
	ps.setString(26,email);
	ps.setString(27,sfzh);
	ps.setString(28,sfzdz);
	ps.setLong(29,gznx);
	ps.setString(30,jjlxr);

	ps.setString(31,jjlxrdz);
	ps.setString(32,lxrdh);
	ps.setString(33,zwbm);
	ps.setString(34,xzzwbm);
	ps.setString(35,sfytj);
	ps.setDate(36,tjrq);
	ps.setString(37,sfqs);
	ps.setString(38,dhsfgb);
	ps.setString(39,zwpj);
	ps.setString(40,ssfgs);

	ps.setString(41,dwbh);
	ps.setString(42,lrr);
	ps.setDate(43,lrsj);
	ps.setString(44,bz);
	ps.setString(45,sfydbs);
	ps.setString(46,qgzdw);
	ps.setDouble(47,wgzsj);
	ps.setDate(48,syjzrq);
	ps.setLong(49,kqhm);
	ps.setString(50,sjsbh);

	ps.setInt(51,rzcs);
	ps.setDate(52,rzsj);
	ps.setDate(53,gqpxkssj);
	ps.setDate(54,gqpxjssj);
	ps.setInt(55,rzxh);
	ps.setString(56,hjszd);
	ps.setString(57,dacfd);
	ps.setDate(58,dazrsj);
	ps.setDate(59,dazcsj);
	ps.setString(60,dazchc);

	ps.setString(61,dabgfjs);
	ps.setInt(62,xuhao);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into rs_yhrzjl ( xh,ygbh,yhmc,bianhao,sfzh,xzzwbm,rzsj,rzcs,dwbh,ssfgs,lrr,lrsj,lx) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,'1') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,rzxh);
	ps.setInt(2,ygbh);
	ps.setString(3,yhmc);
	ps.setString(4,bianhao);
	ps.setString(5,sfzh);
	ps.setString(6,xzzwbm);
	ps.setDate(7,rzsj);
	ps.setInt(8,rzcs);
	ps.setString(9,dwbh);
	ps.setString(10,ssfgs);
	ps.setString(11,lrr);
	ps.setDate(12,lrsj);
	ps.executeUpdate();
	ps.close();

	//员工基本工资表
	ls_sql="delete from rs_ygjbgzb ";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into rs_ygjbgzb (ygbh,bianhao,yhmc,gzlb,khgz,jbgz,gwgz,glgz,jtbt,dhbt,cb,buzhu,bz)";
	ls_sql+=" values ( ?,?,?,?,0,0,0,0,0,0,0,0,'') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,ygbh);
	ps.setString(2,bianhao);
	ps.setString(3,yhmc);
	ps.setString(4,"1");//1：固定工资；2：浮动工资
	ps.executeUpdate();
	ps.close();

	//员工社保信息
	ls_sql="delete from rs_ygsbxx ";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into rs_ygsbxx (ygbh,bianhao,yhmc,sfcjbx,ylbx,jylbx,sybx,gsby,syx,sfjgjj)";
	ls_sql+=" values ( ?,?,?,'N','N','N','N','N','N','N') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,ygbh);
	ps.setString(2,bianhao);
	ps.setString(3,yhmc);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！生成员工编号：<%=ygbh%>");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e+ls_sql);
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