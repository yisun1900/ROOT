<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double tcslxz=0;
ls=request.getParameter("tcslxz");
try{
	if (!(ls.equals("")))  tcslxz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tcslxz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐数量限制]类型转换发生意外:"+e);
	return;
}
double ccbfjj=0;
ls=request.getParameter("ccbfjj");
try{
	if (!(ls.equals("")))  ccbfjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ccbfjj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[超出部分加价]类型转换发生意外:"+e);
	return;
}
String sfxzsl=cf.GB2Uni(request.getParameter("sfxzsl"));

String sfkjm=cf.GB2Uni(request.getParameter("sfkjm"));
double yxjmzdsl=0;
ls=request.getParameter("yxjmzdsl");
try{
	if (!(ls.equals("")))  yxjmzdsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yxjmzdsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[允许减免最大数量]类型转换发生意外:"+e);
	return;
}

String clxlbm=cf.GB2Uni(request.getParameter("clxlbm"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//查询原材料小类名称
	String clxlmc="";
	ls_sql=" select clxlmc ";
	ls_sql+=" from jxc_clxlbm ";
	ls_sql+=" where (clxlbm='"+clxlbm+"') ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		clxlmc=rs.getString("clxlmc");
	}
	rs.close();
	ps.close();

	ls_sql="update bj_khclxlxz set clxlmc=?,sfxzsl=?,tcslxz=?,ccbfjj=?,sfkjm=?,yxjmzdsl=? ";
	ls_sql+=" where  (khbh='"+khbh+"' and clxlbm='"+clxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clxlmc);
	ps.setString(2,sfxzsl);
	ps.setDouble(3,tcslxz);
	ps.setDouble(4,ccbfjj);
	ps.setString(5,sfkjm);
	ps.setDouble(6,yxjmzdsl);
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
	out.print("<BR>出错:" + e);
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