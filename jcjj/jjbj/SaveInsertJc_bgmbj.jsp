<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xcmlxbm=null;
String bklxxh=null;
String mbcl=null;
String xbpz=null;
String zsxt=null;
String jjfs=null;
double pmdj=0;
double ymdj=0;
String zpmc=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
xcmlxbm=cf.GB2Uni(request.getParameter("xcmlxbm"));
bklxxh=cf.GB2Uni(request.getParameter("bklxxh"));
mbcl=cf.GB2Uni(request.getParameter("mbcl"));
xbpz=cf.GB2Uni(request.getParameter("xbpz"));
zsxt=cf.GB2Uni(request.getParameter("zsxt"));
jjfs=cf.GB2Uni(request.getParameter("jjfs"));
ls=request.getParameter("pmdj");
try{
	if (!(ls.equals("")))  pmdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pmdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[平米单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ymdj");
try{
	if (!(ls.equals("")))  ymdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ymdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[延米单价]类型转换发生意外:"+e);
	return;
}
zpmc=cf.GB2Uni(request.getParameter("zpmc"));
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xcmbm="";
	int count=0;
	ls_sql="select NVL(max(TO_NUMBER(SUBSTR(xcmbm,3,4))),0)";
	ls_sql+=" from  jc_bgmbj";
	ls_sql+=" where xcmlxbm='"+xcmlxbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	xcmbm=xcmlxbm+cf.addZero(count+1,4);

	ls_sql="insert into jc_bgmbj ( xcmbm,xcmlxbm,bklxxh,mbcl,xbpz,zsxt,jjfs,pmdj,ymdj,zpmc,lrr,lrsj,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xcmbm);
	ps.setString(2,xcmlxbm);
	ps.setString(3,bklxxh);
	ps.setString(4,mbcl);
	ps.setString(5,xbpz);
	ps.setString(6,zsxt);
	ps.setString(7,jjfs);
	ps.setDouble(8,pmdj);
	ps.setDouble(9,ymdj);
	ps.setString(10,zpmc);
	ps.setString(11,lrr);
	ps.setDate(12,lrsj);
	ps.setString(13,bz);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>