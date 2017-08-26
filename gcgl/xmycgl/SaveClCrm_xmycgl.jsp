<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date clqklrsj=null;
String clqklrr=null;
String sjclqk=null;

ls=request.getParameter("clqklrsj");
try{
	if (!(ls.equals("")))  clqklrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clqklrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[处理情况录入时间]类型转换发生意外:"+e);
	return;
}
clqklrr=cf.GB2Uni(request.getParameter("clqklrr"));
sjclqk=cf.GB2Uni(request.getParameter("sjclqk"));
String wtsfjj=cf.GB2Uni(request.getParameter("wtsfjj"));

java.sql.Date clsj=null;
ls=request.getParameter("clsj");
try{
	if (!(ls.equals("")))  clsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[处理时间]类型转换发生意外:"+e);
	return;
}

int khyyts=0;
ls=request.getParameter("khyyts");
try{
	if (!(ls.equals("")))  khyyts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khyyts]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户原因影响天数]类型转换发生意外:"+e);
	return;
}
double khzrbl=0;
ls=request.getParameter("khzrbl");
try{
	if (!(ls.equals("")))  khzrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khzrbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户责任比例]类型转换发生意外:"+e);
	return;
}
int fkhyyts=0;
ls=request.getParameter("fkhyyts");
try{
	if (!(ls.equals("")))  fkhyyts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fkhyyts]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[非客户原因影响天数]类型转换发生意外:"+e);
	return;
}
double fkhzrbl=0;
ls=request.getParameter("fkhzrbl");
try{
	if (!(ls.equals("")))  fkhzrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fkhzrbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[非客户责任比例]类型转换发生意外:"+e);
	return;
}

String djbh=cf.GB2Uni(request.getParameter("djbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String zt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_xmycgl";
	ls_sql+=" where djbh='"+djbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();
	if (!zt.equals("3"))//1：录入；2：制订方案；3：方案审核；4：已处理
	{
		out.println("错误！状态不正确，不能再修改");
		return;
	}

	ls_sql="update crm_xmycgl set zt='4',clqklrsj=?,clqklrr=?,wtsfjj=?,sjclqk=?,clsj=?,khyyts=?,khzrbl=?,fkhyyts=?,fkhzrbl=? ";
	ls_sql+=" where  djbh='"+djbh+"' and zt='3'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,clqklrsj);
	ps.setString(2,clqklrr);
	ps.setString(3,wtsfjj);
	ps.setString(4,sjclqk);
	ps.setDate(5,clsj);
	ps.setInt(6,khyyts);
	ps.setDouble(7,khzrbl);
	ps.setInt(8,fkhyyts);
	ps.setDouble(9,fkhzrbl);
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