<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mlx=null;
String mdjgqjbm=null;
double jjl=0;
mlx=cf.GB2Uni(request.getParameter("mlx"));
mdjgqjbm=cf.GB2Uni(request.getParameter("mdjgqjbm"));
ls=request.getParameter("jjl");
try{
	if (!(ls.equals("")))  jjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jjl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[每扇门加价率]类型转换发生意外:"+e);
	return;
}

String dqbm=request.getParameter("dqbm");
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String lrbm=cf.GB2Uni(request.getParameter("lrbm"));
java.sql.Date lrsj=null;
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

String wheremlx=null;
String wheremdjgqjbm=null;
wheremlx=cf.GB2Uni(request.getParameter("wheremlx"));
wheremdjgqjbm=cf.GB2Uni(request.getParameter("wheremdjgqjbm"));
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_mdcbjjb set mlx=?,mdjgqjbm=?,jjl=?  ,dqbm=?,lrr=?,lrsj=SYSDATE,lrbm=? ";
	ls_sql+=" where mlx='"+wheremlx+"' and mdjgqjbm='"+wheremdjgqjbm+"' and dqbm='"+wheredqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mlx);
	ps.setString(2,mdjgqjbm);
	ps.setDouble(3,jjl);

	ps.setString(4,dqbm);
	ps.setString(5,lrr);
	ps.setString(6,lrbm);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>修改数据库失败！");
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
	out.print("Exception: " + e);
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