<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xqmc=null;
String dqbm=null;
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
String fgsbh=null;
xqmc=cf.GB2Uni(request.getParameter("xqmc"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
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
	out.println("<BR>变量zlhxmj不存在");
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
	out.println("<BR>变量jfhs不存在");
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
	out.println("<BR>变量zxgssl不存在");
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
	out.println("<BR>变量yzxhs不存在");
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
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  yx_lsdcb";
	ls_sql+=" where dqbm='"+dqbm+"' and xqmc='"+xqmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！小区已存在");
		return;
	}

	int xqbh=0;
	ls_sql="select NVL(max(xqbh),0)";
	ls_sql+=" from  yx_lsdcb";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xqbh=rs.getInt(1)+1;
	}
	rs.close();
	ps.close();

	ls_sql="insert into yx_lsdcb ( xqbh,xqmc,dqbm,cqbm,dz,cclx,tjdm,jw,yzxfsp,xz,wyxs,xqgm,hxzl,zlhx,zlhxmj,ywy,dysfwc,xqfzr,xqfzrdh,xqzhpj,lxsj,xsfs,fyssj,jfhs,sfytg,xszk,khzlgmqk,khmd,ykfsgx,sfjcxc,khzyl,yxxcfs,kfjy,kfs,kfslxr,kfslxrzw,kfslxrdh,jzs,xss,sldh,ywzxgs,zxgssl,yzxhs,sftizxq,yjzxsj,ywwygs,wygsmc,wyfzr,wydh,wylxr,wylxrzw,kfjd,lrr,lrsj,fgsbh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'1',?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xqbh);
	ps.setString(2,xqmc);
	ps.setString(3,dqbm);
	ps.setString(4,cqbm);
	ps.setString(5,dz);
	ps.setString(6,cclx);
	ps.setString(7,tjdm);
	ps.setString(8,jw);
	ps.setString(9,yzxfsp);
	ps.setString(10,xz);
	ps.setString(11,wyxs);
	ps.setString(12,xqgm);
	ps.setString(13,hxzl);
	ps.setString(14,zlhx);
	//ps.setLong(15,zlhxmj);
	ps.setString(15,zlhxmj);
	ps.setString(16,ywy);
	ps.setString(17,dysfwc);
	ps.setString(18,xqfzr);
	ps.setString(19,xqfzrdh);
	ps.setString(20,xqzhpj);
	ps.setDate(21,lxsj);
	ps.setString(22,xsfs);
	ps.setDate(23,fyssj);
	ps.setLong(24,jfhs);
	ps.setString(25,sfytg);
	ps.setString(26,xszk);
	ps.setString(27,khzlgmqk);
	ps.setString(28,khmd);
	ps.setString(29,ykfsgx);
	ps.setString(30,sfjcxc);
	ps.setDouble(31,khzyl);
	ps.setString(32,yxxcfs);
	ps.setString(33,kfjy);
	ps.setString(34,kfs);
	ps.setString(35,kfslxr);
	ps.setString(36,kfslxrzw);
	ps.setString(37,kfslxrdh);
	ps.setString(38,jzs);
	ps.setString(39,xss);
	ps.setString(40,sldh);
	ps.setString(41,ywzxgs);
	ps.setLong(42,zxgssl);
	ps.setLong(43,yzxhs);
	ps.setString(44,sftizxq);
	ps.setDate(45,yjzxsj);
	ps.setString(46,ywwygs);
	ps.setString(47,wygsmc);
	ps.setString(48,wyfzr);
	ps.setString(49,wydh);
	ps.setString(50,wylxr);
	ps.setString(51,wylxrzw);
	ps.setString(52,lrr);
	ps.setDate(53,lrsj);
	ps.setString(54,fgsbh);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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