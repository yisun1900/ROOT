<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xqmc=null;
String cqbm=null;
String dz=null;
String cclx=null;
String tjdm=null;
String jw=null;
String yzxfsp=null;
String xz=null;
String wyxs=null;
String xqgm=null;
String hxzl=null;
String zlhx=null;
//long zlhxmj=0;
String zlhxmj=null;
String ywy=null;
String dysfwc=null;
String xqfzr=null;
String xqfzrdh=null;
String xqzhpj=null;
java.sql.Date lxsj=null;
String xsfs=null;
java.sql.Date fyssj=null;
long jfhs=0;
String sfytg=null;
String xszk=null;
String khzlgmqk=null;
String khmd=null;
String ykfsgx=null;
String sfjcxc=null;
double khzyl=0;
String yxxcfs=null;
String kfjy=null;
String kfs=null;
String kfslxr=null;
String kfslxrzw=null;
String kfslxrdh=null;
String jzs=null;
String xss=null;
String sldh=null;
String ywzxgs=null;
long zxgssl=0;
long yzxhs=0;
String sftizxq=null;
java.sql.Date yjzxsj=null;
String ywwygs=null;
String wygsmc=null;
String wyfzr=null;
String wydh=null;
String wylxr=null;
String wylxrzw=null;
String lrr=null;
java.sql.Date lrsj=null;
xqmc=cf.GB2Uni(request.getParameter("xqmc"));
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
dz=cf.GB2Uni(request.getParameter("dz"));
cclx=cf.GB2Uni(request.getParameter("cclx"));
tjdm=cf.GB2Uni(request.getParameter("tjdm"));
jw=cf.GB2Uni(request.getParameter("jw"));
yzxfsp=cf.GB2Uni(request.getParameter("yzxfsp"));
xz=cf.GB2Uni(request.getParameter("xz"));
wyxs=cf.GB2Uni(request.getParameter("wyxs"));
xqgm=cf.GB2Uni(request.getParameter("xqgm"));
hxzl=cf.GB2Uni(request.getParameter("hxzl"));
zlhx=cf.GB2Uni(request.getParameter("zlhx"));
/*ls=request.getParameter("zlhxmj");
try{
	if (!(ls.equals("")))  zlhxmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zlhxmj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主力户型面积]类型转换发生意外:"+e);
	return;
}*/
zlhxmj=cf.GB2Uni(request.getParameter("zlhxmj"));
ywy=cf.GB2Uni(request.getParameter("ywy"));
dysfwc=cf.GB2Uni(request.getParameter("dysfwc"));
xqfzr=cf.GB2Uni(request.getParameter("xqfzr"));
xqfzrdh=cf.GB2Uni(request.getParameter("xqfzrdh"));
xqzhpj=cf.GB2Uni(request.getParameter("xqzhpj"));
ls=request.getParameter("lxsj");
try{
	if (!(ls.equals("")))  lxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lxsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[开盘时间]类型转换发生意外:"+e);
	return;
}
xsfs=cf.GB2Uni(request.getParameter("xsfs"));
ls=request.getParameter("fyssj");
try{
	if (!(ls.equals("")))  fyssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fyssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交钥匙时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jfhs");
try{
	if (!(ls.equals("")))  jfhs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jfhs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交房户数]类型转换发生意外:"+e);
	return;
}
sfytg=cf.GB2Uni(request.getParameter("sfytg"));
xszk=cf.GB2Uni(request.getParameter("xszk"));
khzlgmqk=cf.GB2Uni(request.getParameter("khzlgmqk"));
khmd=cf.GB2Uni(request.getParameter("khmd"));
ykfsgx=cf.GB2Uni(request.getParameter("ykfsgx"));
sfjcxc=cf.GB2Uni(request.getParameter("sfjcxc"));
ls=request.getParameter("khzyl");
try{
	if (!(ls.equals("")))  khzyl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khzyl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户占有率]类型转换发生意外:"+e);
	return;
}
yxxcfs=cf.GB2Uni(request.getParameter("yxxcfs"));
kfjy=cf.GB2Uni(request.getParameter("kfjy"));
kfs=cf.GB2Uni(request.getParameter("kfs"));
kfslxr=cf.GB2Uni(request.getParameter("kfslxr"));
kfslxrzw=cf.GB2Uni(request.getParameter("kfslxrzw"));
kfslxrdh=cf.GB2Uni(request.getParameter("kfslxrdh"));
jzs=cf.GB2Uni(request.getParameter("jzs"));
xss=cf.GB2Uni(request.getParameter("xss"));
sldh=cf.GB2Uni(request.getParameter("sldh"));
ywzxgs=cf.GB2Uni(request.getParameter("ywzxgs"));
ls=request.getParameter("zxgssl");
try{
	if (!(ls.equals("")))  zxgssl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zxgssl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[装修公司数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yzxhs");
try{
	if (!(ls.equals("")))  yzxhs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yzxhs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[已装修户数]类型转换发生意外:"+e);
	return;
}
sftizxq=cf.GB2Uni(request.getParameter("sftizxq"));
ls=request.getParameter("yjzxsj");
try{
	if (!(ls.equals("")))  yjzxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yjzxsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预计装修时间]类型转换发生意外:"+e);
	return;
}
ywwygs=cf.GB2Uni(request.getParameter("ywwygs"));
wygsmc=cf.GB2Uni(request.getParameter("wygsmc"));
wyfzr=cf.GB2Uni(request.getParameter("wyfzr"));
wydh=cf.GB2Uni(request.getParameter("wydh"));
wylxr=cf.GB2Uni(request.getParameter("wylxr"));
wylxrzw=cf.GB2Uni(request.getParameter("wylxrzw"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
String xqbh=null;
xqbh=cf.GB2Uni(request.getParameter("xqbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update yx_lsdcb set xqmc=?,cqbm=?,dz=?,cclx=?,tjdm=?,jw=?,yzxfsp=?,xz=?,wyxs=?,xqgm=?,hxzl=?,zlhx=?,zlhxmj=?,ywy=?,dysfwc=?,xqfzr=?,xqfzrdh=?,xqzhpj=?,lxsj=?,xsfs=?,fyssj=?,jfhs=?,sfytg=?,xszk=?,khzlgmqk=?,khmd=?,ykfsgx=?,sfjcxc=?,khzyl=?,yxxcfs=?,kfjy=?,kfs=?,kfslxr=?,kfslxrzw=?,kfslxrdh=?,jzs=?,xss=?,sldh=?,ywzxgs=?,zxgssl=?,yzxhs=?,sftizxq=?,yjzxsj=?,ywwygs=?,wygsmc=?,wyfzr=?,wydh=?,wylxr=?,wylxrzw=?,lrr=?,lrsj=? ";
	ls_sql+=" where  (xqbh="+xqbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xqmc);
	ps.setString(2,cqbm);
	ps.setString(3,dz);
	ps.setString(4,cclx);
	ps.setString(5,tjdm);
	ps.setString(6,jw);
	ps.setString(7,yzxfsp);
	ps.setString(8,xz);
	ps.setString(9,wyxs);
	ps.setString(10,xqgm);
	ps.setString(11,hxzl);
	ps.setString(12,zlhx);
	//ps.setLong(13,zlhxmj);
	ps.setString(13,zlhxmj);
	ps.setString(14,ywy);
	ps.setString(15,dysfwc);
	ps.setString(16,xqfzr);
	ps.setString(17,xqfzrdh);
	ps.setString(18,xqzhpj);
	ps.setDate(19,lxsj);
	ps.setString(20,xsfs);
	ps.setDate(21,fyssj);
	ps.setLong(22,jfhs);
	ps.setString(23,sfytg);
	ps.setString(24,xszk);
	ps.setString(25,khzlgmqk);
	ps.setString(26,khmd);
	ps.setString(27,ykfsgx);
	ps.setString(28,sfjcxc);
	ps.setDouble(29,khzyl);
	ps.setString(30,yxxcfs);
	ps.setString(31,kfjy);
	ps.setString(32,kfs);
	ps.setString(33,kfslxr);
	ps.setString(34,kfslxrzw);
	ps.setString(35,kfslxrdh);
	ps.setString(36,jzs);
	ps.setString(37,xss);
	ps.setString(38,sldh);
	ps.setString(39,ywzxgs);
	ps.setLong(40,zxgssl);
	ps.setLong(41,yzxhs);
	ps.setString(42,sftizxq);
	ps.setDate(43,yjzxsj);
	ps.setString(44,ywwygs);
	ps.setString(45,wygsmc);
	ps.setString(46,wyfzr);
	ps.setString(47,wydh);
	ps.setString(48,wylxr);
	ps.setString(49,wylxrzw);
	ps.setString(50,lrr);
	ps.setDate(51,lrsj);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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