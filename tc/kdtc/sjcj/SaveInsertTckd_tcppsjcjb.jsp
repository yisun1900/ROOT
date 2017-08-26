<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String bjjbbm1=null;
String tccplbbm=null;
String jldw=null;
double sjcj=0;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
bjjbbm1=cf.GB2Uni(request.getParameter("bjjbbm1"));
tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("sjcj");
try{
	if (!(ls.equals("")))  sjcj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjcj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[升级差价]类型转换发生意外:"+e);
	return;
}

String ppmc=cf.GB2Uni(request.getParameter("ppmc"));


java.sql.Date yxkssj=null;
java.sql.Date yxjzsj=null;

ls=request.getParameter("yxkssj");
try{
	if (!(ls.equals("")))  yxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yxkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yxjzsj");
try{
	if (!(ls.equals("")))  yxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yxjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[有效结束时间]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="insert into tckd_tcppsjcjb ( dqbm,bjjbbm,bjjbbm1,tccplbbm,ppmc,jldw,sjcj,yxkssj,yxjzsj) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setString(3,bjjbbm1);
	ps.setString(4,tccplbbm);
	ps.setString(5,ppmc);
	ps.setString(6,jldw);
	ps.setDouble(7,sjcj);
	ps.setDate(8,yxkssj);
	ps.setDate(9,yxjzsj);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>