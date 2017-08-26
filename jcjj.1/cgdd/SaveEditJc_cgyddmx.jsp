<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=null;
String cgbm=null;
String tmbm=null;
String mbbm=null;
String mbfbbm=null;
String xtbm=null;
String lsbm=null;
String tjbbm=null;
String ctbm=null;
String jlbm=null;
String bz=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
cgbm=cf.GB2Uni(request.getParameter("cgbm"));
tmbm=cf.GB2Uni(request.getParameter("tmbm"));
mbbm=cf.GB2Uni(request.getParameter("mbbm"));
mbfbbm=cf.GB2Uni(request.getParameter("mbfbbm"));
xtbm=cf.GB2Uni(request.getParameter("xtbm"));
lsbm=cf.GB2Uni(request.getParameter("lsbm"));
tjbbm=cf.GB2Uni(request.getParameter("tjbbm"));
ctbm=cf.GB2Uni(request.getParameter("ctbm"));
jlbm=cf.GB2Uni(request.getParameter("jlbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double cgyddze=0;
double yddze=0;
try {
	conn=cf.getConnection();


	ls_sql="update jc_cgyddmx set cgbm=?,tmbm=?,mbbm=?,mbfbbm=?,xtbm=?,lsbm=?,tjbbm=?,ctbm=?,jlbm=?,bz=?";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cgbm);
	ps.setString(2,tmbm);
	ps.setString(3,mbbm);
	ps.setString(4,mbfbbm);
	ps.setString(5,xtbm);
	ps.setString(6,lsbm);
	ps.setString(7,tjbbm);
	ps.setString(8,ctbm);
	ps.setString(9,jlbm);
	ps.setString(10,bz);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("´æÅÌ³É¹¦£¡");
	parent.window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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