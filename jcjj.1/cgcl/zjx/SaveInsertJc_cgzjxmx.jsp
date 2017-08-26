<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String zjxxh=null;

String lx=null;
String zjxm=null;
long zjsl=0;
double zqdj=0;
double zqzjje=0;
double dj=0;
double zjje=0;
String bz=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

lx=cf.GB2Uni(request.getParameter("lx"));
zjxm=cf.GB2Uni(request.getParameter("zjxm"));
ls=request.getParameter("zjsl");
try{
	if (!(ls.equals("")))  zjsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减数量]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("zqdj");
try{
	if (!(ls.equals("")))  zqdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前－单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zqzjje");
try{
	if (!(ls.equals("")))  zqzjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqzjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前增减金额]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后－单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjje");
try{
	if (!(ls.equals("")))  zjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后－增减金额]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  jc_cgzjx";
	ls_sql+=" where  ddbh='"+ddbh+"' and zjxxh="+zjxxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (!clzt.equals("00"))//00：录入未完成
	{
		out.println("错误！增减项已完成，不能再录入");
		return;
	}

	long xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  jc_cgzjxmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	xh++;

	ls_sql="insert into jc_cgzjxmx ( xh,ddbh,zjxxh,lx,zjxm,zjsl,zqdj,zqzjje,dj,zjje,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,ddbh);
	ps.setString(3,zjxxh);
	ps.setString(4,lx);
	ps.setString(5,zjxm);
	ps.setLong(6,zjsl);
	ps.setDouble(7,zqdj);
	ps.setDouble(8,zqzjje);
	ps.setDouble(9,dj);
	ps.setDouble(10,zjje);
	ps.setString(11,bz);
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
	out.print("存盘失败,发生意外: " + e);
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