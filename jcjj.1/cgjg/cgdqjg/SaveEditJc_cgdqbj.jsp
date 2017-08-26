<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String dqmc=null;
String dqlbbm=null;
String xh=null;
String gg=null;
String jldw=null;
String cptz=null;
String cd=null;
double lsj=0;
double yhj=0;
String dwbh=null;
String zp=null;
String bz=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
dqmc=cf.GB2Uni(request.getParameter("dqmc"));
dqlbbm=cf.GB2Uni(request.getParameter("dqlbbm"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
cptz=cf.GB2Uni(request.getParameter("cptz"));
cd=cf.GB2Uni(request.getParameter("cd"));
ls=request.getParameter("lsj");
try{
	if (!(ls.equals("")))  lsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[零售价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yhj");
try{
	if (!(ls.equals("")))  yhj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yhj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[优惠价]类型转换发生意外:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
zp=cf.GB2Uni(request.getParameter("zp"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wheredqbm=null;
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_cgdqbj set dqbm=?,dqmc=?,dqlbbm=?,xh=?,gg=?,jldw=?,cptz=?,cd=?,lsj=?,yhj=?,dwbh=?,zp=?,bz=? ";
	ls_sql+=" where  (dqbm='"+wheredqbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,dqmc);
	ps.setString(3,dqlbbm);
	ps.setString(4,xh);
	ps.setString(5,gg);
	ps.setString(6,jldw);
	ps.setString(7,cptz);
	ps.setString(8,cd);
	ps.setDouble(9,lsj);
	ps.setDouble(10,yhj);
	ps.setString(11,dwbh);
	ps.setString(12,zp);
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