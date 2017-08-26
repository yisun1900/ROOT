<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khxm=null;
String cqbm=null;
String xqbm=null;
String fwdz=null;
String lxfs=null;
java.sql.Date csrq=null;
String zybm=null;
long qyxh=0;
String hxbm=null;
String czbm=null;
String zxjwbm=null;
String ysbm=null;
String hxmjbm=null;
long fwmj=0;
String hth=null;
String sjs=null;
double qye=0;
String sfyyh=null;
double zkl=0;
java.sql.Date qyrq=null;
java.sql.Date kgrq=null;
java.sql.Date sjkgrq=null;
java.sql.Date jgrq=null;
java.sql.Date sjjgrq=null;
java.sql.Date jhtrq=null;
java.sql.Date bxjzsj=null;
String gcjdbm=null;
String wgbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String hdbz=null;
String khlxbm=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
khxm=cf.GB2Uni(request.getParameter("khxm"));
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
xqbm=cf.GB2Uni(request.getParameter("xqbm"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
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
zybm=cf.GB2Uni(request.getParameter("zybm"));
ls=request.getParameter("qyxh");
try{
	if (!(ls.equals("")))  qyxh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qyxh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签约序号]类型转换发生意外:"+e);
	return;
}
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
czbm=cf.GB2Uni(request.getParameter("czbm"));
zxjwbm=cf.GB2Uni(request.getParameter("zxjwbm"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
hxmjbm=cf.GB2Uni(request.getParameter("hxmjbm"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fwmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[房屋面积]类型转换发生意外:"+e);
	return;
}
hth=cf.GB2Uni(request.getParameter("hth"));
sjs=cf.GB2Uni(request.getParameter("sjs"));
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
sfyyh=cf.GB2Uni(request.getParameter("sfyyh"));
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
ls=request.getParameter("qyrq");
try{
	if (!(ls.equals("")))  qyrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qyrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签约日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kgrq");
try{
	if (!(ls.equals("")))  kgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应开工日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjkgrq");
try{
	if (!(ls.equals("")))  sjkgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjkgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际开工日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jgrq");
try{
	if (!(ls.equals("")))  jgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应竣工日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjjgrq");
try{
	if (!(ls.equals("")))  sjjgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjjgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际竣工日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhtrq");
try{
	if (!(ls.equals("")))  jhtrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhtrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交合同日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bxjzsj");
try{
	if (!(ls.equals("")))  bxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bxjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[保修截止时间]类型转换发生意外:"+e);
	return;
}
gcjdbm=cf.GB2Uni(request.getParameter("gcjdbm"));
wgbz=cf.GB2Uni(request.getParameter("wgbz"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
sgbz=cf.GB2Uni(request.getParameter("sgbz"));
zjxm=cf.GB2Uni(request.getParameter("zjxm"));
hdbz=cf.GB2Uni(request.getParameter("hdbz"));
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
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

String sffj=cf.GB2Uni(request.getParameter("sffj"));
String sfyrz=cf.GB2Uni(request.getParameter("sfyrz"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;

	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where fwdz='"+fwdz+"' and qyxh="+qyxh+" and zt='2'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();

	if (count>0)
	{
		out.println("错误！此房屋地址已存在，若是同一合同签的多个单，签约序号必须不同");
		return;
	}


	//客户编号
	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(khbh))+1,1)";
	ls_sql+=" from  crm_khxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	ps.close();
	rs.close();
	String khbh=cf.addZero(xh,7);


	ls_sql="insert into crm_khxx ( khxm,cqbm,xqbm,fwdz,lxfs,csrq,zybm,qyxh,hxbm,czbm,zxjwbm,ysbm,hxmjbm,fwmj,hth,sjs,qye,sfyyh,zkl,qyrq,kgrq,sjkgrq,jgrq,sjjgrq,jhtrq,bxjzsj,gcjdbm,wgbz,sgd,sgbz,zjxm,hdbz,khlxbm,lrr,lrsj,bz,khbh,sffj,sfyrz,dwbh,zt,tsbz,pdclzt,ybjbz,sfxhf,fkjd,xxlybm,bxbz,hfdjbz,jcjjqye,zxje,jxje,wkje,jsje,sdjsje,skje,zkje  ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'2','N','4','N','N','3','01','N','N',0,0,0,0,0,0,0,0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,cqbm);
	ps.setString(3,xqbm);
	ps.setString(4,fwdz);
	ps.setString(5,lxfs);
	ps.setDate(6,csrq);
	ps.setString(7,zybm);
	ps.setLong(8,qyxh);
	ps.setString(9,hxbm);
	ps.setString(10,czbm);
	ps.setString(11,zxjwbm);
	ps.setString(12,ysbm);
	ps.setString(13,hxmjbm);
	ps.setLong(14,fwmj);
	ps.setString(15,hth);
	ps.setString(16,sjs);
	ps.setDouble(17,qye);
	ps.setString(18,sfyyh);
	ps.setDouble(19,zkl);
	ps.setDate(20,qyrq);
	ps.setDate(21,kgrq);
	ps.setDate(22,sjkgrq);
	ps.setDate(23,jgrq);
	ps.setDate(24,sjjgrq);
	ps.setDate(25,jhtrq);
	ps.setDate(26,bxjzsj);
	ps.setString(27,gcjdbm);
	ps.setString(28,wgbz);
	ps.setString(29,sgd);
	ps.setString(30,sgbz);
	ps.setString(31,zjxm);
	ps.setString(32,hdbz);
	ps.setString(33,khlxbm);
	ps.setString(34,lrr);
	ps.setDate(35,lrsj);
	ps.setString(36,bz);
	ps.setString(37,khbh);
	ps.setString(38,sffj);
	ps.setString(39,sfyrz);
	ps.setString(40,dwbh);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！生成客户编号<<%=khbh%>>");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
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