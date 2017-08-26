<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String shr=null;
java.sql.Date shsj=null;
String shjg=null;
long shts=0;
String shsm=null;
shr=cf.GB2Uni(request.getParameter("shr"));
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[shsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}
shjg=cf.GB2Uni(request.getParameter("shjg"));
ls=request.getParameter("shts");
try{
	if (!(ls.equals("")))  shts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[shts]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核增加天数]类型转换发生意外:"+e);
	return;
}
shsm=cf.GB2Uni(request.getParameter("shsm"));
String yqdbh=cf.GB2Uni(request.getParameter("yqdbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	String khbh=null;
	ls_sql=" select clzt,khbh";
	ls_sql+=" from  crm_yqdgl";
	ls_sql+=" where  yqdbh='"+yqdbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("2"))
	{
		out.println("<BR>！！！错误，未审核");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_yqdgl set shr=?,shsj=?,shjg=?,shts=?,shsm=?,clzt='2' ";
	ls_sql+=" where  yqdbh='"+yqdbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shr);
	ps.setDate(2,shsj);
	ps.setString(3,shjg);
	ps.setLong(4,shts);
	ps.setString(5,shsm);
	ps.executeUpdate();
	ps.close();

	int hzts=0;
	ls_sql=" select sum(shts)";
	ls_sql+=" from  crm_yqdgl";
	ls_sql+=" where  khbh='"+khbh+"' and shjg='Y' and clzt='2'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hzts=rs.getInt(1);
	}
	rs.close();
	ps.close();
		
	ls_sql="update crm_khxx set hzts=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,hzts);
	ps.executeUpdate();
	ps.close();
		
	conn.commit();

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
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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