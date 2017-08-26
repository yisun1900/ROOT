<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmdglxbm=null;
String kdjgqjbm=null;
String ysbm=null;
double dj=0;
mmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
kdjgqjbm=cf.GB2Uni(request.getParameter("kdjgqjbm"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
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

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jc_hjbjb ( mmdglxbm,kdjgqjbm,ysbm,dj  ,dqbm,lrr,lrsj,lrbm ) ";
	ls_sql+=" values ( ?,?,?,?  ,?,?,SYSDATE,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmdglxbm);
	ps.setString(2,kdjgqjbm);
	ps.setString(3,ysbm);
	ps.setDouble(4,dj);

	ps.setString(5,dqbm);
	ps.setString(6,lrr);
	ps.setString(7,lrbm);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>