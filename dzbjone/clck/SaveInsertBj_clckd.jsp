<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ckdh=null;
String khbh=null;
double ckzsl=0;
double ckzje=0;
String ckr=null;
java.sql.Date cksj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
ckdh=cf.GB2Uni(request.getParameter("ckdh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("ckzsl");
try{
	if (!(ls.equals("")))  ckzsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ckzsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出库总数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ckzje");
try{
	if (!(ls.equals("")))  ckzje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ckzje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出库总金额]类型转换发生意外:"+e);
	return;
}
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
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into bj_clckd ( ckdh,khbh,ckzsl,ckzje,clzt,ckr,cksj,lrr,lrsj,bz,sgd,dqbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ckdh);
	ps.setString(2,khbh);
	ps.setDouble(3,ckzsl);
	ps.setDouble(4,ckzje);
	ps.setString(5,"1");
	ps.setString(6,ckr);
	ps.setDate(7,cksj);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,bz);
	ps.setString(11,sgd);
	ps.setString(12,dqbm);
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>