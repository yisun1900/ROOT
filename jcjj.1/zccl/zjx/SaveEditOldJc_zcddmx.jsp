<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double zjsl=0;
double zjycf=0;
String bz=null;
ls=request.getParameter("zjsl");
try{
	if (!(ls.equals("")))  zjsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减数量]类型转换发生意外:"+e);
	return;
}
double zqzjje=0;
ls=request.getParameter("zqzjje");
try{
	if (!(ls.equals("")))  zqzjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqzjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前增减材料费]类型转换发生意外:"+e);
	return;
}
double zjje=0;
ls=request.getParameter("zjje");
try{
	if (!(ls.equals("")))  zjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后增减材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjycf");
try{
	if (!(ls.equals("")))  zjycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjycf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减远程费]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));

double zjqtfy=0;
ls=request.getParameter("zjqtfy");
try{
	if (!(ls.equals("")))  zjqtfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjqtfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减其它费用]类型转换发生意外:"+e);
	return;
}


double zjcxhdje=0;
ls=request.getParameter("zjcxhdje");
try{
	if (!(ls.equals("")))  zjcxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjcxhdje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减计入活动金额]类型转换发生意外:"+e);
	return;
}

double zjcbje=0;
ls=request.getParameter("zjcbje");
try{
	if (!(ls.equals("")))  zjcbje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjcbje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减成本金额]类型转换发生意外:"+e);
	return;
}
double zjyjjrje=0;
ls=request.getParameter("zjyjjrje");
try{
	if (!(ls.equals("")))  zjyjjrje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjyjjrje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减业绩记入金额]类型转换发生意外:"+e);
	return;
}


String ddbh=request.getParameter("ddbh");
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
String xh=request.getParameter("xh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"' and zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>错误，不能再进行修改！增减项单已完成");
		return;
	}


	ls_sql="update jc_zczjxmx set zjsl=?,zqzjje=?,zjje=?,zjycf=?,zjqtfy=?,zjcxhdje=?,zjcbje=?,bz=?,zjyjjrje=?";
	ls_sql+=" where zjxbh='"+zjxbh+"' and xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zjsl);
	ps.setDouble(2,zqzjje);
	ps.setDouble(3,zjje);
	ps.setDouble(4,zjycf);
	ps.setDouble(5,zjqtfy);
	ps.setDouble(6,zjcxhdje);
	ps.setDouble(7,zjcbje);
	ps.setString(8,bz);
	ps.setDouble(9,zjyjjrje);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("Exception: " + e);
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