<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jlh=null;
String khbh=null;
String fqmc=null;
String fqbh=null;
double fqje=0;
java.sql.Date yxrq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
jlh=cf.GB2Uni(request.getParameter("jlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
fqmc=cf.GB2Uni(request.getParameter("fqmc"));
fqbh=cf.GB2Uni(request.getParameter("fqbh"));
ls=request.getParameter("fqje");
try{
	if (!(ls.equals("")))  fqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fqje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[返券金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yxrq");
try{
	if (!(ls.equals("")))  yxrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效日期]类型转换发生意外:"+e);
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherejlh=null;
wherejlh=cf.GB2Uni(request.getParameter("wherejlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sybz="";
	String scbz="";
	ls_sql="select sybz,scbz";
	ls_sql+=" from  cw_khfqdj";
	ls_sql+=" where  (jlh='"+wherejlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sybz=cf.fillNull(rs.getString("sybz"));
		scbz=cf.fillNull(rs.getString("scbz"));
	}
	rs.close();
	ps.close();

	if (!sybz.equals("1"))//1：未用；2：已使用
	{
		out.println("错误！返券已使用");
		return;
	}

	if (!scbz.equals("N"))//N：未删除；Y：已删除
	{
		out.println("错误！返券已删除");
		return;
	}

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfqdj";
	ls_sql+=" where jlh!='"+wherejlh+"' and fqbh='"+fqbh+"' and scbz='N'";
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
		out.println("错误！返券编号已存在");
		return;
	}

	ls_sql="update cw_khfqdj set jlh=?,khbh=?,fqmc=?,fqbh=?,fqje=?,yxrq=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  (jlh='"+wherejlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jlh);
	ps.setString(2,khbh);
	ps.setString(3,fqmc);
	ps.setString(4,fqbh);
	ps.setDouble(5,fqje);
	ps.setDate(6,yxrq);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,bz);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>