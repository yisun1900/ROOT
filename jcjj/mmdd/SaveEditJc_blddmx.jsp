<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yddbh=null;
String blxhbm=null;
String bz=null;
yddbh=cf.GB2Uni(request.getParameter("yddbh"));
blxhbm=cf.GB2Uni(request.getParameter("blxhbm"));

bz=cf.GB2Uni(request.getParameter("bz"));
String lrxh=request.getParameter("lrxh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double blhtje=0;
double htje=0;
try {
	conn=cf.getConnection();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.qddm=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=rs.getString(1);
	}
	rs.close();
	ps.close();

	String blxh=null;
	String bllxbm=null;
	String blytbm=null;
	ls_sql="select blxh,bllxbm,blytbm";
	ls_sql+=" from  jc_blbj";
	ls_sql+=" where blxhbm='"+blxhbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		blxh=rs.getString("blxh");
		bllxbm=rs.getString("bllxbm");
		blytbm=rs.getString("blytbm");
	}
	rs.close();
	ps.close();


	ls_sql="update jc_blddmx set blxhbm=?,blxh=?,bllxbm=?,blytbm=?,bz=? ";
	ls_sql+=" where  lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,blxhbm);
	ps.setString(2,blxh);
	ps.setString(3,bllxbm);
	ps.setString(4,blytbm);
	ps.setString(5,bz);
	ps.executeUpdate();
	ps.close();



	%>
	<SCRIPT language=javascript >
	<!--
	alert("´æÅÌ³É¹¦£¡");
	window.close();
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