<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String ckph=null;
String dwbh=null;
String psdh=null;
double yf=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
String ckr=null;
java.sql.Date cksj=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
ckph=cf.GB2Uni(request.getParameter("ckph"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
psdh=cf.GB2Uni(request.getParameter("psdh"));
ls=request.getParameter("yf");
try{
	if (!(ls.equals("")))  yf=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[配送运费]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
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
bz=cf.GB2Uni(request.getParameter("bz"));
ckr=cf.GB2Uni(request.getParameter("ckr"));
ls=request.getParameter("cksj");
try{
	if (!(ls.equals("")))  cksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cksj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出库时间]类型转换发生意外:"+e);
	return;
}
String lx=cf.GB2Uni(request.getParameter("lx"));
double qtsf=0;
ls=request.getParameter("qtsf");
try{
	if (!(ls.equals("")))  qtsf=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtsf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它收费]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update cl_ckd set dwbh=?,lrr=?,lrsj=?,bz=?,ckr=?,cksj=?,yf=?,qtsf=?";
	ls_sql+=" where ckph='"+ckph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,lrr);
	ps.setDate(3,lrsj);
	ps.setString(4,bz);
	ps.setString(5,ckr);
	ps.setDate(6,cksj);
	ps.setDouble(7,yf);
	ps.setDouble(8,qtsf);
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