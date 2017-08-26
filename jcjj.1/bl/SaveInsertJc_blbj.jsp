<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String blxhbm=null;
String blxh=null;
double jg=0;
String bz=null;
blxhbm=cf.GB2Uni(request.getParameter("blxhbm"));
blxh=cf.GB2Uni(request.getParameter("blxh"));
ls=request.getParameter("jg");
try{
	if (!(ls.equals("")))  jg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[价格]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));

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

String bllxbm=cf.GB2Uni(request.getParameter("bllxbm"));
String blytbm=cf.GB2Uni(request.getParameter("blytbm"));
String zp=cf.GB2Uni(request.getParameter("zp"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jc_blbj ( blxhbm,blxh,bllxbm,jg,zp,bz,blytbm  ,dqbm,lrr,lrsj,lrbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?  ,?,?,SYSDATE,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,blxhbm);
	ps.setString(2,blxh);
	ps.setString(3,bllxbm);
	ps.setDouble(4,jg);
	ps.setString(5,zp);
	ps.setString(6,bz);
	ps.setString(7,blytbm);

	ps.setString(8,dqbm);
	ps.setString(9,lrr);
	ps.setString(10,lrbm);
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