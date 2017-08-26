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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int xh=0;
double cgyddze=0;
double yddze=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(xh)+1,1)";
	ls_sql+=" from  jc_cgyddmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();
	

	ls_sql="insert into jc_cgyddmx ( xh,ddbh,cgbm,tmbm,mbbm,mbfbbm,xtbm,lsbm,tjbbm,ctbm,jlbm,bz) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,xh);
	ps.setString(2,ddbh);
	ps.setString(3,cgbm);
	ps.setString(4,tmbm);
	ps.setString(5,mbbm);
	ps.setString(6,mbfbbm);
	ps.setString(7,xtbm);
	ps.setString(8,lsbm);
	ps.setString(9,tjbbm);
	ps.setString(10,ctbm);
	ps.setString(11,jlbm);
	ps.setString(12,bz);
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
	out.print("存盘失败,发生意外: " + e);
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