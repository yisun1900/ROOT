<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gcysbbh=null;
String gcysxmbm=null;
String gcysxmmc=null;
String ysxmflbm=null;
String dygcjdbm=null;
String sfsgjdb=null;
String jdbm=null;
String sfhf=null;
String hflxbm=null;
double ljskbfb=0;
long yszxsl=0;
long byxsl=0;
long fbyxzxsl=0;
String ysbzsm=null;
String bz=null;
gcysbbh=cf.GB2Uni(request.getParameter("gcysbbh"));
gcysxmbm=request.getParameter("gcysxmbm");
gcysxmmc=cf.GB2Uni(request.getParameter("gcysxmmc"));
ysxmflbm=cf.GB2Uni(request.getParameter("ysxmflbm"));
dygcjdbm=cf.GB2Uni(request.getParameter("dygcjdbm"));
sfsgjdb=cf.GB2Uni(request.getParameter("sfsgjdb"));
jdbm=cf.GB2Uni(request.getParameter("jdbm"));
sfhf=cf.GB2Uni(request.getParameter("sfhf"));
hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
ls=request.getParameter("ljskbfb");
try{
	if (!(ls.equals("")))  ljskbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ljskbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[累计家装收款百分比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yszxsl");
try{
	if (!(ls.equals("")))  yszxsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yszxsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("byxsl");
try{
	if (!(ls.equals("")))  byxsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[byxsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[必验项数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fbyxzxsl");
try{
	if (!(ls.equals("")))  fbyxzxsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fbyxzxsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[非必验项最小数量]类型转换发生意外:"+e);
	return;
}
ysbzsm=cf.GB2Uni(request.getParameter("ysbzsm"));
bz=cf.GB2Uni(request.getParameter("bz"));
int yssx=0;
ls=request.getParameter("yssx");
try{
	if (!(ls.equals("")))  yssx=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yssx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收顺序]类型转换发生意外:"+e);
	return;
}
String xmlx=request.getParameter("xmlx");
String sfxzjg=request.getParameter("sfxzjg");
double ysjj=0;
ls=request.getParameter("ysjj");
try{
	if (!(ls.equals("")))  ysjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ysjj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收奖金]类型转换发生意外:"+e);
	return;
}
double zgysjj=0;
ls=request.getParameter("zgysjj");
try{
	if (!(ls.equals("")))  zgysjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zgysjj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主管验收奖金]类型转换发生意外:"+e);
	return;
}


String wheregcysbbh=null;
String wheregcysxmbm=null;
wheregcysbbh=cf.GB2Uni(request.getParameter("wheregcysbbh"));
wheregcysxmbm=cf.GB2Uni(request.getParameter("wheregcysxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_heysxm set gcysbbh=?,gcysxmbm=?,gcysxmmc=?,ysxmflbm=?,dygcjdbm=?,sfsgjdb=?,jdbm=?,sfhf=?,hflxbm=?,ljskbfb=?,yszxsl=?,byxsl=?,fbyxzxsl=?,ysbzsm=?,bz=?,yssx=?,xmlx=?,sfxzjg=?,ysjj=?,zgysjj=? ";
	ls_sql+=" where  (gcysbbh='"+wheregcysbbh+"') and  (gcysxmbm='"+wheregcysxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gcysbbh);
	ps.setString(2,gcysxmbm);
	ps.setString(3,gcysxmmc);
	ps.setString(4,ysxmflbm);
	ps.setString(5,dygcjdbm);
	ps.setString(6,sfsgjdb);
	ps.setString(7,jdbm);
	ps.setString(8,sfhf);
	ps.setString(9,hflxbm);
	ps.setDouble(10,ljskbfb);
	ps.setLong(11,yszxsl);
	ps.setLong(12,byxsl);
	ps.setLong(13,fbyxzxsl);
	ps.setString(14,ysbzsm);
	ps.setString(15,bz);
	ps.setInt(16,yssx);
	ps.setString(17,xmlx);
	ps.setString(18,sfxzjg);
	ps.setDouble(19,ysjj);
	ps.setDouble(20,zgysjj);
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