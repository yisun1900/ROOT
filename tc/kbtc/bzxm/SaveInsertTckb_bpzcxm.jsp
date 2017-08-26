<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String hxbm=null;
String jgwzbm=null;
String kbcpbm=null;
double sl=0;
String lrr=null;
java.sql.Date lrsj=null;
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));

dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
kbcpbm=cf.GB2Uni(request.getParameter("kbcpbm"));
String kbwlbm=cf.GB2Uni(request.getParameter("kbwlbm"));
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标配数量]类型转换发生意外:"+e);
	return;
}
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

String jldw=cf.GB2Uni(request.getParameter("jldw"));

String bz=cf.GB2Uni(request.getParameter("bz"));
double dj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
String sfksc=request.getParameter("sfksc");
String sfkth=request.getParameter("sfkth");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  tckb_zck";
	ls_sql+=" where kbwlbm='"+kbwlbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		out.println("错误！没有此[科宝物料编码]");
		return;
	}

	String getkbcpbm="";
	ls_sql="select kbcpbm";
	ls_sql+=" from  tckb_zck";
	ls_sql+=" where kbwlbm='"+kbwlbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkbcpbm=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	if (!getkbcpbm.equals(kbcpbm))
	{
		out.println("错误！[科宝产品编码]不正确，应为："+getkbcpbm);
		return;
	}

	ls_sql="insert into tckb_bpzcxm (bjbbh,dqbm,bjjbbm,hxbm,jgwzbm,kbwlbm,kbcpbm,jldw,sl,dj,sfksc,sfkth,lrr,lrsj,bz)  ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjbbh);
	ps.setString(2,dqbm);
	ps.setString(3,bjjbbm);
	ps.setString(4,hxbm);
	ps.setString(5,jgwzbm);
	ps.setString(6,kbwlbm);
	ps.setString(7,kbcpbm);
	ps.setString(8,jldw);
	ps.setDouble(9,sl);
	ps.setDouble(10,dj);
	ps.setString(11,sfksc);
	ps.setString(12,sfkth);
	ps.setString(13,lrr);
	ps.setDate(14,lrsj);
	ps.setString(15,bz);
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