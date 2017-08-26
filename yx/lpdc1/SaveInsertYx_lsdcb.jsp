<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String xqmc=null;
String cqbm=null;
String dz=null;
String jw=null;
String xz=null;
String wyxs=null;
String zlhx=null;
long zlhxmj=0;
java.sql.Date lxsj=null;
java.sql.Date fyssj=null;
long jfhs=0;
String xqfzr=null;
String xqfzrdh=null;
String kfs=null;
String kfslxr=null;
String kfslxrzw=null;
String kfslxrdh=null;
String wygsmc=null;
String wydh=null;
String wylxr=null;
String wylxrzw=null;
String lrr=null;
java.sql.Date lrsj=null;
String fgsbh=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
xqmc=cf.GB2Uni(request.getParameter("xqmc"));
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
dz=cf.GB2Uni(request.getParameter("dz"));
jw=cf.GB2Uni(request.getParameter("jw"));
xz=cf.GB2Uni(request.getParameter("xz"));
wyxs=cf.GB2Uni(request.getParameter("wyxs"));
zlhx=cf.GB2Uni(request.getParameter("zlhx"));
ls=request.getParameter("zlhxmj");
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
}
ls=request.getParameter("lxsj");
try{
	if (!(ls.equals("")))  lxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[立项时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fyssj");
try{
	if (!(ls.equals("")))  fyssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fyssj不存在");
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
xqfzr=cf.GB2Uni(request.getParameter("xqfzr"));
xqfzrdh=cf.GB2Uni(request.getParameter("xqfzrdh"));
kfs=cf.GB2Uni(request.getParameter("kfs"));
kfslxr=cf.GB2Uni(request.getParameter("kfslxr"));
kfslxrzw=cf.GB2Uni(request.getParameter("kfslxrzw"));
kfslxrdh=cf.GB2Uni(request.getParameter("kfslxrdh"));
wygsmc=cf.GB2Uni(request.getParameter("wygsmc"));
wydh=cf.GB2Uni(request.getParameter("wydh"));
wylxr=cf.GB2Uni(request.getParameter("wylxr"));
wylxrzw=cf.GB2Uni(request.getParameter("wylxrzw"));
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

	ls_sql="insert into yx_lsdcb ( dqbm,xqmc,cqbm,dz,jw,xz,wyxs,zlhx,zlhxmj,lxsj,fyssj,jfhs,xqfzr,xqfzrdh,kfs,kfslxr,kfslxrzw,kfslxrdh,wygsmc,wydh,wylxr,wylxrzw,lrr,lrsj,fgsbh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,xqmc);
	ps.setString(3,cqbm);
	ps.setString(4,dz);
	ps.setString(5,jw);
	ps.setString(6,xz);
	ps.setString(7,wyxs);
	ps.setString(8,zlhx);
	ps.setLong(9,zlhxmj);
	ps.setDate(10,lxsj);
	ps.setDate(11,fyssj);
	ps.setLong(12,jfhs);
	ps.setString(13,xqfzr);
	ps.setString(14,xqfzrdh);
	ps.setString(15,kfs);
	ps.setString(16,kfslxr);
	ps.setString(17,kfslxrzw);
	ps.setString(18,kfslxrdh);
	ps.setString(19,wygsmc);
	ps.setString(20,wydh);
	ps.setString(21,wylxr);
	ps.setString(22,wylxrzw);
	ps.setString(23,lrr);
	ps.setDate(24,lrsj);
	ps.setString(25,fgsbh);
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